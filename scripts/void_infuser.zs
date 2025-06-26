import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.contenttweaker.BlockState;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IVector3d;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;
import mods.requious.Variable;
import mods.requious.Parameter;

import crafttweaker.util.Math;
import mods.ctutils.utils.Math as Math2;


static Void_infuser as Assembly = <assembly:void_infuser>;

Void_infuser.setTextSlot(0,0).setVisual(mods.requious.SlotVisual.create(7,1)).setRenderText("Sin points: %d", ["sin"]);
/*Void_infuser.setTextSlot(8,0).setVisual(
    mods.requious.SlotVisual.energySlot(),"test_variable","capacity"
).addPart("requious.text.test",["test_variable"]).addPart("requious.text.owner",["owner"]);*/

//Void_infuser.setTextSlot(0,1).setVisual(mods.requious.SlotVisual.create(7,1)).setRenderText("pos1: %s %s %s\npos2: %s %s %s", ["pos1x", "pos1y", "pos1z", "pos2x", "pos2y", "pos2z"]);
//Void_infuser.setTextSlot(0,2).setVisual(mods.requious.SlotVisual.create(7,1)).setRenderText("%s %s %s", ["living_rock_blocks", "living_metal_blocks", "death_point"]);
//todo debug info for players


Void_infuser.setItemSlot(4, 4, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");


print("[void] 1");

for pot,v in {
    <botania:tinypotato>:                       1,
    <botania_tweaks:compressed_tiny_potato_1>:  10,
    <botania_tweaks:compressed_tiny_potato_2>:  100,
    <botania_tweaks:compressed_tiny_potato_3>:  1000,
    <botania_tweaks:compressed_tiny_potato_4>:  10000,
    <botania_tweaks:compressed_tiny_potato_5>:  100000,
    <botania_tweaks:compressed_tiny_potato_6>:  1000000,
    <botania_tweaks:compressed_tiny_potato_7>:  10000000,
    <botania_tweaks:compressed_tiny_potato_8>:  100000000 //10^8

} as int[IItemStack]{
    var testVariables = AssemblyRecipe.create(function(container) {
        container.machine.setInteger("sin",container.machine.getInteger("sin") + v);
        //container.machine.setInteger("capacity", 2000);
    });

    testVariables.requireItem("input", pot);

    Void_infuser.addRecipe(testVariables);
}




print("[void] 2");


/*
idea:
    sin points
    death ore -> 100k sp
    death points

    colomn -> change stats

    air/anything else -> penalty
    living rock -> dp += 0.05 * sp, turns to ore at 20k dp
    living metal -> dp += 0.3 * sp, turns to ore at 5k dp
    living wood -> recover 0.1 of sp up to 0.9
    
    neighbour bonus
*/
static living_rock as IBlockState = <blockstate:botania:livingrock:variant=default>;
static living_wood as IBlockState = <blockstate:botania:livingwood:variant=default>;
static living_metal as IBlockState = <blockstate:contenttweaker:living_steel_block>;


var main_rec = AssemblyRecipe.create(function(container) {
        //container.machine.getInteger("sin");
        

        container.addWorldOutput(function(container){
            var sin_points as int = container.getInteger("sin");
            var sin_pointsd as double = sin_points as double;
            var death_point as int = 0;
            var recover_sin as double = 0.0;

            var living_rock_blocks as int = 0;
            var living_wood_blocks as int = 0;
            var living_metal_blocks as int = 0;
            var wrong_blocks as int = 0;


            var start_pos as IBlockPos = container.pos.getOffset(IFacing.up(),2).getOffset(IFacing.north(),1).getOffset(IFacing.west(),1);


            for x in 0 to 3
            for y in 0 to 3
            for z in 0 to 3
            {
                var pos as IBlockPos = start_pos.getOffset(IFacing.up(), y).getOffset(IFacing.south(), x).getOffset(IFacing.east(), z);
                var state = container.world.getBlockState(pos);

                if (state == living_rock)
                    living_rock_blocks += 1;
                else if (state == living_wood)
                    living_wood_blocks += 1;
                else if (state == living_metal)
                    living_metal_blocks += 1;
                else 
                    wrong_blocks += 1;
            }


            death_point = (((living_rock_blocks as double) * sin_pointsd * 0.01) + ((living_metal_blocks as double) * sin_pointsd * 0.03)) as int;
            
            //so dumb
            recover_sin = (living_wood_blocks as double) * (0.2 as double) - (wrong_blocks as double) * 0.1;
            recover_sin = Math.clamp(recover_sin, 0.0, 0.95);

            var death_lmetal as int = min(living_metal_blocks, death_point / 1000);
            var death_lrock as int = min(living_rock_blocks, (death_point - death_lmetal * 1000) / 4000);

            var recovered_sin as int = ((sin_pointsd - (death_point as double)) * recover_sin) as int;
            var sin_coeff as double = pow((Math.log10(recovered_sin as double) - 3.0) / 5.0, 2.0);
            //log10 -> 4 - 8
            // -3.0 -> 1 - 5
            // /5 -> 0.2 - 1
            // ^2

            
            container.setInteger("death_point", death_point);

            container.setInteger("sin", recovered_sin);

            for x in 0 to 3
            for y in 0 to 3
            for z in 0 to 3
            {
                var pos as IBlockPos = start_pos.getOffset(IFacing.up(), y).getOffset(IFacing.south(), x).getOffset(IFacing.east(), z);
                var state = container.world.getBlockState(pos);

                if (state == living_rock){
                    if (death_lrock > 0){
                        death_lrock -= 1;
                        if (Math2.random() < sin_coeff)
                            container.world.setBlockState(<blockstate:contenttweaker:death_metal_dense_ore>, pos);
                        else
                            container.world.setBlockState(<blockstate:contenttweaker:death_metal_ore>, pos);
                    }
                }
                else if (state == living_metal){
                    if (death_lmetal > 0){
                        death_lmetal -= 1;
                        if (Math2.random() < sin_coeff)
                            container.world.setBlockState(<blockstate:contenttweaker:death_metal_dense_ore>, pos);
                        else
                            container.world.setBlockState(<blockstate:contenttweaker:death_metal_ore>, pos);
                    }
                }
                else if (state == living_wood){
                    if (Math2.random() > sin_coeff)
                        container.world.setBlockState(<blockstate:contenttweaker:living_waste>, pos);
                }
            }

            return true;
        });
    });

main_rec.requireItem("input", <contenttweaker:sin_nickel_ingot>);

Void_infuser.addRecipe(main_rec);


print("[void] 3");

scripts.content_machines.addAssemblerRecipe(
    [<requious:void_infuser>], 
    [
        <contenttweaker:mana_frame>,
        <contenttweaker:evil_core>,
        <contenttweaker:rune_mana_chip> * 3,
        <extendedcrafting:material:2> * 16,
        <contenttweaker:plasma_gen> * 8,
        <contenttweaker:terragem> * 16
    ], <liquid:mirion2> * 864,
    20, 10000
);