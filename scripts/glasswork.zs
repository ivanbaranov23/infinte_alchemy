//glass
furnace.remove(<minecraft:glass>);
recipes.remove(<minecraft:glass>);

mods.thermalexpansion.Transposer.addFillRecipe(
	<minecraft:glass> * 16, 
	<thermalfoundation:material:1024>, <liquid:sand> * 250, 
	3000
);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <minecraft:glass> * 4, 
    <extrautils2:decorativesolid:4> * 3, <mysticalworld:silver_dust_tiny>, 
    1000
);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <minecraft:glass> * 2, 
    <quark:glass_shards> * 4, <mysticalworld:silver_dust_tiny>, 
    1000
);

furnace.addRecipe(<minecraft:glass>, <extrautils2:decorativesolid:4>);

recipes.addShapeless("glass_glass",
    <minecraft:glass> * 4,
    [<liquid:glass> * 2000, <ore:itemFlint>, <appliedenergistics2:material:3>]
);
recipes.addShapeless("glass_glass_glass",
    <minecraft:glass> * 4,
    [<liquid:glass> * 1000, <liquid:glass> * 1000, <ore:itemFlint>, <appliedenergistics2:material:3>]
);
recipes.addShapeless("glass_glass_silver",
    <minecraft:glass> * 6,
    [<liquid:glass> * 2000, <ore:itemFlint>, <appliedenergistics2:material:3>, <mysticalworld:silver_dust_tiny>]
);
recipes.addShapeless("glass_glass_silver_glass",
    <minecraft:glass> * 6,
    [<liquid:glass> * 1000, <liquid:glass> * 1000, <ore:itemFlint>, <appliedenergistics2:material:3>, <mysticalworld:silver_dust_tiny>]
);

//sandy glass
recipes.remove(<extrautils2:decorativesolid:4>);
recipes.addShapeless("sand_to_sandyglass",
    <extrautils2:decorativesolid:4> * 4,
    [<ore:sand>, <ore:sand>, <ore:sand>, <ore:itemFlint>, <quark:glass_shards>, <appliedenergistics2:material:3>]
);
recipes.addShapeless("sand_to_sandyglass2",
    <extrautils2:decorativesolid:4> * 6,
    [<ore:sand>, <ore:sand>, <ore:sand>, <ore:itemFlint>, <tconstruct:clear_glass>, <appliedenergistics2:material:3>]
);
furnace.remove(<extrautils2:decorativeglass>);

mods.thermalexpansion.InductionSmelter.addRecipe(
    <extrautils2:decorativeglass> * 2, 
    <extrautils2:decorativesolid:4>, <minecraft:glass>, 
    1000
);



furnace.remove(<betternether:quartz_glass>);
recipes.addShaped("ia_quartz_glass1", <betternether:quartz_glass>, [
	[null, <ore:crystalPureNetherQuartz>, <quark:glass_shards>], 
	[<ore:crystalPureNetherQuartz>, <thermalfoundation:glass:2>, <ore:crystalPureNetherQuartz>], 
	[<quark:glass_shards>, <ore:crystalPureNetherQuartz>, null]
]);
recipes.addShaped("ia_quartz_glass2", <betternether:quartz_glass> * 3, [
	[<contenttweaker:research_glass_making>.reuse(), <ore:crystalPureCertusQuartz>, <quark:glass_shards>], 
	[<ore:crystalPureNetherQuartz>, <thermalfoundation:glass:2>, <ore:crystalPureNetherQuartz>], 
	[<quark:glass_shards>, <ore:crystalPureCertusQuartz>, null]
]);