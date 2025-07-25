//aka erebus skip file
import crafttweaker.item.IItemStack;

//malachite
recipes.addShapeless("ia_malachite", <contenttweaker:malachite_polycrystal> * 2, [
    <ore:gearEnchantedMetal>,
    <erebus:materials:40>, <erebus:materials:40>, <erebus:materials:40>, <erebus:materials:40>,
    <contenttweaker:transmut_gel>
]);

function addBugEssence(inp as IItemStack, out as IItemStack){
    mods.immersiveengineering.AlloySmelter.addRecipe(
        out, 
        <contenttweaker:bug_essence>,
        inp,
        200
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        out, 
        <contenttweaker:bug_essence>,
        inp,
        1000
    );
}
mods.roots.Fey.addRecipe("bug_essence", <contenttweaker:bug_essence> * 2, [
    <roots:strange_ooze>, <contenttweaker:primitive_eyes>, <xreliquary:mob_ingredient:2>, <contenttweaker:umberstone_dust>, <ore:dyeCyan>
]);

addBugEssence(<roots:fey_leather> * 3, <erebus:materials:9>);
addBugEssence(<minecraft:emerald> * 2, <erebus:materials:1>);
addBugEssence(<xreliquary:mob_ingredient>, <erebus:materials> * 2);

mods.tconstruct.Melting.addRecipe(<liquid:beetle_juice> * 250, <contenttweaker:bug_essence>, 500);
mods.thermalexpansion.Crucible.addRecipe(<liquid:beetle_juice> * 250, <contenttweaker:bug_essence>, 2000);

{//
    mods.immersiveengineering.AlloySmelter.addRecipe(
        <erebus:flower_seed:14>, 
        <roots:petals> * 64,
        <contenttweaker:bug_essence> * 8,
        4000
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <erebus:flower_seed:14>, 
        <roots:petals> * 64,
        <contenttweaker:bug_essence> * 8,
        40000
    );

    scripts.jei.addJEIhint(
        [<erebus:flower_seed:14>, <erebus:planted_flower:14>], [], [
            <minecraft:dirt> * 9, <minecraft:dye:15>
        ], [<erebus:giant_flower_stigma:14>]
    );
}