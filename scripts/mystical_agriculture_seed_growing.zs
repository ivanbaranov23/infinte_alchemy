import crafttweaker.item.IItemStack;


function addSeeds(ess as IItemStack, seeds as IItemStack, energy_m as int){
    mods.thermalexpansion.Insolator.addRecipe(
        ess,
        seeds, <contenttweaker:fertilizer1>, 10000 * energy_m,
        seeds, 101, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 2,
        seeds, <contenttweaker:fertilizer2>, 30000 * energy_m,
        seeds, 101, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 4,
        seeds, <contenttweaker:fertilizer3>, 50000 * energy_m,
        seeds, 101, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 8,
        seeds, <contenttweaker:fertilizer4>, 70000 * energy_m,
        seeds, 101, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 16,
        seeds, <contenttweaker:fertilizer5>, 90000 * energy_m,
        seeds, 101, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 32,
        seeds, <contenttweaker:fertilizer6>, 110000 * energy_m,
        seeds, 101, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 64,
        seeds, <contenttweaker:fertilizer7>, 130000 * energy_m,
        seeds, 101, 1000
    );
}


addSeeds(<mysticalagriculture:stone_essence>, <mysticalagriculture:stone_seeds>, 1);
addSeeds(<mysticalagriculture:dirt_essence>, <mysticalagriculture:dirt_seeds>, 1);
addSeeds(<mysticalagriculture:nature_essence>, <mysticalagriculture:nature_seeds>, 1);
addSeeds(<mysticalagriculture:wood_essence>, <mysticalagriculture:wood_seeds>, 1);
addSeeds(<mysticalagriculture:water_essence>, <mysticalagriculture:water_seeds>, 1);
addSeeds(<mysticalagriculture:ice_essence>, <mysticalagriculture:ice_seeds>, 1);



addSeeds(<mysticalagriculture:silicon_essence>, <mysticalagriculture:silicon_seeds>, 2);
