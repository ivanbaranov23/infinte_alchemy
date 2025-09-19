import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import crafttweaker.block.IBlockState;
import mods.roots.predicates.Predicates;
import mods.roots.predicates.BlockStateAbove;
import mods.roots.predicates.BlockStateBelow;
import mods.roots.predicates.PropertyPredicate;
import mods.roots.predicates.StatePredicate;


import mods.roots.Transmutation;

{
    /*Transmutation.addStateToStateRecipe(
        "bedrock_test", 
        StatePredicate.create(<blockstate:contenttweaker:bedrockium_alloy_block>),
        <blockstate:minecraft:bedrock>, 
        BlockStateBelow.create(StatePredicate.create(<blockstate:minecraft:bedrock>))
    );*/
}

var counter as int = 0;

for inp,outp in {
    <blockstate:minecraft:sandstone:type=sandstone>: <blockstate:astralsorcery:blockcustomsandore:oretype=aquamarine>
} as IBlockState[IBlockState] {
    Transmutation.addStateToStateRecipe(
        "auto" ~ counter, 
        StatePredicate.create(inp),
        outp, 
        BlockStateAbove.create(StatePredicate.create(<blockstate:biomesoplenty:terrarium:variant=beach>))
    );
    counter += 1;
    
}