

scripts.content_machines.addFluidAlloyerRecipe(
    <moretcon:oreelectarite>,
    <contenttweaker:electric_manyullyn_block>, <erebus:sarcastic_czech_mushroom_block> * 4, <liquid:ore_make> * 1000,
    20, 1000
);


recipes.remove(<moretcon:hydrogenrichredstonepowder>);
mods.mekanism.reaction.addRecipe(
    <extendedcrafting:singularity:3>, <liquid:dense_hydrogen> * 4000, <gas:nether_star_solution> * 100, 
    <moretcon:hydrogenrichredstonepowder>, <gas:waste_gas> * 100, 1500, 60
);