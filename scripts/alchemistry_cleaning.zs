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

    <minecraft:quartz>,
    <minecraft:quartz_ore>,
    <minecraft:quartz_block>,
    <minecraft:quartz_block:1>,
    <minecraft:quartz_block:2>,

    <minecraft:netherrack>,
    <minecraft:netherbrick>,
    <minecraft:nether_brick>,

    <minecraft:nether_wart>,
    <minecraft:nether_wart_block>,

    <minecraft:glowstone_dust>,
    <minecraft:glowstone>,

    <minecraft:magma>,

    <minecraft:ender_pearl>,
    <minecraft:purpur_block>,
    <minecraft:purpur_pillar>,

    <alchemistry:mineral_salt>,
    <minecraft:skull:1>,

    <ore:dyeLightBlue>
] as IIngredient[]{
    Dissolver.removeRecipe(item);
}


Combiner.removeRecipe(<minecraft:ender_pearl>);


