import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;


static loot as IItemStack[][][IItemStack][IItemStack] = {
    <contenttweaker:stone_idol>: {
        <appliedenergistics2:material:45>: [
            [
                <minecraft:dirt>.withDisplayName("Legendary Treasure of Dreadlands")
            ],
            [
                null
            ]
        ]
    },
    <contenttweaker:tincan_mech>: {
        <contenttweaker:tincan_target_ore1>: [
            [
                <densemetals:dense_iron_ore> * 64,
                <densemetals:dense_copper_ore> * 64,
                <densemetals:dense_tin_ore> * 64,

                <densemetals:dense_nickel_ore> * 48,
                <densemetals:dense_aluminum_ore> * 48,
                <densemetals:dense_zinc_ore> * 48,
                <contenttweaker:antimony_ore_dense> * 40,

                <densemetals:dense_gold_ore> * 32,
                <densemetals:dense_silver_ore> * 32,
                <densemetals:dense_lead_ore> * 32,
                <densemetals:dense_osmium_ore> * 32
            ],[
                <densemetals:dense_iron_ore> * 64,
                <densemetals:dense_copper_ore> * 64,
                <densemetals:dense_tin_ore> * 64,

                <densemetals:dense_nickel_ore> * 48,
                <densemetals:dense_aluminum_ore> * 48,
                <densemetals:dense_zinc_ore> * 48,
                <contenttweaker:antimony_ore_dense> * 40,

                <densemetals:dense_gold_ore> * 32,
                <densemetals:dense_silver_ore> * 32,
                <densemetals:dense_lead_ore> * 32,
                <densemetals:dense_osmium_ore> * 32
            ]
        ],
        <contenttweaker:tincan_target_ore2>: [
            [
                <thermalfoundation:ore:6> * 96,
                <thermalfoundation:ore:7> * 96,
                <immersiveengineering:ore:5> * 96,
                <bigreactors:oreyellorite> * 96,
                <contenttweaker:titanium_ore> * 96,
                <contenttweaker:tungsten_ore> * 96,

                <contenttweaker:bismuth_ore> * 64,
                <contenttweaker:gallium_ore> * 64,
                <contenttweaker:barite_ore> * 32,

                <taiga:meteoritecobble_block> * 32
            ],[
                <thermalfoundation:ore:6> * 64,
                <thermalfoundation:ore:7> * 64,
                <immersiveengineering:ore:5> * 64,
                <bigreactors:oreyellorite> * 64,
                <contenttweaker:titanium_ore> * 64,
                <contenttweaker:tungsten_ore> * 64,
                
                <contenttweaker:bismuth_ore> * 32,
                <contenttweaker:gallium_ore> * 32,
                <contenttweaker:barite_ore> * 32,

                <taiga:meteoritecobble_block> * 16
            ]
        ],
        <contenttweaker:tincan_target_gem>: [
            [
                <minecraft:diamond_ore> * 64,
                <minecraft:emerald_ore> * 64,
                <mysticalworld:amethyst_ore> * 32,
                <appliedenergistics2:quartz_ore> * 64,
                <mysticalworld:quartz_ore> * 64,
                <taiga:dilithium_ore> * 64
            ],[
                <minecraft:diamond_ore> * 64,
                <minecraft:emerald_ore> * 64,
                <mysticalworld:amethyst_ore> * 64,
                <appliedenergistics2:quartz_ore> * 64,
                <mysticalworld:quartz_ore> * 64,
                <taiga:dilithium_ore> * 64
            ]
        ],
        <contenttweaker:tincan_target_mob>: [
            [
                <xreliquary:mob_ingredient:6> * 192,
                <xreliquary:mob_ingredient> * 192,
                <xreliquary:mob_ingredient:3> * 192,
                <xreliquary:mob_ingredient:2> * 192,

                null,
                null,
                null,
                null,

                null
            ],[
                <xreliquary:mob_ingredient:6> * 192,
                <xreliquary:mob_ingredient> * 192,
                <xreliquary:mob_ingredient:3> * 192,
                <xreliquary:mob_ingredient:2> * 192,

                <xreliquary:mob_ingredient:1> * 192,
                <xreliquary:mob_ingredient:11> * 192,
                <xreliquary:mob_ingredient:8> * 192,
                <xreliquary:mob_ingredient:4> * 192,

                <quark:diamond_heart> * 4
            ]
        ]
    },
    <contenttweaker:radiotoad_mech>: {
        <contenttweaker:radiotoad_target1>: [
            [
                <densemetals:dense_platinum_ore> * 64,
                <densemetals:dense_iridium_ore> * 64,
                <densemetals:dense_rutile_ore> * 64,
                <densemetals:dense_uranium_ore> * 64,
                <bigreactors:oreyellorite> * (64 * 4),
                <contenttweaker:tungsten_ore> * (64 * 4)
            ], [
                <densemetals:dense_platinum_ore> * 64,
                <densemetals:dense_iridium_ore> * 64,
                <densemetals:dense_rutile_ore> * 64,
                <densemetals:dense_uranium_ore> * 64,
                <bigreactors:oreyellorite> * (64 * 4),
                <contenttweaker:tungsten_ore> * (64 * 4)
            ]
        ],
        <contenttweaker:radiotoad_target2>: [
            [
                <contenttweaker:tantalite_ore> * 128, <moretcon:oreelectarite> * 128, <moretcon:oregarstone> * 128
            ], [
                <contenttweaker:tantalite_ore> * 128, <moretcon:oreelectarite> * 128, <moretcon:oregarstone> * 128
            ]
        ],
        <contenttweaker:radiotoad_target3>: [
            [
                <densemetals:dense_coal_ore> * 64,
                <densemetals:dense_uranium_ore> * 64,
                <bigreactors:oreyellorite> * 128,
                <erebus:ore_copper> * 64
            ], [
                <densemetals:dense_coal_ore> * 64,
                <densemetals:dense_uranium_ore> * 64,
                <bigreactors:oreyellorite> * 64,
                <erebus:ore_copper> * 64
            ]
        ]
    },
    <contenttweaker:nether_boat> * 16: {
        <contenttweaker:nether_boat_osram>: [
            [<betternether:cincinnasite_ore> * 256, <tconstruct:ore> * 256, <tconstruct:ore:1> * 256, <taiga:osram_ore> * 128, <bigreactors:orebenitoite> * 128, <netherite:ancientdebris> * 96, <taiga:tiberium_ore> * 144, <taiga:prometheum_ore> * 64, <taiga:valyrium_ore> * 64, <taiga:basalt_block> * 128, <moretcon:oreigniglomerate> * 8],
            [<betternether:cincinnasite_ore> * 256, <tconstruct:ore> * 256, <tconstruct:ore:1> * 256, <taiga:osram_ore> * 128, <bigreactors:orebenitoite> * 128, <netherite:ancientdebris> * 96, <taiga:tiberium_ore> * 144, <taiga:prometheum_ore> * 64, <taiga:valyrium_ore> * 64, <taiga:basalt_block> * 160, <moretcon:oreigniglomerate> * 8]
        ],
        <contenttweaker:nether_boat_ores>: [
            [
                <netherendingores:ore_nether_vanilla> * 128,
                <netherendingores:ore_nether_vanilla:6> * 128,
                <netherendingores:ore_nether_vanilla:1> * 96,
                <netherendingores:ore_nether_vanilla:3> * 96,
                <netherendingores:ore_nether_modded_2:8> * 16
            ],
            [
                <netherendingores:ore_nether_vanilla> * 256,
                <netherendingores:ore_nether_vanilla:6> * 256,
                <netherendingores:ore_nether_vanilla:1> * 96,
                <netherendingores:ore_nether_vanilla:3> * 96,
                <netherendingores:ore_nether_modded_2:8> * 16
            ]
        ],
        <contenttweaker:nether_boat_quartz>: [
            [<minecraft:quartz_ore> * 320, <netherendingores:ore_nether_modded_1:9> * 144],
            [<minecraft:quartz_ore> * 320, <netherendingores:ore_nether_modded_1:9> * 144]
        ]
    },
    <contenttweaker:robodruid_mech>: {
        <contenttweaker:robodruid_target_gems>: [
            [
                <mysticalworld:amethyst_ore> * 128,
                <densemetals:dense_diamond_ore> * 32,
                <densemetals:dense_emerald_ore> * 32,
                <densemetals:dense_lapis_ore> * 48,

                <biomesoplenty:gem_ore:1> * 128,
                <biomesoplenty:gem_ore:3> * 128,
                <biomesoplenty:gem_ore:7> * 128,
                <biomesoplenty:gem_ore:2> * 128,
                <biomesoplenty:gem_ore:5> * 128,
                <biomesoplenty:gem_ore:6> * 128,
                <biomesoplenty:gem_ore:4> * 128
            ], [
                <mysticalworld:amethyst_ore> * 128,
                <densemetals:dense_diamond_ore> * 32,
                <densemetals:dense_emerald_ore> * 32,
                <densemetals:dense_lapis_ore> * 32,

                <biomesoplenty:gem_ore:1> * 128,
                <biomesoplenty:gem_ore:3> * 128,
                <biomesoplenty:gem_ore:7> * 128,
                <biomesoplenty:gem_ore:2> * 128,
                <biomesoplenty:gem_ore:5> * 128,
                <biomesoplenty:gem_ore:6> * 128,
                <biomesoplenty:gem_ore:4> * 128
            ]
        ],
        <contenttweaker:robodruid_target_wood>: [
            [
                <erebus:ore_petrified_wood> * 256,
                <contenttweaker:entwood> * 32,
                <roots:wildwood_log> * 256
            ], [
                <erebus:ore_petrified_wood> * 256,
                <contenttweaker:entwood> * 32,
                <roots:wildwood_log> * 256
            ]
        ],
        <contenttweaker:robodruid_target_metal>: [
            [
                <densemetals:dense_mithril_ore> * 32,
                <netherendingores:ore_other_1:9> * 128,
                <taiga:vibranium_ore> * 96,
                <taiga:duranite_ore> * 64,
                <draconicevolution:draconium_ore> * 96,
                <contenttweaker:orichalcum_ore> * 16,
                <contenttweaker:geode_ore> * 64

            ], [
                <densemetals:dense_mithril_ore> * 32,
                <netherendingores:ore_other_1:9> * 128,
                <taiga:vibranium_ore> * 96,
                <taiga:duranite_ore> * 64,
                <draconicevolution:draconium_ore> * 96,
                <contenttweaker:orichalcum_ore> * 16,
                <contenttweaker:geode_ore> * 64

            ]
        ]
    },
    <contenttweaker:goldscarab_mech>: {
        <contenttweaker:goldscarab_target_ore>: [
            [
                <atum:relic_ore> * 512,
                <atum:redstone_ore> * 256,
                <contenttweaker:atum_lead_ore> * 192,
                <contenttweaker:atum_sphalerite_ore> * 192,
                <atum:gold_ore> * 256,
                <atum:diamond_ore> * 144
            ], [
                <atum:relic_ore> * 512,
                <atum:redstone_ore> * 256,
                <contenttweaker:atum_lead_ore> * 192,
                <contenttweaker:atum_sphalerite_ore> * 192,
                <atum:gold_ore> * 256,
                <atum:diamond_ore> * 96
            ]
        ],
        <contenttweaker:goldscarab_target_shard>: [
            [
                <atum:diamond_ore> * 256,
                <atum:emerald_ore> * 256,
                <atum:lapis_ore> * 256,
                <contenttweaker:atum_godshardium_ore> * 128
            ], [
                <atum:diamond_ore> * 256,
                <atum:emerald_ore> * 256,
                <atum:lapis_ore> * 256,
                <contenttweaker:atum_godshardium_ore> * 128
            ]
        ],
        <contenttweaker:goldscarab_target_oil>: [
            [
                <atum:gold_ore> * 192,
                <thermalfoundation:ore_fluid> * 320,

            ], [
                <atum:gold_ore> * 192,
                <thermalfoundation:ore_fluid> * 320,

            ]
        ],
        <contenttweaker:goldscarab_target_water>: [
            [
                <openblocks:tank>.withTag({tank: {FluidName: "sand", Amount: 16000}}) * 64,
                <openblocks:tank>.withTag({tank: {FluidName: "desert_water", Amount: 16000}}) * 32
            ], [
                <openblocks:tank>.withTag({tank: {FluidName: "sand", Amount: 16000}}) * 64,
                <openblocks:tank>.withTag({tank: {FluidName: "desert_water", Amount: 16000}}) * 32    
            ]
        ]
    },
    <contenttweaker:bloodhunter_mech>: {
        <contenttweaker:bloodhunter_target_slate>: [
            [
                <contenttweaker:slate_6> * 4,
                <bloodmagic:slate> * 64,
            ],[
                <contenttweaker:slate_6> * 4,
                <bloodmagic:slate> * 64
            ]
        ],
        <contenttweaker:bloodhunter_target_fairy>: [
            [
                <botania:manaresource:23> * 32,
                <erebus:materials:6>.withDisplayName("Fairy Wing") * 8,
            ],[
                <botania:manaresource:23> * 32,
                <erebus:materials:6>.withDisplayName("Fairy Wing") * 8,

            ]
        ],
        <contenttweaker:bloodhunter_target_blood>: [
            [
                <contenttweaker:blood_shard4> * 24,
                <contenttweaker:blood_shard3> * 32
            ],[
                <contenttweaker:blood_shard4> * 24,
                <contenttweaker:blood_shard3> * 32
            ]
        ],
        <contenttweaker:bloodhunter_target_wither>: [
            [
                <minecraft:nether_star> * 100
            ], [
                <minecraft:nether_star> * 100
            ]
        ],
        <contenttweaker:bloodhunter_target_mana>: [
            [<botania:blacklotus:1> * 32], [<botania:blacklotus:1> * 32]
        ],
        <contenttweaker:cursed_wither>: [
            [<contenttweaker:cursed_star>],
            [<contenttweaker:cursed_star>]
        ],
        <contenttweaker:tribute>: [
            [<contenttweaker:slate_10> * 16],
            [<contenttweaker:slate_10> * 16]
        ]
    },
    <contenttweaker:chitigic_party>: {
        <contenttweaker:signal_sandworm>: [
            [
                <contenttweaker:worm_heart> * 16,
                <contenttweaker:chitigic> * 16,
                <contenttweaker:sandworm_gut> * 128
            ], [
                <contenttweaker:worm_heart> * 16,
                <contenttweaker:chitigic> * 16,
                <contenttweaker:sandworm_gut> * 128
            ]
        ]
    }
};
static fuels as ILiquidStack[IItemStack] = {
    //<contenttweaker:stone_idol>: null,
    <contenttweaker:tincan_mech>: <liquid:empowered_steam> * 3000,
    <contenttweaker:radiotoad_mech>: <liquid:liquidfusionfuel> * 10000,
    <contenttweaker:robodruid_mech>: <liquid:druid_soup> * 15000,
    <contenttweaker:goldscarab_mech>: <liquid:nuit_fuel> * 20000,
    <contenttweaker:bloodhunter_mech>: <liquid:lifeessence> * (1000 * 50)
};
static core_cost as int[IItemStack] = {
    <contenttweaker:stone_idol>: 0,
    <contenttweaker:tincan_mech>: 0,
    <contenttweaker:radiotoad_mech>: 1,
    <contenttweaker:robodruid_mech>: 2,
    <contenttweaker:goldscarab_mech>: 2,
    <contenttweaker:bloodhunter_mech>: 4
};

static counter as int = 0;
//todo boat, fuel, multimek expeditions, portal opener
function addExplorationRecipe(mechs as IItemStack[], goals as IItemStack[], marks as int[], ship as IItemStack, chance as float) {
    counter += 1;
    var rec_name as string = "pworld_oregen_" ~ ship.name ~ "_";// ~ counter ~ "_";
    for i,m in mechs{
        rec_name = rec_name ~ m.name ~ goals[i].name ~ "_";
    }
    print("[PWE] adding " ~ counter ~ "th recipe: " ~ rec_name);

    var rec = RecipeBuilder.newBuilder(rec_name, "pworld_oregen", 20);
    rec.addEnergyPerTickInput(100000);
    rec.addItemInput(ship);
    var core_count as int = 1;
    for m in mechs {
        if (core_cost has m) core_count += core_cost[m];
    }
    rec.addItemInput(<mekanism:teleportationcore> * core_count);

    //rec.addMekanismLaserInput(25000000 as double);

    for i, mech in mechs{
        var amount as int = 0;
        var skip as bool = false;
        for j, mech2 in mechs{
            if (mech.definition.id == mech2.definition.id){
                if (j < i){//>
                    skip = true;
                    break;
                }else{
                    amount += 1;
                }
            }
        }
        if (skip){
            continue;
        }
        rec.addItemInput(mech * (mech.amount * amount));
        rec.setChance(chance);

        if (marks[i] == i){
            rec.addItemInput(goals[i]);
            if (fuels has mech)rec.addFluidInput(fuels[mech]);

            for out in loot[mech][goals[i]][1]{
                if out{
                    rec.addItemOutput(out);
                }
            }
        }

        for out in loot[mech][goals[marks[i]]][0]{
            if out{
                rec.addItemOutput(out);
            }
        }
    }

    rec.build();
}


function addAll2Recipes(ship as IItemStack, chance as float){
    for i1 in 0 to loot.length{//0 1 2 3
        for i2 in i1 to loot.length{//00 01 02 03 11 12 13 22 23 33
            var mech1 as IItemStack = loot.keys[i1];
            var mech2 as IItemStack = loot.keys[i2];

            var mechs as IItemStack[] = [mech1, mech2];
            var marks as int[] = [0, (i1 != i2)?1:0];//01 00 00 00 01 00 00 01 00 01

            for goal1 in loot[mech1]{
                for goal2 in loot[mech2]{
                    var goals as IItemStack[] = [goal1, goal2];
                    //goals[0] = goal1;
                    if (marks[1] != 1) {
                        goals[1] = goals[marks[1]];
                    }
                    addExplorationRecipe(mechs, goals, marks, ship, chance);
                }
            }
            
        }
    }
}

addAll2Recipes(<contenttweaker:mech_taxi>, 1.0);
addAll2Recipes(<contenttweaker:mech_taxi2>, 0.75);

for mech in loot{
    for goal in loot[mech]{
        var info as string[] = ["outputs: "];
        for ore in 0 to loot[mech][goal][0].length{
            var item1 as IItemStack = loot[mech][goal][0][ore];
            var item2 as IItemStack = loot[mech][goal][1][ore];

            var n1 as int = 0;
            var n2 as int = 0;
            var name as string = "";

            if item1{
                n1 = item1.amount;
                name = item1.displayName;
            }
            if item2{
                n2 = item2.amount;
                name = item2.displayName;
            }

            info += "   " ~ name ~ " x" ~ n1 ~ "+" ~ n2;
        }
        scripts.modular_machines.addItemInfoRecipe([goal, mech], info);
    }
}


recipes.remove(<mekanism:teleportationcore>);
recipes.addShaped("ia_teleportationcore", <mekanism:teleportationcore>, [
	[<contenttweaker:entangled_particles> | <contenttweaker:singularity_dust>, <quantumflux:craftingpiece:5>, <contenttweaker:entangled_particles> | <contenttweaker:singularity_dust>], 
	[<mekanism:controlcircuit:3>, <contenttweaker:entangled_particles>, <mekanism:controlcircuit:3>], 
	[<contenttweaker:entangled_particles> | <contenttweaker:singularity_dust>, <quantumflux:craftingpiece:5>, <contenttweaker:entangled_particles> | <contenttweaker:singularity_dust>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<mekanism:teleportationcore> * 3],
    [
        <contenttweaker:singularity_dust>,
        <mekanism:controlcircuit:3> * 2,
        <quantumflux:craftingpiece:5> * 2,
        <contenttweaker:entangled_particles> * 3
    ], null,
    20, 1000
);
scripts.content_machines.addAssemblerRecipe(
    [<mekanism:teleportationcore> * 3],
    [
        <contenttweaker:wormholium>,
        <mekanism:controlcircuit:3> * 2,
        <quantumflux:craftingpiece:5> * 2,
        <contenttweaker:entangled_particles> * 3
    ], null,
    20, 1000
);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <contenttweaker:wormholium> * 2, 
    <contenttweaker:singularity_dust>, <contenttweaker:wormium_ingot> * 6, 
    25000
);
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:wormholium> * 4, [
    <contenttweaker:singularity_dust>, 
    <contenttweaker:wormium_ingot> * 8,
    <contenttweaker:entangled_particles>
], 35000);

//goals
recipes.addShaped("ia_tincan_target_ore1", <contenttweaker:tincan_target_ore1>, [
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>], 
	[<contenttweaker:advanced_plating1_4>, <extendedcrafting:singularity:17>, <contenttweaker:advanced_plating1_4>], 
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>]
]);
recipes.addShaped("ia_tincan_target_ore2", <contenttweaker:tincan_target_ore2>, [
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>], 
	[<contenttweaker:advanced_plating1_4>, <extendedcrafting:singularity:35>, <contenttweaker:advanced_plating1_4>], 
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>]
]);
recipes.addShaped("ia_tincan_target_gem", <contenttweaker:tincan_target_gem>, [
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>], 
	[<contenttweaker:advanced_plating1_4>, <extendedcrafting:singularity:6>, <contenttweaker:advanced_plating1_4>], 
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>]
]);
recipes.addShaped("ia_tincan_target_mob", <contenttweaker:tincan_target_mob>, [
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>], 
	[<contenttweaker:advanced_plating1_4>, <extrautils2:ingredients:10>, <contenttweaker:advanced_plating1_4>], 
	[<contenttweaker:lesmium_plate>, <contenttweaker:advanced_plating1_4>, <contenttweaker:lesmium_plate>]
]);


mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:portal>, [
    [<modularmachinery:pworld_oregen_controller>, <enderio:block_tele_pad>, <enderio:block_tele_pad>, <botania:alfheimportal>, <enderio:block_tele_pad>, <enderio:block_tele_pad>, <modularmachinery:pworld_oregen_controller>], 
    [<enderio:block_tele_pad>, <contenttweaker:wormholium>, <bloodmagic:component:17>, <bloodmagic:component:17>, <bloodmagic:component:17>, <contenttweaker:wormholium>, <enderio:block_tele_pad>], 
    [<enderio:block_tele_pad>, <bloodmagic:component:17>, <mekanism:teleportationcore>, <mekanism:teleportationcore>, <mekanism:teleportationcore>, <bloodmagic:component:17>, <enderio:block_tele_pad>], 
    [<botania:alfheimportal>, <bloodmagic:component:17>, <mekanism:teleportationcore>, <botania:alfheimportal>, <mekanism:teleportationcore>, <bloodmagic:component:17>, <botania:alfheimportal>], 
    [<enderio:block_tele_pad>, <bloodmagic:component:17>, <mekanism:teleportationcore>, <mekanism:teleportationcore>, <mekanism:teleportationcore>, <bloodmagic:component:17>, <enderio:block_tele_pad>], 
    [<enderio:block_tele_pad>, <contenttweaker:wormholium>, <bloodmagic:component:17>, <bloodmagic:component:17>, <bloodmagic:component:17>, <contenttweaker:wormholium>, <enderio:block_tele_pad>], 
    [<modularmachinery:pworld_oregen_controller>, <enderio:block_tele_pad>, <enderio:block_tele_pad>, <botania:alfheimportal>, <enderio:block_tele_pad>, <enderio:block_tele_pad>, <modularmachinery:pworld_oregen_controller>]
]);

/*
parallel world exploration

ship
mechs(or scouts)
fuel(liquid)
goal

ship
-1, 2, 3 seats
-tiers

mechs
-special plating
-cores
-limbs
-parts
-unique resources
-research station for stats

fuel
-eio rocket fuel
-superheated steam
-dt fuel

goal
-not consumed
-ores
-monsters
-bosses
-fluid gathering


mechs ideas
-basic mech
    advanced alloy plating
    saw and drill arms
    jetpack
    eio rocket fuel

    mc/te/mk ores, gems, wither, e dragon
-chemical resistant mech
    chem res plating (<-antipoison)
    claw and a nuclear cannon
    pocket nuclear reactor
    dt fuel

    poisons, chemicals, lead, U, Yl
-egypt mech
    relic and godshards
    atum equapment 
    solar pack
    l sunshine
    monster slaying

    atum ores, fossils, godshards en mass, divine flesh
-bug mech
    chitin alloy
    bio reactor
    meat fuel
    monster slaying

    erebus drops, erebus ores, erebus bosses, royal chitin, fossils
-mana mech
    terra based plating
    mana core
    l mana fuel
    mana gathering, 


-star killer mech
    netronium
    part of infinity line
-god killer mech
    netronium
    egypt mech
    godshard fuel


*/