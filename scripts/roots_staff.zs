//staffs aren't roots but whatever
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.roots.Pyre;
import mods.roots.Fey;
import mods.roots.Mortar;

function addStaffHint(inp as IIngredient, staff as IItemStack, out as IItemStack, right as bool){
    if (right)
        scripts.jei.addJEIhint(
            [inp], [],
            [staff, <minecraft:paper>.withDisplayName("Right Click")],
            [out]
        );
    else
        scripts.jei.addJEIhint(
            [inp], [],
            [staff, <minecraft:paper>.withDisplayName("Break Using Staff")],
            [out]
        );
}
function addStaffHint2(inp as IIngredient, staff as IItemStack, out as IItemStack[], luck as bool){
    scripts.jei.addJEIhint(
        [inp], [],
        [staff, <minecraft:paper>.withDisplayName("Break Using Staff").withLore(["Staff effected by Fortune: " ~ (luck ? "yes" : "no")])],
        out
    );
}
function addStaffHint3(inp as IIngredient, staff as IItemStack, out as IItemStack[], luck as bool){
    scripts.jei.addJEIhint(
        [inp], [],
        [staff, <minecraft:paper>.withDisplayName("Break Using Staff")],
        out
    );
}

{//staffwood
    Mortar.addRecipe("glue", 
        <contenttweaker:organic_glue> * 3, 
        [<harvestcraft:doughitem> | <moreplates:knightslime_plate> | <contenttweaker:creosolon>, <erebus:materials:40>, <erebus:materials:40>, <mekanism:salt>, <harvestcraft:snailcookeditem>]
    );
    Fey.addRecipe("staffwood",
        <contenttweaker:staffwood>,
        [<contenttweaker:organic_glue>, <biomesoplenty:bamboo>, <natura:sticks:9>, <natura:sticks:2>, <immersiveengineering:material>]
    );
}

{//clay
    addStaffHint(<contenttweaker:kaolin_clay_block>, <contenttweaker:staffwood_clay>, <contenttweaker:forest_clay_block>, true);
    addStaffHint(<minecraft:clay>, <contenttweaker:staffwood_clay>, <tconstruct:dried_clay>, true);
    addStaffHint(<excompressum:compressed_block:5>, <contenttweaker:staffwood_clay>, <atum:khnumite_raw>, true);
    addStaffHint(<atum:khnumite_block>, <contenttweaker:staffwood_clay>, <netherendingores:ore_other_1:6>, true);
}


{//mushroom
    //todo move to lang
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("Breaking block:", "Press Shift for Info");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->block will be replaced with an ore");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->staff takes 1 damage");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->only works with a real player");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->works with veinminer");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("Right clicking block:");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->block turns into oreshroom");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->breaking oreshroom with any tool turns it into an ore");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->staff takes 2 damage");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->can be automated");

    
    addStaffHint2(<erebus:kaizers_fingers_mushroom_block> | <contenttweaker:oreshroom_red>, <contenttweaker:staffwood_mushroom>, [
        <minecraft:netherrack>,
        //<biomesoplenty:flesh>,
        <minecraft:redstone_ore>,
        <biomesoplenty:gem_ore:1>,
        <thermalfoundation:ore_fluid:2>,
        <taiga:valyrium_ore>
    ], true);
    addStaffHint2(<erebus:dutch_cap_mushroom_block> | <contenttweaker:oreshroom_yellow>, <contenttweaker:staffwood_mushroom>, [
        <erebus:amber>,
        <thermalfoundation:ore>,
        <thermalfoundation:ore:5>,
        <minecraft:gold_ore>,
        <biomesoplenty:gem_ore:7>,
        <bigreactors:oreanglesite>.withLore(["Fortune lvl >= 1"])
    ], true);
    addStaffHint2(<erebus:grandmas_shoes_mushroom_block> | <contenttweaker:oreshroom_green>, <contenttweaker:staffwood_mushroom>, [
        <mysticalagriculture:inferium_ore>.withLore(["Becomes rarer with Fortune"]),
        <minecraft:emerald_ore>,
        <erebus:ore_jade>,
        <biomesoplenty:gem_ore:2>,
        <immersiveengineering:ore:5>,
        <taiga:tiberium_ore>
    ], true);
    addStaffHint2(<erebus:dark_capped_mushroom_block> | <contenttweaker:oreshroom_blue>, <contenttweaker:staffwood_mushroom>, [
        <contenttweaker:electrotine_ore>,
        <minecraft:lapis_ore>,
        <netherendingores:ore_other_1:4>,
        <netherendingores:ore_other_1:10>,
        <biomesoplenty:gem_ore:6>,
        <thermalfoundation:ore:6>
    ], false);
    addStaffHint2(<erebus:sarcastic_czech_mushroom_block> | <contenttweaker:oreshroom_purple>, <contenttweaker:staffwood_mushroom>, [
        <stygian:endobsidian>,
        <immersiveengineering:ore:2>,
        <netherendingores:ore_other_1:8>,
        <draconicevolution:draconium_ore>,
        <biomesoplenty:gem_ore:4>,
        <contenttweaker:geode_ore>.withLore(["Fortune lvl >= 1"])
    ], true);
}



{//fire
    addStaffHint(<contenttweaker:forest_clay_block>, <contenttweaker:staffwood_fire>, <contenttweaker:forest_fire>, true);
    recipes.addShaped("ia_staffwood_fire", <contenttweaker:staffwood_fire>, [
        [null, <contenttweaker:druid_bone>, <contenttweaker:lich_bone>], 
        [null, <contenttweaker:staffwood>, <contenttweaker:druid_bone>], 
        [<biomesoplenty:jar_filled:1>, null, null]
    ]);
}

{//bug
    recipes.addShaped("ia_staffwood_bug", <contenttweaker:staffwood_bug>, [
        [<erebus:materials:2>, <xreliquary:mob_ingredient:11>, <erebus:materials:15> | <erebus:materials:35>], 
        [null, <contenttweaker:staffwood>, <tconstruct:materials:22>], 
        [<tconstruct:materials:21>, null, null]
    ]);
}


{//flower staff
    <contenttweaker:staffwood_flower>.addShiftTooltip("Breaking block:", "Press Shift for Info");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->block will drop an item");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->staff takes 1 damage");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->only works with a real player");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->works with veinminer");
    <contenttweaker:staffwood_flower>.addShiftTooltip("Right clicking block:");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->block turns into flowred leaves");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->breaking flowered leaves with any tool drops an item");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->staff takes 1 damage");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->can be automated");

    scripts.jei.addJEIhint(
        [<contenttweaker:staffwood>, <biomesoplenty:leaves_3:9>], [],
        [<minecraft:paper>.withDisplayName("Break with staff")],
        [<contenttweaker:staffwood_flower>]
    );

    addStaffHint2(<minecraft:leaves:*>, <contenttweaker:staffwood_flower>, [
        <harvestcraft:snailrawitem>,
        <roots:petals>,
        <biomesoplenty:plant_0:12>,
        <twilightforest:steeleaf_ingot>
    ], false);
    addStaffHint2(<erebus:leaves_marshwood>, <contenttweaker:staffwood_flower>, [
        <erebus:materials:40>,
        <erebus:materials:28>,
        <erebus:materials:30>,
        <erebus:materials:31>,
        <biomesoplenty:plant_0:12>,
        <twilightforest:steeleaf_ingot>
    ], false);
}
