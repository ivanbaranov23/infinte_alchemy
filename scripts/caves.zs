import crafttweaker.item.IItemStack;
//mods.roots.Chrysopoeia.addRecipe(string name, IIngredient ingredient, <caves_n_cliffs:amethyst_cluster_single> * 4);


recipes.addShaped("ia_ame_cluster", <caves_n_cliffs:amethyst_block> * 4, [
    [<caves_n_cliffs:amethyst_cluster_single>, <caves_n_cliffs:amethyst_cluster_single>],
    [<caves_n_cliffs:amethyst_cluster_single>, <caves_n_cliffs:amethyst_cluster_single>]
]);
recipes.addShaped("ia_ame_cluster_grow", <caves_n_cliffs:budding_amethyst>, [
    [null, <caves_n_cliffs:amethyst_cluster_single>, null],
    [<caves_n_cliffs:amethyst_cluster_single>, <caves_n_cliffs:amethyst_cluster_single>, <caves_n_cliffs:amethyst_cluster_single>],
    [null, <caves_n_cliffs:amethyst_cluster_single>, null]
]);

scripts.helper.addSawRecipe(<caves_n_cliffs:small_amethyst_bud>, <caves_n_cliffs:amethyst_cluster_single>);
scripts.helper.addSawRecipe(<caves_n_cliffs:medium_amethyst_bud>, <caves_n_cliffs:amethyst_cluster_single> * 2);
scripts.helper.addSawRecipe(<caves_n_cliffs:large_amethyst_bud>, <caves_n_cliffs:amethyst_cluster_single> * 3);
scripts.helper.addSawRecipe(<caves_n_cliffs:amethyst_cluster>, <caves_n_cliffs:amethyst_cluster_single> * 6);

mods.thermalexpansion.Transposer.addFillRecipe(
    <caves_n_cliffs:calcite> * 3,
    <prodigytech:ash_bricks>, <liquid:andesite> * 250,
    800
);

{//dripstone
    recipes.addShapeless("ia_dripstone", <caves_n_cliffs:dripstone_block> * 8, [
        <minecraft:hardened_clay>, <chisel:waterstone>,
        <chisel:waterstone>, <minecraft:hardened_clay>
    ]);
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:ovium_pieces> % 30,
            <exnihilocreatio:item_ore_platinum> % 20,
            <contenttweaker:gallium_pieces> % 10
        ], null, 
        <liquid:tartaric_acid> * 500, <caves_n_cliffs:dripstone_block> * 4,
        <contenttweaker:research_sieving2>,
        20, 20000
    );
}

recipes.addShapeless("ia_deepslate", <caves_n_cliffs:cobbled_deepslate> * 8, [
    <minecraft:cobblestone>, <quark:slate>,
    <quark:slate>, <minecraft:cobblestone>
]);
mods.chisel.Carving.addGroup("deepslate");
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:cobbled_deepslate>);
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:deepslate>);
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:deepslate_bricks>);
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:polished_deepslate>);
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:deepslate_tiles>);
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:cracked_deepslate_bricks>);
mods.chisel.Carving.addVariation("deepslate", <caves_n_cliffs:cracked_deepslate_tiles>);


for i in [
    <caves_n_cliffs:amethyst_block>,
    <caves_n_cliffs:budding_amethyst>,
    <caves_n_cliffs:calcite>,
    <caves_n_cliffs:dripstone_block>,
    <caves_n_cliffs:cobbled_deepslate>,
    <caves_n_cliffs:deepslate>,
    <caves_n_cliffs:deepslate_bricks>,
    <caves_n_cliffs:polished_deepslate>,
    <caves_n_cliffs:deepslate_tiles>,
    <caves_n_cliffs:cracked_deepslate_bricks>,
    <caves_n_cliffs:cracked_deepslate_tiles>
] as IItemStack[]{
    i.asBlock().definition.setHarvestLevel("pickaxe", 3);
}