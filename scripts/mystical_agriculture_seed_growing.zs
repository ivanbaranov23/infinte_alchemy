import crafttweaker.item.IItemStack;


function addSeeds(ess as IItemStack, seeds as IItemStack, energy_m as int){
    recipes.addShapeless("myst_reset_argicraft_data_" ~ seeds.name, seeds, [seeds]);

    mods.thermalexpansion.Insolator.addRecipe(
        ess,
        seeds, <contenttweaker:fertilizer1>, 10000 * energy_m,
        seeds, 110, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 2,
        seeds, <contenttweaker:fertilizer2>, 10000 * energy_m,
        seeds, 110, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 4,
        seeds, <contenttweaker:fertilizer3>, 10000 * energy_m,
        seeds, 110, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 8,
        seeds, <contenttweaker:fertilizer4>, 10000 * energy_m,
        seeds, 110, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 16,
        seeds, <contenttweaker:fertilizer5>, 10000 * energy_m,
        seeds, 110, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 32,
        seeds, <contenttweaker:fertilizer6>, 20000 * energy_m,
        seeds, 110, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        ess * 64,
        seeds, <contenttweaker:fertilizer7>, 30000 * energy_m,
        seeds, 110, 1000
    );

    
}


addSeeds(<mysticalagriculture:stone_essence>, <mysticalagriculture:stone_seeds>, 1);
addSeeds(<mysticalagriculture:dirt_essence>, <mysticalagriculture:dirt_seeds>, 1);
addSeeds(<mysticalagriculture:nature_essence>, <mysticalagriculture:nature_seeds>, 1);
addSeeds(<mysticalagriculture:wood_essence>, <mysticalagriculture:wood_seeds>, 1);
addSeeds(<mysticalagriculture:water_essence>, <mysticalagriculture:water_seeds>, 1);
addSeeds(<mysticalagriculture:ice_essence>, <mysticalagriculture:ice_seeds>, 1);
addSeeds(<mysticalagriculture:fire_essence>, <mysticalagriculture:fire_seeds>, 1);
addSeeds(<mysticalagriculture:nether_essence>, <mysticalagriculture:nether_seeds>, 1);


addSeeds(<mysticalagriculture:menril_essence>, <mysticalagriculture:menril_seeds>, 1);

addSeeds(<mysticalagriculture:limestone_essence>, <mysticalagriculture:limestone_seeds>, 1);
addSeeds(<mysticalagriculture:sky_stone_essence>, <mysticalagriculture:sky_stone_seeds>, 1);

//t1 metals
addSeeds(<mysticalagriculture:iron_essence>, <mysticalagriculture:iron_seeds>, 2);
addSeeds(<mysticalagriculture:copper_essence>, <mysticalagriculture:copper_seeds>, 2);
addSeeds(<mysticalagriculture:tin_essence>, <mysticalagriculture:tin_seeds>, 2);
addSeeds(<mysticalagriculture:nickel_essence>, <mysticalagriculture:nickel_seeds>, 2);
addSeeds(<mysticalagriculture:aluminum_essence>, <mysticalagriculture:aluminum_seeds>, 2);
addSeeds(<mysticalagriculture:zinc_essence>, <mysticalagriculture:zinc_seeds>, 2);
addSeeds(<mysticalagriculture:cobalt_essence>, <mysticalagriculture:cobalt_seeds>, 2);
addSeeds(<mysticalagriculture:ardite_essence>, <mysticalagriculture:ardite_seeds>, 2);
addSeeds(<mysticalcreations:antimony_essence>, <mysticalcreations:antimony_seeds>, 2);

addSeeds(<mysticalcreations:karmesine_essence>, <mysticalcreations:karmesine_seeds>, 2);
addSeeds(<mysticalcreations:ovium_essence>, <mysticalcreations:ovium_seeds>, 2);
addSeeds(<mysticalcreations:jauxum_essence>, <mysticalcreations:jauxum_seeds>, 2);

addSeeds(<mysticalagriculture:silicon_essence>, <mysticalagriculture:silicon_seeds>, 2);

addSeeds(<mysticalagriculture:terrasteel_essence>, <mysticalagriculture:terrasteel_seeds>, 5);
