import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.alchemistry.Evaporator;
import mods.alchemistry.Combiner;
import mods.alchemistry.Dissolver;


for item in [
    <ore:cobblestone>,
    <ore:stone>,

    <minecraft:nether_wart>,
    <minecraft:nether_wart_block>,

    <minecraft:magma>,

    <minecraft:ender_pearl>,

    <alchemistry:mineral_salt>,
    <minecraft:skull:1>
] as IIngredient[]{
    Dissolver.removeRecipe(item);
}


Combiner.removeRecipe(<minecraft:ender_pearl>);