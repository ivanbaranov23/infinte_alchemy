import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

recipes.addShaped("ia_pot_seeds", <contenttweaker:potential_seeds>, [
    [<contenttweaker:burn_powder> | <tconstruct:firewood:1>, <contenttweaker:entangled_particles>, <contenttweaker:burn_powder> | <tconstruct:firewood:1>],
    [<twilightforest:liveroot>, <mowziesmobs:foliaath_seed>, <twilightforest:liveroot>],
    [<contenttweaker:burn_powder> | <tconstruct:firewood:1>, <contenttweaker:entangled_particles>, <contenttweaker:burn_powder> | <tconstruct:firewood:1>]
]);
<contenttweaker:potential_seeds>.addTooltip("Too potential to use");

mods.enderio.AlloySmelter.addRecipe(<contenttweaker:base_seeds> * 2, [
    <contenttweaker:potential_seeds> * 2,
    <actuallyadditions:item_crystal_empowered:5> * 64,
    <twilightforest:block_storage:2> * 32
]);
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:base_seeds> * 3, [
    <contenttweaker:potential_seeds> * 2,
    <actuallyadditions:item_crystal_empowered:5> * 64,
    <extendedcrafting:singularity_custom:11>
]);
mods.aether_legacy.Enchanter.registerEnchantment(<contenttweaker:base_seeds>, <mysticalagriculture:crafting:16>, 20 * 60 * 5);
<mysticalagriculture:crafting:16>.addTooltip("5 minutes in the altar");

{
    recipes.addShaped("ia_craftseed1", <mysticalagriculture:crafting:17>, [
        [<mysticalagriculture:storage>, <mysticalagriculture:crafting:33>, <mysticalagriculture:storage>],
        [<mysticalagriculture:crafting:33>, <mysticalagriculture:crafting:16>, <mysticalagriculture:crafting:33>],
        [<mysticalagriculture:storage>, <mysticalagriculture:crafting:33>, <mysticalagriculture:storage>]
    ]);
    recipes.addShaped("ia_craftseed2", <mysticalagriculture:crafting:18>, [
        [<mysticalagriculture:storage:1>, <mysticalagriculture:crafting:34>, <mysticalagriculture:storage:1>],
        [<mysticalagriculture:crafting:34>, <mysticalagriculture:crafting:17>, <mysticalagriculture:crafting:34>],
        [<mysticalagriculture:storage:1>, <mysticalagriculture:crafting:34>, <mysticalagriculture:storage:1>]
    ]);
}

var tier_seed as IItemStack[int] = {
    1: <mysticalagriculture:crafting:17>,
    2: <mysticalagriculture:crafting:18>
};
var seed_items as IItemStack[][IItemStack][string] = {
    TEAlloyer: {
        <mysticalagriculture:silicon_seeds>: [<appliedenergistics2:material:20> * 64],

    }
};

{//0
    recipes.addShaped("ia_slimy_bone_seeds", <mysticalagriculture:slimy_bone_seeds> * 4, [
        [<contenttweaker:lich_bone>, <mod_lavacow:silky_sludge>], 
        [<mod_lavacow:intestine>, <minecraft:wheat_seeds>]
    ]);
    mods.immersiveengineering.AlloySmelter.addRecipe(
        <mysticalagriculture:slimy_bone_seeds>, 
        <mod_lavacow:intestine> * 64,
        <contenttweaker:quest_coin>,
        4000
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <mysticalagriculture:slimy_bone_seeds>, 
        <mod_lavacow:intestine> * 64,
        <contenttweaker:quest_coin>,
        40000
    );
}

{//TEAlloyer
    for seed,ing in seed_items.TEAlloyer{
        mods.thermalexpansion.InductionSmelter.addRecipe(
            seed, 
            <mysticalagriculture:crafting:18>, ing[0], 
            100000
        );
    }
    /*mods.thermalexpansion.InductionSmelter.addRecipe(
        <mysticalagriculture:silicon_seeds>, 
        <mysticalagriculture:crafting:18>, IItemStack secondaryInput, 
        int energy_infuser
    );*/

}