import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.contenttweaker.BlockState;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IVector3d;
import crafttweaker.world.IFacing;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;
import mods.requious.Variable;
import mods.requious.Parameter;

static altar as Assembly = <assembly:altar>;
altar.setDurationSlot(4, 2).setVisual(mods.requious.SlotVisual.arrowRight()).setGroup("duration");
/*for x in 0 .. 3
    for y in 0 .. 2
        altar.setSelectionSlot(2+x, 1+y, "selection", x * 2 + y)
            .setGroup("selection")
            .setMaxSelection(1);*/

altar.setJEIItemSlot(0, 1, "mid_in");
altar.setJEIItemSlot(2, 1, "mid_out");
altar.setJEIItemSlot(0, 0, "top_in");
altar.setJEIItemSlot(2, 0, "top_out");


static transform as IBlockState[IBlockState] = {
    <blockstate:minecraft:iron_ore>:                                        <blockstate:minecraft:stone:variant=andesite>,
    <blockstate:thermalfoundation:ore:type=copper>:                         <blockstate:minecraft:stone:variant=granite>,
    <blockstate:thermalfoundation:ore:type=tin>:                            <blockstate:minecraft:stone:variant=diorite>, 
    <blockstate:thermalfoundation:ore:type=aluminum>:                       <blockstate:quark:marble:variant=stone_marble>, 
    <blockstate:thermalfoundation:ore:type=nickel>:                         <blockstate:quark:limestone:variant=stone_limestone>, 
    <blockstate:contenttweaker:zinc_ore>:                                   <blockstate:quark:jasper:variant=stone_jasper>,

    <blockstate:netherendingores:ore_other_1:blocks=overworld_cobalt_ore>:  <blockstate:quark:slate:variant=stone_slate_smooth>,
    <blockstate:netherendingores:ore_other_1:blocks=overworld_ardite_ore>:  <blockstate:contenttweaker:pumpk_tile>,
    <blockstate:contenttweaker:antimony_ore>:                               <blockstate:minecraft:red_nether_brick>,

    <blockstate:taiga:karmesine_ore>:                                       <blockstate:contenttweaker:karmesine_tile2>,
    <blockstate:taiga:ovium_ore>:                                           <blockstate:contenttweaker:ovium_tile2>,
    <blockstate:taiga:jauxum_ore>:                                          <blockstate:contenttweaker:jauxum_tile2>
};



{
    var recipe = AssemblyRecipe.create(function(container) {
        container.addWorldOutput(function(container){
            var state1 = container.world.getBlockState(container.pos.getOffset(container.facing,1));
            var state2 = container.world.getBlockState(container.pos.getOffset(container.facing, 1).getOffset(IFacing.up(),1));
            for st_out,st_in in transform{
                if ((state1 == st_in) && (state2 == <blockstate:exnihilocreatio:block_dust>)){
                    container.world.setBlockState(st_out, container.pos.getOffset(container.facing,1));
                    container.world.setBlockState(<blockstate:minecraft:cobblestone>, container.pos.getOffset(container.facing, 1).getOffset(IFacing.up(),1));
                    return true;
                }
            }
            
                
            return true;
        });
        
    });
    
    //recipe.requireSelection("selection", icon, false);
    recipe.requireWorldCondition("world", function(container){
            var state1 = container.world.getBlockState(container.pos.getOffset(container.facing,1));
            var state2 = container.world.getBlockState(container.pos.getOffset(container.facing, 1).getOffset(IFacing.up(),1));
            for st_out,st_in in transform{
                if (state1 == st_in) && (state2 == <blockstate:exnihilocreatio:block_dust>)
                    return true;
            }
            return false;
        }, 40
    );
    recipe.setActive(400).requireDuration("duration", 400);
    

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
    addAltarJEI(<minecraft:iron_ore>, <minecraft:stone:5>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltarJEI(<thermalfoundation:ore>, <minecraft:stone:1>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltarJEI(<thermalfoundation:ore:1>, <minecraft:stone:3>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltarJEI(<thermalfoundation:ore:4>, <quark:marble>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltarJEI(<thermalfoundation:ore:5>, <quark:limestone>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

    addAltarJEI(<contenttweaker:zinc_ore>, <quark:jasper>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );


    addAltarJEI(<netherendingores:ore_other_1:4>, <quark:slate:1>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );
    addAltarJEI(<netherendingores:ore_other_1:2>, <contenttweaker:pumpk_tile>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );
    addAltarJEI(<contenttweaker:antimony_ore>, <minecraft:red_nether_brick>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );


    addAltarJEI(<taiga:karmesine_ore>, <contenttweaker:karmesine_tile2>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );
    addAltarJEI(<taiga:ovium_ore>, <contenttweaker:ovium_tile2>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );
    addAltarJEI(<taiga:jauxum_ore>, <contenttweaker:jauxum_tile2>, 
        <minecraft:cobblestone>, 
        <exnihilocreatio:block_dust>
    );

}
