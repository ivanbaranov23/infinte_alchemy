import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

recipes.addShaped("ia_pot_seeds", <contenttweaker:potential_seeds> * 3, [
    [<contenttweaker:burn_powder> | <tconstruct:firewood:1>, <contenttweaker:entangled_particles>, <contenttweaker:burn_powder> | <tconstruct:firewood:1>],
    [<twilightforest:liveroot>, <mowziesmobs:foliaath_seed>, <twilightforest:liveroot>],
    [<contenttweaker:burn_powder> | <tconstruct:firewood:1>, <contenttweaker:entangled_particles>, <contenttweaker:burn_powder> | <tconstruct:firewood:1>]
]);
<contenttweaker:potential_seeds>.addTooltip("Too potential to use");

mods.enderio.AlloySmelter.addRecipe(<contenttweaker:base_seeds> * 4, [
    <contenttweaker:potential_seeds> * 2,
    <actuallyadditions:item_crystal_empowered:5> * 64,
    <twilightforest:block_storage:2> * 32
], 100 * 1000);
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:base_seeds> * 6, [
    <contenttweaker:potential_seeds> * 2,
    <actuallyadditions:item_crystal_empowered:5> * 64,
    <extendedcrafting:singularity_custom:11>
], 100 * 1000);
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
var tier_power as int[int] = {
    0: 10000,
    1: 100000,
    2: 1000000,
    3: 10000000,
    4: 100000000,
    5: 1000000000,
    6: 10000000000
};
var tier_fluid as ILiquidStack[][int] = {
    0: [],
    1: [<liquid:dirt> * 1000],
    2: [<liquid:dirt> * 2000],
    3: [<liquid:dirt> * 4000],
    4: [<liquid:dirt> * 12000],
    5: [<liquid:dirt> * 32000],
    6: [<liquid:dirt> * 128000],
    7: []
};
var seed_items as IItemStack[][IItemStack][int] = {
    1: {
        <mysticalagriculture:stone_seeds>: [<extendedcrafting:singularity_custom:2> * 4],
        <mysticalagriculture:dirt_seeds>: [
            <biomesoplenty:dirt> * 64,
            <biomesoplenty:dirt:1> * 64,
            <biomesoplenty:dirt:2> * 64,
            <minecraft:dirt:1> * 64
        ],

        <mysticalagriculture:nature_seeds>: [
            <mysticalagriculture:crafting:6>, 
            <harvestcraft:aridgarden> * 4, <harvestcraft:frostgarden> * 4, <harvestcraft:shadedgarden> * 4, <harvestcraft:soggygarden> * 4, <harvestcraft:tropicalgarden> * 4, <harvestcraft:windygarden> * 4
        ],
        <mysticalagriculture:wood_seeds>: [
            <mysticalagriculture:nature_essence> * 64,
            <extendedcrafting:singularity_custom:100> * 4,
            <integrateddynamics:menril_log> * 64,
            <twilightforest:ironwood_ingot> * 64
        ],

        <mysticalagriculture:water_seeds>: [
            <cookingforblockheads:sink> * 4, <extrautils2:passivegenerator:3> * 4, <mekanism:machineblock:12> * 4
        ],
        <mysticalagriculture:nether_seeds>: [
            <mysticalagriculture:crafting:8>,
            <extrautils2:compressednetherrack:3>, <extendedcrafting:singularity_custom:25>, <extendedcrafting:singularity:4>, <biomesoplenty:flesh> * 256
        ],

        <mysticalagriculture:menril_seeds>: [
            <mysticalagriculture:nature_essence> * 64,
            <contenttweaker:menril_steel_ingot> * 256,
            <integrateddynamics:crystalized_menril_block> * 256
        ],

        <mysticalagriculture:limestone_seeds>: [
            <mysticalagriculture:stone_essence> * 64,
            <atum:limestone> * 256,
            <quark:limestone> * 256,
            <chisel:limestone2:7> * 256,
            <contenttweaker:relic_ingot> * 64
        ]
    },
    2: {
        <mysticalagriculture:iron_seeds>: [<extendedcrafting:singularity:1> * 4, <harvestcraft:ironbrewitem> * 16],
        <mysticalagriculture:copper_seeds>: [<extendedcrafting:singularity:17> * 4, <mysticalagriculture:iron_essence> * 64, <contenttweaker:copper_potato> * 64],
        <mysticalagriculture:tin_seeds>: [<extendedcrafting:singularity:18> * 4, <mysticalagriculture:iron_essence> * 64, <contenttweaker:tinley> * 64],
        <mysticalagriculture:nickel_seeds>: [<extendedcrafting:singularity:25> * 4, <mysticalagriculture:iron_essence> * 64, <contenttweaker:nickel_oxide> * 64],
        <mysticalagriculture:aluminum_seeds>: [<extendedcrafting:singularity:16> * 4, <mysticalagriculture:iron_essence> * 64, <contenttweaker:ferramic_base> * 64],
        <mysticalagriculture:zinc_seeds>: [<extendedcrafting:singularity:20> * 4, <mysticalagriculture:iron_essence> * 64, <thermalexpansion:florb>.withTag({Fluid: "andesite"}) * 64],
        <mysticalagriculture:cobalt_seeds>: [<extendedcrafting:singularity:65> * 4, <mysticalagriculture:iron_essence> * 64, <mysticalagriculture:nether_essence> * 64],
        <mysticalagriculture:ardite_seeds>: [<extendedcrafting:singularity:64> * 4, <mysticalagriculture:iron_essence> * 64, <mysticalagriculture:nether_essence> * 64],
        <mysticalcreations:antimony_seeds>: [<extendedcrafting:singularity_custom:73> * 4, <mysticalagriculture:iron_essence> * 64, <contenttweaker:solder> * 256],

        <mysticalagriculture:silicon_seeds>: [<projectred-core:resource_item:301> * 64],

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


    recipes.addShaped("nature_cluster", <mysticalagriculture:crafting:6>, [
        [<botania:cocoon>, <harvestcraft:cookedtofaconitem>], 
        [<contenttweaker:cacti_foci>, <additionalcompression:cropsugarcane_compressed:2>]
    ]);
}

for tier in seed_items{
    for seed,ing in seed_items[tier]{
        var rec = mods.modularmachinery.RecipeBuilder.newBuilder("myst_agri_" ~ tier ~ "_" ~ seed.name, "plant_station", 10 * 20);
        rec.addEnergyPerTickInput(tier_power[tier]);

        rec.addItemOutput(seed);
        

        rec.addItemInput(tier_seed[tier]);
        for i in ing{
            rec.addItemInput(i);
        }
        
        for fl in tier_fluid[tier]
            rec.addFluidInput(fl);

        rec.build();
    }
}
