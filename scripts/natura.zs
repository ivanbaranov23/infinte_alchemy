

recipes.addShapeless("sand_to_sandyglass1",
    <natura:nether_heat_sand>,
    [<natura:nether_tainted_soil>, <minecraft:soul_sand>]
);

recipes.remove(<natura:seed_bags:2>);


recipes.addShaped("ia_silverbell_sapling", <natura:overworld_sapling:1>, [
    [null, <ore:dustSilver>, null],
    [<ore:dustSilver>, <ore:treeSapling>, <ore:dustSilver>],
    [null, <ore:dustSilver>, null]
]);


mods.prodigytech.explosionfurnace.recipes.addRecipe(
    <erebus:sapling_mossbark> * 4, <natura:nether_sapling:1> * 4, 
    3000, <immersiveengineering:wirecoil:3>, 
    1
);
