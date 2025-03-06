import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;


import mods.modularmachinery.RecipeBuilder;

static counter as int = 1;
function addHydroponicRec(crop as IItemStack){
    print("hydro" ~ counter);
    var rec = RecipeBuilder.newBuilder("hydro" ~ counter, "hydroponic", 2);
    counter += 1;

    rec.addEnergyPerTickInput(10000000);

    rec.addFluidInput(<liquid:fertilizer> * 1000);
    rec.addFluidInput(<liquid:ammonia> * 400);

    
    rec.addItemInput(crop);
    rec.setChance(0.0);
    rec.addItemOutput(crop * 32);
    
    

    rec.build();
}

for crop in [
    <minecraft:potato>,
    <minecraft:carrot>,
    <minecraft:beetroot>,
    
    <actuallyadditions:item_misc:13>,
    <mysticalworld:aubergine>,

    <minecraft:wheat>,
    <natura:materials>,
    <atum:emmer>,

    <minecraft:cactus>,

    <minecraft:double_plant>,
    <erebus:dark_capped_mushroom>,
    <erebus:sarcastic_czech_mushroom>,
    <erebus:grandmas_shoes_mushroom>,
    <erebus:dutch_cap_mushroom>,
    <erebus:kaizers_fingers_mushroom>,
    <minecraft:brown_mushroom>,
    <minecraft:red_mushroom>,
    <biomesoplenty:mushroom>,
    <quark:glowshroom>,
    <roots:baffle_cap_mushroom>,
    <roots:moonglow_leaf>,
    <roots:pereskia>,
    <roots:terra_moss>,
    <roots:spirit_herb>,
    <roots:wildroot>,
    <roots:wildewheet>,
    <roots:cloud_berry>,
    <roots:infernal_bulb>,
    <roots:dewgonia>,
    <roots:stalicripe>,

    <contenttweaker:flolit_plant>,
    <twilightforest:steeleaf_ingot>,

    <biomesoplenty:coral>,
    <biomesoplenty:coral:1>,
    <biomesoplenty:coral:2>,
    <biomesoplenty:coral:3>
] as IItemStack[]{
    addHydroponicRec(crop);
}