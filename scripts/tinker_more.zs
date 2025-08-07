
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





recipes.remove(<moretcon:hydrogenrichredstonepowder>);
mods.mekanism.reaction.addRecipe(
    <extendedcrafting:singularity:3>, <liquid:dense_hydrogen> * 4000, <gas:nether_star_solution> * 2000, 
    <moretcon:hydrogenrichredstonepowder>, <gas:waste_gas> * 100, 1500, 60
);