
/*
scripts.content_machines.addFluidAlloyerRecipe(
    <moretcon:oreelectarite>,
    <contenttweaker:electric_manyullyn_block> * 2, <erebus:sarcastic_czech_mushroom_block> * 5, <liquid:ore_make> * 1000,
    20, 1000
);
*/

recipes.addShapeless("ia_carbonpile_alt1", <moretcon:carbonpile>, [
	<minecraft:coal:1>, <minecraft:coal:1>, <minecraft:coal:1>,
    <minecraft:coal:1>, <minecraft:coal:1>, <minecraft:coal:1>
]);
recipes.addShapeless("ia_carbonpile_alt2", <moretcon:carbonpile>, [
	<contenttweaker:cactus_charcoal>, <contenttweaker:cactus_charcoal>
]);
recipes.addShapeless("ia_carbonpile_alt3", <moretcon:carbonpile>, [
	<mekanism:compressedcarbon>, <mekanism:compressedcarbon>
]);
recipes.addShapeless("ia_carbonpile_alt4", <moretcon:carbonpile>, [
	<ore:fuelCoke>, <ore:fuelCoke>
]);
recipes.addShapeless("ia_carbonpile_alt5", <moretcon:carbonpile> * 2, [
	<mysticalagriculture:coal>
]);
recipes.addShapeless("ia_carbonpile_alt6", <moretcon:carbonpile> * 4, [
	<mysticalagriculture:coal:1>
]);
recipes.addShapeless("ia_carbonpile_alt7", <moretcon:carbonpile> * 8, [
	<mysticalagriculture:coal:2>
]);
recipes.addShapeless("ia_carbonpile_alt8", <moretcon:carbonpile> * 16, [
	<mysticalagriculture:coal:3>
]);
recipes.addShapeless("ia_carbonpile_alt9", <moretcon:carbonpile> * 32, [
	<mysticalagriculture:coal:4>
]);
recipes.addShapeless("ia_carbonpile_alt10", <moretcon:carbonpile> * 64, [
	<mysticalagradditions:insanium:5>
]);


mods.thermalexpansion.Transposer.addFillRecipe(
    <moretcon:repitem:3>, 
    <moretcon:gemerythynite>, 
    <liquid:liquidebonite> * 144, 10000
);

