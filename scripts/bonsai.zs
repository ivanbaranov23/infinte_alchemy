
recipes.remove(<bonsaitrees:bonsaipot:1>);
recipes.addShaped(
    "bonsai_wood_singularity",
    <bonsaitrees:bonsaipot:1>,
    [[null, <bonsaitrees:bonsaipot>, null],
    [<tconstruct:wooden_hopper>, <extendedcrafting:singularity_custom:100>, <tconstruct:wooden_hopper>],
    [null, <minecraft:hopper>, null]]
);

recipes.addShaped("ia_bonsai_oak", <contenttweaker:bonsai_sapling>, [
    [<contenttweaker:creosolon>, <extendedcrafting:singularity_custom:100> | <contenttweaker:singularity_dust>, <contenttweaker:creosolon>], 
    [<extendedcrafting:singularity_custom:100> | <contenttweaker:singularity_dust>, <minecraft:sapling>, <extendedcrafting:singularity_custom:100> | <contenttweaker:singularity_dust>], 
    [<contenttweaker:creosolon>, <extendedcrafting:singularity_custom:100> | <contenttweaker:singularity_dust>, <contenttweaker:creosolon>]
]);
recipes.addShapeless("ia_bonsai_oak2", <contenttweaker:bonsai_sapling>, [<minecraft:sapling>, <contenttweaker:research_plants2>.reuse()]);

recipes.addShaped("ia_bonsai_mushroom_red", <contenttweaker:bonsai_mushroom_red>, [
    [<contenttweaker:mushroomite_block>, <contenttweaker:mushroomite_rod>, <contenttweaker:mushroomite_block>], 
    [<contenttweaker:mushroomite_rod>, <minecraft:red_mushroom>, <contenttweaker:mushroomite_rod>], 
    [<contenttweaker:mushroomite_block>, <contenttweaker:mushroomite_rod>, <contenttweaker:mushroomite_block>]
]);
recipes.addShapeless("ia_bonsai_mushroom_red2", <contenttweaker:bonsai_mushroom_red>, [<minecraft:red_mushroom>, <contenttweaker:research_mushroom1>.reuse()]);

recipes.addShaped("ia_bonsai_mushroom_brown", <contenttweaker:bonsai_mushroom_brown>, [
    [<contenttweaker:mushroomite_block>, <contenttweaker:mushroomite_rod>, <contenttweaker:mushroomite_block>], 
    [<contenttweaker:mushroomite_rod>, <minecraft:brown_mushroom>, <contenttweaker:mushroomite_rod>], 
    [<contenttweaker:mushroomite_block>, <contenttweaker:mushroomite_rod>, <contenttweaker:mushroomite_block>]
]);
recipes.addShapeless("ia_bonsai_mushroom_brown2", <contenttweaker:bonsai_mushroom_brown>, [<minecraft:brown_mushroom>, <contenttweaker:research_mushroom1>.reuse()]);