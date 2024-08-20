
//blue fire
scripts.jei.addJEIhint(
    [<biomesoplenty:blue_fire>], [],
    [<biomesoplenty:jar_empty>],
    [<biomesoplenty:jar_filled:1>]
);
mods.roots.Fey.addRecipe(
    "blue_fire", <biomesoplenty:jar_filled:1>,
    [
        <biomesoplenty:jar_empty>,
        <biomesoplenty:ash_block>,
        <thermalfoundation:material:1024>,
        <forge:bucketfilled>.withTag({FluidName: "methane", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "tar", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "napalm", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "ethanol", Amount: 1000}) | <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}),
        <minecraft:lapis_block>
    ]
);
recipes.addShapeless("blue_fire", <biomesoplenty:jar_filled:1>,
    [<biomesoplenty:jar_empty>, <contenttweaker:advanced_pyrotheum>, <liquid:methane> * 1000]
);