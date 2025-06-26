#priority 100


import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

//grinders
import mods.appliedenergistics2.Grinder as AEgrinder; 
import mods.actuallyadditions.Crusher as AAgrinder;
//import mods.thermalexpansion.RedstoneFurnace;
import mods.thermalexpansion.Pulverizer as TEgrinder;
import mods.immersiveengineering.Crusher as IEgrinder;
import mods.extrautils2.Crusher as EUgrinder;
import mods.prodigytech.orerefinery as PTgrinder;
import mods.integrateddynamics.MechanicalSqueezer as IDgrinder;
import mods.enderio.SagMill;

//furnaces
import mods.thermalexpansion.InductionSmelter;
//InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
import mods.thermalexpansion.Transposer;

import mods.modularmachinery.RecipeBuilder;

import mods.thermalexpansion.Centrifuge;

import mods.mekanism.enrichment;
import mods.mekanism.purification;
import mods.mekanism.chemical.injection;
import mods.mekanism.chemical.dissolution;


function addCrushingRecipe_no_eio(ingot as IItemStack, dust as IItemStack, byprod as IItemStack, chance as int){
    //AEgrinder.addRecipe(dust, ingot, 4, byprod, (chance as float) / 100.0);
    PTgrinder.addRecipe(ingot, dust, byprod, (chance as float) / 100.0);
    IEgrinder.addRecipe(dust, ingot, 4000, byprod, (chance as float) / 100.0);
    EUgrinder.add(dust, ingot, byprod, (chance as float) / 100.0);
    TEgrinder.addRecipe(dust, ingot, 2000, byprod, chance);
	AAgrinder.addRecipe(dust, ingot, byprod, chance);
	
	//SagMill.addRecipe([dust, byprod], [1.0, chance / 100.0], ingot, "CHANCE_ONLY");
	//mods.mekanism.crusher.addRecipe(ingot, dust);
}

//functions
function addSimpleCrushingRecipe(ingot as IItemStack, dust as IItemStack){
    scripts.helper.addSimpleCrushingRecipe(ingot, dust);
}

function addCrushing1(ore as IItemStack, main as IItemStack, byprod as IItemStack, chance as int){
    addCrushingRecipe_no_eio(ore, main, byprod, chance);
    SagMill.addRecipe([main, byprod], [1.0, (chance as float) / 100.0], ore, "CHANCE_ONLY");
}
function addCrushing12(
    ore as IItemStack, main as IItemStack, 
    byprod1 as IItemStack, chance1 as int, 
    byprod2 as IItemStack, chance2 as int
    ){
    addCrushingRecipe_no_eio(ore, main, byprod1, chance1);
    SagMill.addRecipe([main, byprod1, byprod2], [1.0, (chance1 as float) / 100.0, (chance2 as float) / 100.0], ore, "CHANCE_ONLY");
    IDgrinder.addRecipe(ore, 
        main, 1.0,
        byprod1, (chance1 as float) / 100.0,
        byprod2, (chance2 as float) / 100.0
    );
}
function addCrushing2(ore as IItemStack, main as IItemStack, byprod2 as IItemStack, chance2 as int){
    addSimpleCrushingRecipe(ore, main);
    SagMill.addRecipe([main, byprod2], [1.0, (chance2 as float) / 100.0], ore, "CHANCE_ONLY");
}

function addClumpCrushing(clump as IItemStack, main as IItemStack,
    byprod1 as IItemStack, chance1 as int, 
    byprod2 as IItemStack, chance2 as int, 
    energy as int)
{
    if (byprod2)
        SagMill.addRecipe([main, byprod1, byprod2], [1.0, (chance1 as float) / 100.0, (chance2 as float) / 100.0], clump, "MULTIPLY_OUTPUT");
    else
        SagMill.addRecipe([main, byprod1], [1.0, (chance1 as float) / 100.0], clump, "MULTIPLY_OUTPUT");

}

function addTingalumOvenRecipe(out as IItemStack[], inp as IItemStack[], energy as int, sec as int, temp as int = 250){
    var rec = RecipeBuilder.newBuilder("ore_proc_" ~ out[0].name ~ inp[0].name, "tignalum_oven", sec * 20);

    rec.addEnergyPerTickInput(energy);

    for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
    
    rec.addHotAirInput(temp, temp, 1000000);

    rec.build();
}

//recipes.removeByInput(bauxite_ore);
//addSimpleCrushingRecipe(bauxite_ore, <contenttweaker:bauxite_dust> * 2);


/*
dense ore -> ore -> pieces -> chunk -> crystal -> shard -> clump -> dirty dust -> dust -> ingot
                                                    |
                                                   \/
                                                   seed -> potato -> soup
*/
val ores as IItemStack[string][string][string] = {
    iron: {
        overworld: {
            item: <minecraft:iron_ore>,
            crushing_no_balls: <thermalfoundation:material> * 2,
            balling: <thermalfoundation:material> * 2,
            crushingByprod1: <thermalfoundation:material:69>,
            crushingByprod2: <thermalfoundation:material:65>,

            alloySlag2: <minecraft:iron_ingot> * 2,
            alloySlag3: <minecraft:iron_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_iron> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_vanilla:4>,
            crushing_no_balls: <thermalfoundation:material> * 4,
            balling: <thermalfoundation:material> * 4,
            crushingByprod1: <exnihilocreatio:item_ore_cobalt:2>,
            crushingByprod2: <mekores:mekanismore:218>,

            alloySlag2: <minecraft:iron_ingot> * 3,
            alloySlag3: <minecraft:iron_ingot> * 4,

            drilling: <exnihilocreatio:item_ore_iron> * 12,
            denorm: <minecraft:iron_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_vanilla:4>,
            crushing_no_balls: <thermalfoundation:material> * 5,
            balling: <thermalfoundation:material> * 5,
            crushingByprod1: <contenttweaker:biotite_dust>,
            crushingByprod2: <mekores:mekanismore:123>,

            alloySlag2: <minecraft:iron_ingot> * 4,
            alloySlag3: <minecraft:iron_ingot> * 5,

            drilling: <exnihilocreatio:item_ore_iron> * 15,
            denorm: <minecraft:iron_ore> * 3
        },

        erebus: {
            item: <erebus:ore_iron>,
            crushing_no_balls: <thermalfoundation:material> * 2,
            balling: <thermalfoundation:material> * 2,
            crushingByprod1: <thermalfoundation:material:69>,
            crushingByprod2: <erebus:materials:11>,

            alloySlag2: <minecraft:iron_ingot> * 2,
            alloySlag3: <minecraft:iron_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_iron> * 9,
            denorm: <minecraft:iron_ore> * 2
        },
        atum: {
            item: <atum:iron_ore>,
            crushing_no_balls: <thermalfoundation:material> * 2,
            crushingByprod1: <contenttweaker:relic_nugget>,
            crushingByprod2: <atum:sand>,

            alloySlag2: <minecraft:iron_ingot> * 2,
            alloySlag3: <minecraft:iron_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_iron> * 9,
            denorm: <minecraft:iron_ore> * 2
        },

        chunk: {
            item: <exnihilocreatio:item_ore_iron:1>,
            crushing_no_balls: <thermalfoundation:material> * 2,
            balling: <thermalfoundation:material> * 2,
            crushingByprod1: <thermalfoundation:material:69>,
            crushingByprod2: <thermalfoundation:material:65>,

            alloySlag2: <minecraft:iron_ingot> * 2,
            alloySlag3: <minecraft:iron_ingot> * 3,

            drilling: <mekanism:dirtydust> * 3,
            madeFrom: <exnihilocreatio:item_ore_iron> * 3,
            madeWeak: <exnihilocreatio:item_ore_iron>
        },

        dense: {
            item: <densemetals:dense_iron_ore>,
            crushing: <minecraft:iron_ore> * 3,
            crushingByprod1: <thermalfoundation:material:69> * 4,
            crushingByprod2: <thermalfoundation:material:65> * 4,

            making: <minecraft:iron_ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_iron_ore>,
            crushing: <netherendingores:ore_nether_vanilla:4> * 3,
            crushingByprod1: <exnihilocreatio:item_ore_cobalt:2> * 4,
            crushingByprod2: <mekores:mekanismore:218> * 4,

            making: <netherendingores:ore_nether_vanilla:4> * 4
        },

        clump: {
            item: <mekanism:clump>,
            balling: <mekanism:dirtydust> * 2,
            crushingByprod1: <thermalfoundation:material:69>,
            crushingByprod2: <thermalfoundation:material:65>,
        },
        dirtydust: {
            item: <mekanism:dirtydust>,
            separating1: <thermalfoundation:material>,
            separating2: <thermalfoundation:material:68>,
            separating3: <thermalfoundation:material:70>,
            separating4: <contenttweaker:soot>
        },


        poor: {
            item: <contenttweaker:poor_iron_ore>,
            furnace: <minecraft:iron_nugget> * 3,

            crushing: <prodigytech:iron_dust_tiny> * 4,
            crushingByprod1: <prodigytech:iron_dust_tiny> * 2,

            alloySlag2: <minecraft:iron_nugget> * 6,
            alloySlag3: <minecraft:iron_nugget> * 9,

            drilling: <prodigytech:iron_dust_tiny> * 9,
            denorm: <minecraft:iron_ore>
        }
    },
    copper: {
        
        overwolrd: {
            item: <thermalfoundation:ore>,
            crushing_no_balls: <thermalfoundation:material:64> * 2,
            balling: <thermalfoundation:material:64> * 2,
            crushingByprod1: <thermalfoundation:material:1>,
            crushingByprod2: <contenttweaker:malachite_dust>,

            alloySlag2: <thermalfoundation:material:128> * 2,
            alloySlag3: <thermalfoundation:material:128> * 3,

            drilling: <exnihilocreatio:item_ore_copper> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:1>,
            crushing_no_balls: <thermalfoundation:material:64> * 4,
            balling: <thermalfoundation:material:64> * 4,
            crushingByprod1: <thermalfoundation:material:1>,
            crushingByprod2: <contenttweaker:chrome_dirty_dust>,

            alloySlag2: <thermalfoundation:material:128> * 3,
            alloySlag3: <thermalfoundation:material:128> * 4,

            drilling: <exnihilocreatio:item_ore_copper> * 12,
            denorm: <thermalfoundation:ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:1>,
            crushing_no_balls: <thermalfoundation:material:64> * 5,
            balling: <thermalfoundation:material:64> * 5,
            crushingByprod1: <thermalfoundation:material:1>,
            crushingByprod2: <contenttweaker:chrome_dirty_dust>,

            alloySlag2: <thermalfoundation:material:128> * 4,
            alloySlag3: <thermalfoundation:material:128> * 5,

            drilling: <exnihilocreatio:item_ore_copper> * 15,
            denorm: <thermalfoundation:ore> * 3
        },
        magical: {
            item: <mysticalworld:copper_ore>,
            crushing_no_balls: <thermalfoundation:material:64> * 2,
            balling: <thermalfoundation:material:64> * 2,
            crushingByprod1: <contenttweaker:arkenium_dust>,
            crushingByprod2: <contenttweaker:orichalcum_dust>,

            alloySlag2: <thermalfoundation:material:128> * 2,
            alloySlag3: <thermalfoundation:material:128> * 3,

            drilling: <exnihilocreatio:item_ore_copper> * 6
        },
        chunk: {
            item: <exnihilocreatio:item_ore_copper:1>,
            crushing_no_balls: <thermalfoundation:material:64> * 2,
            balling: <thermalfoundation:material:64> * 2,
            crushingByprod1: <thermalfoundation:material:1>,
            crushingByprod2: <contenttweaker:malachite_dust>,

            alloySlag2: <thermalfoundation:material:128> * 2,
            alloySlag3: <thermalfoundation:material:128> * 3,

            drilling: <mekanism:dirtydust:3> * 3,
            madeFrom: <exnihilocreatio:item_ore_copper> * 3,
            madeWeak: <exnihilocreatio:item_ore_copper>
        },

        clump: {
            item: <mekanism:clump:3>,
            balling: <mekanism:dirtydust:3>,
            crushingByprod1: <thermalfoundation:material:1>,
            crushingByprod2: <contenttweaker:malachite_dust>,
        },
        dirtydust: {
            item: <mekanism:dirtydust:3>,

            separating1: <thermalfoundation:material:64>,
            separating2: <thermalfoundation:material:1>,
            //separating3: <contenttweaker:malachite_dust>,
            separating4: <contenttweaker:soot>
        },
        seeds: {
            item: <mekanism:clump:3>,

            seeds: <contenttweaker:copper_seed>,
            potato: <contenttweaker:copper_potato>
        },
        potatoes: {
            item: <contenttweaker:copper_potato>,
            separating1: <mekanism:dirtydust:3>, 
            //separating2: <mekanism:dirtydust:3>,
            separating2: <contenttweaker:chrome_dust>,

            balling: <mekanism:dirtydust:3>,
            crushingByprod1: <mekanism:dirtydust:3>,
            crushingByprod2: <contenttweaker:chrome_dust>
        },

        dense: {
            item: <densemetals:dense_copper_ore>,
            crushing: <thermalfoundation:ore> * 3,
            crushingByprod1: <thermalfoundation:material:1> * 4,
            crushingByprod2: <contenttweaker:malachite_dust> * 4,

            making: <thermalfoundation:ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_copper_ore>,
            crushing: <netherendingores:ore_nether_modded_1:1> * 3,
            crushingByprod1: <thermalfoundation:material:1> * 4,
            crushingByprod2: <contenttweaker:chrome_dirty_dust> * 4,

            making: <netherendingores:ore_nether_modded_1:1> * 4
        }

    },
    tin: {
        overwolrd: {
            item: <thermalfoundation:ore:1>,
            crushing_no_balls: <thermalfoundation:material:65> * 2,
            balling: <thermalfoundation:material:65> * 2,
            crushingByprod1: <thermalfoundation:material:66>,

            alloySlag2: <thermalfoundation:material:129> * 2,
            alloySlag3: <thermalfoundation:material:129> * 3,

            drilling: <exnihilocreatio:item_ore_tin> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:8>,
            crushing_no_balls: <thermalfoundation:material:65> * 4,
            balling: <thermalfoundation:material:65> * 4,
            crushingByprod1: <thermalfoundation:material:66>,

            alloySlag2: <thermalfoundation:material:129> * 3,
            alloySlag3: <thermalfoundation:material:129> * 4,

            drilling: <exnihilocreatio:item_ore_tin> * 12,
            denorm: <thermalfoundation:ore:1> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:8>,
            crushing_no_balls: <thermalfoundation:material:65> * 5,
            balling: <thermalfoundation:material:65> * 5,
            crushingByprod1: <thermalfoundation:material:66>,

            alloySlag2: <thermalfoundation:material:129> * 4,
            alloySlag3: <thermalfoundation:material:129> * 5,

            drilling: <exnihilocreatio:item_ore_tin> * 15,
            denorm: <thermalfoundation:ore:1> * 3
        },
        erebus: {
            item: <erebus:ore_tin>,
            crushing_no_balls: <thermalfoundation:material:65> * 2,
            balling: <thermalfoundation:material:65> * 2,
            crushingByprod1: <thermalfoundation:material:66>,
            crushingByprod2: <contenttweaker:jade_dust>,

            alloySlag2: <thermalfoundation:material:129> * 2,
            alloySlag3: <thermalfoundation:material:129> * 3,

            drilling: <exnihilocreatio:item_ore_tin> * 9
        },
        magical: {
            item: <mekanism:oreblock:2>,
            crushing_no_balls: <thermalfoundation:material:65> * 2,
            balling: <thermalfoundation:material:65> * 2,
            crushingByprod1: <contenttweaker:arkenium_dust>,
            crushingByprod2: <contenttweaker:orichalcum_dust>,

            alloySlag2: <thermalfoundation:material:129> * 2,
            alloySlag3: <thermalfoundation:material:129> * 3,

            drilling: <exnihilocreatio:item_ore_iron> * 9
        },
        chunk: {
            item: <exnihilocreatio:item_ore_tin:1>,
            crushing_no_balls: <thermalfoundation:material:65> * 2,
            balling: <thermalfoundation:material:65> * 2,
            crushingByprod1: <thermalfoundation:material:66>,

            alloySlag2: <thermalfoundation:material:129> * 2,
            alloySlag3: <thermalfoundation:material:129> * 3,

            drilling: <mekanism:dirtydust:4> * 3,

            madeFrom: <exnihilocreatio:item_ore_tin> * 3,
            madeWeak: <exnihilocreatio:item_ore_tin>
        },
        clump: {
            item: <mekanism:clump:4>,
            balling: <mekanism:dirtydust:4>,
            crushingByprod1: <thermalfoundation:material:66>,
        },
        dirtydust: {
            item: <mekanism:dirtydust:4>,
            separating1: <thermalfoundation:material:65>,
            separating2: <thermalfoundation:material:66>,
            separating4: <contenttweaker:soot>
        },

        dense: {
            item: <densemetals:dense_tin_ore>,
            crushing: <thermalfoundation:ore:1> * 3,
            crushingByprod1: <thermalfoundation:material:66> * 4,

            making: <thermalfoundation:ore:1> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_tin_ore>,
            crushing: <netherendingores:ore_nether_modded_1:8> * 3,
            crushingByprod1: <thermalfoundation:material:66> * 4,

            making: <netherendingores:ore_nether_modded_1:8> * 4
        }
    },

    aluminum: {
        chunk: {
            item: <exnihilocreatio:item_ore_aluminum:1>,
            crushing_no_balls: <thermalfoundation:material:68> * 2,
            balling: <thermalfoundation:material:68> * 2,
            crushingByprod1: <contenttweaker:zinc_dust>,
            crushingByprod2: <contenttweaker:dolomite>,

            drilling: <mekores:mekanismore:33> * 3,
            madeFrom: <exnihilocreatio:item_ore_aluminum> * 3,
            madeWeak: <exnihilocreatio:item_ore_aluminum>
        },
        bauxite: {
            item: <immersiveengineering:ore:1>,
            furnace: <contenttweaker:bauxite_dust>,
            crushing_no_balls: <contenttweaker:bauxite_dust> * 2,
            balling: <contenttweaker:bauxite_dust> * 2,
            crushingByprod1: <appliedenergistics2:material:3>,
            crushingByprod2: <contenttweaker:dolomite>,

            drilling: <exnihilocreatio:item_ore_aluminum> * 6,
            denorm: <thermalfoundation:ore:4> * 2
        },
        overwolrd: {
            item: <thermalfoundation:ore:4>,
            crushing_no_balls: <thermalfoundation:material:68> * 2,
            balling: <thermalfoundation:material:68> * 2,
            crushingByprod1: <contenttweaker:bauxite_dust>,
            crushingByprod2: <contenttweaker:dolomite>,

            drilling: <exnihilocreatio:item_ore_aluminum> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1>,
            crushing_no_balls: <thermalfoundation:material:68> * 4,
            balling: <thermalfoundation:material:68> * 4,
            crushingByprod1: <contenttweaker:bauxite_dust>,
            crushingByprod2: <enderio:item_material:32>,

            drilling: <exnihilocreatio:item_ore_aluminum> * 12,
            denorm: <thermalfoundation:ore:4> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1>,
            crushing_no_balls: <thermalfoundation:material:68> * 5,
            balling: <thermalfoundation:material:68> * 5,
            crushingByprod1: <contenttweaker:bauxite_dust>,
            crushingByprod2: <enderio:item_material:32>,

            drilling: <exnihilocreatio:item_ore_aluminum> * 15,
            denorm: <thermalfoundation:ore:4> * 3
        },
        erebus: {
            item: <erebus:ore_aluminium>,
            furnace: <thermalfoundation:material:68>,
            crushing_no_balls: <thermalfoundation:material:68> * 2,
            balling: <thermalfoundation:material:68> * 2,
            crushingByprod1: <contenttweaker:bauxite_dust>,
            crushingByprod2: <enderio:item_material:32>,

            drilling: <exnihilocreatio:item_ore_aluminum> * 9,
            denorm: <thermalfoundation:ore:4> * 2
        },

        clump: {
            item: <mekores:mekanismore:32>,
            balling: <mekores:mekanismore:33>,
            crushingByprod1: <contenttweaker:bauxite_dust>,
            crushingByprod2: <enderio:item_material:32>,
        },
        dirtydust: {
            item: <mekores:mekanismore:33>,
            separating1: <thermalfoundation:material:68>,
            separating2: <contenttweaker:bauxite_dust>,
            separating3: <contenttweaker:dolomite>,
            separating4: <contenttweaker:soot>,

            washing: <thermalfoundation:material:68>
        },

        dense: {
            item: <densemetals:dense_aluminum_ore>,

            making: <thermalfoundation:ore:4> * 4,

            crushing: <thermalfoundation:ore:4> * 3,
            crushingByprod1: <contenttweaker:dolomite> * 4,
            crushingByprod2: <thermalfoundation:ore:4>
        },
        dense_nether: {
            item: <densemetals:dense_nether_aluminum_ore>,

            making: <netherendingores:ore_nether_modded_1> * 4,

            crushing: <netherendingores:ore_nether_modded_1> * 3,
            crushingByprod1: <contenttweaker:dolomite> * 6,
            crushingByprod2: <netherendingores:ore_nether_modded_1>
        }
    },
    nickel: {
        overworld: {
            item: <thermalfoundation:ore:5>,
            crushing_no_balls: <thermalfoundation:material:69> * 2,
            balling: <thermalfoundation:material:69> * 2,
            crushingByprod1: <thermalfoundation:material:70>,
            crushingByprod2: <mekores:mekanismore:23>,

            alloySlag2: <thermalfoundation:material:133> * 2,
            alloySlag3: <thermalfoundation:material:133> * 3,

            drilling: <exnihilocreatio:item_ore_nickel> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:5>,
            crushing_no_balls: <thermalfoundation:material:69> * 4,
            balling: <thermalfoundation:material:69> * 4,
            crushingByprod1: <thermalfoundation:material:70>,
            crushingByprod2: <mekores:mekanismore:23>,

            alloySlag2: <thermalfoundation:material:133> * 3,
            alloySlag3: <thermalfoundation:material:133> * 4,

            drilling: <exnihilocreatio:item_ore_nickel> * 12,
            denorm: <thermalfoundation:ore:5> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:5>,
            crushing_no_balls: <thermalfoundation:material:69> * 5,
            balling: <thermalfoundation:material:69> * 5,
            crushingByprod1: <thermalfoundation:material:70>,
            crushingByprod2: <mekores:mekanismore:23>,

            alloySlag2: <thermalfoundation:material:133> * 4,
            alloySlag3: <thermalfoundation:material:133> * 5,

            drilling: <exnihilocreatio:item_ore_nickel> * 15,
            denorm: <thermalfoundation:ore:5> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_nickel:1>,
            crushing_no_balls: <thermalfoundation:material:69> * 2,
            balling: <thermalfoundation:material:69> * 2,
            crushingByprod1: <thermalfoundation:material:70>,
            crushingByprod2: <mekores:mekanismore:23>,

            alloySlag2: <thermalfoundation:material:133> * 2,
            alloySlag3: <thermalfoundation:material:133> * 3,

            madeFrom: <exnihilocreatio:item_ore_nickel> * 3,
            madeWeak: <exnihilocreatio:item_ore_nickel>,
            drilling: <mekores:mekanismore:13> * 3
        },

        dense: {
            item: <densemetals:dense_nickel_ore>,
            crushing: <thermalfoundation:ore:5> * 3,
            crushingByprod1: <mekores:mekanismore:18> * 4,
            crushingByprod2: <mekores:mekanismore:23> * 4,

            making: <thermalfoundation:ore:5> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_nickel_ore>,
            crushing: <netherendingores:ore_nether_modded_1:5> * 3,
            crushingByprod1: <mekores:mekanismore:18> * 4,
            crushingByprod2: <mekores:mekanismore:23> * 4,

            making: <netherendingores:ore_nether_modded_1:5> * 4
        },

        clump: {
            item: <mekores:mekanismore:12>,
            balling: <mekores:mekanismore:13>,
            crushingByprod1: <thermalfoundation:material:70>,
            crushingByprod2: <mekores:mekanismore:23>,
        },
        dirtydust: {
            item: <mekores:mekanismore:13>,
            separating1: <thermalfoundation:material:69>,
            separating2: <thermalfoundation:material:70>,
            separating3: <mekores:mekanismore:23>,
            separating4: <contenttweaker:soot>
        }
    },
    zinc: {
        overworld: {
            item: <contenttweaker:zinc_ore>,
            furnace: <contenttweaker:zinc_ingot>,
            crushing_no_balls: <contenttweaker:zinc_dust> * 2,
            balling: <contenttweaker:zinc_dust> * 2,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <mekanism:dirtydust>,

            alloySlag2: <contenttweaker:zinc_ingot> * 2,
            alloySlag3: <contenttweaker:zinc_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_zinc> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2>,
            crushing_no_balls: <contenttweaker:zinc_dust> * 4,
            balling: <contenttweaker:zinc_dust> * 4,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <contenttweaker:gallium_dust>,

            alloySlag2: <contenttweaker:zinc_ingot> * 3,
            alloySlag3: <contenttweaker:zinc_ingot> * 4,

            drilling: <exnihilocreatio:item_ore_zinc> * 12,
            denorm: <contenttweaker:zinc_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2>,
            crushing_no_balls: <contenttweaker:zinc_dust> * 5,
            balling: <contenttweaker:zinc_dust> * 5,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <contenttweaker:gallium_dust>,

            alloySlag2: <contenttweaker:zinc_ingot> * 4,
            alloySlag3: <contenttweaker:zinc_ingot> * 5,

            drilling: <exnihilocreatio:item_ore_zinc> * 15,
            denorm: <contenttweaker:zinc_ore> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_zinc:1>,
            furnace: <contenttweaker:zinc_ingot>,
            crushing_no_balls: <contenttweaker:zinc_dust> * 2,
            balling: <contenttweaker:zinc_dust> * 2,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <mekanism:dirtydust>,

            alloySlag2: <contenttweaker:zinc_ingot> * 2,
            alloySlag3: <contenttweaker:zinc_ingot> * 3,

            drilling: <mekores:mekanismore:113> * 3,
            madeFrom: <exnihilocreatio:item_ore_zinc> * 3,
            madeWeak: <exnihilocreatio:item_ore_zinc>
        },

        dense: {
            item: <densemetals:dense_zinc_ore>,
            crushing: <contenttweaker:zinc_ore> * 3,
            crushingByprod1: <thermalfoundation:material:68> * 4,
            crushingByprod2: <mekanism:dirtydust> * 4,

            making: <contenttweaker:zinc_ore> * 4
        },
        clump: {
            item: <mekores:mekanismore:112>,
            balling: <mekores:mekanismore:113>,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <mekanism:dirtydust>,
        },
        dirtydust: {
            item: <mekores:mekanismore:113>,
            separating1: <contenttweaker:zinc_dust>,
            separating2: <thermalfoundation:material>,
            separating4: <contenttweaker:soot>
        },

        atum: {
            item: <contenttweaker:atum_sphalerite_ore>,
            crushing_no_balls: <contenttweaker:sphalerite_dust> * 2,
            balling: <contenttweaker:sphalerite_dust> * 2,
            crushingByprod1: <contenttweaker:fluospar_dust>,
            crushingByprod2: <atum:limestone>,

            furnace: <contenttweaker:zinc_ingot>
        },

        sphalerite: {
            item: <contenttweaker:sphalerite_dust>,
            separating1: <contenttweaker:zinc_dust>,
            separating2: <thermalfoundation:material>,
            separating3: <contenttweaker:gallium_dust>,
            separating4: <thermalfoundation:material:771>
        }
    },

    cobalt: {
        chunk: {
            item: <exnihilocreatio:item_ore_cobalt:1>,
            crushing_no_balls: <exnihilocreatio:item_ore_cobalt:2> * 2,
            balling: <exnihilocreatio:item_ore_cobalt:2> * 2,
            crushingByprod1: <projectred-core:resource_item:105>,
            crushingByprod2: <thermalfoundation:material:2049>,

            alloySlag2: <tconstruct:ingots> * 2,
            alloySlag3: <tconstruct:ingots> * 3,

            drilling: <mekores:mekanismore:38> * 3,
            madeFrom: <exnihilocreatio:item_ore_cobalt> * 3,
            madeWeak: <exnihilocreatio:item_ore_cobalt>
        },
        overworld: {
            item: <netherendingores:ore_other_1:4>,
            furnace: <tconstruct:ingots>,
            crushing_no_balls: <exnihilocreatio:item_ore_cobalt:2> * 2,
            balling: <exnihilocreatio:item_ore_cobalt:2> * 2,
            crushingByprod1: <projectred-core:resource_item:105>,
            crushingByprod2: <thermalfoundation:material:2049>,

            alloySlag2: <tconstruct:ingots> * 2,
            alloySlag3: <tconstruct:ingots> * 3,

            drilling: <exnihilocreatio:item_ore_cobalt> * 6
        },
        nether: {
            item: <tconstruct:ore>,
            crushing_no_balls: <exnihilocreatio:item_ore_cobalt:2> * 4,
            balling: <exnihilocreatio:item_ore_cobalt:2> * 4,
            crushingByprod1: <projectred-core:resource_item:105> * 2,
            crushingByprod2: <thermalfoundation:material:2049>,

            alloySlag2: <tconstruct:ingots> * 3,
            alloySlag3: <tconstruct:ingots> * 4,

            drilling: <exnihilocreatio:item_ore_cobalt> * 13,
            denorm: <netherendingores:ore_other_1:4>
        },
        end: {
            item: <netherendingores:ore_other_1:5>,
            crushing_no_balls: <exnihilocreatio:item_ore_cobalt:2> * 5,
            balling: <exnihilocreatio:item_ore_cobalt:2> * 5,
            crushingByprod1: <projectred-core:resource_item:105>,
            crushingByprod2: <thermalfoundation:material:2049>,

            alloySlag2: <tconstruct:ingots> * 4,
            alloySlag3: <tconstruct:ingots> * 5,

            drilling: <exnihilocreatio:item_ore_cobalt> * 15,
            denorm: <netherendingores:ore_other_1:4> * 2
        },

        clump: {
            item: <mekores:mekanismore:37>,
            balling: <mekores:mekanismore:38>,
            crushingByprod1: <projectred-core:resource_item:105>,
            crushingByprod2: <thermalfoundation:material:2049>
        },
        dirtydust: {
            item: <mekores:mekanismore:38>,
            separating1: <mekores:mekanismore:37>,
            separating2: <projectred-core:resource_item:105>,
            separating3: <thermalfoundation:material:2049>,
            separating4: <contenttweaker:soot>
        }
    },
    ardite: {
        chunk: {
            item: <exnihilocreatio:item_ore_ardite:1>,
            crushing_no_balls: <exnihilocreatio:item_ore_ardite:2> * 2,
            balling: <exnihilocreatio:item_ore_ardite:2> * 2,
            crushingByprod1: <minecraft:redstone>,
            crushingByprod2: <minecraft:blaze_powder>,

            alloySlag2: <tconstruct:ingots:1> * 2,
            alloySlag3: <tconstruct:ingots:1> * 3,

            drilling: <mekores:mekanismore:43> * 3,
            madeFrom: <exnihilocreatio:item_ore_ardite> * 3,
            madeWeak: <exnihilocreatio:item_ore_ardite>
        },
        overworld: {
            item: <netherendingores:ore_other_1:2>,
            crushing_no_balls: <exnihilocreatio:item_ore_ardite:2> * 2,
            balling: <exnihilocreatio:item_ore_ardite:2> * 2,
            crushingByprod1: <minecraft:redstone>,
            crushingByprod2: <minecraft:blaze_powder>,

            alloySlag2: <tconstruct:ingots:1> * 2,
            alloySlag3: <tconstruct:ingots:1> * 3,

            drilling: <exnihilocreatio:item_ore_ardite> * 6
        },
        nether: {
            item: <tconstruct:ore:1>,
            crushing_no_balls: <exnihilocreatio:item_ore_ardite:2> * 4,
            balling: <exnihilocreatio:item_ore_ardite:2> * 4,
            crushingByprod1: <minecraft:redstone> * 2,
            crushingByprod2: <minecraft:blaze_powder>,

            alloySlag2: <tconstruct:ingots:1> * 3,
            alloySlag3: <tconstruct:ingots:1> * 4,

            drilling: <exnihilocreatio:item_ore_ardite> * 13,
            denorm: <netherendingores:ore_other_1:2>
        },
        end: {
            item: <netherendingores:ore_other_1:3>,
            crushing_no_balls: <exnihilocreatio:item_ore_ardite:2> * 5,
            balling: <exnihilocreatio:item_ore_ardite:2> * 5,
            crushingByprod1: <minecraft:redstone>,
            crushingByprod2: <minecraft:blaze_powder>,

            alloySlag2: <tconstruct:ingots:1> * 4,
            alloySlag3: <tconstruct:ingots:1> * 5,

            drilling: <exnihilocreatio:item_ore_ardite> * 15,
            denorm: <netherendingores:ore_other_1:2> * 2
        },

        clump: {
            item: <mekores:mekanismore:42>,
            balling: <mekores:mekanismore:43>,
            crushingByprod1: <minecraft:redstone>,
            crushingByprod2: <minecraft:blaze_powder>
        },
        dirtydust: {
            item: <mekores:mekanismore:43>,
            separating1: <exnihilocreatio:item_ore_ardite:2>,
            separating2: <minecraft:redstone>,
            separating3: <minecraft:blaze_powder>,
            separating4: <contenttweaker:soot>
        }
    },

    gold: {
        ore: {
            item: <minecraft:gold_ore>,
            crushing_no_balls: <thermalfoundation:material:1> * 2,
            balling: <thermalfoundation:material:1> * 2,
            crushingByprod1: <minecraft:glowstone_dust>,
            crushingByprod2: <thermalfoundation:material:2051>,

            alloySlag2: <minecraft:gold_ingot> * 2,
            alloySlag3: <minecraft:gold_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_gold> * 6
        },
        chunk: {
            item: <exnihilocreatio:item_ore_gold:1>,
            crushing_no_balls: <thermalfoundation:material:1> * 2,
            balling: <thermalfoundation:material:1> * 2,
            crushingByprod1: <minecraft:glowstone_dust>,
            crushingByprod2: <thermalfoundation:material:2051>,

            alloySlag2: <minecraft:gold_ingot> * 2,
            alloySlag3: <minecraft:gold_ingot> * 3,

            madeFrom: <exnihilocreatio:item_ore_gold> * 3,
            madeCreosolon: <exnihilocreatio:item_ore_gold>,
            drilling: <mekanism:dirtydust:1> * 3,
        },

        erebus: {
            item: <erebus:ore_gold>,
            crushing_no_balls: <thermalfoundation:material:1> * 2,
            balling: <thermalfoundation:material:1> * 2,
            crushingByprod1: <minecraft:glowstone_dust>,
            crushingByprod2: <contenttweaker:malachite_dust>,

            alloySlag2: <minecraft:gold_ingot> * 2,
            alloySlag3: <minecraft:gold_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_gold> * 9,
            denorm: <minecraft:gold_ore> * 2
        },
        atum: {//todo
            item: <atum:gold_ore>,
            crushing_no_balls: <thermalfoundation:material:1> * 2,
            crushingByprod1: <contenttweaker:relic_nugget>,
            crushingByprod2: <atum:sand>,

            alloySlag2: <minecraft:gold_ingot> * 2,
            alloySlag3: <minecraft:gold_ingot> * 3,

            drilling: <exnihilocreatio:item_ore_gold> * 9,
            denorm: <minecraft:gold_ore> * 2
        },
        nether: {
            item: <netherendingores:ore_nether_vanilla:3>,
            crushing_no_balls: <thermalfoundation:material:1> * 2,
            balling: <thermalfoundation:material:1> * 2,
            crushingByprod1: <minecraft:glowstone_dust>,

            alloySlag2: <minecraft:gold_ingot> * 3,
            alloySlag3: <minecraft:gold_ingot> * 4,

            drilling: <exnihilocreatio:item_ore_gold> * 12,
            denorm: <minecraft:gold_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_vanilla:3>,
            crushing_no_balls: <thermalfoundation:material:1> * 2,
            balling: <thermalfoundation:material:1> * 2,
            crushingByprod1: <taiga:aurorium_dust>,

            alloySlag2: <minecraft:gold_ingot> * 4,
            alloySlag3: <minecraft:gold_ingot> * 5,

            drilling: <exnihilocreatio:item_ore_gold> * 15,
            denorm: <minecraft:gold_ore> * 3
        },

        dense: {
            item: <densemetals:dense_gold_ore>,
            crushing: <minecraft:gold_ore> * 3,
            crushingByprod1: <minecraft:glowstone_dust> * 4,
            crushingByprod2: <thermalfoundation:material:2051> * 4,

            making: <minecraft:gold_ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_gold_ore>,
            crushing: <netherendingores:ore_nether_vanilla:3> * 3,
            crushingByprod1: <minecraft:glowstone_dust> * 4,
            crushingByprod2: <thermalfoundation:material:2051> * 4,

            making: <netherendingores:ore_nether_vanilla:3> * 4
        },

        clump: {
            item: <mekanism:clump:1>,
            balling: <mekanism:dirtydust:1>,
            crushingByprod1: <contenttweaker:relic_nugget>,
            crushingByprod2: <atum:sand>
        },
        dirtydust: {
            item: <mekanism:dirtydust:1>,
            separating1: <thermalfoundation:material:1>,
            separating2: <minecraft:glowstone_dust>,
            separating3: <thermalfoundation:material:2051>,
            separating4: <contenttweaker:soot>
        }
    },
    silver: {
        ow1: {
            item: <thermalfoundation:ore:2>,
            crushing_no_balls: <thermalfoundation:material:66> * 2,
            balling: <thermalfoundation:material:66> * 2,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:galena_dust> * 2,

            alloySlag2: <thermalfoundation:material:130> * 2,
            alloySlag3: <thermalfoundation:material:130> * 3,

            drilling: <exnihilocreatio:item_ore_silver> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:7>,
            crushing_no_balls: <thermalfoundation:material:66> * 4,
            balling: <thermalfoundation:material:66> * 4,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:galena_dust> * 2,

            alloySlag2: <thermalfoundation:material:130> * 3,
            alloySlag3: <thermalfoundation:material:130> * 4,

            drilling: <exnihilocreatio:item_ore_silver> * 12,
            denorm: <thermalfoundation:ore:2> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:7>,
            crushing_no_balls: <thermalfoundation:material:66> * 5,
            balling: <thermalfoundation:material:66> * 5,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:galena_dust> * 2,

            alloySlag2: <thermalfoundation:material:130> * 4,
            alloySlag3: <thermalfoundation:material:130> * 5,

            drilling: <exnihilocreatio:item_ore_silver> * 15,
            denorm: <thermalfoundation:ore:2> * 3
        },

        erebus: {
            item: <erebus:ore_silver>,
            crushing_no_balls: <thermalfoundation:material:66> * 2,
            balling: <thermalfoundation:material:66> * 2,
            crushingByprod1: <contenttweaker:galena_dust>,
            crushingByprod2: <contenttweaker:jade_dust>,

            alloySlag2: <thermalfoundation:material:130> * 2,
            alloySlag3: <thermalfoundation:material:130> * 3,

            drilling: <exnihilocreatio:item_ore_silver> * 9,
            denorm: <thermalfoundation:ore:2> * 2
        },
        chunk: {
            item: <exnihilocreatio:item_ore_silver:1>,
            crushing_no_balls: <thermalfoundation:material:66> * 2,
            balling: <thermalfoundation:material:66> * 2,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:galena_dust>,

            alloySlag2: <thermalfoundation:material:130> * 2,
            alloySlag3: <thermalfoundation:material:130> * 3,

            drilling: <mekanism:dirtydust:5> * 3,

            madeFrom: <exnihilocreatio:item_ore_silver> * 3,
            madeCreosolon: <exnihilocreatio:item_ore_silver>
        },
        dense: {
            item: <densemetals:dense_silver_ore>,
            crushing: <thermalfoundation:ore:2> * 3,
            crushingByprod1: <thermalfoundation:material:67> * 4,
            crushingByprod2: <contenttweaker:galena_dust> * 6,
            making: <thermalfoundation:ore:2> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_silver_ore>,
            crushing: <netherendingores:ore_nether_modded_1:7> * 3,
            crushingByprod1: <thermalfoundation:material:67> * 4,
            crushingByprod2: <contenttweaker:galena_dust> * 6,
            making: <netherendingores:ore_nether_modded_1:7> * 4
        },

        clump: {
            item: <mekanism:clump:5>,
            balling: <mekanism:dirtydust:5>,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:galena_dust>
        },
        dirtydust: {
            item: <mekanism:dirtydust:5>,
            separating1: <thermalfoundation:material:66>,
            separating2: <thermalfoundation:material:67>,
            separating3: <contenttweaker:galena_dust>,
            separating4: <contenttweaker:soot>
        }
            
    },
    lead: {
        overworld: {
            item: <thermalfoundation:ore:3>,
            crushing_no_balls: <thermalfoundation:material:67> * 2,
            balling: <thermalfoundation:material:67> * 2,
            crushingByprod1: <thermalfoundation:material:66>,
            crushingByprod2: <thermalfoundation:material:2053>,

            alloySlag2: <thermalfoundation:material:131> * 2,
            alloySlag3: <thermalfoundation:material:131> * 3,

            drilling: <exnihilocreatio:item_ore_lead> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:3>,
            crushing_no_balls: <thermalfoundation:material:67> * 4,
            balling: <thermalfoundation:material:67> * 4,
            crushingByprod1: <thermalfoundation:material:66>,

            alloySlag2: <thermalfoundation:material:131> * 3,
            alloySlag3: <thermalfoundation:material:131> * 4,

            drilling: <exnihilocreatio:item_ore_lead> * 12,

            denorm: <thermalfoundation:ore:3> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:3>,
            crushing_no_balls: <thermalfoundation:material:67> * 5,
            balling: <thermalfoundation:material:67> * 5,
            crushingByprod1: <thermalfoundation:material:66>,

            alloySlag2: <thermalfoundation:material:131> * 4,
            alloySlag3: <thermalfoundation:material:131> * 5,

            drilling: <exnihilocreatio:item_ore_lead> * 15,

            denorm: <thermalfoundation:ore:3> * 3
        },
        erebus: {
            item: <erebus:ore_lead>,
            crushing_no_balls: <thermalfoundation:material:67> * 2,
            balling: <thermalfoundation:material:67> * 2,
            crushingByprod1: <contenttweaker:galena_dust>,
            crushingByprod2: <contenttweaker:jade_dust>,

            alloySlag2: <thermalfoundation:material:131> * 2,
            alloySlag3: <thermalfoundation:material:131> * 3,

            drilling: <exnihilocreatio:item_ore_lead> * 9,
            denorm: <thermalfoundation:ore:3> * 2
        },
        chunk: {
            item: <exnihilocreatio:item_ore_lead:1>,
            crushing_no_balls: <thermalfoundation:material:67> * 2,
            balling: <thermalfoundation:material:67> * 2,
            crushingByprod1: <thermalfoundation:material:66>,
            crushingByprod2: <thermalfoundation:material:2053>,

            alloySlag2: <thermalfoundation:material:131> * 2,
            alloySlag3: <thermalfoundation:material:131> * 3,

            drilling: <mekanism:dirtydust:6> * 3,

            madeFrom: <exnihilocreatio:item_ore_lead> * 3,
            madeCreosolon: <exnihilocreatio:item_ore_lead>
        },

        clump: {
            item: <mekanism:clump:6>,
            balling: <mekanism:dirtydust:6>,
            crushingByprod1: <thermalfoundation:material:66>,
            crushingByprod2: <thermalfoundation:material:2053>,
        },
        dirtydust: {
            item: <mekanism:dirtydust:6>,
            separating1: <thermalfoundation:material:67>,
            separating2: <thermalfoundation:material:66>,
            //separating3: <contenttweaker:galena_dust>,
            separating4: <contenttweaker:soot>
        },
        dense: {
            item: <densemetals:dense_lead_ore>,
            crushing: <thermalfoundation:ore:3> * 3,
            crushingByprod1: <thermalfoundation:material:66> * 4,
            crushingByprod2: <thermalfoundation:material:2053> * 4,

            making: <thermalfoundation:ore:3> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_lead_ore>,
            crushing: <netherendingores:ore_nether_modded_1:3> * 3,
            crushingByprod1: <thermalfoundation:material:66> * 4,
            crushingByprod2: <thermalfoundation:material:2053> * 4,

            making: <netherendingores:ore_nether_modded_1:3> * 4
        },

        galena_ore: {
            item: <immersiveengineering:ore:2>,
            crushing: <contenttweaker:galena_dust> * 2,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:fluospar_dust>
        },
        atum_galena: {
            item: <contenttweaker:atum_lead_ore>,
            crushing: <contenttweaker:galena_dust> * 2,
            crushingByprod1: <contenttweaker:sphalerite_dust>,
            crushingByprod2: <contenttweaker:fluospar_dust>
        },
        galena: {
            item: <contenttweaker:galena_dust>,
            furnace: <thermalfoundation:material:131>,
            separating1: <thermalfoundation:material:67>,
            separating2: <thermalfoundation:material:66>,
            separating4: <thermalfoundation:material:771>
        }
    },
    osmium: {
        overworld: {
            item: <mekanism:oreblock>,
            crushing_no_balls: <mekanism:dust:2> * 2,
            balling: <mekanism:dust:2> * 2,
            crushingByprod1: <enderio:item_material:32>,
            crushingByprod2: <mekanism:dirtydust:6>,

            alloySlag2: <mekanism:ingot:1> * 2,
            alloySlag3: <mekanism:ingot:1> * 3,

            drilling: <exnihilocreatio:item_ore_osmium> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:11>,
            crushing_no_balls: <mekanism:dust:2> * 4,
            balling: <mekanism:dust:2> * 4,
            crushingByprod1: <enderio:item_material:32>,
            crushingByprod2: <mekanism:dirtydust:6>,

            alloySlag2: <mekanism:ingot:1> * 3,
            alloySlag3: <mekanism:ingot:1> * 4,

            drilling: <exnihilocreatio:item_ore_osmium> * 12,
            denorm: <mekanism:oreblock> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:11>,
            crushing_no_balls: <mekanism:dust:2> * 5,
            balling: <mekanism:dust:2> * 5,
            crushingByprod1: <enderio:item_material:32> * 2,
            crushingByprod2: <mekanism:dirtydust:6> * 2,

            alloySlag2: <mekanism:ingot:1> * 4,
            alloySlag3: <mekanism:ingot:1> * 5,

            drilling: <exnihilocreatio:item_ore_osmium> * 15,
            denorm: <mekanism:oreblock> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_osmium:1>,
            crushing_no_balls: <mekanism:dust:2> * 2,
            balling: <mekanism:dust:2> * 2,
            crushingByprod1: <enderio:item_material:32>,
            crushingByprod2: <mekanism:dirtydust:6>,

            alloySlag2: <mekanism:ingot:1> * 2,
            alloySlag3: <mekanism:ingot:1> * 3,

            drilling: <mekanism:dirtydust:2> * 3,
            madeFrom: <exnihilocreatio:item_ore_osmium> * 3,
            madeCreosolon: <exnihilocreatio:item_ore_osmium>
        },
        clump: {
            item: <mekanism:clump:2>,
            //crushing_no_balls: <mekanism:dust:2> * 2,
            balling: <mekanism:dirtydust:2>,
            crushingByprod1: <enderio:item_material:32>,
            crushingByprod2: <mekanism:dirtydust:6>
        },
        dense: {
            item: <densemetals:dense_osmium_ore>,
            crushing: <mekanism:oreblock> * 3,
            crushingByprod1: <enderio:item_material:32> * 4,
            crushingByprod2: <mekanism:dirtydust:6> * 4,

            making: <mekanism:oreblock> * 4
        }
    },

    cincinnasite: {
        ore: {
            item: <betternether:cincinnasite_ore>,
            furnace: <betternether:cincinnasite>,
            crushing_no_balls: <betternether:cincinnasite> * 2,
            balling: <betternether:cincinnasite> * 2,
            crushingByprod1: <contenttweaker:cincinnasite_dirty_dust>,
            crushingByprod2: <actuallyadditions:item_dust:2>,

            alloySlag2: <betternether:cincinnasite> * 2,
            alloySlag3: <betternether:cincinnasite> * 3,

            denorm: <netherendingores:ore_nether_vanilla:3>
        },
        dirtydust: {
            item: <contenttweaker:cincinnasite_dirty_dust>,
            separating1: <betternether:cincinnasite>,
            separating2: <mekanism:dirtydust:1>,
            separating4: <contenttweaker:soot>
        }
    },
    dilitheum: {
        overworld: {
            item: <taiga:dilithium_ore>,
            crushing: <taiga:dilithium_crystal> * 2,
            crushingByprod1: <taiga:dilithium_dust>,
            crushingByprod2: <taiga:vibranium_dust>,

            drilling: <taiga:dilithium_crystal> * 4
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:14>,
            crushing: <taiga:dilithium_crystal> * 4,
            crushingByprod1: <taiga:dilithium_dust>,
            crushingByprod2: <taiga:vibranium_dust>,

            drilling: <taiga:dilithium_crystal> * 5,
            denorm: <taiga:dilithium_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:14>,
            crushing: <taiga:dilithium_crystal> * 5,
            crushingByprod1: <taiga:vibranium_dust>,
            crushingByprod2: <taiga:vibranium_dust>,

            drilling: <taiga:dilithium_crystal> * 6,
            denorm: <taiga:dilithium_ore> * 3
        },

        clump: {
            item: <mekores:mekanismore:127>,
            balling: <mekores:mekanismore:128>,
            crushingByprod1: <mekores:mekanismore:128>,
            crushingByprod2: <taiga:dilithium_dust>
        },
        dirtydust: {
            item: <mekores:mekanismore:128>,
            separating1: <taiga:dilithium_dust>,
            separating2: <taiga:dilithium_crystal>,
            separating3: <taiga:vibranium_dust>,
            separating4: <contenttweaker:soot>
        }
    },

    //todo 
    platinum: {
        overworld: {
            item: <thermalfoundation:ore:6>,
            crushing: <thermalfoundation:material:70> * 2,
            crushingByprod1: <mekores:mekanismore:23>,

            drilling: <exnihilocreatio:item_ore_platinum> * 6,
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:6>,
            crushing: <thermalfoundation:material:70> * 4,
            crushingByprod1: <mekores:mekanismore:23>,
            
            drilling: <exnihilocreatio:item_ore_platinum> * 12,
            denorm: <thermalfoundation:ore:6> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:6>,
            crushing: <thermalfoundation:material:70> * 5,
            crushingByprod1: <mekores:mekanismore:23> * 2,
            
            drilling: <exnihilocreatio:item_ore_platinum> * 15,
            denorm: <thermalfoundation:ore:6> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_platinum:1>,
            crushing: <thermalfoundation:material:70> * 2,
            crushingByprod1: <mekores:mekanismore:23>,
            

            madeFrom: <exnihilocreatio:item_ore_platinum> * 3
        },

        dense: {
            item: <densemetals:dense_platinum_ore>,
            crushing: <thermalfoundation:ore:6> * 3,
            crushingByprod1: <mekores:mekanismore:23> * 4,

            making: <thermalfoundation:ore:6> * 4
        },
        dense_nether: {
            item:<densemetals:dense_nether_platinum_ore>,
            crushing: <netherendingores:ore_nether_modded_1:6> * 3,
            crushingByprod1: <mekores:mekanismore:23> * 6,

            making: <netherendingores:ore_nether_modded_1:6> * 4
        }
    },
    iridium: {
        overworld: {
            item: <thermalfoundation:ore:7>,
            crushing: <thermalfoundation:material:71> * 2,
            crushingByprod1: <taiga:vibranium_dust>,
            crushingByprod2: <contenttweaker:neodymium_dust>,

            drilling: <exnihilocreatio:item_ore_iridium> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:2>,
            crushing: <thermalfoundation:material:71> * 4,
            crushingByprod1: <taiga:vibranium_dust>,
            crushingByprod2: <contenttweaker:neodymium_dust>,

            drilling: <exnihilocreatio:item_ore_iridium> * 12,
            denorm: <thermalfoundation:ore:7> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:2>,
            crushing: <thermalfoundation:material:71> * 5,
            crushingByprod1: <taiga:vibranium_dust>,
            crushingByprod2: <contenttweaker:neodymium_dust>,

            drilling: <exnihilocreatio:item_ore_iridium> * 15,
            denorm: <thermalfoundation:ore:7> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_iridium:1>,
            crushing: <thermalfoundation:material:71> * 2,
            crushingByprod1: <thermalfoundation:material:70>,
            crushingByprod2: <contenttweaker:neodymium_dust>,

            drilling: <mekores:mekanismore:23> * 3,
            madeFrom: <exnihilocreatio:item_ore_iridium> * 3
        },

        dense: {
            item: <densemetals:dense_iridium_ore>,
            crushing: <thermalfoundation:ore:7> * 3,
            crushingByprod1: <taiga:vibranium_dust> * 4,
            crushingByprod2: <contenttweaker:neodymium_dust> * 4,

            making: <thermalfoundation:ore:7> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_iridium_ore>,
            crushing: <netherendingores:ore_nether_modded_1:2> * 3,
            crushingByprod1: <taiga:vibranium_dust> * 5,
            crushingByprod2: <contenttweaker:neodymium_dust> * 4,

            making: <netherendingores:ore_nether_modded_1:2> * 4
        }
    },
    titanium: {
        chunk: {
            item: <exnihilocreatio:item_ore_titanium:1>,

            madeFrom: <exnihilocreatio:item_ore_titanium> * 3
        },
        overworld: {
            item: <contenttweaker:titanium_ore>,
            drilling: <exnihilocreatio:item_ore_titanium> * 6
        },
        dense: {
            item: <densemetals:dense_rutile_ore>,
            crushing: <contenttweaker:titanium_ore> * 3,
            crushingByprod1: <biomesoplenty:gem:6> * 6,
            making: <contenttweaker:titanium_ore> * 4
        },
        clump: {
            item: <mekores:mekanismore:87>,
            balling: <mekores:mekanismore:88>,
            crushingByprod1: <biomesoplenty:gem:6>
        }
    },
    tungsten: {
        chunk: {
            item: <exnihilocreatio:item_ore_tungsten:1>,
            crushing_no_balls: <exnihilocreatio:item_ore_tungsten:2> * 2,
            balling: <exnihilocreatio:item_ore_tungsten:2> * 2,
            crushingByprod1: <taiga:prometheum_dust>,
            crushingByprod2: <contenttweaker:arkenium_dust>,

            madeFrom: <exnihilocreatio:item_ore_tungsten> * 3
        },
        overworld: {
            item: <contenttweaker:tungsten_ore>,
            crushing_no_balls: <exnihilocreatio:item_ore_tungsten:2> * 2,
            balling: <exnihilocreatio:item_ore_tungsten:2> * 2,
            crushingByprod1: <taiga:prometheum_dust>,
            crushingByprod2: <contenttweaker:arkenium_dust>,

            drilling: <exnihilocreatio:item_ore_tungsten> * 6
        },
        clump: {
            item: <mekores:mekanismore:107>,
            balling: <mekores:mekanismore:108>,
            crushingByprod1: <taiga:prometheum_dust>,
            crushingByprod2: <contenttweaker:arkenium_dust>,
        }
    },
    uranium: {
        otherworld: {
            item: <immersiveengineering:ore:5>,
            crushing: <immersiveengineering:metal:14> * 2,
            crushingByprod1: <taiga:jauxum_dust>,
            crushingByprod2: <bigreactors:dustyellorium>,

            drilling: <contenttweaker:uranium_pieces> * 6,
            denorm: <bigreactors:oreyellorite>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:12>,
            crushing: <immersiveengineering:metal:14> * 4,
            crushingByprod1: <taiga:jauxum_dust> * 2,
            crushingByprod2: <bigreactors:dustyellorium>,

            drilling: <contenttweaker:uranium_pieces> * 12,
            denorm: <immersiveengineering:ore:5> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:12>,
            crushing: <immersiveengineering:metal:14> * 5,
            crushingByprod1: <taiga:jauxum_dust>,
            crushingByprod2: <bigreactors:dustyellorium> * 3,

            drilling: <contenttweaker:uranium_pieces> * 15,
            denorm: <immersiveengineering:ore:5> * 3
        },
        chunk: {
            item: <contenttweaker:uranium_chunk>,
            crushing: <immersiveengineering:metal:14> * 2,
            crushingByprod1: <taiga:jauxum_dust>,
            crushingByprod2: <bigreactors:dustyellorium>,

            drilling: <mekores:mekanismore:3> * 3,

            madeFrom: <contenttweaker:uranium_pieces> * 3,
            made2x2: <contenttweaker:uranium_pieces>
        },

        dense: {
            item: <densemetals:dense_uranium_ore>,
            crushing: <immersiveengineering:ore:5> * 3,
            crushingByprod1: <taiga:jauxum_dust> * 4,
            crushingByprod2: <bigreactors:dustyellorium> * 4,

            making: <immersiveengineering:ore:5> * 4
        }
    },
    yellorium: {//todo
        overworld: {
            item: <bigreactors:oreyellorite>,
            //furnace: <bigreactors:ingotyellorium>,
            crushing_no_balls: <bigreactors:dustyellorium> * 2,
            balling: <bigreactors:dustyellorium> * 2,
            crushingByprod1: <immersiveengineering:metal:14>,
            crushingByprod2: <betternether:cincinnasite>,

            drilling: <exnihilocreatio:item_ore_yellorium> * 6,
            denorm: <immersiveengineering:ore:5>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:13>,
            crushing_no_balls: <bigreactors:dustyellorium> * 4,
            balling: <bigreactors:dustyellorium> * 4,
            crushingByprod1: <immersiveengineering:metal:14>,
            crushingByprod2: <betternether:cincinnasite> * 2,

            drilling: <exnihilocreatio:item_ore_yellorium> * 12,
            denorm: <bigreactors:oreyellorite> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:13>,
            crushing_no_balls: <bigreactors:dustyellorium> * 5,
            balling: <bigreactors:dustyellorium> * 5,
            crushingByprod1: <immersiveengineering:metal:14> * 2,
            crushingByprod2: <betternether:cincinnasite> * 3,

            drilling: <exnihilocreatio:item_ore_yellorium> * 15,
            denorm: <bigreactors:oreyellorite> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_yellorium:1>,
            crushing_no_balls: <bigreactors:dustyellorium> * 2,
            balling: <bigreactors:dustyellorium> * 2,
            crushingByprod1: <immersiveengineering:metal:14>,
            crushingByprod2: <betternether:cincinnasite>,

            drilling: <mekores:mekanismore:8> * 3,
            madeFrom: <exnihilocreatio:item_ore_yellorium> * 3
        },
        clump: {
            item: <mekores:mekanismore:7>,
            balling: <mekores:mekanismore:8>,
            rushingByprod1: <immersiveengineering:metal:14>,
            crushingByprod2: <betternether:cincinnasite>,

        }
    },

    cursed_gold: {
        chunk: {
            item: <contenttweaker:cursed_gold_chunk>,
            crushing: <contenttweaker:cursed_gold_dust> * 2,
            crushingByprod1: <atum:coin_gold>,
            crushingByprod2: <thermalfoundation:material:72>,

            madeFrom: <contenttweaker:cursed_gold_pieces> * 3,
            made2x2: <contenttweaker:cursed_gold_pieces>
        }
    },

    //
    mithril: {
        overworld: {
            item: <thermalfoundation:ore:8>,
            crushing: <thermalfoundation:material:72> * 2,
            crushingByprod1: <contenttweaker:neodymium_dust>,
            crushingByprod2: <contenttweaker:orichalcum_dirty_dust>,

            drilling: <exnihilocreatio:item_ore_mithril> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:4>,
            crushing: <thermalfoundation:material:72> * 4,
            crushingByprod1: <contenttweaker:neodymium_dust>,
            crushingByprod2: <contenttweaker:orichalcum_dirty_dust>,

            drilling: <exnihilocreatio:item_ore_mithril> * 12,
            denorm: <thermalfoundation:ore:8> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:4>,
            crushing: <thermalfoundation:material:72> * 5,
            crushingByprod1: <contenttweaker:neodymium_dust> * 2,
            crushingByprod2: <contenttweaker:orichalcum_dirty_dust>,

            drilling: <exnihilocreatio:item_ore_mithril> * 15,
            denorm: <thermalfoundation:ore:8> * 3
        },
        chunk: {
            item: <exnihilocreatio:item_ore_mithril:1>,
            crushing: <thermalfoundation:material:72> * 2,
            crushingByprod1: <contenttweaker:neodymium_dust>,

            drilling: <mekores:mekanismore:28> * 3,
            madeFrom: <exnihilocreatio:item_ore_mithril> * 3
        },

        dense: {
            item: <densemetals:dense_mithril_ore>,
            crushing: <thermalfoundation:ore:8> * 3,
            crushingByprod1: <contenttweaker:neodymium_dust> * 4,
            crushingByprod2: <contenttweaker:orichalcum_dirty_dust> * 4,

            making: <thermalfoundation:ore:8> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_mithril_ore>,
            crushing: <netherendingores:ore_nether_modded_1:4> * 3,
            crushingByprod1: <contenttweaker:neodymium_dust> * 5,
            crushingByprod2: <contenttweaker:orichalcum_dirty_dust> * 5,

            making: <netherendingores:ore_nether_modded_1:4> * 4
        }
    },
    chrome: {
        otherworld: {
            item: <contenttweaker:chrome_ore>,
            crushing_no_balls: <contenttweaker:chrome_dust> * 2,
            balling: <contenttweaker:chrome_dust> * 2,
            crushingByprod1: <biomesoplenty:gem:1>,
            crushingByprod2: <biomesoplenty:gem:1>,

            drilling: <contenttweaker:chrome_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:chrome_chunk>,
            crushing_no_balls: <contenttweaker:chrome_dust> * 2,
            balling: <contenttweaker:chrome_dust> * 2,
            crushingByprod1: <biomesoplenty:gem:1>,
            crushingByprod2: <biomesoplenty:gem:1>,

            drilling: <contenttweaker:chrome_dirty_dust> * 3,
            madeFrom: <contenttweaker:chrome_pieces> * 3,
            made2x2: <contenttweaker:chrome_pieces>
        },
        dense: {
            item: <densemetals:dense_chromium_ore>,
            crushing: <contenttweaker:chrome_ore> * 3,
            crushingByprod1: <biomesoplenty:gem:1> * 4,

            making: <contenttweaker:chrome_ore> * 4
        }
    },
    gallium: {
        ow: {
            item: <contenttweaker:gallium_ore>,
            crushing: <contenttweaker:gallium_dust> * 2,
            crushingByprod1: <contenttweaker:bauxite_dust>,

            drilling: <contenttweaker:gallium_pieces> * 6,
            denorm: <immersiveengineering:ore:4>
        },
        dense: {
            item: <contenttweaker:gallium_dense_ore>,

            making: <contenttweaker:gallium_ore> * 4
        },

        chunk: {
            item: <contenttweaker:gallium_chunk>,
            crushing: <contenttweaker:gallium_dust> * 2,
            crushingByprod1: <contenttweaker:bauxite_dust>,


            made2x2: <contenttweaker:gallium_pieces>,
            madeFrom: <contenttweaker:gallium_pieces> * 3    
        }
    },
    neodymium: {
        ow: {
            item: <contenttweaker:neodymium_ore>,
            crushing: <contenttweaker:neodymium_dust> * 2,
            crushingByprod1: <contenttweaker:arkenium_dirty_dust>,
            crushingByprod2: <contenttweaker:rare_earth_dust>,

            drilling: <contenttweaker:neodymium_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:neodymium_chunk>,
            crushing: <contenttweaker:neodymium_dust> * 2,
            crushingByprod1: <contenttweaker:arkenium_dirty_dust>,
            crushingByprod2: <contenttweaker:rare_earth_dust>,

            drilling: <contenttweaker:neodymium_dirty_dust> * 3,

            madeFrom: <contenttweaker:neodymium_pieces> * 3,
            made2x2: <contenttweaker:neodymium_pieces>
        },
        clump: {
            item: <contenttweaker:neodymium_cluster>,
            balling: <contenttweaker:neodymium_dirty_dust>,
            crushingByprod1:<contenttweaker:arkenium_dirty_dust>,
            crushingByprod2: <contenttweaker:rare_earth_dust>
        }
    },
    vibranium: {
        overworld: {
            item: <taiga:vibranium_ore>,
            crushing: <taiga:vibranium_dust> * 2,
            crushingByprod1: <taiga:duranite_dust>,
            crushingByprod2: <thermalfoundation:material:72>,

            drilling: <contenttweaker:vibranium_pieces> * 6,
            denorm: <moretcon:orearkenium>
        },
        chunk: {
            item: <contenttweaker:vibranium_chunk>,
            crushing: <taiga:vibranium_dust> * 2,
            crushingByprod1: <taiga:duranite_dust>,
            crushingByprod2: <thermalfoundation:material:72>,

            drilling: <mekores:mekanismore:268> * 3,

            made2x2: <contenttweaker:vibranium_pieces>,
            madeFrom: <contenttweaker:vibranium_pieces> * 3
        }
    },
    palladium: {
        chunk: {
            item: <contenttweaker:palladium_chunk>,
            crushing_no_balls: <taiga:palladium_dust> * 2,
            balling: <taiga:palladium_dust> * 2,
            crushingByprod1: <taiga:abyssum_dust>,

            drilling: <mekores:mekanismore:123> * 3,

            madeFrom: <contenttweaker:palladium_pieces> * 3,
            made2x2: <contenttweaker:palladium_pieces>
        },
        end: {
            item: <taiga:palladium_ore>,
            crushing_no_balls: <taiga:palladium_dust> * 2,
            balling: <taiga:palladium_dust> * 2,
            crushingByprod1: <taiga:abyssum_dust>,
            crushingByprod2: <mekores:mekanismore:288>,

            drilling: <contenttweaker:palladium_pieces> * 9
        },

        clump: {
            item: <mekores:mekanismore:122>,
            balling: <mekores:mekanismore:123>,
            crushingByprod1: <taiga:abyssum_dust>,
            crushingByprod2: <mekores:mekanismore:288>,

        }
    },
    arkenium: {
        overworld: {
            item: <netherendingores:ore_other_1:9>,
            crushing: <contenttweaker:arkenium_dust> * 2,
            crushingByprod1: <taiga:eezo_dust>,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,

            drilling: <contenttweaker:arkenium_pieces> * 6,
            denorm: <contenttweaker:gallium_ore>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:8>,
            crushing: <contenttweaker:arkenium_dust> * 4,
            crushingByprod1: <taiga:eezo_dust>,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,


            drilling: <contenttweaker:arkenium_pieces> * 12,

            denorm: <netherendingores:ore_other_1:9> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:8>,
            crushing: <contenttweaker:arkenium_dust> * 5,
            crushingByprod1: <taiga:eezo_dust>,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,

            drilling: <contenttweaker:arkenium_pieces> * 15,

            denorm: <netherendingores:ore_other_1:9> * 3
        },
        chunk: {
            item: <contenttweaker:arkenium_chunk>,
            crushing: <contenttweaker:arkenium_dust> * 2,
            crushingByprod1: <taiga:eezo_dust>,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,

            madeFrom: <contenttweaker:arkenium_pieces> * 3,
            made2x2: <contenttweaker:arkenium_pieces>
        },

        aether: {
            item: <moretcon:orearkenium>,
            crushing: <contenttweaker:arkenium_dust> * 3,
            crushingByprod1: <aether_legacy:zanite_gemstone>,
            crushingByprod2: <moretcon:dustgravitonium>,

            drilling: <contenttweaker:arkenium_pieces> * 6,
            denorm: <netherendingores:ore_other_1:9>
        }
    },
    draconium: {
        overworld: {
            item: <draconicevolution:draconium_ore>,
            crushing_no_balls: <draconicevolution:draconium_dust> * 2,
            balling: <draconicevolution:draconium_dust> * 2,
            crushingByprod1: <thermalfoundation:material:72>,
            crushingByprod2: <mekores:mekanismore:28>,

            drilling: <exnihilocreatio:item_ore_draconium> * 6,
            denorm: <taiga:vibranium_ore>
        },
        nether: {
            item: <draconicevolution:draconium_ore:1>,
            crushing_no_balls: <draconicevolution:draconium_dust> * 4,
            balling: <draconicevolution:draconium_dust> * 4,
            crushingByprod1: <thermalfoundation:material:72>,
            crushingByprod2: <mekores:mekanismore:28>,

            drilling: <exnihilocreatio:item_ore_draconium> * 12,
            denorm: <draconicevolution:draconium_ore> * 2
        },
        end: {
            item: <draconicevolution:draconium_ore:2>,
            crushing_no_balls: <draconicevolution:draconium_dust> * 5,
            balling: <draconicevolution:draconium_dust> * 5,
            crushingByprod1: <contenttweaker:biotite_dust> * 3,
            crushingByprod2: <contenttweaker:biotite_dust>,

            drilling: <exnihilocreatio:item_ore_draconium> * 15,
            denorm: <draconicevolution:draconium_ore> * 3
        },

        chunk: {
            item: <exnihilocreatio:item_ore_draconium:1>,
            crushing_no_balls: <draconicevolution:draconium_dust> * 2,
            balling: <draconicevolution:draconium_dust> * 2,
            crushingByprod1: <thermalfoundation:material:72>,
            crushingByprod2: <mekores:mekanismore:28>,

            drilling: <mekores:mekanismore:53> * 3,
            madeFrom: <exnihilocreatio:item_ore_draconium> * 3
        },
        clump: {
            item: <mekores:mekanismore:52>,
            balling: <mekores:mekanismore:53>,
            crushingByprod1: <thermalfoundation:material:72>,
            crushingByprod2: <mekores:mekanismore:28>,
        }
    },
    orichalcum: {
        chunk: {
            item: <contenttweaker:orichalcum_chunk>,
            crushing: <contenttweaker:orichalcum_dust> * 2,
            crushingByprod1: <thermalfoundation:material:72>,

            drilling: <contenttweaker:orichalcum_dirty_dust> * 3,

            madeFrom: <contenttweaker:orichalcum_pieces> * 3,
            made2x2: <contenttweaker:orichalcum_pieces>

        },
        overworld: {
            item: <contenttweaker:orichalcum_ore>,
            crushing: <contenttweaker:orichalcum_dust> * 2,
            crushingByprod1: <thermalfoundation:material:72>,

            drilling: <contenttweaker:orichalcum_pieces> * 6,

        }
    },
    nickel_oxide: {
        overworld: {
            item: <immersiveengineering:ore:4>,

            crushing_no_balls: <contenttweaker:nickel_oxide> * 2,
            balling: <contenttweaker:nickel_oxide> * 2,
            crushingByprod1: <immersiveengineering:metal:14>,
            crushingByprod2: <mekores:mekanismore:18>,

            drilling: <contenttweaker:nickel_oxide> * 3
        }
    },

    //t5
    starmetal: {
        overworld: {
            item: <contenttweaker:starmetal_ore>,
            crushing_no_balls: <astralsorcery:itemcraftingcomponent:2> * 2,
            balling: <astralsorcery:itemcraftingcomponent:2> * 2,
            crushingByprod1: <taiga:uru_dust>,
            crushingByprod2: <contenttweaker:nether_star_dust>,

            drilling: <mekores:mekanismore:48> * 3
        }
    },
    beryllium: {
        overworld: {
            item: <contenttweaker:beryllium_ore>,
            crushing: <contenttweaker:beryllium_dust> * 2,
            crushingByprod1: <contenttweaker:zirconium_dirty_dust>,
            crushingByprod2: <contenttweaker:beryllium_dust>
        }
    },
    zirconium: {
        overworld: {
            item: <contenttweaker:zirconium_ore>,
            crushing_no_balls: <contenttweaker:zirconium_dust> * 2,
            balling: <contenttweaker:zirconium_dust> * 2,
            crushingByprod1: <contenttweaker:rare_earth_dust>, 
            crushingByprod2: <taiga:meteoritecobble_block>,

            drilling: <contenttweaker:zirconium_pieces> * 6,
        },
        chunk: {
            item: <contenttweaker:zirconium_chunk>,
            crushing_no_balls: <contenttweaker:zirconium_dust> * 2,
            balling: <contenttweaker:zirconium_dust> * 2,
            crushingByprod1: <contenttweaker:rare_earth_dust>, 
            crushingByprod2: <taiga:meteoritecobble_block>,

            drilling: <contenttweaker:zirconium_dirty_dust> * 3,

            made2x2: <contenttweaker:zirconium_pieces>,
            madeFrom: <contenttweaker:zirconium_pieces> * 3
        },
        dense: {
            item: <contenttweaker:zirconium_ore_dense>,
            drilling: <contenttweaker:zirconium_ore> * 4,

            crushing: <contenttweaker:zirconium_ore> * 3,
            crushingByprod1: <contenttweaker:rare_earth_dust> * 4, 
            crushingByprod2: <taiga:meteoritecobble_block>,
        }
    },
    spaceice: {
        ice: {
            item: <contenttweaker:space_ice_raw>,
            crushing: <contenttweaker:space_ice> * 2,
            crushingByprod1: <contenttweaker:ice_dust>,
            crushingByprod2: <contenttweaker:polonium_dust>
        }
    },
    death_metal: {
        overworld: {
            item: <contenttweaker:death_metal_ore>,

            drilling: <contenttweaker:death_metal_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:death_metal_chunk>,

            made2x2: <contenttweaker:death_metal_pieces>,
            madeFrom: <contenttweaker:death_metal_pieces> * 3
        }
    },

    //bop gems
    ruby: {
        overworld: {
            item: <biomesoplenty:gem_ore:1>,
            crushing_no_balls: <biomesoplenty:gem:1> * 2,
            balling: <biomesoplenty:gem:1> * 2,
            crushingByprod1: <biomesoplenty:gem:1>,
            crushingByprod2: <contenttweaker:chrome_dust>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:1>,
            crushing_no_balls: <biomesoplenty:gem:1> * 4,
            balling: <biomesoplenty:gem:1> * 4,
            crushingByprod1: <contenttweaker:chrome_dust>,
            crushingByprod2: <contenttweaker:chrome_dust>,

            denorm: <biomesoplenty:gem_ore:1> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:1>,
            crushing_no_balls: <biomesoplenty:gem:1> * 5,
            balling: <biomesoplenty:gem:1> * 5,
            crushingByprod1: <contenttweaker:chrome_dust>,
            crushingByprod2: <contenttweaker:chrome_dust>,

            denorm: <biomesoplenty:gem_ore:1> * 3
        },
        overworld3: {
            item: <biomesoplenty:gem_ore:1> * 3,
            denorm: <contenttweaker:chrome_ore>
        }
    },
    topaz: {
        overworld: {
            item: <biomesoplenty:gem_ore:3>,
            crushing_no_balls: <biomesoplenty:gem:3> * 2,
            balling: <biomesoplenty:gem:3> * 2,
            crushingByprod1: <biomesoplenty:gem:3>,
            crushingByprod2: <mekores:mekanismore:33>,

            drilling: <biomesoplenty:gem:3> * 4,
            cleaning: <biomesoplenty:gem:3> * 3
        }
    },
    amber: {
        overworld: {
            item: <biomesoplenty:gem_ore:7>,
            crushing_no_balls: <biomesoplenty:gem:7> * 2,
            balling: <biomesoplenty:gem:7> * 2,
            crushingByprod1: <biomesoplenty:gem:7>,
            crushingByprod2: <erebus:materials:2>
        }
    },
    peridot: {
        overworld: {
            item: <biomesoplenty:gem_ore:2>,
            crushing_no_balls: <biomesoplenty:gem:2> * 2,
            balling: <biomesoplenty:gem:2> * 2,
            crushingByprod1: <biomesoplenty:gem:2>,
            crushingByprod2: <thermalfoundation:material> * 3,
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:3>,
            crushing_no_balls: <biomesoplenty:gem:2> * 4,
            balling: <biomesoplenty:gem:2> * 4,
            crushingByprod1: <thermalfoundation:material> * 3,
            crushingByprod2: <thermalfoundation:material> * 3,

            denorm: <biomesoplenty:gem_ore:2> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:3>,
            crushing_no_balls: <biomesoplenty:gem:2> * 5,
            balling: <biomesoplenty:gem:2> * 5,
            crushingByprod1: <thermalfoundation:material> * 3,
            crushingByprod2: <thermalfoundation:material> * 3,

            denorm: <biomesoplenty:gem_ore:2> * 3
        }
    },
    malachite: {
        overworld: {
            item: <biomesoplenty:gem_ore:5>,
            crushing_no_balls: <biomesoplenty:gem:5> * 2,
            balling: <biomesoplenty:gem:5> * 2,
            crushingByprod1: <mekanism:dirtydust:3>,
            crushingByprod2: <biomesoplenty:gem:5>
        }
    },
    sapphire: {
        overworld: {
            item: <biomesoplenty:gem_ore:6>,
            crushing_no_balls: <biomesoplenty:gem:6> * 2,
            balling: <biomesoplenty:gem:6> * 2,
            crushingByprod1: <contenttweaker:titanium_dust>,
            crushingByprod2: <biomesoplenty:gem:6>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:2>,
            crushing_no_balls: <biomesoplenty:gem:6> * 4,
            balling: <biomesoplenty:gem:6> * 4,
            crushingByprod1: <mekores:mekanismore:88>,
            crushingByprod2: <biomesoplenty:gem:6>,

            denorm: <biomesoplenty:gem_ore:6> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:2>,
            crushing_no_balls: <biomesoplenty:gem:6> * 5,
            balling: <biomesoplenty:gem:6> * 5,
            crushingByprod1: <mekores:mekanismore:88>,
            crushingByprod2: <biomesoplenty:gem:6>,

            denorm: <biomesoplenty:gem_ore:6> * 3
        }
    },
    tanzanite: {
        overworld: {
            item: <biomesoplenty:gem_ore:4>,
            crushing_no_balls: <biomesoplenty:gem:4> * 2,
            balling: <biomesoplenty:gem:4> * 2,
            crushingByprod1: <contenttweaker:bauxite_dust>,
            crushingByprod2: <biomesoplenty:gem:4>
        }
    },

    amethyst: {
        overworld: {
            item: <mysticalworld:amethyst_ore>,
            crushing_no_balls: <contenttweaker:amethyst_dust> * 2,
            balling: <contenttweaker:amethyst_dust> * 2,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <mysticalworld:amethyst_gem>,

            cleaning: <mysticalworld:amethyst_gem> * 4,
            drilling: <contenttweaker:amethyst_dirty_dust> * 4
        },
        dirty: {
            item: <contenttweaker:amethyst_dirty_dust>,
            cleaning: <contenttweaker:amethyst_dust>,

            separating1: <contenttweaker:amethyst_dust>,
            separating3: <contenttweaker:ender_amethyst_dust>,
            separating4: <contenttweaker:soot>
        },
        gem: {
            item: <mysticalworld:amethyst_gem>,
            crushing: <contenttweaker:amethyst_dust>
        },
        end: {
            item: <biomesoplenty:gem_ore>,
            crushing_no_balls: <contenttweaker:ender_amethyst_dust> * 2,
            balling: <contenttweaker:ender_amethyst_dust> * 2,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <biomesoplenty:gem>,

            alloySlag2: <biomesoplenty:gem> * 2,
            alloySlag3: <biomesoplenty:gem> * 3,

            drilling: <contenttweaker:ender_amethyst_dirty_dust> * 4,

            denorm: <mysticalworld:amethyst_ore>
        },
        end_dirty: {
            item: <contenttweaker:ender_amethyst_dirty_dust>,
            cleaning: <contenttweaker:ender_amethyst_dust>,

            separating1: <contenttweaker:ender_amethyst_dust>,
            separating3: <contenttweaker:amethyst_dust>,
            separating4: <contenttweaker:soot>
        },
        end_gem: {
            item: <biomesoplenty:gem>,
            crushing: <contenttweaker:ender_amethyst_dust>
        }
    },
    graphite: {
        overworld: {
            item: <quantumflux:graphiteore>,
            crushing: <quantumflux:graphitedust> * 2,
            crushingByprod1: <actuallyadditions:item_dust:2>,
            crushingByprod2: <quantumflux:graphitedust>,

            drilling: <quantumflux:graphitedust> * 4
        }
    },

    clathrate_redstone: {
        ore: {
            item: <thermalfoundation:ore_fluid:2>,
            crushing: <thermalfoundation:material:893> * 3,
            crushingByprod1: <minecraft:redstone>,
            crushingByprod2: <thermalfoundation:material:866>,

            drilling: <thermalfoundation:material:893> * 5
        }
    },
    clathrate_glowstone: {
        ore: {
            item: <thermalfoundation:ore_fluid:3>,
            crushing: <thermalfoundation:material:894> * 3,
            crushingByprod1: <minecraft:glowstone_dust>,
            crushingByprod2: <betternether:cincinnasite>,

            drilling: <thermalfoundation:material:894> * 5
        }
    },
    clathrate_ender: {
        ore: {
            item: <thermalfoundation:ore_fluid:4>,
            crushing: <thermalfoundation:material:895> * 3,
            crushingByprod1: <minecraft:ender_pearl>,
            crushingByprod2: <thermalfoundation:material:895>,

            drilling: <thermalfoundation:material:895> * 5
        }
    },

    //aether
    ambrosium: {
        aether: {
            item: <aether_legacy:ambrosium_ore>,
            crushing_no_balls: <aether_legacy:ambrosium_shard> * 3,
            balling: <aether_legacy:ambrosium_shard> * 3,
            crushingByprod1: <contenttweaker:ambrosium_dust>,
            crushingByprod2: <contenttweaker:ambrosium_seed>,

            drilling: <contenttweaker:ambrosium_dust> * 5
        },
        overworld: {
            item: <netherendingores:ore_other_1:6>,
            crushing_no_balls: <aether_legacy:ambrosium_shard> * 2,
            balling: <aether_legacy:ambrosium_shard> * 2,
            crushingByprod1: <contenttweaker:ambrosium_dust>,
            crushingByprod2: <contenttweaker:ambrosium_seed>,

            drilling: <contenttweaker:ambrosium_dust> * 4,

            denorm: <aether_legacy:ambrosium_ore>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:5>,
            crushing_no_balls: <aether_legacy:ambrosium_shard> * 4,
            balling: <aether_legacy:ambrosium_shard> * 4,
            crushingByprod1: <contenttweaker:ambrosium_dust>,
            crushingByprod2: <contenttweaker:ambrosium_seed>,

            drilling: <contenttweaker:ambrosium_dust> * 6,

            denorm: <netherendingores:ore_other_1:6> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:5>,
            crushing_no_balls: <aether_legacy:ambrosium_shard> * 5,
            balling: <aether_legacy:ambrosium_shard> * 5,
            crushingByprod1: <contenttweaker:ambrosium_dust>,
            crushingByprod2: <contenttweaker:ambrosium_seed>,

            drilling: <contenttweaker:ambrosium_dust> * 8,

            denorm: <netherendingores:ore_other_1:6> * 3
        }
    },
    zanite: {
        aether: {
            item: <aether_legacy:zanite_ore>,
            furnace: <aether_legacy:zanite_gemstone>,
            crushing_no_balls: <aether_legacy:zanite_gemstone> * 2,
            balling: <aether_legacy:zanite_gemstone> * 2,
            crushingByprod1: <biomesoplenty:gem:4> * 3,
            crushingByprod2: <actuallyadditions:item_dust:2>
        },
        overworld: {
            item: <netherendingores:ore_other_1:8>,
            furnace: <aether_legacy:zanite_gemstone>,
            crushing: <aether_legacy:zanite_gemstone> * 2,
            crushingByprod1: <aether_legacy:zanite_gemstone>,

            denorm: <aether_legacy:zanite_ore>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:7>,
            furnace: <aether_legacy:zanite_gemstone> * 2,
            crushing: <aether_legacy:zanite_gemstone> * 4,

            denorm: <netherendingores:ore_other_1:8> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:7>,
            furnace: <aether_legacy:zanite_gemstone> * 3,
            crushing: <aether_legacy:zanite_gemstone> * 5,

            denorm: <netherendingores:ore_other_1:8> * 3
        }
    },
    gravitite: {
        otherworld: {
            item: <netherendingores:ore_other_1:7>,

            denorm: <aether_legacy:gravitite_ore>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:6>,

            denorm: <netherendingores:ore_other_1:7> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:6>,

            denorm: <netherendingores:ore_other_1:7> * 3
        }
    },

    benitoite: {
        nether: {
            item: <bigreactors:orebenitoite>,
            furnace: <bigreactors:mineralbenitoite>,
            crushing_no_balls: <bigreactors:mineralbenitoite> * 2,
            balling: <bigreactors:mineralbenitoite> * 2,
            crushingByprod1: <appliedenergistics2:material:5> * 3,
            crushingByprod2: <mekores:mekanismore:88>,

            drilling: <bigreactors:mineralbenitoite> * 3,

            denorm: <contenttweaker:titanium_ore>
        }
    },
    anglesite: {
        end: {
            item: <bigreactors:oreanglesite>,
            furnace: <bigreactors:mineralanglesite>,
            crushing_no_balls: <bigreactors:mineralanglesite> * 2,
            balling: <bigreactors:mineralanglesite> * 2,
            crushingByprod1: <thermalfoundation:material:771> * 6,
            crushingByprod2: <mekanism:crystal:6> * 3,

            drilling: <bigreactors:mineralanglesite> * 3,

            denorm: <densemetals:dense_lead_ore>
        }
    },

    //taiga ores
    eezo: {
        chunk: {
            item: <contenttweaker:eezo_chunk>,

            crushing_no_balls: <taiga:eezo_dust> * 2,
            balling: <taiga:eezo_dust> * 2,
            crushingByprod1: <enderio:item_material:20> * 3,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,

            drilling: <mekores:mekanismore:298>  * 3,
            
            madeFrom: <contenttweaker:eezo_pieces> * 3,
            made2x2: <contenttweaker:eezo_pieces>,
            madeCreosolon: <contenttweaker:eezo_pieces>
        },
        ore: {
            item: <taiga:eezo_ore>,

            crushing_no_balls: <taiga:eezo_dust> * 2,
            balling: <taiga:eezo_dust> * 2,
            crushingByprod1: <enderio:item_material:20> * 3,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,

            drilling: <contenttweaker:eezo_pieces> * 6
        },
        clump: {
            item: <mekores:mekanismore:297>,
            balling: <mekores:mekanismore:298>,
            crushingByprod1: <enderio:item_material:20> * 3,
            crushingByprod2: <contenttweaker:bedrockium_small_chunk>,
        }
    },
    karmesine: {
        ore: {
            item: <taiga:karmesine_ore>,
            crushing_no_balls: <taiga:karmesine_dust> * 2,
            balling: <taiga:karmesine_dust> * 2,
            crushingByprod1: <taiga:ovium_dust>,

            alloySlag2: <taiga:karmesine_ingot> * 2,
            alloySlag3: <taiga:karmesine_ingot> * 3,

            drilling: <contenttweaker:karmesine_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:karmesine_chunk>,
            crushing_no_balls: <taiga:karmesine_dust> * 2,
            balling: <taiga:karmesine_dust> * 2,
            crushingByprod1: <taiga:ovium_dust>,

            alloySlag2: <taiga:karmesine_ingot> * 2,
            alloySlag3: <taiga:karmesine_ingot> * 3,

            drilling: <mekores:mekanismore:273> * 3,

            madeFrom: <contenttweaker:karmesine_pieces> * 3,
            made2x2: <contenttweaker:karmesine_pieces>,
            madeWeak: <contenttweaker:karmesine_pieces>
        },
        clump: {
            item: <mekores:mekanismore:272>,
            balling: <mekores:mekanismore:273>,
            crushingByprod1: <taiga:ovium_dust>,
        },
        dirtydust: {
            item: <mekores:mekanismore:273>,
            separating1: <taiga:karmesine_dust>,
            separating2: <taiga:jauxum_dust>,
            separating4: <contenttweaker:soot>
        }
    },
    ovium: {
        ore: {
            item: <taiga:ovium_ore>,
            crushing_no_balls: <taiga:ovium_dust> * 2,
            balling: <taiga:ovium_dust> * 2,
            crushingByprod1: <taiga:jauxum_dust>,
            crushingByprod2: <mekores:mekanismore:28>,

            alloySlag2: <taiga:ovium_ingot> * 2,
            alloySlag3: <taiga:ovium_ingot> * 3,

            drilling: <contenttweaker:ovium_pieces> * 6,
        },
        chunk: {
            item: <contenttweaker:ovium_chunk>,
            crushing_no_balls: <taiga:ovium_dust> * 2,
            balling: <taiga:ovium_dust> * 2,
            crushingByprod1: <taiga:jauxum_dust>,
            crushingByprod2: <mekores:mekanismore:28>,

            alloySlag2: <taiga:ovium_ingot> * 2,
            alloySlag3: <taiga:ovium_ingot> * 3,

            drilling: <mekores:mekanismore:278> * 3,

            madeFrom: <contenttweaker:ovium_pieces> * 3,
            made2x2: <contenttweaker:ovium_pieces>,
            madeWeak: <contenttweaker:ovium_pieces>
        },
        clump: {
            item: <mekores:mekanismore:277>,
            balling: <mekores:mekanismore:278>,
            crushingByprod1: <taiga:jauxum_dust>,
            crushingByprod2: <mekores:mekanismore:28>,
        },
        dirtydust: {
            item: <mekores:mekanismore:278>,
            separating1: <taiga:ovium_dust>,
            separating2: <taiga:karmesine_dust>,
            separating3: <mekores:mekanismore:28>,
            separating4: <contenttweaker:soot>
        }
    },
    jauxum: {
        ore: {
            item: <taiga:jauxum_ore>,
            crushing_no_balls: <taiga:jauxum_dust> * 2,
            balling: <taiga:jauxum_dust> * 2,
            crushingByprod1: <taiga:karmesine_dust>,
            crushingByprod2: <immersiveengineering:metal:14>,

            alloySlag2: <taiga:jauxum_ingot> * 2,
            alloySlag3: <taiga:jauxum_ingot> * 3,

            drilling: <contenttweaker:jauxum_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:jauxum_chunk>,
            crushing_no_balls: <taiga:jauxum_dust> * 2,
            balling: <taiga:jauxum_dust> * 2,
            crushingByprod1: <taiga:karmesine_dust>,
            crushingByprod2: <immersiveengineering:metal:14>,

            alloySlag2: <taiga:jauxum_ingot> * 2,
            alloySlag3: <taiga:jauxum_ingot> * 3,

            drilling: <mekores:mekanismore:283> * 3,

            madeFrom: <contenttweaker:jauxum_pieces> * 3,
            made2x2: <contenttweaker:jauxum_pieces>,
            madeWeak: <contenttweaker:jauxum_pieces>
        },
        clump: {
            item: <mekores:mekanismore:282>,
            balling: <mekores:mekanismore:283>,
            crushingByprod1: <taiga:karmesine_dust>,
            crushingByprod2: <immersiveengineering:metal:14>,
        },
        dirtydust: {
            item: <mekores:mekanismore:283>,
            separating1: <taiga:jauxum_dust>,
            separating2: <taiga:ovium_dust>,
            separating3: <immersiveengineering:metal:14>,
            separating4: <contenttweaker:soot>
        }
    },
    tiberium: {
        nether: {
            item: <taiga:tiberium_ore>,
            crushing: <taiga:tiberium_crystal> * 4,
            crushingByprod1: <taiga:tiberium_dust>,
            crushingByprod2: <taiga:tiberium_crystal> * 4,

            drilling: <mekores:mekanismore:248> * 4
        }
    },
    osram: {
        chunk: {
            item: <contenttweaker:osram_chunk>,
            crushing_no_balls: <taiga:osram_dust> * 2,
            balling: <taiga:osram_dust> * 2,
            crushingByprod1: <taiga:valyrium_dust>,
            crushingByprod2: <taiga:prometheum_dust>,

            alloySlag2: <taiga:osram_ingot> * 2,
            alloySlag3: <taiga:osram_ingot> * 3,

            drilling: <mekores:mekanismore:293> * 3,

            madeFrom: <contenttweaker:osram_pieces> * 3,
            made2x2: <contenttweaker:osram_pieces>,
            madeCreosolon: <contenttweaker:osram_pieces>
        },
        nether: {
            item: <taiga:osram_ore>,
            crushing_no_balls: <taiga:osram_dust> * 2,
            balling: <taiga:osram_dust> * 2,
            crushingByprod1: <taiga:valyrium_dust>,
            crushingByprod2: <taiga:prometheum_dust>,

            alloySlag2: <taiga:osram_ingot> * 2,
            alloySlag3: <taiga:osram_ingot> * 3,

            drilling: <contenttweaker:osram_pieces> * 6,

            denorm: <betternether:cincinnasite_ore>
        },

        clump: {
            item: <mekores:mekanismore:292>,
            balling: <mekores:mekanismore:293>,
            crushingByprod1: <taiga:valyrium_dust>,
            crushingByprod2: <taiga:prometheum_dust>
        }
    },
    abyssum: {
        end: {
            item: <taiga:abyssum_ore>,
            crushing: <taiga:abyssum_dust> * 2,
            crushingByprod1: <taiga:palladium_dust>,
            crushingByprod2: <mekores:mekanismore:288>,

            drilling: <contenttweaker:abyssum_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:abyssum_chunk>,
            crushing: <taiga:abyssum_dust> * 2,
            crushingByprod1: <taiga:palladium_dust>,

            madeFrom: <contenttweaker:abyssum_pieces> * 3,
            made2x2: <contenttweaker:abyssum_pieces>,
            drilling: <mekores:mekanismore:303> * 3
        }
    },
    prometheum: {
        nether: {
            item: <taiga:prometheum_ore>,
            crushing_no_balls: <taiga:prometheum_dust> * 2,
            balling: <taiga:prometheum_dust> * 2,
            crushingByprod1: <bigreactors:dustyellorium>,
            crushingByprod2: <exnihilocreatio:item_ore_tungsten:2>,

            denorm: <immersiveengineering:ore:5>,
            drilling: <contenttweaker:prometheum_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:prometheum_chunk>,
            crushing_no_balls: <taiga:prometheum_dust> * 2,
            balling: <taiga:prometheum_dust> * 2,
            crushingByprod1: <bigreactors:dustyellorium>,
            crushingByprod2: <exnihilocreatio:item_ore_tungsten:2>,

            madeFrom: <contenttweaker:prometheum_pieces> * 3,
            made2x2: <contenttweaker:prometheum_pieces>,

            drilling: <mekores:mekanismore:218> * 3
        },
        clump: {
            item: <mekores:mekanismore:217>,
            balling: <mekores:mekanismore:218>,
            crushingByprod1: <bigreactors:dustyellorium>,
            crushingByprod2: <exnihilocreatio:item_ore_tungsten:2>,
        }
    },
    uru: {
        ore: {
            item: <taiga:uru_ore>,
            crushing_no_balls: <taiga:uru_dust> * 2,
            balling: <taiga:uru_dust> * 2,
            crushingByprod1: <mekores:mekanismore:123>,
            crushingByprod2: <taiga:obsidiorite_dust> * 3,
            drilling: <contenttweaker:uru_pieces> * 6
        },
        chunk: {
            item: <contenttweaker:uru_chunk>,
            crushing_no_balls: <taiga:uru_dust> * 2,
            balling: <taiga:uru_dust> * 2,
            crushingByprod1: <mekores:mekanismore:123>,
            crushingByprod2: <taiga:obsidiorite_dust> * 3,

            drilling: <mekores:mekanismore:288> * 3,

            made2x2: <contenttweaker:uru_pieces>,
            madeFrom: <contenttweaker:uru_pieces> * 3
        },
        clump: {
            item: <mekores:mekanismore:287>,
            balling: <mekores:mekanismore:288>,
            crushingByprod1: <mekores:mekanismore:123>,
            crushingByprod2: <taiga:obsidiorite_dust> * 3,

        }
    },

    meteorite: {
        meteorite: {
            item: <taiga:meteoritecobble_block>,
            crushing: <taiga:meteorite_dust> * 2,
            crushingByprod1: <mekores:mekanismore:23>,
            crushingByprod2: <taiga:meteorite_dust>
        }
    },


    //more tcon ores
    electarite: {
        ore: {
            item: <moretcon:oreelectarite>,
            crushing_no_balls: <moretcon:gemelectarite> * 2,
            balling: <moretcon:gemelectarite> * 2,
            crushingByprod1: <projectred-core:resource_item:105> * 3,
            crushingByprod2: <moretcon:gemelectarite> * 2,

            cleaning: <moretcon:gemelectarite> * 4,
            drilling: <moretcon:gemelectarite> * 4,

            denorm: <contenttweaker:electrotine_ore> * 2
        }
    },
    

    //other
    redstone: {
        overworld: {
            item: <minecraft:redstone_ore>,
            crushing: <minecraft:redstone> * 10,
            crushingByprod1: <exnihilocreatio:item_ore_ardite:2>,
            crushingByprod2: <contenttweaker:rare_earth_dust>
        },
        atum: {
            item: <atum:redstone_ore>,
            crushing: <minecraft:redstone> * 10,
            crushingByprod1: <appliedenergistics2:material:5>
        },
        nether: {
            item: <netherendingores:ore_nether_vanilla:6>,
            crushing: <minecraft:redstone> * 14,
            crushingByprod1: <exnihilocreatio:item_ore_ardite:2>,
            crushingByprod2: <contenttweaker:rare_earth_dust>,

            denorm: <minecraft:redstone_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_vanilla:6>,
            crushing: <minecraft:redstone> * 16,
            crushingByprod1: <contenttweaker:rare_earth_dust>,
            crushingByprod2: <contenttweaker:rare_earth_dust>,

            denorm: <minecraft:redstone_ore> * 3
        },
        
        dense: {
            item: <densemetals:dense_redstone_ore>,
            crushing: <minecraft:redstone_ore> * 3,
            crushingByprod1: <contenttweaker:rare_earth_dust>,
            crushingByprod2: <contenttweaker:rare_earth_dust>,
            making: <minecraft:redstone_ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_redstone_ore>,
            crushing: <netherendingores:ore_nether_vanilla:6> * 3,
            crushingByprod1: <contenttweaker:rare_earth_dust> * 2,
            crushingByprod2: <contenttweaker:rare_earth_dust>,
            making: <netherendingores:ore_nether_vanilla:6> * 4
        }
    },
    electrotine: {
        overworld: {
            item: <contenttweaker:electrotine_ore>,
            furnace: <projectred-core:resource_item:105> * 2,
            crushing_no_balls: <projectred-core:resource_item:105> * 4,
            balling: <projectred-core:resource_item:105> * 4,
            crushingByprod1: <mekores:mekanismore:38>,
            crushingByprod2: <thermalfoundation:material:2049>,

            drilling: <projectred-core:resource_item:105> * 6
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:4>,
            furnace: <projectred-core:resource_item:105> * 4,
            crushing_no_balls: <projectred-core:resource_item:105> * 6,
            balling: <projectred-core:resource_item:105> * 6,
            crushingByprod1: <mekores:mekanismore:38> * 3,
            crushingByprod2: <thermalfoundation:material:2049>,

            drilling: <projectred-core:resource_item:105> * 12,

            denorm: <contenttweaker:electrotine_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:4>,
            furnace: <projectred-core:resource_item:105> * 5,
            crushing_no_balls: <projectred-core:resource_item:105> * 8,
            balling: <projectred-core:resource_item:105> * 8,
            crushingByprod1: <mekores:mekanismore:38>,
            crushingByprod2: <thermalfoundation:material:2049>,

            drilling: <projectred-core:resource_item:105> * 15,

            denorm: <contenttweaker:electrotine_ore> * 3
        },

        dense: {
            item: <contenttweaker:electrotine_ore_dense>,
            crushing: <contenttweaker:electrotine_ore> * 3,
            crushingByprod1: <mekores:mekanismore:38> * 4,

            making: <contenttweaker:electrotine_ore> * 4
        }
    },
    quartz: {
        overworld: {
            item: <mysticalworld:quartz_ore>,
            crushing: <appliedenergistics2:material:3> * 4,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:4>,

            drilling: <enderio:item_material:33> * 5,
            //denorm: <netherendingores:ore_other_1>
        },
        poor: {
            item: <netherendingores:ore_other_1>,
            furnace: <appliedenergistics2:material:3>
        },
        nether: {
            item: <minecraft:quartz_ore>,
            crushing: <appliedenergistics2:material:3> * 6,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:4>,

            drilling: <enderio:item_material:33> * 6,
            denorm: <mysticalworld:quartz_ore> * 2

        },
        end: {
            item: <netherendingores:ore_other_1:1>,
            crushing: <appliedenergistics2:material:3> * 8,
            crushingByprod1: <appliedenergistics2:material:2> * 3,
            crushingByprod2: <actuallyadditions:item_dust:4> * 3,

            drilling: <enderio:item_material:33> * 8,
            denorm: <mysticalworld:quartz_ore> * 3
        },

        granite: {
            item: <mysticalworld:granite_quartz_ore>,
            crushing: <appliedenergistics2:material:3> * 4,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <taiga:jauxum_dust>,

            drilling: <enderio:item_material:33> * 5,
            denorm: <mysticalworld:quartz_ore>
        },
        erebus: {
            item: <erebus:ore_quartz>,
            crushing: <appliedenergistics2:material:3> * 4,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <appliedenergistics2:material:2>,

            drilling: <enderio:item_material:33> * 5,
            denorm: <mysticalworld:quartz_ore>
        },
        erebus_petr: {
            item: <erebus:ore_petrified_quartz>,
            crushing: <appliedenergistics2:material:3> * 4,
            crushingByprod1: <erebus:materials:74>,
            crushingByprod2: <erebus:materials:74>,

            drilling: <enderio:item_material:33> * 5,
            denorm: <mysticalworld:quartz_ore>
        },

        dirtydust: {
            item: <enderio:item_material:33>,
            separating1: <appliedenergistics2:material:3>,
            separating2: <appliedenergistics2:material:3>,
            separating3: <actuallyadditions:item_dust:7>,
            separating4: <contenttweaker:soot>,

            making: <appliedenergistics2:material:3> * 3
        }
    },
    lapis: {
        overworld: {
            item: <minecraft:lapis_ore>,
            crushing: <enderio:item_material:32> * 8,
            crushingByprod1: <appliedenergistics2:material:5> * 4,
            crushingByprod2: <actuallyadditions:item_dust:4>,

            drilling: <actuallyadditions:item_dust:4> * 8
        },
        atum: {
            item: <atum:lapis_ore>,
            crushing: <enderio:item_material:32> * 8,
            crushingByprod1: <contenttweaker:relic_nugget>,
            crushingByprod2: <appliedenergistics2:material:5> * 4,

            drilling: <actuallyadditions:item_dust:4> * 9,

            denorm: <minecraft:lapis_ore>
        },
        erebus: {
            item: <erebus:ore_lapis>,
            crushing: <enderio:item_material:32> * 8,
            crushingByprod1: <contenttweaker:jade_dust>,
            crushingByprod2: <biomesoplenty:gem:4>,

            drilling: <actuallyadditions:item_dust:4> * 9,

            denorm: <minecraft:lapis_ore>
        },
        nether: {
            item: <netherendingores:ore_nether_vanilla:5>,
            crushing: <enderio:item_material:32> * 12,
            crushingByprod1: <appliedenergistics2:material:5> * 4,
            crushingByprod2: <actuallyadditions:item_dust:4>,

            drilling: <actuallyadditions:item_dust:4> * 12,

            denorm: <minecraft:lapis_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_vanilla:5>,
            crushing: <enderio:item_material:32> * 16,
            crushingByprod1: <appliedenergistics2:material:5> * 4,
            crushingByprod2: <contenttweaker:calcium>,

            drilling: <actuallyadditions:item_dust:4> * 16,
            denorm: <minecraft:lapis_ore> * 3
        },
        dense: {
            item: <densemetals:dense_lapis_ore>,
            crushing: <minecraft:lapis_ore> * 3,
            crushingByprod1: <atum:khnumite> * 12,
            crushingByprod2: <contenttweaker:calcium>,

            making: <minecraft:lapis_ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_lapis_ore>,
            crushing: <netherendingores:ore_nether_vanilla:5> * 3,
            crushingByprod1: <atum:khnumite> * 12,

            making: <netherendingores:ore_nether_vanilla:5> * 4
        },

        dirtydust: {
            item: <actuallyadditions:item_dust:4>,
            separating1: <enderio:item_material:32>,
            separating2: <enderio:item_material:32>,
            separating3: <contenttweaker:calcium>,
            separating4: <contenttweaker:soot>
        }
    },
    diamond: {
        overworld: {
            item: <minecraft:diamond_ore>,
            crushing: <mekanism:otherdust> * 2,
            crushingByprod1: <thermalfoundation:material:768>,
            crushingByprod2: <actuallyadditions:item_dust:2>,

            drilling: <actuallyadditions:item_dust:2> * 3
        },
        nether: {
            item: <netherendingores:ore_nether_vanilla:1>,
            crushing: <mekanism:otherdust> * 4,
            crushingByprod1: <thermalfoundation:material:768>,
            crushingByprod2: <actuallyadditions:item_dust:2> * 2,

            drilling: <actuallyadditions:item_dust:2> * 5,
            denorm: <minecraft:diamond_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_vanilla:1>,
            crushing: <mekanism:otherdust> * 5,
            crushingByprod1: <thermalfoundation:material:768> * 3,
            crushingByprod2: <contenttweaker:biotite_dust> * 2,

            drilling: <actuallyadditions:item_dust:2> * 7,
            denorm: <minecraft:diamond_ore> * 3
        },

        atum: {
            item: <atum:diamond_ore>,
            crushing: <mekanism:otherdust> * 3,
            crushingByprod1: <atum:dusty_bone>,
            crushingByprod2: <thermalfoundation:material:892> * 2,

            drilling: <actuallyadditions:item_dust:2> * 4,
            denorm: <minecraft:diamond_ore>
        },
        erebus: {
            item: <erebus:ore_diamond>,
            crushing: <mekanism:otherdust> * 3,
            crushingByprod1: <thermalfoundation:material:768>,
            crushingByprod2: <thermalfoundation:material:892> * 2,

            drilling: <actuallyadditions:item_dust:2> * 4,
            denorm: <minecraft:diamond_ore>
        },
        volcanic: {
            item: <erebus:ore_encrusted_diamond>,
            crushing: <mekanism:otherdust> * 3,
            crushingByprod1: <mekores:mekanismore:23>,
            crushingByprod2: <actuallyadditions:item_dust:2> * 2,

            drilling: <actuallyadditions:item_dust:2> * 5,
            denorm: <minecraft:diamond_ore> * 2
        },

        dense: {
            item: <densemetals:dense_diamond_ore>,
            crushing: <minecraft:diamond_ore> * 3,
            crushingByprod1: <actuallyadditions:item_dust:2> * 5,
            crushingByprod2: <contenttweaker:aquamarine_dust>,

            making: <minecraft:diamond_ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_diamond_ore>,
            crushing: <netherendingores:ore_nether_vanilla:1> * 3,
            crushingByprod1: <actuallyadditions:item_dust:2> * 7,
            crushingByprod2: <contenttweaker:aquamarine_dust> * 3,

            making: <netherendingores:ore_nether_vanilla:1> * 4
        },

        dirtydust: {
            item: <actuallyadditions:item_dust:2>,
            cleaning: <mekanism:otherdust>
        }
    },
    emerald: {
        overworld: {
            item: <minecraft:emerald_ore>,
            crushing_no_balls: <prodigytech:emerald_dust> * 2,
            balling: <prodigytech:emerald_dust> * 2,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <contenttweaker:chrome_dust>,

            drilling: <actuallyadditions:item_dust:3> * 4
        },
        nether: {
            item: <netherendingores:ore_nether_vanilla:2>,
            crushing_no_balls: <prodigytech:emerald_dust> * 4,
            balling: <prodigytech:emerald_dust> * 4,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <contenttweaker:chrome_dust> * 2,

            drilling: <actuallyadditions:item_dust:3> * 6,
            denorm: <minecraft:emerald_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_vanilla:2>,
            crushing_no_balls: <prodigytech:emerald_dust> * 5,
            balling: <prodigytech:emerald_dust> * 5,
            crushingByprod1: <appliedenergistics2:material:5> * 3,
            crushingByprod2: <contenttweaker:chrome_dust>,

            drilling: <actuallyadditions:item_dust:3> * 8,
            denorm: <minecraft:emerald_ore> * 3
        },

        erebus: {
            item: <erebus:ore_emerald>,
            crushing_no_balls: <prodigytech:emerald_dust> * 3,
            balling: <prodigytech:emerald_dust> * 3,
            crushingByprod1: <contenttweaker:jade_dust>,
            crushingByprod2: <contenttweaker:chrome_dust> * 2,

            drilling: <actuallyadditions:item_dust:3> * 5,
            denorm: <minecraft:emerald_ore> * 2
        },
        atum: {
            item: <atum:emerald_ore>,
            crushing_no_balls: <prodigytech:emerald_dust> * 3,
            crushingByprod1: <contenttweaker:relic_nugget>,
            crushingByprod2: <contenttweaker:chrome_dust>,

            drilling: <actuallyadditions:item_dust:3> * 5,
            denorm: <minecraft:emerald_ore> * 2
        },

        dense: {
            item: <densemetals:dense_emerald_ore>,
            crushing: <minecraft:emerald_ore> * 3,
            crushingByprod1: <contenttweaker:chrome_dust> * 4,
            making: <minecraft:emerald_ore> * 4
        },
        dense_nether: {
            item: <densemetals:dense_nether_emerald_ore>,
            crushing: <netherendingores:ore_nether_vanilla:2> * 3,
            crushingByprod1: <contenttweaker:chrome_dust> * 6,
            making: <netherendingores:ore_nether_vanilla:2> * 4
        }
    },
    certus: {
        overworld: {
            item: <appliedenergistics2:quartz_ore>,
            crushing_no_balls: <appliedenergistics2:material> * 2,
            balling: <appliedenergistics2:material> * 2,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:7>,

            drilling: <appliedenergistics2:material> * 3
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:9>,
            crushing_no_balls: <appliedenergistics2:material> * 4,
            balling: <appliedenergistics2:material> * 4,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:7>,

            drilling: <appliedenergistics2:material> * 5,
            denorm: <appliedenergistics2:quartz_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:9>,
            crushing_no_balls: <appliedenergistics2:material> * 5,
            balling: <appliedenergistics2:material> * 5,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:7>,

            drilling: <appliedenergistics2:material> * 6,
            denorm: <appliedenergistics2:quartz_ore> * 3
        }
    },
    charged_certus: {
        overworld: {
            item: <appliedenergistics2:charged_quartz_ore>,
            crushing: <appliedenergistics2:material:1> * 2,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:7>,

            drilling: <appliedenergistics2:material:1> * 3
        },
        nether: {
            item: <netherendingores:ore_nether_modded_1:10>,
            crushing: <appliedenergistics2:material:1> * 4,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:7>,

            drilling: <appliedenergistics2:material:1> * 5,
            denorm: <appliedenergistics2:quartz_ore> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_1:10>,
            crushing: <appliedenergistics2:material:1> * 5,
            crushingByprod1: <appliedenergistics2:material:2>,
            crushingByprod2: <actuallyadditions:item_dust:7>,

            drilling: <appliedenergistics2:material:1> * 6,
            denorm: <appliedenergistics2:quartz_ore> * 3
        }
    },
    black_quartz: {
        overworld: {
            item: <actuallyadditions:block_misc:3>,
            crushing_no_balls: <actuallyadditions:item_dust:7> * 2,
            balling: <actuallyadditions:item_dust:7> * 2,
            crushingByprod1: <appliedenergistics2:material:3>,
            crushingByprod2: <appliedenergistics2:material:2>,

            drilling: <actuallyadditions:item_dust:7> * 4,

            denorm: <mysticalworld:quartz_ore> * 2
        },
        dust: {
            item: <actuallyadditions:item_dust:7>,
            cleaning: <actuallyadditions:item_misc:5>
        }
    },
    biotite: {
        end: {
            item: <quark:biotite_ore>,
            crushing_no_balls: <contenttweaker:biotite_dust> * 3,
            balling: <contenttweaker:biotite_dust> * 3,
            crushingByprod1: <minecraft:ender_pearl>,
            crushingByprod2: <contenttweaker:biotite_dirty_dust>,

            drilling: <contenttweaker:biotite_dirty_dust> * 4
        },
        dirtydust: {
            item: <contenttweaker:biotite_dirty_dust>,
            separating1: <contenttweaker:biotite_dust>,
            separating2: <contenttweaker:biotite_dust>,
            separating3: <contenttweaker:ender_bacteria>,
            separating4: <contenttweaker:soot>
        },
        dust: {
            item: <contenttweaker:biotite_dust>,
            furnace: <quark:biotite>
        }
    },
    aquamarine: {
        overworld: {
            item: <astralsorcery:blockcustomsandore>,
            crushing: <contenttweaker:aquamarine_dust> * 4,
            crushingByprod1: <contenttweaker:aquamarine_dust>,
            crushingByprod2: <biomesoplenty:gem:6>,

            drilling: <contenttweaker:aquamarine_dirty_dust> * 6,
            cleaning: <astralsorcery:itemcraftingcomponent> * 6
        },
        dirtydust: {
            item: <contenttweaker:aquamarine_dirty_dust>,
            cleaning: <contenttweaker:aquamarine_dust>
        }
    },
    moissanite: {
        ore: {
            item: <contenttweaker:moissanite_ore>,
            crushing_no_balls: <contenttweaker:moissanite> * 2,
            balling: <contenttweaker:moissanite_dirty> * 2,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <contenttweaker:moissanite>,

            drilling: <contenttweaker:moissanite_dirty> * 4,
        },
        dirty: {
            item: <contenttweaker:moissanite_dirty>,
            cleaning: <contenttweaker:moissanite>
        }
    },

    prosperity: {
        overworld: {
            item: <mysticalagriculture:prosperity_ore>,
            crushing_no_balls: <mysticalagriculture:crafting:5> * 4,
            balling: <mysticalagriculture:crafting:5> * 4,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <mysticalagriculture:crafting:5> * 4,

            drilling: <mysticalagriculture:crafting:5> * 7
        },
        nether: {
            item: <mysticalagriculture:nether_prosperity_ore>,
            crushing_no_balls: <mysticalagriculture:crafting:5> * 5,
            balling: <mysticalagriculture:crafting:5> * 5,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <mysticalagriculture:crafting:5> * 4,

            drilling: <mysticalagriculture:crafting:5> * 9,
            denorm: <mysticalagriculture:prosperity_ore> * 2
        },
        end: {
            item: <mysticalagriculture:end_prosperity_ore>,
            crushing_no_balls: <mysticalagriculture:crafting:5> * 6,
            balling: <mysticalagriculture:crafting:5> * 6,
            crushingByprod1: <thermalfoundation:material:68>,
            crushingByprod2: <mysticalagriculture:crafting:5> * 4,

            drilling: <mysticalagriculture:crafting:5> * 10,
            denorm: <mysticalagriculture:prosperity_ore> * 3
        }
    },
    inferium: {
        overworld: {
            item: <mysticalagriculture:inferium_ore>,
            crushing_no_balls: <mysticalagriculture:crafting> * 4,
            balling: <mysticalagriculture:crafting> * 4,
            crushingByprod1: <mysticalagriculture:crafting>,
            crushingByprod2: <mysticalagriculture:crafting:1>,

            drilling: <mysticalagriculture:crafting> * 7
        },
        nether: {
            item: <mysticalagriculture:nether_inferium_ore>,
            crushing_no_balls: <mysticalagriculture:crafting> * 5,
            balling: <mysticalagriculture:crafting> * 5,
            crushingByprod1: <mysticalagriculture:crafting>,
            crushingByprod2: <mysticalagriculture:crafting:2>,

            drilling: <mysticalagriculture:crafting> * 9,
            denorm: <mysticalagriculture:inferium_ore> * 2
        },
        end: {
            item: <mysticalagriculture:end_inferium_ore>,
            crushing_no_balls: <mysticalagriculture:crafting> * 6,
            balling: <mysticalagriculture:crafting> * 6,
            crushingByprod1: <mysticalagriculture:crafting>,
            crushingByprod2: <mysticalagriculture:crafting:2>,

            drilling: <mysticalagriculture:crafting> * 10,
            denorm: <mysticalagriculture:inferium_ore> * 3
        }
    },

    flolit: {
        erebus: {
            item: <contenttweaker:flolit_ore>,

            crushing: <contenttweaker:flolit> * 4,
            crushingByprod1: <thermalfoundation:material:67>,
            crushingByprod2: <contenttweaker:flolit> * 2,
            cleaning: <contenttweaker:flolit> * 6,

            drilling: <contenttweaker:flolit> * 8
        }
    },
    fossil: {
        erebus: {
            item: <erebus:ore_fossil>,

            crushing: <erebus:materials:2> * 4,
            crushingByprod1: <minecraft:dye:15> * 3,
            crushingByprod2: <xreliquary:mob_ingredient>,

            drilling: <erebus:materials:2> * 10
        }
    },
    temple: {
        erebus: {
            item: <erebus:ore_temple>,
            furnace: <erebus:materials:74>,
            crushing_no_balls: <erebus:materials:74> * 2,
            balling: <erebus:materials:74> * 2,
            crushingByprod1: <erebus:materials:47>,

            alloySlag2: <erebus:materials:74> * 2,
            alloySlag3: <erebus:materials:74> * 3,

            drilling: <erebus:materials:74> * 3
        }
    },
    gneiss: {
        erebus: {
            item: <erebus:ore_gneiss>,
            crushing_no_balls: <erebus:materials:47> * 2,
            balling: <erebus:materials:47> * 2,
            crushingByprod1: <erebus:materials:74>,

            alloySlag2: <erebus:materials:47> * 2,
            alloySlag3: <erebus:materials:47> * 3,

            drilling: <erebus:materials:47> * 3
        }
    },
    rawmalachite: {
        ore: {
            item: <erebus:ore_copper>,

            crushing_no_balls: <contenttweaker:malachite_ore_dust> * 2,
            balling: <contenttweaker:malachite_ore_dust> * 2,
            crushingByprod1: <thermalfoundation:material:64>,
            crushingByprod2: <mekanism:dirtydust:3>,

            drilling: <contenttweaker:malachite_ore_dust> * 4
        },
        dirtydust: {
            item: <contenttweaker:malachite_ore_dust>,

            wash: <contenttweaker:malachite_dust>,
            making: <contenttweaker:malachite_crystal_seed>,
            cleaning: <contenttweaker:malachite_dust>,
        }
    },
    jade: {
        erebus: {
            item: <erebus:ore_jade>,
            crushing_no_balls: <contenttweaker:jade_dust> * 3,
            balling: <contenttweaker:jade_dust> * 3,
            crushingByprod1: <contenttweaker:malachite_polycrystal>,
            crushingByprod2: <contenttweaker:jade_dust>,

            drilling: <erebus:materials:1> * 6,
            cleaning: <erebus:materials:1> * 8
        },
        erebus2: {
            item: <erebus:ore_jade> * 2,

            denorm: <erebus:ore_emerald>
        }
    },
    petrified_wood: {
        erebus: {
            item: <erebus:ore_petrified_wood>,
            alloySlag2: <erebus:materials:7> * 2,
            alloySlag3: <erebus:materials:7> * 3
        }
    },
    relic: {
        atum: {
            item: <atum:relic_ore>,
            furnace: <contenttweaker:relic_ingot>,

            drilling: <contenttweaker:relic_ingot> * 3
        }
    },
    bone: {
        atum: {
            item: <atum:bone_ore>,
            furnace: <atum:dusty_bone>,
            crushing: <atum:dusty_bone> * 2,
            crushingByprod1: <minecraft:dye:15> * 3,
            crushingByprod2: <contenttweaker:ancient_dust>
        }
    },
    khnumite: {
        raw: {
            item: <atum:khnumite_raw>,
            crushing: <atum:khnumite> * 2,
            crushingByprod1: <appliedenergistics2:material:5>,
            crushingByprod2: <atum:khnumite> * 2,

            drilling: <atum:khnumite> * 4
        }
    },
    oil: {
        sand: {
            item: <thermalfoundation:ore_fluid>,
            crushing: <thermalfoundation:material:892> * 3,
            crushingByprod1: <thermalfoundation:material:833>,
            crushingByprod2: <thermalfoundation:material:892> * 2,

            drilling: <thermalfoundation:material:892> * 4,
            cleaning: <thermalfoundation:material:892> * 4
        },
        redsand: {
            item: <thermalfoundation:ore_fluid:5>,
            crushing: <thermalfoundation:material:892> * 3,
            crushingByprod1: <thermalfoundation:material:833>,
            crushingByprod2: <thermalfoundation:material:892> * 2,

            drilling: <thermalfoundation:material:892> * 4,
            cleaning: <thermalfoundation:material:892> * 4
        },
        gravel: {
            item: <thermalfoundation:ore_fluid:1>,
            crushing: <thermalfoundation:material:892> * 4,
            crushingByprod1: <thermalfoundation:material:833>,
            crushingByprod2: <thermalfoundation:material:892> * 2,

            drilling: <thermalfoundation:material:892> * 4,
            cleaning: <thermalfoundation:material:892> * 4
        }
    },
    icestone: {
        overworld: {
            item: <netherendingores:ore_other_1:10>,
            crushing_no_balls: <contenttweaker:ice_dust> * 2,
            balling: <contenttweaker:ice_dust> * 2,
            crushingByprod1: <contenttweaker:ice_dust>,
            crushingByprod2: <contenttweaker:ice_shard>
        },
        nether: {
            item: <netherendingores:ore_nether_modded_2:9>,
            crushing_no_balls: <contenttweaker:ice_dust> * 4,
            balling: <contenttweaker:ice_dust> * 4,
            crushingByprod1: <contenttweaker:ice_dust>,
            crushingByprod2: <contenttweaker:ice_shard>,

            denorm: <netherendingores:ore_other_1:10> * 2
        },
        end: {
            item: <netherendingores:ore_end_modded_2:9>,
            crushing_no_balls: <contenttweaker:ice_dust> * 5,
            balling: <contenttweaker:ice_dust> * 5,
            crushingByprod1: <contenttweaker:ice_dust>,
            crushingByprod2: <contenttweaker:ice_shard>,

            denorm: <netherendingores:ore_other_1:10> * 3
        }
    },
    steeleaf: {
        ore: {
            item: <contenttweaker:stoneleaf_ore>,
            crushing_no_balls: <contenttweaker:stoneleaf> * 2,
            balling: <contenttweaker:stoneleaf> * 2,
            crushingByprod1: <thermalfoundation:material:71>,
            crushingByprod2: <thermalfoundation:material:72>,

            cleaning: <contenttweaker:stoneleaf> * 4,
            drilling: <contenttweaker:stoneleaf> * 5,

            denorm: <exnihilocreatio:item_ore_iridium:1>
        },
        dense: {
            item: <contenttweaker:stoneleaf_dense_ore>,
            crushing: <contenttweaker:stoneleaf_ore> * 3,
            crushingByprod1: <thermalfoundation:material:71>,
            crushingByprod2: <thermalfoundation:material:72>,

            making: <contenttweaker:stoneleaf_ore> * 4
        }
    },
    life_essence: {
        overworld: {
            item: <contenttweaker:life_essence_ore>,
            crushing: <contenttweaker:blood_shard2> * 2,
            crushingByprod1: <contenttweaker:blood_shard1>,
            crushingByprod2: <contenttweaker:blood_shard2>,

            drilling: <contenttweaker:blood_shard2> * 3
        }
    },
    terrasteel: {
        overworld: {
            item: <contenttweaker:terrasteel_ore>,
            balling: <contenttweaker:terra_base_dust> * 2,
            crushingByprod1: <contenttweaker:terra_base_dust>,
            crushingByprod2: <contenttweaker:terra_base_dust>,

            drilling: <contenttweaker:terra_base_dust> * 3
        }
    },

    caelumite: {
        ore: {
            item: <contenttweaker:caelumite_ore>,
            furnace: <contenttweaker:caelumite_ingot>,
            crushing_no_balls: <contenttweaker:caelumite_dust> * 2,
            balling: <contenttweaker:caelumite_dust> * 2,
            crushingByprod1: <minecraft:glowstone_dust> * 4,
            crushingByprod2: <projectred-core:resource_item:105> * 8,

            alloySlag2: <contenttweaker:caelumite_ingot> * 2,
            alloySlag3: <contenttweaker:caelumite_ingot> * 3,

            drilling: <contenttweaker:caelumite_dust> * 3
        }
    }
};
val to_clean as IItemStack[][string] = {
    frn: [
        <erebus:materials:42>,
        <bigreactors:ingotyellorium>,
        <astralsorcery:itemcraftingcomponent:1>,

        <moretcon:ingothallowsite>,
        <minecraft:emerald>
    ],

    TE_pulv: [
        <quark:biotite_ore>
    ],
    TE_furn: [
        
    ],
    TE_is_sand: [
        <contenttweaker:titanium_dust>,
        <thermalfoundation:material:72>,
        <draconicevolution:draconium_dust>,
        <contenttweaker:neodymium_dust>,
        <contenttweaker:zirconium_dust>,

        <moretcon:dusthallowsite>
    ],
    TE_is_richslag: [
        
    ],
    MEK_enrich: [
        <netherendingores:ore_other_1>
    ],

    EIO_sag: [
        <minecraft:clay>,
        <ore:sand>.firstItem,

        <mysticalagriculture:prosperity_ore>,
        <mysticalagriculture:nether_prosperity_ore>,
        <mysticalagriculture:end_prosperity_ore>,

        <mysticalagriculture:inferium_ore>,
        <mysticalagriculture:nether_inferium_ore>,
        <mysticalagriculture:end_inferium_ore>,

        <thermalfoundation:ore_fluid>,
        <thermalfoundation:ore_fluid:5>,
        <appliedenergistics2:quartz_ore>,
        <quark:biotite_ore>,

        <draconicevolution:draconium_ore>,
        <draconicevolution:draconium_ore:1>,
        <draconicevolution:draconium_ore:2>
    ]
    
};

val chances as int[string][string][string] = {
    iron: {
        atum: {
            crushingByprod1: 50
        }
    },

    cobalt: {
        nether: {
            crushingByprod1: 30
        }
    },
    ardite: {
        nether: {
            crushingByprod1: 30
        }
    },

    gold: {
        atum: {
            crushingByprod1: 50
        }
    },
    lead: {

        galena: {
            separating2: 50
        }
    },

    iridium: {
        chunk: {
            crushingByprod2: 1
        }
    },

    arkenium: {
        overworld: {
            crushingByprod2: 5
        },
        nether: {
            crushingByprod2: 7
        },
        end: {
            crushingByprod2: 9
        },
    },

    redstone: {
        overworld: {
            crushingByprod2: 1
        },
        atum: {
            crushingByprod1: 50
        }
    },

    lapis: {
        erebus: {
            crushingByprod1: 5
        },
        atum: {
            crushingByprod1: 50
        },
        dense_nether: {
            crushingByprod1: 15
        }
    },
    emerald: {
        atum: {
            crushingByprod1: 50
        }
    },

    khnumite: {
        raw: {
            crushingByprod1: 40
        }
    }
};
val drilling_fluid_amount as int[string] = {
    iron: 30,
    copper: 25,
    tin: 25,

    nickel: 30,
    aluminum: 30,
    zinc: 30,

    cobalt: 50,
    ardite: 45,

    gold: 50,
    silver: 50,
    lead: 45,
    osmium: 45,

    cincinnasite: 50,
    dilitheum: 100,

    platinum: 180,
    iridium: 220,
    titanium: 300,
    tungsten: 275,
    uranium: 250,
    yellorium: 250,

    cursed_gold: 150,

    mithril: 300,
    chrome: 320,
    gallium: 350,
    neodymium: 500,
    vibranium: 450,
    arkenium: 400,
    draconium: 650,
    palladium: 500,
    orichalcum: 700,
    nickel_oxide: 500,

    starmetal: 1500,
    zirconium: 1200,
    spaceice: 1000,
    death_metal: 1500,

    ruby: 300,
    topaz: 300,
    amber: 300,
    malachite: 300,
    peridot: 300,
    sapphire: 300,
    tanzanite: 300,

    amethyst: 400,
    graphite: 400,

    clathrate_redstone: 350,
    clathrate_glowstone: 400,
    clathrate_ender: 450,

    ambrosium: 150,
    zanite: 175,
    gravitite: 250,

    benitoite: 500,
    anglesite: 750,

    eezo: 250,
    karmesine: 120,
    ovium: 120,
    jauxum: 120,
    tiberium: 200,

    osram: 320,
    abyssum: 500,
    prometheum: 360,
    uru: 600,

    meteorite: 125,

    electarite: 240,


    coal: 25,
    redstone: 45,
    electrotine: 50,
    quartz: 40,
    lapis: 35,
    diamond: 150,
    emerald: 150,
    certus: 70,
    charged_certus: 80,
    black_quartz: 200,
    biotite: 800,
    aquamarine: 1000,
    moissanite: 500,

    prosperity: 100,
    inferium: 100,

    flolit: 125,
    fossil: 100,
    temple: 80,
    gneiss: 80,
    rawmalachite: 100,
    jade: 100,
    petrified_wood: 75,
    relic: 75,
    bone: 100,
    khnumite: 65,
    oil: 135,
    icestone: 175,
    steeleaf: 150,
    life_essence: 1000,
    terrasteel: 10000,
    caelumite: 500,
};

///////////////////////////////////////////////////////////////////////////////cleaning
print("[IA] ------------------------------- Ore Cleaing! -------------------------------");

PTgrinder.removeAll();

for oredic in <ore:ore*>{
    oredic.removeItems(oredic.items);
    oredic.add(<contenttweaker:dummy>);
}
for oredic in [
    <ore:oreElectrotine>,
    <ore:oreIGraphite>,

    <ore:oreKarmesine>,
    <ore:oreOvium>,
    <ore:oreJauxum>,
    <ore:oreEezo>,
    <ore:oreVibranium>,
    <ore:oreDuranite>,

    <ore:oreTiberium>,
    <ore:oreOsram>,
    <ore:orePrometheum>,
    <ore:oreValyrium>,

    <ore:oreAbyssum>,
    <ore:oreAurorium>,
    <ore:orePalladium>,
    <ore:oreUru>,

    <ore:oreLifeEssence>,
    <ore:oreEnethyst>,
    <ore:oreMoissanite>,
    <ore:oreStoneleaf>,
    <ore:oreSpaceice>,
    <ore:oreCaelumite>,
    //todo
    //oreEMC
    //oreInfinity?

    <ore:oreBauxite>,
    <ore:oreFlolit>,
    <ore:oreChrome>,
    <ore:oreNeodymium>,
    <ore:oreArkenium>,
    <ore:oreGallium>,
    <ore:oreOrichalcum>,
    <ore:oreZirconium>,
    <ore:oreDeathMetal>
] as IOreDictEntry[]{
    //oredic.removeItems(oredic.items);
    oredic.add(<contenttweaker:dummy>);
}


print("[IA] ------------------------------- Ore Cleaning! -------------------------------");

//furnace.remove(<contenttweaker:dummy>);
//recipes.remove(<contenttweaker:dummy>);

//for i in 0 to 28
    //mods.bloodmagic.AlchemyTable.removeRecipe([<bloodmagic:cutting_fluid>, <contenttweaker:dummy>]);

//for i in 0 to 30
//mods.immersiveengineering.ArcFurnace.removeRecipe(<netherendingores:ore_nether_modded_2:4>);
{
    for item in to_clean.frn{
        furnace.remove(item);
    }
    for item in to_clean.TE_pulv{
        mods.thermalexpansion.Pulverizer.removeRecipe(item);
    }
    for item in to_clean.TE_furn{
        mods.thermalexpansion.RedstoneFurnace.removeRecipe(item);
    }
    for item in to_clean.TE_is_sand{
        InductionSmelter.removeRecipe(item, <ore:sand>.firstItem);
    }
    for item in to_clean.TE_is_richslag{
        InductionSmelter.removeRecipe(item, <thermalfoundation:material:865>);
    }
    for item in to_clean.MEK_enrich{
        mods.mekanism.enrichment.removeRecipe(item);
    }
    for item in to_clean.EIO_sag{
        SagMill.removeRecipe(item);
    }
    
}

print("[IA] ------------------------------- Ore Adding! -------------------------------");
for material in ores {
    print("[IA] adding " + material + " ore");
    for ore_type in ores[material] {
        //crushing
        if (ores[material][ore_type] has "crushing"){
            

            if (ores[material][ore_type] has "crushingByprod1"){
                var crushByprod1 as int = 10;
                if (chances has material)
                    if (chances[material] has ore_type)
                        if (chances[material][ore_type] has "crushingByprod1")
                            crushByprod1 = chances[material][ore_type].crushingByprod1 as int;

                if (ores[material][ore_type] has "crushingByprod2"){
                    var crushByprod2 as int = 3;
                    if (chances has material)
                        if (chances[material] has ore_type)
                            if (chances[material][ore_type] has "crushingByprod2")
                                crushByprod2 = chances[material][ore_type].crushingByprod2 as int;

                    addCrushing12(
                        ores[material][ore_type].item, ores[material][ore_type].crushing, 
                        ores[material][ore_type].crushingByprod1, crushByprod1, 
                        ores[material][ore_type].crushingByprod2, crushByprod2
                    );
                } else{
                    addCrushing1(
                        ores[material][ore_type].item, ores[material][ore_type].crushing, 
                        ores[material][ore_type].crushingByprod1, crushByprod1
                    );
                }
            }else{
                //no byprod
                scripts.helper.addSimpleCrushingRecipe(ores[material][ore_type].item, ores[material][ore_type].crushing);
            }

        }

        //crushing_no_balls
        if (ores[material][ore_type] has "crushing_no_balls"){
            

            if (ores[material][ore_type] has "crushingByprod1"){
                var crushByprod1 as int = 10;
                if (chances has material)
                    if (chances[material] has ore_type)
                        if (chances[material][ore_type] has "crushingByprod1")
                            crushByprod1 = chances[material][ore_type].crushingByprod1 as int;

                addCrushingRecipe_no_eio(
                    ores[material][ore_type].item, ores[material][ore_type].crushing_no_balls, 
                    ores[material][ore_type].crushingByprod1, crushByprod1
                );
                
            }else{
                //no byprod
                scripts.helper.addSimpleCrushingRecipe(ores[material][ore_type].item, ores[material][ore_type].crushing);
            }

        }

        //balling
        if (ores[material][ore_type] has "balling"){
            if (ores[material][ore_type] has "crushingByprod1"){
                var crushByprod1 as int = 10;
                if (chances has material)
                    if (chances[material] has ore_type)
                        if (chances[material][ore_type] has "crushingByprod1")
                            crushByprod1 = chances[material][ore_type].crushingByprod1 as int;

                if (ores[material][ore_type] has "crushingByprod2"){
                    var crushByprod2 as int = 4;
                    if (chances has material)
                        if (chances[material] has ore_type)
                            if (chances[material][ore_type] has "crushingByprod2")
                                crushByprod2 = chances[material][ore_type].crushingByprod2 as int;

                    addClumpCrushing(
                        ores[material][ore_type].item, ores[material][ore_type].balling, 
                        ores[material][ore_type].crushingByprod1, crushByprod1, 
                        ores[material][ore_type].crushingByprod2, crushByprod2,
                        drilling_fluid_amount[material]
                    );
                } else{
                    addClumpCrushing(
                        ores[material][ore_type].item, ores[material][ore_type].balling, 
                        ores[material][ore_type].crushingByprod1, crushByprod1,
                        null, 0, drilling_fluid_amount[material]
                    );
                }
            }

        }
        

        //furnace
        if (ores[material][ore_type] has "furnace"){
            furnace.addRecipe(ores[material][ore_type].furnace, ores[material][ore_type].item);
        }
        //smelter
        if (ores[material][ore_type] has "alloySlag2"){
            InductionSmelter.addRecipe(
                ores[material][ore_type].alloySlag2, 
                ores[material][ore_type].item, <thermalfoundation:material:865>, 
                2000 + 75 * drilling_fluid_amount[material], 
                <thermalfoundation:material:864>, 75);
        }
        if (ores[material][ore_type] has "alloySlag3"){
            InductionSmelter.addRecipe(
                ores[material][ore_type].alloySlag3, 
                ores[material][ore_type].item, <thermalfoundation:material:866>, 
                2000 + 45 * drilling_fluid_amount[material], 
                <thermalfoundation:material:865>, 75);
        }

        //washing
        if (ores[material][ore_type] has "wash"){
            Transposer.addFillRecipe(
                ores[material][ore_type].wash, 
                ores[material][ore_type].item, 
                <liquid:water> * 250, 1000 + 20 * drilling_fluid_amount[material]);
        }

        //drilling
        if (ores[material][ore_type] has "drilling"){
            Transposer.addFillRecipe(
                ores[material][ore_type].drilling, 
                ores[material][ore_type].item, 
                <liquid:ore_drill> * drilling_fluid_amount[material], 2000 + 50 * drilling_fluid_amount[material]);
        }
        //making
        if (ores[material][ore_type] has "making"){
            Transposer.addFillRecipe(
                ores[material][ore_type].making, 
                ores[material][ore_type].item, 
                <liquid:ore_make> * drilling_fluid_amount[material], 2000 + 40 * drilling_fluid_amount[material]
            );
        }
        if (ores[material][ore_type] has "madeFrom"){
            Transposer.addFillRecipe(
                ores[material][ore_type].item,
                ores[material][ore_type].madeFrom,  
                <liquid:ore_make> * drilling_fluid_amount[material], 2000 + 40 * drilling_fluid_amount[material]
            );
        }
        if (ores[material][ore_type] has "made2x2"){
            recipes.addShaped("op_" ~ material ~ ore_type ~ "_2x2_craft", ores[material][ore_type].item, [
                [ores[material][ore_type].made2x2, ores[material][ore_type].made2x2],
                [ores[material][ore_type].made2x2, ores[material][ore_type].made2x2]
            ]);
        }
        if (ores[material][ore_type] has "madeWeak"){
            recipes.addShaped("op_" ~ material ~ ore_type ~ "_Weak_craft", ores[material][ore_type].item, [
                [ores[material][ore_type].madeWeak, ores[material][ore_type].madeWeak],
                [ores[material][ore_type].madeWeak, <contenttweaker:weak_enhancer>]
            ]);
        }
        if (ores[material][ore_type] has "madeCreosolon"){
            recipes.addShaped("op_" ~ material ~ ore_type ~ "_Creosolon_craft", ores[material][ore_type].item, [
                [ores[material][ore_type].madeCreosolon, ores[material][ore_type].madeCreosolon],
                [ores[material][ore_type].madeCreosolon, <contenttweaker:creosolon>]
            ]);
        }

        //cleaning
        if (ores[material][ore_type] has "cleaning"){
            enrichment.addRecipe(ores[material][ore_type].item, ores[material][ore_type].cleaning);
        }


        //separating
        if (ores[material][ore_type] has "separating1"){
            var outputs as WeightedItemStack[] = [];
            var sep1 as int = 75;
            if (chances has material)
                if (chances[material] has ore_type)
                    if (chances[material][ore_type] has "separating1")
                        sep1 = chances[material][ore_type].separating1 as int;
                
            outputs += ores[material][ore_type].separating1 % sep1;
            
            if (ores[material][ore_type] has "separating2"){
                var sep2 as int = 15;
                if (chances has material)
                    if (chances[material] has ore_type)
                        if (chances[material][ore_type] has "separating2")
                            sep2 = chances[material][ore_type].separating2 as int;
                
                outputs += ores[material][ore_type].separating2 % sep2;
            }
            if (ores[material][ore_type] has "separating3"){
                var sep3 as int = 3;
                if (chances has material)
                    if (chances[material] has ore_type)
                        if (chances[material][ore_type] has "separating3")
                            sep3 = chances[material][ore_type].separating3 as int;
                    
                outputs += ores[material][ore_type].separating3 % sep3;
            }
            if (ores[material][ore_type] has "separating4"){
                var sep4 as int = 10;
                if (chances has material)
                    if (chances[material] has ore_type)
                        if (chances[material][ore_type] has "separating4")
                            sep4 = chances[material][ore_type].separating4 as int;
                        
                outputs += ores[material][ore_type].separating4 % sep4;
            }

            Centrifuge.addRecipe(outputs, ores[material][ore_type].item, <liquid:ore_waste> * drilling_fluid_amount[material], 2000 + 50 * drilling_fluid_amount[material]);

            
            mods.tconstruct.Casting.addBasinRecipe(
                ores[material][ore_type].separating1, 
                ores[material][ore_type].item,
                <liquid:water>, 1000,
                true
            );
        }

        //seeds
        if (ores[material][ore_type] has "seeds"){

            mods.enderio.AlloySmelter.addRecipe(ores[material][ore_type].seeds, 
                [
                    ores[material][ore_type].item,
                    <exnihilocreatio:item_material:3>,
                    <harvestcraft:beeswaxitem>
                ]
            );
            InductionSmelter.addRecipe(
                ores[material][ore_type].potato, 
                ores[material][ore_type].seeds, <thermalfoundation:fertilizer:2> * 3, 2000 + 50 * drilling_fluid_amount[material], 
                ores[material][ore_type].potato, 50
            );
            mods.thermalexpansion.Insolator.addRecipe(
                ores[material][ore_type].potato * 2, 
                ores[material][ore_type].seeds, <thermalfoundation:fertilizer:2> * 3, 10000 + 200 * drilling_fluid_amount[material], 
                ores[material][ore_type].potato, 75, 1000
            );
        }

        //denorm
        if (ores[material][ore_type] has "denorm"){
            mods.mekanism.reaction.addRecipe(
                ores[material][ore_type].item, <liquid:denorm> * drilling_fluid_amount[material], <gas:carmin> * 40, 
                ores[material][ore_type].denorm, <gas:waste_gas> * 40, 1000, 20
            );
        }
    }
}




scripts.helper.addFluidMixerRecipe(
    <liquid:ore_drill> * 2000, 
    <liquid:petrotheum> * 500, <liquid:blood> * 100, <contenttweaker:wear_resistant_alloy_dust>, 
    64, 80
);
scripts.helper.addFluidMixerRecipe(
    <liquid:ore_drill> * 2000, 
    <liquid:petrotheum> * 500, <liquid:honey> * 1000, <contenttweaker:wear_resistant_alloy_dust>, 
    64, 80
);

scripts.helper.addFluidMixerRecipe(
    <liquid:ore_make> * 2000, 
    <liquid:aerotheum> * 500, <liquid:sulfuricacid> * 100, <contenttweaker:bioslag>, 
    128, 80
);
scripts.helper.addFluidMixerRecipe(
    <liquid:ore_make> * 2000, 
    <liquid:aerotheum> * 500, <liquid:liquidlithium> * 400, <contenttweaker:bioslag>, 
    128, 80
);

mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:denorm_dust>, 
    [
        <bloodmagic:cutting_fluid:1>,
        <biomesoplenty:shroompowder>,
        <actuallyadditions:item_misc:24>,
        <enderio:item_material:74>,
        <erebus:materials:18>,
        <thermalfoundation:material:1027>
    ], 500, 20, 2
);
mods.thermalexpansion.Imbuer.addRecipe(<liquid:denorm> * 1000, <contenttweaker:denorm_dust>, <liquid:witchwater> * 1000, 4000);


print("[IA] ------------------------------- Ore Adding Uniques! -------------------------------");


////aluminum
//bauxite
//furnace.remove(<ore:ingotAluminum>);

AEgrinder.addRecipe(<contenttweaker:bauxite_dust>, <immersiveengineering:ore:1>, 4, <contenttweaker:bauxite_dust>, 0.75);
mods.thermalexpansion.Transposer.addFillRecipe(
	<thermalfoundation:material:68> * 2, 
	<contenttweaker:bauxite_dust>, <liquid:witchwater> * 100, 
	2000
);


//zinc

/*
<exnihilocreatio:item_ore_zinc:2>.addTooltip("This item is replaced. Put in crafting table to change to correct version.");
recipes.addShapeless("ia_zinc_fix1", <contenttweaker:zinc_dust>, [<exnihilocreatio:item_ore_zinc:2>]);
<exnihilocreatio:item_ore_zinc:3>.addTooltip("This item is replaced. Put in crafting table to change to correct version.");
recipes.addShapeless("ia_zinc_fix2", <contenttweaker:zinc_ingot>, [<exnihilocreatio:item_ore_zinc:3>]);
*/
mods.jei.JEI.addItem(<densemetals:dense_zinc_ore>);

//osmium

mods.jei.JEI.addItem(<densemetals:dense_osmium_ore>);



{//tungsten 
    <ore:ingotTungsten>.remove(<alchemistry:ingot:74>);

    mods.mekanism.chemical.dissolution.addRecipe(<exnihilocreatio:item_ore_tungsten:1>, <gas:tungsten> * 1000);

    
    
}


mods.jei.JEI.addItem(<densemetals:dense_uranium_ore>);
//yellorium

//chrome



//eezo
//mods.tconstruct.Melting.removeRecipe(<liquid:eezo_fluid>, <taiga:eezo_ore>);
//mods.tconstruct.Melting.removeRecipe(<liquid:eezo_fluid>, <taiga:eezo_dust>);
mods.tconstruct.Melting.addRecipe(<liquid:eezo_fluid> * 288, <contenttweaker:eezo_chunk>);

//arkenium


/////////////////////other

//brick dust
//todo move out
addSimpleCrushingRecipe(<minecraft:brick>, <contenttweaker:brick_dust>);
addSimpleCrushingRecipe(<minecraft:brick_block>, <contenttweaker:brick_dust> * 4);
addSimpleCrushingRecipe(<minecraft:hardened_clay>, <contenttweaker:brick_dust> * 4);
mods.roots.Mortar.addRecipe("brickdust", <contenttweaker:brick_dust>, [<minecraft:brick>]);
mods.prodigytech.rotarygrinder.addRecipe(<minecraft:brick>, <contenttweaker:brick_dust>);
mods.prodigytech.rotarygrinder.addRecipe(<minecraft:brick_block>, <contenttweaker:brick_dust> * 4);
mods.prodigytech.rotarygrinder.addRecipe(<minecraft:hardened_clay>, <contenttweaker:brick_dust> * 4);

//knight metal
<ore:oreKnightmetal>.remove(<twilightforest:armor_shard_cluster>);


/////////gems
<ore:gemRuby>.remove(<projectred-core:resource_item:200>);
<ore:gemPeridot>.remove(<projectred-core:resource_item:202>);
<ore:gemSapphire>.remove(<projectred-core:resource_item:201>);

//coal
Transposer.addFillRecipe(
    <minecraft:coal_ore> * 4, 
    <densemetals:dense_coal_ore>, 
    <liquid:ore_make> * 50, 4000
);

{//icestone
    <ore:dustIcestone>.add(<contenttweaker:ice_dust>);

    scripts.helper.addFluidAlloyerRecipe(
        <aether_legacy:icestone> * 2, 
        <contenttweaker:ice_shard>, <quark:biome_cobblestone:1> * 2, 
        <liquid:cryotheum> * 1000, 
        64, 20
    );
}





recipes.addShapeless("ia_ore_refinement1", 
    <contenttweaker:ore_catalyst> * 4, 
    [
        <contenttweaker:research_chemistry1>.reuse(), 
        <taiga:karmesine_dust>, <tconstruct:edible:33>, 
        <appliedenergistics2:material:4>, 
        <appliedenergistics2:material:8>, <harvestcraft:vinegaritem>
    ]
);

{//soot in tingalum oven
    var rec = RecipeBuilder.newBuilder("soot", "tignalum_oven", 20);

    rec.addEnergyPerTickInput(1024);

    rec.addItemOutput(<contenttweaker:soot> * 3);
    rec.addItemOutput(<contenttweaker:soot>);
    rec.setChance(0.5);
    rec.addItemOutput(<contenttweaker:soot>);
    rec.setChance(0.25);

    rec.addItemInput(<thermalfoundation:material:801>);
    
    
    rec.addHotAirInput(250, 250, 1001);

    rec.build();
}