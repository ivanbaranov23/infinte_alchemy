
recipes.remove(<biomesoplenty:jar_empty>);
recipes.addShaped("ia_jar_empty", <biomesoplenty:jar_empty>, [
    [<minecraft:glass>, null, <minecraft:glass>],
    [<minecraft:glass_bottle>, <minecraft:diamond>, <minecraft:glass_bottle>],
    [<minecraft:glass>, <minecraft:glass_bottle>, <minecraft:glass>]
]);


//blue fire
scripts.jei.addJEIhint(
    [<biomesoplenty:blue_fire>], [],
    [<biomesoplenty:jar_empty>],
    [<biomesoplenty:jar_filled:1>]
);
scripts.jei.addJEIhint(
    [<biomesoplenty:jar_filled:1>], [],
    [],
    [<biomesoplenty:blue_fire>]
);
mods.roots.Fey.addRecipe(
    "blue_fire", <biomesoplenty:jar_filled:1>,
    [
        <biomesoplenty:jar_empty>,
        <biomesoplenty:ash_block>,
        <thermalfoundation:material:1024>,
        <forge:bucketfilled>.withTag({FluidName: "methane", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "tar", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "napalm", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "ethanol", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}),
        <minecraft:lapis_block> | <contenttweaker:roving>
    ]
);
recipes.addShapeless("blue_fire", <biomesoplenty:jar_filled:1>,
    [<biomesoplenty:jar_empty>, <thermalfoundation:material:1024>, <thermalfoundation:material:1024>, <thermalfoundation:material:1024>, <thermalfoundation:material:1024>, <thermalfoundation:material:1024>, <liquid:methane> * 1000]
);

