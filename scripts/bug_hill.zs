import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import crafttweaker.data.IData;
import crafttweaker.util.Math;


import mods.modularmachinery.RecipeBuilder;

recipes.addShaped("ia_bugs", <forge:bucketfilled>.withTag({FluidName: "bugs", Amount: 1000}), [
    [<contenttweaker:bug_essence>, <contenttweaker:bug_essence>, <contenttweaker:bug_essence>],
    [<contenttweaker:bug_essence>, <minecraft:bucket>, <contenttweaker:bug_essence>],
    [<contenttweaker:bug_essence>, <contenttweaker:bug_essence>, <contenttweaker:bug_essence>]
]);

//exits
recipes.addShaped("ia_bug_hill1", <contenttweaker:bug_hill_exit1> * 8, [
    [<tconstruct:deco_ground>, <tconstruct:deco_ground>, <tconstruct:deco_ground>],
    [<tconstruct:deco_ground>, <liquid:bugs> * 1000, <tconstruct:deco_ground>],
    [<tconstruct:deco_ground>, <tconstruct:deco_ground>, <tconstruct:deco_ground>]
]);
recipes.addShaped("ia_bug_hill12", <contenttweaker:bug_hill_exit1> * 8, [
    [<tconstruct:deco_ground>, <tconstruct:deco_ground>, <tconstruct:deco_ground>],
    [<tconstruct:deco_ground>, <erebus:rein_exo>, <tconstruct:deco_ground>],
    [<tconstruct:deco_ground>, <tconstruct:deco_ground>, <tconstruct:deco_ground>]
]);

recipes.addShaped("ia_bug_hill2", <contenttweaker:bug_hill_exit2>, [
    [<moreplates:ironwood_plate>, <contenttweaker:flower_steel_rod>, <moreplates:ironwood_plate>],
    [<contenttweaker:druid_bone>, <contenttweaker:bug_hill_exit1>, <contenttweaker:druid_bone>],
    [<moreplates:ironwood_plate>, <contenttweaker:flower_steel_rod>, <moreplates:ironwood_plate>]
]);

/*recipes.addShaped("ia_bug_hill3", <contenttweaker:bug_hill_exit3> * 2, [
    [<contenttweaker:chitin_ball>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin_ball>],
    [<contenttweaker:bug_hill_exit2>, <contenttweaker:rune_bug>, <contenttweaker:bug_hill_exit2>],
    [<contenttweaker:chitin_ball>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin_ball>]
]);*/
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bug_hill_exit3>, [
    [<contenttweaker:chitin_ball>, <contenttweaker:chitin>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin>, <contenttweaker:chitin_ball>], 
    [<contenttweaker:chitin>, null, <contenttweaker:bug_essence>, null, <contenttweaker:chitin>], 
    [<contenttweaker:bug_hill_exit2>, <contenttweaker:bug_essence>, <contenttweaker:rune_bug>, <contenttweaker:bug_essence>, <contenttweaker:bug_hill_exit2>], 
    [<contenttweaker:chitin>, null, <contenttweaker:bug_essence>, null, <contenttweaker:chitin>], 
    [<contenttweaker:chitin_ball>, <contenttweaker:chitin>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin>, <contenttweaker:chitin_ball>]
]);

//mud
mods.roots.Fey.addRecipe(
    "mushroomite_mud", <contenttweaker:mushroomite_mud>,
    [
        <erebus:mud>, <erebus:mud>,
        <mod_lavacow:chitin>,
        <contenttweaker:mushroomite_block>,
        <contenttweaker:plant_sample>
    ]
);
mods.roots.Fey.addRecipe(
    "glowshroomite_mud", <contenttweaker:glowshroomite_mud>,
    [
        <contenttweaker:mushroomite_mud>, <contenttweaker:mushroomite_mud>,
        <contenttweaker:chitin>,
        <contenttweaker:glowshroomite_block>,
        <contenttweaker:mushroomite_singularity>
    ]
);

//fuels
scripts.content_machines.addFluidMixerRecipe(
    <liquid:flolit_water> * 1000, 
    <liquid:honey> * 1000, <liquid:pure_water> * 1000, <contenttweaker:flolit>, 
    200, 100
);
scripts.content_machines.addFluidMixerRecipe(
    <liquid:flolit_water> * 500, 
    <liquid:honey> * 1000, <liquid:pure_water> * 1000, <contenttweaker:flolit_plant>, 
    200, 100
);



{//food ores
    //plant
    <ore:bugFoodPlant1>.addItems([<actuallyadditions:item_misc:1>, <erebus:compost>, <mekanism:biofuel>]);
    <ore:bugFoodPlant1>.addItems(<ore:listAllgreenveggie>.items);
    
    <ore:bugFoodPlant2>.addItems([<actuallyadditions:item_misc:21>, <contenttweaker:ashen_biocoal>, <contenttweaker:bioslag>, <mekanism:substrate>]);
    <ore:bugFoodPlant2>.addItems([<erebus:dark_capped_mushroom>, <erebus:sarcastic_czech_mushroom>, <erebus:grandmas_shoes_mushroom>, <erebus:dutch_cap_mushroom>, <erebus:kaizers_fingers_mushroom>]);

    <ore:bugFoodPlant3>.addItems([<contenttweaker:coaled_bioash>, <contenttweaker:mushroomite_ingot>]);

    <ore:bugFoodPlant4>.addItems([<contenttweaker:enmaned_biomass>, <contenttweaker:enspiced_spicy_bioblend>, <contenttweaker:biotite_dust>]);

    <ore:bugFoodPlant5>.addItems([<contenttweaker:activated_biopower>]);

    //meat
    <ore:bugFoodMeat1>.addItems([<minecraft:rotten_flesh>, <tconstruct:edible:3>, <prodigytech:meat_ground>, <contenttweaker:chewed_meat>]);
    <ore:bugFoodMeat2>.addItems([
        <mod_lavacow:canerottenmeat>,
        <harvestcraft:beefjerkyitem>,
        <tconstruct:edible:10>,
        <harvestcraft:zombiejerkyitem>,
        <tconstruct:edible:10>,
        <tconstruct:edible:11>,
        <tconstruct:edible:12>,
        <tconstruct:edible:23>,
        <tconstruct:edible:22>,
        <tconstruct:edible:21>,
        <tconstruct:edible:20>,
        <tconstruct:edible:14>,
        <tconstruct:edible:13>,
        <tconstruct:edible:15>
    ]);

    <ore:bugFoodMeat3>.addItems([<prodigytech:meat_patty>, <contenttweaker:aether_bug>, <erebus:erebus_food:13>, <bhc:red_heart>]);
    for o in <ore:foodGourmet*>{
        <ore:bugFoodMeat3>.addItems(o.items);
    }

    <ore:bugFoodMeat4>.addItems([<twilightforest:hydra_chop>, <atum:efreet_heart>, <deepmoblearning:glitch_heart>]);

    //slime1
    <ore:bugFoodSlime1>.addItems([<minecraft:slime_ball>, <actuallyadditions:item_misc:12>]);
    <ore:bugFoodSlime2>.addItems([<tconstruct:edible:2>, <tconstruct:edible:1>, <tconstruct:edible:4>]);
    <ore:bugFoodSlime3>.addItems([<harvestcraft:slimegummiesitem>, <industrialforegoing:pink_slime>, <contenttweaker:bug_slimeball>, <aether_legacy:swetty_ball>]);
    <ore:bugFoodSlime4>.addItems([<contenttweaker:gold_slimeball>, <contenttweaker:brain_slimeball>, <xreliquary:mob_ingredient:4>, <quark:slime_bucket>]);
    <ore:bugFoodSlime5>.add(<contenttweaker:bouncy_matter_small>);
}



static bug_breeding as int[][int[string]][ILiquidStack] = {
    <liquid:seed_oil> * 1000: {
        //temp, time, rft, bugs out
        {"bugFoodMeat1":1, "bugFoodSlime1":1}: [20*8, 0, 400]
    },

    <liquid:glowshroom_stew> * 2000: {
        {"bugFoodMeat3":1, "bugFoodMeat2":2, "bugFoodMeat1":4, "bugFoodSlime3":1, "bugFoodSlime2":2, "bugFoodSlime1":4}: [20*8, 200, 5000]
    },

    <liquid:blood> * 500: {
        {"bugFoodPlant1":1, "bugFoodSlime1":1}: [20*8, 0, 400]
    },
    <liquid:beetle_juice> * 500: {
        {"bugFoodPlant2":1, "bugFoodPlant1":2, "bugFoodSlime2":1, "bugFoodSlime1":2}: [20*8, 80, 1000]
    },

    <liquid:evil_blood> * 500: {
        {"bugFoodPlant2": 32, "bugFoodSlime5":1}: [20*5, 4000, 120 * 1000]
    },


    <liquid:blueslime> * 1000: {
        {"bugFoodPlant1": 1, "bugFoodMeat1": 1}: [20*8, 100, 600]
    },
    <liquid:purpleslime> * 1000: {
        {"bugFoodPlant1": 1, "bugFoodMeat1": 1}: [20*8, 100, 600]
    },
    <liquid:if.pink_slime> * 3000: {
        {
            "bugFoodPlant1": 8, 
            "bugFoodPlant2": 4, 
            "bugFoodPlant3": 2,
            "bugFoodMeat1": 8, 
            "bugFoodMeat2": 4, 
            "bugFoodMeat3": 1
        }: [20*6, 500, 10 * 1000]
    }
};

static bug_fluid_tiers as ILiquidStack[][int][string] = {
    Plant: {
        1: [
            <liquid:canolaoil> * 3000,
            <liquid:refinedcanolaoil> * 1000,
            <liquid:plantoil> * 3000,
            <liquid:latex> * 2000,
            <liquid:biocrude> * 3000,
            <liquid:seed_oil> * 3000,
            <liquid:sap> * 3000,
            <liquid:resin> * 3000,
            <liquid:tree_oil> * 3000
        ],
        2: [
            <liquid:menrilresin> * 4000,
            <liquid:yeast> * 4000,
            <liquid:honey> * 4000,
            <liquid:seaweed_rich_water> * 5000,
            <liquid:grape_juice> * 3500,
            <liquid:soy_milk> * 2000,
            <liquid:skyroot> * 2000,
            <liquid:biofuel> * 1000,
            <liquid:mushroom_stew> * 4000,
            <liquid:syrup> * 3000,
            <liquid:refined_biofuel> * 2000,
            <liquid:chocolate_mud> * 500
        ],
        3: [
            <liquid:liquidchorus> * 20000,
            <liquid:crystaloil> * 8000,
            <liquid:yeast_rich> * 5000,
            <liquid:bacteria_broth> * 10000,
            <liquid:fermented_bacteria_broth> * 7000,
            <liquid:glowshroom_stew> * 7500,
            <liquid:biodiesel> * 8000
        ],
        4: [
            <liquid:biotite> * 25000,
            <liquid:ender_bacteria_broth> * 16000,
            <liquid:empoweredoil> * 16000,
            <liquid:ambrosium_slury> * 4000
        ]
    },
    Meat: {
        1: [
            <liquid:blood> * 2000,
            <liquid:rot> * 1500,
            <liquid:beetle_juice> * 2000,
            <liquid:meat> * 3000
        ],
        2: [
            <liquid:worm_blood> * 4000,
            <liquid:nutrient_distillation> * 6000,
            <liquid:raw_chitin> * 4000,
            <liquid:if.protein> * 4000,
            <liquid:pigiron> * 1000
        ],
        3: [
            <liquid:lifeessence> * 16000,
            <liquid:ender_blood> * 12000,
            <liquid:bloodbronze> * 1000
        ],
        4: [
            <liquid:evil_blood> * 10000,
            <liquid:desert_soup> * 8000,
            <liquid:cool_soup> * 8000,
            <liquid:bound_metal> * 500
        ]
    },
    Slime: {
        1: [
            <liquid:sludge> * 3000,
            <liquid:blueslime> * 3000,
            <liquid:purpleslime> * 3000
        ],
        2: [
            <liquid:muddy_sludge> * 4000,
            <liquid:if.pink_slime> * 8000,
            <liquid:knightslime> * 5000
        ],
        3: [
            <liquid:pink_metal> * 10000
        ],
        4: [
            <liquid:molten_reinforced_pink_slime> * 1000
        ]
    }
};
static tier_foods as int[string][int] = {
    1: {
        "1": 1
    },
    2: {
        "1": 4,
        "2": 1
    },
    3: {
        "1": 16,
        "2": 4,
        "3": 1
    },
    4: {
        "1": 64,
        "2": 16,
        "3": 4,
        "4": 1
    },
    5: {
        "1": 64,
        "2": 64,
        "3": 16,
        "4": 4,
        "5": 1
    }
};
static tier_bugs as int[int] = {
    1: 300,
    2: 1000,
    3: 12000,
    4: 150000,
    5: 2000000
};

for fl_food_type in bug_fluid_tiers{
    for tier in bug_fluid_tiers[fl_food_type]{
        for fluid in bug_fluid_tiers[fl_food_type][tier]{
            print("bugs_" ~ fl_food_type ~ fluid.name ~ tier);
            {    
                var rec = RecipeBuilder.newBuilder("bugs_" ~ fl_food_type ~ fluid.name, "bug_hill", 15 * 20);

                rec.addEnergyPerTickInput(100 * tier * tier);
                rec.addDimensionInput(66);
                rec.addFluidOutput(<liquid:bugs> * tier_bugs[tier]);
                
                for food_type in ["Plant", "Meat", "Slime"] as string[]{
                    if (fl_food_type != food_type) {
                        for ft,amount in tier_foods[tier]
                            rec.addItemInput(oreDict.get("bugFood" ~ food_type ~ ft) * amount);
                    }
                }

                rec.addFluidInput(fluid);

                rec.build();
            }
            {    
                var rec = RecipeBuilder.newBuilder("bugsl_" ~ fl_food_type ~ fluid.name, "bug_hill", 15 * 20);

                rec.addEnergyPerTickInput(100 * tier * tier);
                rec.addFluidOutput(<liquid:bugs> * tier_bugs[tier]);
                
                for food_type in ["Plant", "Meat", "Slime"] as string[]{
                    if (fl_food_type != food_type) {
                        for ft,amount in tier_foods[tier]
                            rec.addItemInput(oreDict.get("bugFood" ~ food_type ~ ft) * amount);
                    }
                }

                rec.addFluidInput(fluid);
                rec.addFluidInput(<liquid:erebus_air> * (tier_bugs[tier] / 10));

                rec.build();
            }
        }
    }
}



/*-11325: "deep_dark",
    
    -1:     "nether",      hot
    0:      "overworld",   
    1:      "end",         cold
    4:      "aether",      fly
    7:      "twilight_forest", fly
    17:     "atum",        dry
    
    66:     "erebus"       strong competition
*/

{//fluids
    scripts.content_machines.basicFluidMixerRecipe(
        null, <liquid:chocolate_mud> * 1000, 
        <erebus:dark_capped_mushroom>, [<liquid:chocolate> * 1000, <liquid:claymud> * 1000], 
        20, 1000
    );

    //taiga
    scripts.content_machines.basicFluidMixerRecipe(
        null, <liquid:taiga_fluid> * 1000, 
        <minecraft:sapling:1>, [<liquid:cryotheum> * 1000, <liquid:terrax_fluid> * 288], 
        20, 1000
    );
    scripts.content_machines.basicFluidMixerRecipe(
        null, <liquid:taiga_fluid> * 1200, 
        <biomesoplenty:sapling_0:6>, [<liquid:cryotheum> * 1000, <liquid:terrax_fluid> * 288], 
        20, 1000
    );
    scripts.content_machines.basicFluidMixerRecipe(
        null, <liquid:taiga_fluid> * 1500, 
        <harvestcraft:frostgarden>, [<liquid:cryotheum> * 1000, <liquid:terrax_fluid> * 288], 
        20, 1000
    );

    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:eggplant> * 1000, 
        <contenttweaker:eggplant_dust>, <liquid:potion>.withTag({Potion: "minecraft:long_fire_resistance"}) * 500, 
        2000
    );
}

static bug_foraging as WeightedItemStack[][ILiquidStack][int[]] = {
    //dim, bug, rec time tick, rft
    [66, 2000, 20*8, 100]: {
        <liquid:refined_biofuel> * 3000: [
            <erebus:materials:55> % 80,
            <erebus:materials:55> % 20,
            <erebus:materials:55> % 10,

            <erebus:materials:11> % 80,
            <erebus:materials:11> % 20,

            <erebus:materials:30> % 30,
            <erebus:materials:31> % 30,
            <erebus:materials:28> % 30,
            <erebus:materials:18> % 20,
            <erebus:materials:23> % 10,
            <erebus:materials:4> % 10
        ],
        <liquid:flolit_water> * 500: [
            <mekanism:dirtydust> % 20,
            <mekanism:dirtydust:2> % 18,
            <mekanism:dirtydust:6> % 15,

            <mekores:mekanismore:38> % 14,

            <mekores:mekanismore:23> % 10,
            <mekanism:dirtydust:5> % 10,
            <mekanism:dirtydust:6> % 10,
            <mekores:mekanismore:108> % 10,

            <mekores:mekanismore:268> % 1,
            <thermalfoundation:material:892> % 10
        ],
        <liquid:cracked_steam> * 100: [
            <thermalfoundation:material:892> % 50,
            <immersivepetroleum:material> % 50,
            <contenttweaker:kaolin_clay> % 50,
            <contenttweaker:kaolin_clay> % 50,
            <contenttweaker:kaolin_clay> % 50
        ]
    },
    [66, 3000, 20*7, 400]: {
        <liquid:formic_acid> * 200: [
            <contenttweaker:flolit> % 20,
            <contenttweaker:formic_acid_dust> % 40,
            <mysticalagriculture:crafting:5> % 50,
            <mysticalagriculture:crafting:5> % 50
        ],
        <liquid:chocolate_mud> * 100: [
            <contenttweaker:flolit> % 20,
            <contenttweaker:jade_dust> % 10,
            <contenttweaker:malachite_ore_dust> % 10,
            <enderio:item_material:33> % 15,
            <thermalfoundation:material:893> % 2,

            <actuallyadditions:item_dust:2> % 4,
            <actuallyadditions:item_dust:3> % 3,

        ]
    },
    [0, 10*1000, 20*10, 100*1000]: {
        <liquid:circuit> * 200: [
            <contenttweaker:bug_chip> % 10,
            <contenttweaker:bug_chip> % 10,
            <contenttweaker:bug_chip> % 10,
            <contenttweaker:bug_chip> % 10
        ]//250
    },


    [7, 2000, 20*10, 1000]: {
        <liquid:taiga_fluid> * 400: [
            <mekores:mekanismore:273> % 75,
            <mekores:mekanismore:278> % 75,
            <mekores:mekanismore:283> % 75,

            <mekores:mekanismore:298> % 50,
            <mekores:mekanismore:258> % 50,
            <mekores:mekanismore:268> % 25,

            <taiga:dilithium_crystal> % 50
        ],
        <liquid:cracked_steam> * 100: [
            <thermalfoundation:material:892> % 50,
            <thermalfoundation:material:892> % 50,
            <immersivepetroleum:material> % 50,
            <contenttweaker:kaolin_clay> % 50
        ]
    },
    [7, 4000, 20 * 10, 1000]: {
        <liquid:refined_biofuel> * 3000: [
            <botania:flower> % 75,
            <botania:flower:1> % 75,
            <botania:flower:2> % 75,
            <botania:flower:3> % 75,
            <botania:flower:4> % 75,
            <botania:flower:5> % 75,
            <botania:flower:6> % 75,
            <botania:flower:7> % 75,
            <botania:flower:8> % 75,
            <botania:flower:9> % 75,
            <botania:flower:10> % 75,
            <botania:flower:11> % 75,
            <botania:flower:12> % 75,
            <botania:flower:13> % 75,
            <botania:flower:14> % 75,
            <botania:flower:15> % 75,
        ]
    },

    [-1, 4000, 20 * 10, 1000]: {
        <liquid:taiga_fluid> * 400: [
            <taiga:tiberium_crystal> % 50,
            <taiga:tiberium_crystal> % 50,

            <mekores:mekanismore:253> % 50,
            <mekores:mekanismore:218> % 50,
            <taiga:meteorite_dust> % 50
        ]
    },
    [-1, 4000, 20 * 10, 1000]: {
        <liquid:eggplant> * 1000: [
            <betternether:egg_plant> % 80,
            <betternether:egg_plant> % 40,
            <betternether:egg_plant> % 20,
            <betternether:lucis_spore> % 20,
            <betternether:magma_flower> % 20,
            <betternether:bone_mushroom> % 20,
            <betternether:agave> % 20
        ]
    }
};

var counter as int = 0;
for stat, fluids in bug_foraging{
    for fluid,loot in fluids{

        var rec = RecipeBuilder.newBuilder("foraging_" ~ counter, "bug_hill", stat[2]);
        counter += 1;

        if (stat[3] != 0) rec.addEnergyPerTickInput(stat[3]);

        rec.addDimensionInput(stat[0]);

        rec.addFluidInput(<liquid:bugs> * stat[1]);
        rec.addFluidInput(fluid);

        for l in loot{
            rec.addItemOutput(l.stack);
			rec.setChance(l.chance);
        }
        
        //for i in i_food
        //    rec.addItemInput(i, i.amount);
        //rec.addFluidInput(l_food);
        
        //rec.addHotAirInput(stats[0], stats[0], 1000000);

        rec.build();
    }
}
