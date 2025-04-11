import crafttweaker.item.IIngredient;


recipes.addShaped("bountyboarditem", <bountiful:bountyboarditem>, [
    [<roots:wildwood_log>, <moreplates:emerald_plate>, <roots:wildwood_log>], 
    [<minecraft:paper>, <actuallyadditions:block_misc:4>, <minecraft:paper>], 
    [<roots:wildwood_log>, <moreplates:emerald_plate>, <roots:wildwood_log>]
]);




var ores as IIngredient = <thermalfoundation:ore:4> | <thermalfoundation:ore:5> | <contenttweaker:zinc_ore> | <minecraft:iron_ore> |  <thermalfoundation:ore:1> | <thermalfoundation:ore> | <minecraft:gold_ore> | <thermalfoundation:ore:3> | <netherendingores:ore_other_1:2> | <netherendingores:ore_other_1:4> | <minecraft:glowstone> | <appliedenergistics2:quartz_ore> | <mysticalagriculture:inferium_ore> | <minecraft:lapis_ore> | <minecraft:redstone_ore> | <draconicevolution:draconium_ore> | <contenttweaker:chrome_ore> | <netherendingores:ore_other_1:9> | <contenttweaker:electrotine_ore> | <betternether:cincinnasite_ore> | <immersiveengineering:ore:5> | <mekanism:oreblock> | <thermalfoundation:ore:2> | <netherendingores:ore_other_1:9>;



scripts.jei.addJEIhint(
    [ores], [],
    [<bountiful:bountyboarditem>],
    [
        <contenttweaker:rare_earth_dust>,
        <roots:baffle_cap_mushroom>,
        <minecraft:prismarine_shard>,
        <contenttweaker:apatite>,
        <contenttweaker:coral_dust>,
        <contenttweaker:wine_diamond>
    ]
);
scripts.jei.addJEIhint(
    [ores], [],
    [<bountiful:bountyboarditem>],
    [
        <harvestcraft:chocolatebaritem>,
        <projectred-core:resource_item:105>,
        <biomesoplenty:gem:7>,

        <harvestcraft:vinegaritem>,
        <erebus:materials:55>,
        <harvestcraft:doughitem>
    ]
);
scripts.jei.addJEIhint(
    [ores], [],
    [<bountiful:bountyboarditem>],
    [
        <minecraft:diamond>,
        <thermalfoundation:material:135>,
        <contenttweaker:bonsai_baffle_cap>,
        <contenttweaker:bonsai_mushroom_brown>,
        <contenttweaker:bonsai_mushroom_red>
    ]
);


