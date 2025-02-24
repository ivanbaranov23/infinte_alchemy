import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import crafttweaker.data.IData;
import crafttweaker.util.Math;


import mods.modularmachinery.RecipeBuilder;

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
    [<contenttweaker:flower_steel_rod>, <contenttweaker:bug_hill_exit1>, <contenttweaker:flower_steel_rod>],
    [<moreplates:ironwood_plate>, <contenttweaker:flower_steel_rod>, <moreplates:ironwood_plate>]
]);

/*recipes.addShaped("ia_bug_hill3", <contenttweaker:bug_hill_exit3> * 2, [
    [<contenttweaker:chitin_ball>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin_ball>],
    [<contenttweaker:bug_hill_exit2>, <contenttweaker:rune_bug>, <contenttweaker:bug_hill_exit2>],
    [<contenttweaker:chitin_ball>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin_ball>]
]);*/
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bug_hill_exit3>, [
    [<contenttweaker:chitin_ball>, <contenttweaker:chitin>, <contenttweaker:bug_hill_exit2>, <contenttweaker:chitin>, <contenttweaker:chitin_ball>], 
    [<contenttweaker:chitin>, null, null, null, <contenttweaker:chitin>], 
    [<contenttweaker:bug_hill_exit2>, null, <contenttweaker:rune_bug>, null, <contenttweaker:bug_hill_exit2>], 
    [<contenttweaker:chitin>, null, null, null, <contenttweaker:chitin>], 
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
    4: 125000,
    5: 625000
};

for fl_food_type in bug_fluid_tiers{
    for tier in bug_fluid_tiers[fl_food_type]{
        for fluid in bug_fluid_tiers[fl_food_type][tier]{
            print("bugs_" ~ fl_food_type ~ fluid.name ~ tier);
            var rec = RecipeBuilder.newBuilder("bugs_" ~ fl_food_type ~ fluid.name, "bug_hill", 15 * 20);

            rec.addEnergyPerTickInput(100 * tier * tier);

            rec.addDimensionRequirement([66]);

            rec.addFluidOutput(<liquid:bugs> * tier_bugs[tier]);
            
            
            for food_type in ["Plant", "Meat", "Slime"] as string[]{
                if (fl_food_type != food_type) {
                    for ft,amount in tier_foods[tier]
                        rec.addItemInput(oreDict.get("bugFood" ~ food_type ~ ft), amount);
                }
            }

            rec.addFluidInput(fluid);
            
            //rec.addHotAirInput(stats[0], stats[0], 1000000);

            rec.build();

        }
    }
}



/*
for l_food in bug_breeding{
    for i_food, stats in bug_breeding[l_food]{
        var rec = RecipeBuilder.newBuilder("bugs_" ~ l_food.name ~ l_food.amount, "bug_hill", stats[0]);

        if (stats[1] != 0) rec.addEnergyPerTickInput(stats[1]);

        rec.addDimensionRequirement([66]);

        rec.addFluidOutput(<liquid:bugs> * stats[2]);
        
        for n, a in i_food
            rec.addItemInput(oreDict.get(n), a);
        rec.addFluidInput(l_food);
        
        //rec.addHotAirInput(stats[0], stats[0], 1000000);

        rec.build();
    }
}
*/
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
}

static bug_foraging as WeightedItemStack[][ILiquidStack][int[]] = {
    //dim, bug, rec time tick, rft, ymin, ymax
    [66, 2000, 20*8, 100, 0, 40]: {
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
        ]
    },
    [66, 2500, 20*7, 120, 41, 90]: {
        <liquid:flolit_water> * 100: [
            <erebus:dark_capped_mushroom> % 15,
            <erebus:sarcastic_czech_mushroom> % 15,
            <erebus:grandmas_shoes_mushroom> % 15,
            <erebus:dutch_cap_mushroom> % 15,
            <erebus:kaizers_fingers_mushroom> % 15,

            <erebus:materials:30> % 12,

            <contenttweaker:jade_dust> % 5,
            <contenttweaker:malachite_ore_dust> % 7,
            <erebus:materials:11> % 10,

            <contenttweaker:flolit> % 15
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
    [66, 2500, 20*7, 120, 91, 250]: {
        <liquid:flolit_water> * 100: [
            <mekanism:dirtydust:3> % 20,
            <mekanism:dirtydust:5> % 15,
            <mekores:mekanismore:8> % 4,
            <contenttweaker:gallium_dirty_dust> % 2,

            <enderio:item_material:33> % 15,
            <erebus:materials:11> % 20,

            <contenttweaker:flolit> % 15
        ]
    },
    [0, 10*1000, 20*10, 100*1000, 0, 255]: {
        <liquid:circuit> * 200: [
            <contenttweaker:bug_chip> % 10,
            <contenttweaker:bug_chip> % 10,
            <contenttweaker:bug_chip> % 10,
            <contenttweaker:bug_chip> % 10
        ]//250
    }
};

var counter as int = 0;
for stat, fluids in bug_foraging{
    for fluid,loot in fluids{

        var rec = RecipeBuilder.newBuilder("foraging_" ~ counter, "bug_hill", stat[2]);
        counter += 1;

        if (stat[3] != 0) rec.addEnergyPerTickInput(stat[3]);

        rec.addDimensionRequirement([0, stat[0]]);
        rec.addYRequirement(stat[4], stat[5]);

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
