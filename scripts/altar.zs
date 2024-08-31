import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.contenttweaker.BlockState;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IVector3d;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;
import mods.requious.Variable;
import mods.requious.Parameter;

static altar as Assembly = <assembly:altar>;
altar.setDurationSlot(6, 2).setVisual(mods.requious.SlotVisual.arrowRight()).setGroup("duration");
for x in 0 .. 3
    for y in 0 .. 2
        altar.setSelectionSlot(2+x, 1+y, "selection", x * 2 + y)
            .setGroup("selection")
            .setMaxSelection(1);

altar.setJEIItemSlot(0, 1, "mid_in");
altar.setJEIItemSlot(2, 1, "mid_out");
altar.setJEIItemSlot(0, 0, "top_in");
altar.setJEIItemSlot(2, 0, "top_out");


function addAltar(mid_out as IBlockState, mid_in as IBlockState, top_out as IBlockState, top_in as IBlockState, time_t as int, icon as IItemStack){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addWorldOutput(function(container){
            var state1 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            var state2 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),2));
            if ((state1 == mid_in) && (state2 == top_in)){
                container.world.setBlockState(mid_out, container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
                container.world.setBlockState(top_out, container.pos.getOffset(crafttweaker.world.IFacing.up(),2));
            }
                
            return true;
        });
        
    });
    
    recipe.requireSelection("selection", icon, false);
    recipe.requireWorldCondition("world", function(container){
            var state1 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            var state2 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),2));
            return (state1 == mid_in) && (state2 == top_in);
        }, 40
    );
    recipe.setActive(time_t).requireDuration("duration", time_t);
    

    altar.addRecipe(recipe);
    
}
function addAltarJEI(mid_out as IItemStack, mid_in as IItemStack, top_out as IItemStack, top_in as IItemStack){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addItemOutput("mid_out", mid_out);
        container.addItemOutput("top_out", top_out);
    });
    recipe.requireItem("mid_in", mid_in);
    recipe.requireItem("top_in", top_in);
    altar.addJEIRecipe(recipe);
}

recipes.addShaped("ia_eg_altar", <requious:altar>, [
    [<minecraft:obsidian>, null, <minecraft:obsidian>], 
    [<minecraft:obsidian>, <contenttweaker:burned_slimedirt>, <minecraft:obsidian>], 
    [<prodigytech:charred_stone>, <prodigytech:charred_stone>, <prodigytech:charred_stone>]
]);

{//cobble
    addAltar(<blockstate:minecraft:iron_ore>, <blockstate:minecraft:stone:variant=andesite>, 
        <blockstate:minecraft:cobblestone>, 
        <blockstate:exnihilocreatio:block_dust>, 20, <minecraft:iron_ore>
    );
    addAltarJEI(<minecraft:iron_ore>, <minecraft:stone:5>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltar(<blockstate:thermalfoundation:ore:type=copper>, <blockstate:minecraft:stone:variant=granite>, 
        <blockstate:minecraft:cobblestone>, 
        <blockstate:exnihilocreatio:block_dust>, 20, <thermalfoundation:ore>
    );
    addAltarJEI(<thermalfoundation:ore>, <minecraft:stone:1>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltar(<blockstate:thermalfoundation:ore:type=tin>, <blockstate:minecraft:stone:variant=diorite>, 
        <blockstate:minecraft:cobblestone>, 
        <blockstate:exnihilocreatio:block_dust>, 20, <thermalfoundation:ore:1>
    );
    addAltarJEI(<thermalfoundation:ore:1>, <minecraft:stone:3>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );
}
