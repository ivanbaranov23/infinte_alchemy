import crafttweaker.item.IItemStack;

import mods.prodigytech.atomicreshaper;
//addRecipeMulti(IItemStack in, int primordium, int time, IItemStack[] outputs, @Optional int[] weights)


function addASrecipe(inp as IItemStack, items as IItemStack[], prim as int, time_sec as int){
    var i as IItemStack[] = [];
    var w as int[] = [];
    for item in items{
        i += item * 4;
        w += item.amount;
    }
    atomicreshaper.addRecipeMulti(
        inp, prim, time_sec * 20,
        i, w
    );
}

atomicreshaper.removeRecipe(<ore:stone>);

addASrecipe(<minecraft:stone>, [
    <minecraft:iron_ore> * 20,
    <thermalfoundation:ore> * 15,
    <thermalfoundation:ore:1> * 8,
    <thermalfoundation:ore:4> * 10,
    <thermalfoundation:ore:5> * 10,
    <contenttweaker:zinc_ore> * 10
], 10, 1);
addASrecipe(<minecraft:quartz_block>, [
    <mysticalworld:quartz_ore> * 25,
    <appliedenergistics2:quartz_ore> * 15,
    <appliedenergistics2:charged_quartz_ore> * 3,
    <actuallyadditions:block_misc:3> * 10
], 15, 2);
addASrecipe(<quark:jasper>, [
    <thermalfoundation:ore> * 20,
    <atum:relic_ore> * 10,
    <biomesoplenty:gem_ore:3> * 5,
    <contenttweaker:tungsten_ore> * 12
], 20, 2);
addASrecipe(<quark:biome_cobblestone>, [
    <minecraft:redstone_ore> * 20,
    <thermalfoundation:ore_fluid:2> * 5,
    <biomesoplenty:gem_ore:1> * 5,
    <minecraft:quartz_ore> * 20
], 20, 2);
addASrecipe(<quark:biome_cobblestone:1>, [
    <minecraft:lapis_ore> * 20,
    <minecraft:diamond_ore> * 5,
    <contenttweaker:electrotine_ore> * 25,
    <moretcon:orefusionite> * 10,
    <moretcon:oreelectarite> * 10,
    <thermalfoundation:ore:6> * 3,
    <biomesoplenty:gem_ore:6> * 10
], 25, 2);

//erebus
addASrecipe(<erebus:umberstone>, [
    <erebus:ore_coal> * 35,
    <erebus:ore_copper> * 10,
    <erebus:ore_lapis> * 10,
    <erebus:ore_jade> * 10,
    <contenttweaker:flolit_ore> * 10,
    <erebus:ore_petrified_wood> * 5
], 10, 2);

//nether
addASrecipe(<mysticalagriculture:soulstone>, [
    <netherendingores:ore_nether_modded_2:1> * 20,
    <betternether:cincinnasite_ore> * 15,
    <taiga:prometheum_ore> * 15,
    <moretcon:orehallowsite> * 15,
    <netherite:ancientdebris> * 10,
    <bigreactors:orebenitoite>
], 20, 2);

//twilight
addASrecipe(<twilightforest:underbrick>, [
    <twilightforest:trollsteinn> * 5,
    <taiga:meteoritecobble_block> * 2,
    <moretcon:orefusionite>,
    <moretcon:oreirradium>,
    <moretcon:orevoidspar>,
    <moretcon:oregarstone>,
    <moretcon:oreelectarite>,
    <netherendingores:ore_other_1:9>
], 25, 2);