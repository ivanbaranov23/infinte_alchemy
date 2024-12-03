#priority 200
//todo redo all plates rods and gears
//earlygame 
//plate         6   4
//rod           6   3
//gear          13  8
//wire          3   1
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

//ingots
import mods.tconstruct.Casting;


import mods.immersiveengineering.MetalPress as IEPress;
//plates
import mods.thermalexpansion.Compactor as TEPress;

//rods
import mods.prodigytech.heatsawmill as PTsaw;
import mods.thermalexpansion.Sawmill as TEsaw;
//Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

//molten
import mods.tconstruct.Melting;

import mods.thermalexpansion.Crucible as TEMelter;

//alloys
import mods.tconstruct.Alloy;
import mods.thermalexpansion.InductionSmelter as TEAlloyer;
//InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);


import mods.thermalexpansion.Infuser;
//Infuser.addRecipe(IItemStack output, IItemStack input, int energy);


print("[IA] starting metalworks");


static all_metals as IItemStack[string][string] = {
    // tier 1 metals
    iron: {
        ingot: <minecraft:iron_ingot>,
        plate: <thermalfoundation:material:32>, 
        rod: <immersiveengineering:material:1>, 
        gear: <thermalfoundation:material:24>,
        block: <minecraft:iron_block>,
        dust: <thermalfoundation:material>,

        singularity: <extendedcrafting:singularity:1>
    },
    copper: {
        ingot: <thermalfoundation:material:128>,
        plate: <thermalfoundation:material:320>,
        rod: <moreplates:copper_stick>,
        gear: <thermalfoundation:material:256>,
        block: <thermalfoundation:storage>,
        wire: <immersiveengineering:material:20>,
        dust: <thermalfoundation:material:64>,

        singularity: <extendedcrafting:singularity:17>
    },
    tin: {
        ingot: <thermalfoundation:material:129>,
        plate: <thermalfoundation:material:321>,
        rod: <moreplates:tin_stick>,
        gear: <thermalfoundation:material:257>,
        block: <thermalfoundation:storage:1>,
        dust: <thermalfoundation:material:65>,

        singularity: <extendedcrafting:singularity:18>
    },

    // tier 1 alloys
    bronze: {
        ingot: <thermalfoundation:material:163>,
        plate: <thermalfoundation:material:355>,
        rod: <moreplates:bronze_stick>,
        gear: <thermalfoundation:material:291>,
        block: <thermalfoundation:storage_alloy:3>,
        dust: <thermalfoundation:material:99>, 

        singularity: <extendedcrafting:singularity:19>
    },
    pigiron: {
        ingot: <tconstruct:ingots:4>,
        plate: <moreplates:pig_iron_plate>,
        gear: <moreplates:pig_iron_gear>,
        block: <tconstruct:metal:4>,

        singularity: <extendedcrafting:singularity_custom:10>
    },
    knightslime: {
        ingot: <tconstruct:ingots:3>,
        plate: <moreplates:knightslime_plate>,
        gear: <moreplates:knightslime_gear>,
        block: <tconstruct:metal:3>
    },

    // tier 1.5 metals
    aluminum: {
        ingot: <thermalfoundation:material:132>,
        plate: <thermalfoundation:material:324>,
        rod: <immersiveengineering:material:3>,
        gear: <thermalfoundation:material:260>,
        block: <thermalfoundation:storage:4>,
        wire: <immersiveengineering:material:22>,
        dust: <thermalfoundation:material:68>,

        singularity: <extendedcrafting:singularity:16>
    },
    nickel: {
        ingot: <thermalfoundation:material:133>,
        plate: <thermalfoundation:material:325>,
        rod: <moreplates:nickel_stick>,
        gear: <thermalfoundation:material:261>,
        block: <thermalfoundation:storage:5>,
        dust: <thermalfoundation:material:69>,

        singularity: <extendedcrafting:singularity:25>
    },
    zinc: {
        ingot: <contenttweaker:zinc_ingot>,
        plate: <contenttweaker:zinc_plate>,
        rod: <contenttweaker:zinc_rod>,
        gear: <contenttweaker:zinc_gear>,
        wire: <contenttweaker:zinc_wire>,

        nugget: <contenttweaker:zinc_nugget>,
        block: <contenttweaker:zinc_block>,
        dust: <contenttweaker:zinc_dust>,

        singularity: <extendedcrafting:singularity:20>
    },

    cobalt: {
        ingot: <tconstruct:ingots>,
        plate: <moreplates:cobalt_plate>,
        gear: <moreplates:cobalt_gear>,
        block: <tconstruct:metal>,
        dust: <exnihilocreatio:item_ore_cobalt:2>,

        singularity: <extendedcrafting:singularity:65>
    },
    ardite: {
        ingot: <tconstruct:ingots:1>,
        plate: <moreplates:ardite_plate>,
        gear: <moreplates:ardite_gear>,
        block: <tconstruct:metal:1>,
        dust: <exnihilocreatio:item_ore_ardite:2>,

        singularity: <extendedcrafting:singularity:64>
    },

    // tier 1.5 alloys
    ferramic: {
        ingot: <prodigytech:ferramic_ingot>,
        gear: <prodigytech:ferramic_gear>,
        block: <prodigytech:ferramic_block>,
        dust: <prodigytech:ferramic_dust>,

        singularity: <extendedcrafting:singularity_custom:4>
    },
    constantan: {
        ingot: <thermalfoundation:material:164>,
        plate: <thermalfoundation:material:356>,
        rod: <moreplates:constantan_stick>,
        gear: <thermalfoundation:material:292>,
        block: <thermalfoundation:storage_alloy:4>,
        dust: <thermalfoundation:material:100>,

        singularity: <extendedcrafting:singularity:26>
    },
    invar:{
        ingot: <thermalfoundation:material:162>,
        plate: <thermalfoundation:material:354>,
        rod: <moreplates:invar_stick>,
        gear: <thermalfoundation:material:290>,
        block: <thermalfoundation:storage_alloy:2>,
        dust: <thermalfoundation:material:98>,

        singularity: <extendedcrafting:singularity:28>
    },
    steel: {
        ingot: <thermalfoundation:material:160>,
        plate: <thermalfoundation:material:352>,
        rod: <immersiveengineering:material:2>,
        gear: <thermalfoundation:material:288>,
        block: <thermalfoundation:storage_alloy>,
        dust: <thermalfoundation:material:96>,
        wire: <immersiveengineering:material:23>,
        dust: <thermalfoundation:material:96>,

        singularity: <extendedcrafting:singularity:24>
    },
    alumite:{
        ingot: <plustic:alumiteingot>,
        plate: <moreplates:alumite_plate>,
        gear: <moreplates:alumite_gear>,
        block: <plustic:alumiteblock>
    },
    duraluminum: {
        ingot: <contenttweaker:duraluminum_ingot>,
        plate: <contenttweaker:duraluminum_plate>,
        rod: <contenttweaker:duraluminum_rod>,
        gear: <contenttweaker:duraluminum_gear>,

        nugget: <contenttweaker:duraluminum_nugget>,
        block: <contenttweaker:duraluminum_block>,
        dust: <contenttweaker:duraluminum_dust>
    },
    watertight_steel: {
        ingot: <contenttweaker:watertight_steel_ingot>,
        plate: <contenttweaker:watertight_steel_plate>,
        rod: <contenttweaker:watertight_steel_rod>,
        gear: <contenttweaker:watertight_steel_gear>,

        nugget: <contenttweaker:watertight_steel_nugget>,
        block: <contenttweaker:watertight_steel_block>,
        dust: <contenttweaker:watertight_steel_dust>
    },
    alubrass: {
        ingot: <tconstruct:ingots:5>,
        block: <tconstruct:metal:5>,
        nugget: <tconstruct:nuggets:5>,

        singularity: <extendedcrafting:singularity:21>
    },
    nial: {
        ingot: <contenttweaker:nial_ingot>,
        block: <contenttweaker:nial_block>,
        dust: <contenttweaker:nial_dust>,

        singularity: <extendedcrafting:singularity_custom:39>
    },

    manyullyn: {
        ingot: <tconstruct:ingots:2>,
        plate: <moreplates:manyullyn_plate>,
        gear: <moreplates:manyullyn_gear>,
        block: <tconstruct:metal:2>,
        dust: <contenttweaker:manyullyn_dust>,

        singularity: <extendedcrafting:singularity:66>
    },
    wear_resistant_alloy: {
        ingot: <contenttweaker:wear_resistant_alloy_ingot>,
        plate: <contenttweaker:wear_resistant_alloy_plate>,
        rod: <contenttweaker:wear_resistant_alloy_rod>,
        gear: <contenttweaker:wear_resistant_alloy_gear>,

        nugget: <contenttweaker:wear_resistant_alloy_nugget>,
        block: <contenttweaker:wear_resistant_alloy_block>,
        dust: <contenttweaker:wear_resistant_alloy_dust>,

        ball: <contenttweaker:wear_resistant_alloy_ball>
    },

    // tier 2 metals
    gold: {
        ingot: <minecraft:gold_ingot>,
        plate: <thermalfoundation:material:33>,
        rod: <moreplates:gold_stick>,
        gear: <thermalfoundation:material:25>,
        block: <minecraft:gold_block>,
        wire: <contenttweaker:gold_wire>,
        dust: <thermalfoundation:material:1>,

        singularity: <extendedcrafting:singularity:5>
    },
    silver:{
        ingot: <thermalfoundation:material:130>,
        plate: <thermalfoundation:material:322>,
        rod: <moreplates:silver_stick>,
        gear: <thermalfoundation:material:258>,
        block: <thermalfoundation:storage:2>,
        dust: <thermalfoundation:material:66>,

        singularity: <extendedcrafting:singularity:22>
    },
    lead: {
        ingot: <thermalfoundation:material:131>,
        plate: <thermalfoundation:material:323>,
        rod: <moreplates:lead_stick>,
        gear: <thermalfoundation:material:259>,
        block: <thermalfoundation:storage:3>,
        dust: <thermalfoundation:material:67>,

        singularity: <extendedcrafting:singularity:23>
    },
    osmium: {
        ingot: <mekanism:ingot:1>,
        plate: <moreplates:osmium_plate>,
        gear: <moreplates:osmium_gear>,
        block: <mekanism:basicblock>,
        dust: <mekanism:dust:2>,

        singularity: <extendedcrafting:singularity_custom:5>
    },

    // tier 2 alloys
    electrum: {
        ingot: <thermalfoundation:material:161>,
        plate: <thermalfoundation:material:353>,
        rod: <moreplates:electrum_stick>,
        gear: <thermalfoundation:material:289>,
        block: <thermalfoundation:storage_alloy:1>,
        dust: <thermalfoundation:material:97>,
        wire: <immersiveengineering:material:21>,

        singularity: <extendedcrafting:singularity:27>
    },
    lesmium: {
        ingot: <contenttweaker:lesmium_ingot>,
        plate: <contenttweaker:lesmium_plate>,
        rod: <contenttweaker:lesmium_rod>,
        gear: <contenttweaker:lesmium_gear>,
        block: <contenttweaker:lesmium_block>,
        dust: <contenttweaker:lesmium_dust>,
        nugget: <contenttweaker:lesmium_nugget>,

        singularity: <extendedcrafting:singularity_custom:12>
    },

    // tier 2.5 metals
    demon: {
        ingot: <extrautils2:ingredients:11>,
        plate: <moreplates:demon_plate>,
        gear: <moreplates:demon_gear>,
        block: <extrautils2:simpledecorative:1>,

        singularity: <extendedcrafting:singularity_custom:41>
    },
    angel: {
        ingot: <contenttweaker:angel_ingot>,
        plate: <contenttweaker:angel_plate>,
        rod: <contenttweaker:angel_rod>,
        gear: <contenttweaker:angel_gear>,
        block: <contenttweaker:angel_block>,
        dust: <contenttweaker:angel_dust>,
        nugget: <contenttweaker:angel_nugget>,

        singularity: <extendedcrafting:singularity_custom:42>
    },
    evil: {
        ingot: <extrautils2:ingredients:17>,
        plate: <moreplates:evil_infused_iron_plate>,
        gear: <moreplates:evil_infused_iron_gear>,
        block: <extrautils2:simpledecorative:2>,

        ball: <contenttweaker:evil_ball>,
        singularity: <contenttweaker:evil_singularity>
    },
    enchanted: {
        ingot: <extrautils2:ingredients:12>,
        plate: <moreplates:enchanted_plate>,
        gear: <moreplates:enchanted_gear>,
        block: <extrautils2:simpledecorative>
    },
    relic: {
        ingot: <contenttweaker:relic_ingot>,
        block: <contenttweaker:relic_block>,

        singularity: <extendedcrafting:singularity_custom:32>
    },

    electric_steel: {
        ingot: <enderio:item_alloy_ingot>,
        plate: <moreplates:electrical_steel_plate>,
        gear: <moreplates:electrical_steel_gear>,
        block: <enderio:block_alloy>,

        ball: <enderio:item_alloy_ball>
    },

    red_alloy: {
        ingot: <projectred-core:resource_item:103>,
        plate: <moreplates:red_alloy_plate>,
        gear: <moreplates:red_alloy_gear>,
        block: <moreplates:red_alloy_plate>
    },
    blue_alloy: {
        ingot: <projectred-core:resource_item:104>,
        plate: <moreplates:electrotine_alloy_plate>,
        gear: <moreplates:electrotine_alloy_gear>,
        block: <moreplates:electrotine_alloy_plate>
    },

    compound_metal: {
        ingot: <contenttweaker:compound_metal2>,
        block: <contenttweaker:compound_metal2> * 9
    },

    // thermal metals
    thermal_paste: {
        ingot: <contenttweaker:thermal_paste>
    },
    thermal_steel: {
        ingot: <contenttweaker:thermal_ingot>,
        plate: <contenttweaker:thermal_plate>,
        rod: <contenttweaker:thermal_rod>,
        gear: <contenttweaker:thermal_gear>,
        block: <contenttweaker:thermal_block>,
        dust: <contenttweaker:thermal_dust>
    },
        
    lumium: {
        ingot: <thermalfoundation:material:166>,
        plate: <thermalfoundation:material:358>,
        rod: <moreplates:lumium_stick>,
        gear: <thermalfoundation:material:294>,
        block: <thermalfoundation:storage_alloy:6>,
        dust: <thermalfoundation:material:102>,

        ball: <enderio:item_material:59>,
        singularity: <extendedcrafting:singularity:49>
    },
    signalum: {
        ingot: <thermalfoundation:material:165>,
        plate: <thermalfoundation:material:357>,
        rod: <moreplates:signalum_stick>,
        gear: <thermalfoundation:material:293>,
        block: <thermalfoundation:storage_alloy:5>,
        dust: <thermalfoundation:material:101>,

        ball: <enderio:item_material:57>,
        singularity: <extendedcrafting:singularity:48>
    },

    mushroomite: {
        ingot: <contenttweaker:mushroomite_ingot>,
        plate: <contenttweaker:mushroomite_plate>,
        rod: <contenttweaker:mushroomite_rod>,
        gear: <contenttweaker:mushroomite_gear>,
        block: <contenttweaker:mushroomite_block>,

        singularity: <contenttweaker:mushroomite_singularity>
    },
    enderium_base: {
        ingot: <enderio:item_material:39>,
        block: <enderio:item_material:39> * 9
    },
    enderium:{
        ingot: <thermalfoundation:material:167>,
        plate: <thermalfoundation:material:359>,
        rod: <moreplates:enderium_stick>,
        gear: <thermalfoundation:material:295>,
        block: <thermalfoundation:storage_alloy:7>,
        dust: <thermalfoundation:material:103>,

        ball: <enderio:item_material:58>,
        singularity: <extendedcrafting:singularity:50>
    },
    electric_manyullyn_base: {
        ingot: <contenttweaker:electric_manyullyn_base_ingot>,
        block: <contenttweaker:electric_manyullyn_base_block>,
        nugget: <contenttweaker:electric_manyullyn_base_nugget>
    },
    electric_manyullyn: {
        ingot: <contenttweaker:electric_manyullyn_ingot>,
        plate: <contenttweaker:electric_manyullyn_plate>,
        rod: <contenttweaker:electric_manyullyn_rod>,
        gear: <contenttweaker:electric_manyullyn_gear>,
        block: <contenttweaker:electric_manyullyn_block>,
        nugget: <contenttweaker:electric_manyullyn_nugget>,
        dust: <contenttweaker:electric_manyullyn_dust>
    },

    zorra_steel: {
        ingot: <prodigytech:zorrasteel_ingot>,
        block: <prodigytech:zorrasteel_block>
    },
    flower_steel: {
        ingot: <contenttweaker:flower_steel_ingot>,
        plate: <contenttweaker:flower_steel_plate>,
        rod: <contenttweaker:flower_steel_rod>,
        gear: <contenttweaker:flower_steel_gear>,
        block: <contenttweaker:flower_steel_block>
    },

    // tier 3 metals
    platinum: {
        ingot: <thermalfoundation:material:134>,
        plate: <thermalfoundation:material:326>,
        rod: <moreplates:platinum_stick>,
        gear: <thermalfoundation:material:262>,
        wire: <contenttweaker:platinum_wire>,
        block: <thermalfoundation:storage:6>,
        dust: <thermalfoundation:material:70>,

        singularity: <extendedcrafting:singularity:34>
    },
    iridium: {
        ingot: <thermalfoundation:material:135>,
        plate: <thermalfoundation:material:327>,
        rod: <moreplates:iridium_stick>,
        gear: <thermalfoundation:material:263>,
        block: <thermalfoundation:storage:7>,
        dust: <thermalfoundation:material:71>,

        singularity: <extendedcrafting:singularity:35>
    },
    titanium: {
        ingot: <contenttweaker:titanium_ingot>,
        plate: <contenttweaker:titanium_plate>,
        rod: <contenttweaker:titanium_rod>,
        gear: <contenttweaker:titanium_gear>,

        nugget: <contenttweaker:titanium_nugget>,
        block: <contenttweaker:titanium_block>,
        dust: <contenttweaker:titanium_dust>,

        singularity: <extendedcrafting:singularity:31>
    },
    tungsten: {
        ingot: <exnihilocreatio:item_ore_tungsten:3>,
        block: <contenttweaker:tungsten_block>,
        plate: <contenttweaker:tungsten_plate>,
        wire: <contenttweaker:tungsten_wire>,
        dust: <exnihilocreatio:item_ore_tungsten:2>,

        singularity: <extendedcrafting:singularity:30>
    },
    uranium: {
        ingot: <immersiveengineering:metal:5>,
        plate: <immersiveengineering:metal:35>,
        block: <immersiveengineering:storage:5>,
        dust: <immersiveengineering:metal:14>,

        singularity: <extendedcrafting:singularity:32>
    },
    yellorium: {
        ingot: <bigreactors:ingotyellorium>,
        block: <bigreactors:blockyellorium>,
        dust: <bigreactors:dustyellorium>,

        singularity: <extendedcrafting:singularity_custom:17>
    },

    mithril: {
        ingot: <thermalfoundation:material:136>,
        plate: <thermalfoundation:material:328>,
        rod: <moreplates:mana_infused_stick>,
        gear: <thermalfoundation:material:264>,
        block: <thermalfoundation:storage:8>,
        dust: <thermalfoundation:material:72>,

        singularity: <extendedcrafting:singularity:29>
    },

    // mekanism metals
    mekanized_steel_base: {
        ingot: <contenttweaker:mekanized_steel_base_ingot>
    },
    mekanized_steel: {
        ingot: <contenttweaker:mekanized_steel_ingot>,
        plate: <contenttweaker:mekanized_steel_plate>,
        rod: <contenttweaker:mekanized_steel_rod>,
        gear: <contenttweaker:mekanized_steel_gear>,
        block: <contenttweaker:mekanized_steel_block>,
        dust: <contenttweaker:mekanized_steel_dust>
    },
    refined_obsidian: {
        ingot: <mekanism:ingot>,
        plate: <moreplates:refined_obsidian_plate>,
        gear: <moreplates:refined_obsidian_gear>,
        block: <mekanism:basicblock:2>,
        dust: <mekanism:otherdust:5>,

        singularity: <extendedcrafting:singularity_custom:59>
    },
    refined_glowstone: {
        ingot: <mekanism:ingot:3>,
        plate: <moreplates:refined_glowstone_plate>,
        gear: <moreplates:refined_glowstone_gear>,
        block: <mekanism:basicblock:4>,

        singularity: <extendedcrafting:singularity_custom:60>
    },
    osmium_shard: {
        ingot: <mekanism:shard:2>,
        block: <mekanism:crystal:2>
    },
    lithium: {
        ingot: <mekanism:otherdust:4>,
        dust: <mekanism:otherdust:4>
    },

    osgloglass: {
        ingot: <plustic:osgloglasingot>,
        plate: <moreplates:osgloglas_plate>,
        gear: <moreplates:osgloglas_gear>,
        block: <plustic:osgloglasblock>,

        singularity: <extendedcrafting:singularity_custom:61>
    },
    osmiridium: {
        ingot: <plustic:osmiridiumingot>,
        plate: <moreplates:osmiridium_plate>,
        gear: <moreplates:osmiridium_gear>,
        block: <plustic:osmiridiumblock>,

        dust: <contenttweaker:osmiridium_dust>,
        rod: <contenttweaker:osmiridium_rod>
    },
    osgloridium: {
        ingot: <contenttweaker:osgloridium_ingot>,
        plate: <contenttweaker:osgloridium_plate>,
        rod: <contenttweaker:osgloridium_rod>,
        gear: <contenttweaker:osgloridium_gear>,

        nugget: <contenttweaker:osgloridium_nugget>,
        block: <contenttweaker:osgloridium_block>,
        dust: <contenttweaker:osgloridium_dust>
    },


    fluix_steel: {
        ingot: <contenttweaker:fluix_steel_ingot>,
        plate: <contenttweaker:fluix_steel_plate>,
        rod: <contenttweaker:fluix_steel_rod>,
        gear: <contenttweaker:fluix_steel_gear>,
        wire: <contenttweaker:fluix_steel_wire>,

        nugget: <contenttweaker:fluix_steel_nugget>,
        block: <contenttweaker:fluix_steel_block>,
        dust: <contenttweaker:fluix_steel_dust>
    },
    xnet: {
        ingot: <contenttweaker:xnet_ingot>,
        plate: <contenttweaker:xnet_plate>,
        wire: <contenttweaker:xnet_wire>,

        block: <contenttweaker:xnet_block>
    },
    menril_steel_base: {
        ingot: <contenttweaker:menril_steel_base_ingot>,
    },
    menril_steel: {
        ingot: <contenttweaker:menril_steel_ingot>,
        plate: <contenttweaker:menril_steel_plate>,
        wire: <contenttweaker:menril_steel_wire>,
        
        nugget: <contenttweaker:menril_steel_nugget>,
        block: <contenttweaker:menril_steel_block>,
        dust: <contenttweaker:menril_steel_dust>
    },
    
    soy_steel: {
        ingot: <contenttweaker:soy_ingot>,
        block: <contenttweaker:soy_plate>,
        plate: <contenttweaker:soy_plate>,
        gear: <contenttweaker:soy_gear>
    },
    potion_zinc: {
        ingot: <contenttweaker:potion_zinc_ingot>,
        block: <contenttweaker:potion_zinc_plate>,
        plate: <contenttweaker:potion_zinc_plate>,
        gear: <contenttweaker:potion_zinc_gear>
    },
    solar_potion_zinc: {
        ingot: <contenttweaker:solar_potion_zinc_ingot>,
        block: <contenttweaker:solar_potion_zinc_plate>,
        plate: <contenttweaker:solar_potion_zinc_plate>,
        gear: <contenttweaker:solar_potion_zinc_gear>
    },

    black_bronze: {
        ingot: <contenttweaker:black_bronze_ingot>,
        plate: <contenttweaker:black_bronze_plate>,
        rod: <contenttweaker:black_bronze_rod>,
        gear: <contenttweaker:black_bronze_gear>,

        nugget: <contenttweaker:black_bronze_nugget>,
        block: <contenttweaker:black_bronze_block>,
        dust: <contenttweaker:black_bronze_dust>
    },
    tinezo: {
        ingot: <contenttweaker:tinezo_ingot>,
        plate: <contenttweaker:tinezo_plate>,
        gear: <contenttweaker:tinezo_gear>,

        block: <contenttweaker:tinezo_block>,
        dust: <contenttweaker:tinezo_dust>
    },
    medical_alloy: {
        ingot: <contenttweaker:medical_alloy_ingot>,
        plate: <contenttweaker:medical_alloy_plate>,
        rod: <contenttweaker:medical_alloy_rod>,
        gear: <contenttweaker:medical_alloy_gear>,
        wire: <contenttweaker:medical_alloy_wire>,

        nugget: <contenttweaker:medical_alloy_nugget>,
        block: <contenttweaker:medical_alloy_block>,
        dust: <contenttweaker:medical_alloy_dust>
    },
    gastight_steel: {
        ingot: <contenttweaker:gastight_steel_ingot>,
        plate: <contenttweaker:gastight_steel_plate>,
        rod: <contenttweaker:gastight_steel_rod>,
        gear: <contenttweaker:gastight_steel_gear>,

        nugget: <contenttweaker:gastight_steel_nugget>,
        block: <contenttweaker:gastight_steel_block>,
        dust: <contenttweaker:gastight_steel_dust>
    },

    lithium_tungstate: {
        ingot: <alchemistry:ingot:74>,
        block: <alchemistry:ingot:74> * 9
    },
    calitunti_base: {
        ingot: <alchemistry:ingot:22>,
        block: <alchemistry:ingot:22> * 9
    },
    enheavied: {
        ingot: <contenttweaker:calitunti_ingot>,
        plate: <contenttweaker:calitunti_plate>,
        gear: <contenttweaker:calitunti_gear>,
        block: <contenttweaker:calitunti_block>
    },

    fluxed_electrum: {
        ingot: <redstonearsenal:material:32>,
        plate: <redstonearsenal:material:128>,
        rod: <contenttweaker:fluxed_rod>,
        gear: <redstonearsenal:material:96>,
        block: <redstonearsenal:storage>,

        dust: <redstonearsenal:material>
    },

    mitanium: {
        ingot: <contenttweaker:mitanium_ingot>,
        block: <contenttweaker:mitanium_block>
    },

    // twilight metals
    armor_shard: {
        ingot: <twilightforest:armor_shard_cluster>
    },
    steeleaf: {
        ingot: <twilightforest:steeleaf_ingot>,
        block: <twilightforest:block_storage:2>,

        singularity: <extendedcrafting:singularity_custom:11>
    },
    steeleaf_singularity: {
        ingot: <extendedcrafting:singularity_custom:11>,
        block: <extendedcrafting:singularity_custom:11> * 9
    },
    ironwood: {
        ingot: <twilightforest:ironwood_ingot>,
        plate: <moreplates:ironwood_plate>,
        gear: <moreplates:ironwood_gear>,
        block: <twilightforest:block_storage>
    },
    steelwood: {
        ingot: <contenttweaker:steelwood_ingot>,
        block: <contenttweaker:steelwood_ingot> * 9
    },
    duraluminumwood: {
        ingot: <contenttweaker:duraluminumwood_ingot>,
        block: <contenttweaker:duraluminumwood_ingot> * 9
    },
    knight: {
        ingot: <twilightforest:knightmetal_ingot>,
        plate: <moreplates:knightmetal_plate>,
        gear: <moreplates:knightmetal_gear>,
        block: <twilightforest:knightmetal_block>
    },
    fiery: {
        ingot: <twilightforest:fiery_ingot>,
        plate: <moreplates:fiery_plate>,
        gear: <moreplates:fiery_gear>,
        block: <twilightforest:block_storage:1>,

        ball: <contenttweaker:fiery_ball>,
        singularity: <contenttweaker:fiery_singularity>
    },
    carminite: {
        ingot: <twilightforest:carminite>,
        block: <twilightforest:block_storage:4>
    },
    carminium: {
        ingot: <contenttweaker:carminium_ingot>,
        block: <contenttweaker:carminium_ingot> * 9
    },

    // actually things

    restonia: {
        ingot: <actuallyadditions:item_crystal>,
        block: <actuallyadditions:block_crystal>
    },

    nittin: {
        ingot: <contenttweaker:nittin>,
        block: <contenttweaker:nittin_block>
    },

    evoid: {
        ingot: <actuallyadditions:item_crystal_empowered:3>,
        block: <actuallyadditions:block_crystal_empowered:3>
    },

    // ender io things
    conductive_iron: {
        ingot: <enderio:item_alloy_ingot:4>,
        plate: <moreplates:conductive_iron_plate>,
        gear: <moreplates:conductive_iron_gear>,
        block: <enderio:block_alloy:4>,

        ball: <enderio:item_alloy_ball:4>
    },
    redstone_alloy: {
        ingot: <enderio:item_alloy_ingot:3>,
        plate: <moreplates:redstone_alloy_plate>,
        gear: <moreplates:redstone_alloy_gear>,
        block: <enderio:block_alloy:3>,

        ball: <enderio:item_alloy_ball:3>
    },
    pulsating_alloy: {
        ingot: <enderio:item_alloy_ingot:5>,
        plate: <moreplates:pulsating_iron_plate>,
        gear: <moreplates:pulsating_iron_gear>,
        block: <enderio:block_alloy:5>,

        ball: <enderio:item_alloy_ball:5>
    },
    soularium: {
        ingot: <enderio:item_alloy_ingot:7>,
        plate: <moreplates:soularium_plate>,
        gear: <moreplates:soularium_gear>,
        block: <enderio:block_alloy:7>,

        ball: <enderio:item_alloy_ball:7>
    },

    inf_reagent: {
        ingot: <enderio:item_material:75>,
        block: <enderio:item_material:75> * 9,
        dust: <enderio:item_material:75>
    },

    dark_steel: {
        ingot: <enderio:item_alloy_ingot:6>,
        plate: <moreplates:dark_steel_plate>,
        gear: <moreplates:dark_steel_gear>,
        block: <enderio:block_alloy:6>,

        ball: <enderio:item_alloy_ball:6>
    },
    end_steel: {
        ingot: <enderio:item_alloy_ingot:8>,
        plate: <moreplates:end_steel_plate>,
        gear: <moreplates:end_steel_gear>,
        block: <enderio:block_alloy:8>,

        ball: <enderio:item_alloy_ball:8>
    },
    melodic_alloy: {
        ingot: <enderio:item_alloy_endergy_ingot:2>,
        plate: <moreplates:melodic_alloy_plate>,
        gear: <moreplates:melodic_alloy_gear>,
        block: <enderio:block_alloy_endergy:2>,

        ball: <enderio:item_alloy_endergy_ball:2>
    },
    stellar_alloy: {
        ingot: <enderio:item_alloy_endergy_ingot:3>,
        plate: <moreplates:stellar_alloy_plate>,
        gear: <moreplates:stellar_alloy_gear>,
        block: <enderio:block_alloy_endergy:3>,

        ball: <enderio:item_alloy_endergy_ball:3>
    },

    energetic_gold1: {
        ingot: <enderio:item_alloy_ingot:1>,
        plate: <moreplates:energetic_alloy_plate>,
        gear: <moreplates:energetic_alloy_gear>,
        block: <enderio:block_alloy:1>,

        ball: <enderio:item_alloy_ball:1>
    },
    energetic_gold2: {
        ingot: <enderio:item_alloy_ingot:2>, 
        plate: <moreplates:vibrant_alloy_plate>,
        gear: <moreplates:vibrant_alloy_gear>,
        block: <enderio:block_alloy:2>,

        ball: <enderio:item_alloy_ball:2>
    },
    energetic_silver1: {
        ingot: <enderio:item_alloy_endergy_ingot:5>, 
        plate: <moreplates:energetic_silver_plate>,
        gear: <moreplates:energetic_silver_gear>,
        block: <enderio:block_alloy_endergy:5>,

        ball: <enderio:item_alloy_endergy_ball:5>
    },
    energetic_silver2: {
        ingot: <enderio:item_alloy_endergy_ingot:6>, 
        plate: <moreplates:vivid_alloy_plate>,
        gear: <moreplates:vivid_alloy_gear>,
        block: <enderio:block_alloy_endergy:6>,

        ball: <enderio:item_alloy_endergy_ball:6>
    },

    crystalline_alloy: {
        ingot: <enderio:item_alloy_endergy_ingot:1>,
        plate: <moreplates:crystalline_alloy_plate>,
        gear: <moreplates:crystalline_alloy_gear>,
        block: <enderio:block_alloy_endergy:1>,

        ball: <enderio:item_alloy_endergy_ball:1>
    },
    crystalline_pink_slime: {
        ingot: <enderio:item_alloy_endergy_ingot:4>,
        plate: <moreplates:crystalline_pink_slime_plate>,
        gear: <moreplates:crystalline_pink_slime_gear>,
        block: <enderio:block_alloy_endergy:4>,

        ball: <enderio:item_alloy_endergy_ball:4>
    },

    bedrockium_alloy: {
        ingot: <contenttweaker:bedrockium_alloy_ingot>,
        plate: <contenttweaker:bedrockium_alloy_plate>,
        gear: <contenttweaker:bedrockium_alloy_gear>,
        block: <contenttweaker:bedrockium_alloy_block>,

        ball: <contenttweaker:bedrockium_alloy_ball>
    },
    explosion_resistant: {
        ingot: <contenttweaker:explosion_resistant_ingot>,
        plate: <contenttweaker:explosion_resistant_plate>,
        rod: <contenttweaker:explosion_resistant_rod>,
        gear: <contenttweaker:explosion_resistant_gear>,
        block: <contenttweaker:explosion_resistant_block>
    },
    hot: {
        ingot: <contenttweaker:hot_ingot>,
        plate: <contenttweaker:hot_plate>,
        //rod: <contenttweaker:hot_rod>,
        gear: <contenttweaker:hot_gear>,
        block: <contenttweaker:hot_block>
    },
    cursed_gold: {
        ingot: <contenttweaker:cursed_gold_ingot>,
        plate: <contenttweaker:cursed_gold_plate>,
        block: <contenttweaker:cursed_gold_ingot> * 9
    },

    dark_soularium: {
        ingot: <simplyjetpacks:metaitemmods:12>,
        block: <simplyjetpacks:metaitemmods:12> * 9
    },
    tignalum: {
        ingot: <contenttweaker:tignalum_ingot>,
        plate: <contenttweaker:tignalum_plate>,
        rod: <contenttweaker:tignalum_rod>,
        gear: <contenttweaker:tignalum_gear>,
        block: <contenttweaker:tignalum_block>,

        ball: <contenttweaker:tignalum_ball>
    },

    // tier 4 metals
    chrome: {
        ingot: <contenttweaker:chrome_ingot>,
        block: <contenttweaker:chrome_block>,

        singularity: <extendedcrafting:singularity:33>
    },
    palladium: {
        ingot: <taiga:palladium_ingot>,
        block: <taiga:palladium_block>,
        nugget: <taiga:palladium_nugget>,
        dust: <taiga:palladium_dust>,

        plate: <contenttweaker:palladium_plate>,
        gear: <contenttweaker:palladium_gear>,
        rod: <contenttweaker:palladium_rod>,

        singularity: <extendedcrafting:singularity_custom:30>
    },
    neodymium: {
        ingot: <contenttweaker:neodymium_ingot>,
        plate: <contenttweaker:neodymium_plate>,
        rod: <contenttweaker:neodymium_rod>,
        gear: <contenttweaker:neodymium_gear>,
        block: <contenttweaker:neodymium_block>,

        singularity: <contenttweaker:neodymium_singularity>
    },
    arkenium: {
        ingot: <contenttweaker:arkenium_ingot>,
        plate: <contenttweaker:arkenium_plate>,
        gear: <contenttweaker:arkenium_gear>,
        block: <contenttweaker:arkenium_block>,
        //dust: <contenttweaker:arkenium_dust>,

        ball: <contenttweaker:arkenium_ball>
    },
    gallium: {
        ingot: <contenttweaker:gallium_ingot>,
        block: <contenttweaker:gallium_block>,
        dust: <contenttweaker:gallium_dust>
    },

    ender_ingot: {
        ingot: <extendedcrafting:material:36>,
        block: <extendedcrafting:storage:5>
    },
    UU_matter: {
        ingot: <tconevo:metal:40>,
        plate: <tconevo:metal:43>,
        gear: <tconevo:metal:44>,
        block: <tconevo:metal_block:8>
    },
    preblack_iron: {
        ingot: <contenttweaker:preblack_ingot>,
        block: <contenttweaker:preblack_ingot> * 9
    },
    black_iron: {
        ingot: <extendedcrafting:material>,
        plate: <extendedcrafting:material:2>,
        rod: <extendedcrafting:material:3>,
        block: <extendedcrafting:storage>
    },

    imperial_steel: {
        ingot: <contenttweaker:imperial_steel_ingot>,
        plate: <contenttweaker:imperial_steel_plate>,
        gear: <contenttweaker:imperial_steel_gear>,
        block: <contenttweaker:imperial_steel_block>
    },

    tunril: {
        ingot: <contenttweaker:tunril_ingot>,
        plate: <contenttweaker:tunril_plate>,
        rod: <contenttweaker:tunril_rod>,
        block: <contenttweaker:tunril_block>
    },
    awaken_uru: {
        ingot: <contenttweaker:awaken_uru_ingot>,
        plate: <contenttweaker:awaken_uru_plate>,
        gear: <contenttweaker:awaken_uru_gear>,
        block: <contenttweaker:awaken_uru_block>,
        dust: <contenttweaker:awaken_uru_dust>
    },


    draconium: {
        ingot: <draconicevolution:draconium_ingot>,
        plate: <moreplates:draconium_plate>,
        gear: <moreplates:draconium_gear>,
        block: <draconicevolution:draconium_block>,

        singularity: <extendedcrafting:singularity_custom:31>
    },
    purple_gold: {
        ingot: <contenttweaker:purple_gold_ingot>,
        block: <contenttweaker:purple_gold_block>
    },

    //blood magic
    sentient: {
        ingot: <tconevo:metal:30>,
        plate: <tconevo:metal:33>,
        gear: <tconevo:metal:34>,
        block: <tconevo:metal_block:6>,
        dust: <tconevo:metal:31>
    },
    blood_bronze: {
        ingot: <bloodtinker:blood_bronze_ingot>,
        plate: <contenttweaker:blood_bronze_plate>,
        gear: <contenttweaker:blood_bronze_gear>,
        block: <bloodtinker:blood_bronze_block>,

        ball: <contenttweaker:blood_bronze_ball>
    },
    bound: {
        ingot: <tconevo:metal:25>,
        plate: <tconevo:metal:28>,
        gear: <tconevo:metal:29>,
        block: <tconevo:metal_block:5>,
        dust: <tconevo:metal:26>
    },
    crystal_metal: {
        ingot: <contenttweaker:crystal_metal_ingot>,
        plate: <contenttweaker:crystal_metal_plate>,
        gear: <contenttweaker:crystal_metal_gear>,
        block: <contenttweaker:crystal_metal_block>
        
    },
    alchemical_brass: {
        ingot: <contenttweaker:alchemical_brass_ingot>,
        plate: <contenttweaker:alchemical_brass_plate>,
        gear: <contenttweaker:alchemical_brass_gear>,
        block: <contenttweaker:alchemical_brass_block>
    },
    living_steel: {
        ingot: <contenttweaker:living_steel_ingot>,
        plate: <contenttweaker:living_steel_plate>,
        gear: <contenttweaker:living_steel_gear>,
        block: <contenttweaker:living_steel_block>
        
    },
    conductive_alloy: {
        ingot: <contenttweaker:conductive_alloy_ingot>,
        plate: <contenttweaker:conductive_alloy_plate>,
        gear: <contenttweaker:conductive_alloy_gear>,
        block: <contenttweaker:conductive_alloy_block>,
        wire: <contenttweaker:conductive_alloy_wire>
    },
    sunlight: {
        ingot: <contenttweaker:light_ingot>,
        plate: <contenttweaker:light_plate>,
        gear: <contenttweaker:light_gear>,
        block: <contenttweaker:light_block>
    },
    acid_resistant_steel: {
        ingot: <contenttweaker:acid_resistant_steel_ingot>,
        plate: <contenttweaker:acid_resistant_steel_plate>,
        gear: <contenttweaker:acid_resistant_steel_gear>,
        block: <contenttweaker:acid_resistant_steel_block>
    },

    // botania things
    mana_absorbing:{
        ingot: <contenttweaker:mana_absorbing_ingot>,
        block: <contenttweaker:mana_absorbing_ingot> * 9
    },
    mana_steel: {
        ingot: <botania:manaresource>,
        plate: <moreplates:manasteel_plate>,
        gear: <moreplates:manasteel_gear>,
        block: <botania:storage>,

        ball: <contenttweaker:mana_steel_ball>
    },
    elementium: {
        ingot: <botania:manaresource:7>,
        plate: <moreplates:elementium_plate>,
        gear: <moreplates:elementium_gear>,
        block: <botania:storage:2>
    },
    terra_steel: {
        ingot: <botania:manaresource:4>,
        plate: <moreplates:terrasteel_plate>,
        gear: <moreplates:terrasteel_gear>,
        block: <botania:storage:1>
    },
    mirion: {
        ingot: <plustic:mirioningot>,
        plate: <moreplates:mirion_plate>,
        gear: <moreplates:mirion_gear>,
        block: <plustic:mirionblock>,

        singularity: <extendedcrafting:singularity_custom:56>
    },
    chlorasteel: {
        ingot: <contenttweaker:chlorasteel_ingot>,
        plate: <contenttweaker:chlorasteel_plate>,
        gear: <contenttweaker:chlorasteel_gear>,
        block: <contenttweaker:chlorasteel_block>
    },
    gem_steel: {
        ingot: <contenttweaker:gem_steel_ingot>,
        plate: <contenttweaker:gem_steel_plate>,
        gear: <contenttweaker:gem_steel_gear>,
        block: <contenttweaker:gem_steel_block>
    },
    mirion2: {
        ingot: <contenttweaker:mirion2_ingot>,
        plate: <contenttweaker:mirion2_plate>,
        rod: <contenttweaker:mirion2_rod>,
        gear: <contenttweaker:mirion2_gear>,
        block: <contenttweaker:mirion2_block>
    },
    orichalcum: {
        ingot: <contenttweaker:orichalcum_ingot>,
        plate: <contenttweaker:orichalcum_plate>,
        gear: <contenttweaker:orichalcum_gear>,
        block: <contenttweaker:orichalcum_block>
    },
    orichalconite: {
        ingot: <contenttweaker:orichalconite_ingot>,
        plate: <contenttweaker:orichalconite_plate>,
        gear: <contenttweaker:orichalconite_gear>,
        block: <contenttweaker:orichalconite_block>
    },
    vibralcum: {
        ingot: <contenttweaker:vibralcum_ingot>,
        plate: <contenttweaker:vibralcum_plate>,
        gear: <contenttweaker:vibralcum_gear>,
        block: <contenttweaker:vibralcum_block>
    },
    death_metal: {
        ingot: <contenttweaker:death_metal_ingot>,
        plate: <contenttweaker:death_metal_plate>,
        gear: <contenttweaker:death_metal_gear>,
        block: <contenttweaker:death_metal_block>,
    },
    

    //astral
    starmetal: {
        ingot: <astralsorcery:itemcraftingcomponent:1>,
        plate: <contenttweaker:starmetal_plate>,
        gear: <contenttweaker:starmetal_gear>,
        block: <contenttweaker:starmetal_block>,

        dust: <astralsorcery:itemcraftingcomponent:2>
    },
    star_alloy: {
        ingot: <contenttweaker:star_alloy_ingot>,
        plate: <contenttweaker:star_alloy_plate>,
        gear: <contenttweaker:star_alloy_gear>,
        block: <contenttweaker:star_alloy_block>
    },
    zirconium: {
        ingot: <contenttweaker:zirconium_gem>,
        block: <contenttweaker:zirconium_block>,
        dust: <contenttweaker:zirconium_dust>,

        singularity: <extendedcrafting:singularity_custom:52>
    },
    nitinol: {
        ingot: <contenttweaker:nitinol_ingot>,
        plate: <contenttweaker:nitinol_plate>,
        rod: <contenttweaker:nitinol_rod>,
        gear: <contenttweaker:nitinol_gear>,
        block: <contenttweaker:nitinol_block>,

        wire: <contenttweaker:nitinol_wire>
    },
    neuronium: {
        ingot: <contenttweaker:neuronium_ingot>,
        plate: <contenttweaker:neuronium_plate>,
        gear: <contenttweaker:neuronium_gear>,
        block: <contenttweaker:neuronium_block>
    },
    fluxed_invar: {
        ingot: <contenttweaker:fluxed_invar_ingot>,
        plate: <contenttweaker:fluxed_invar_plate>,
        gear: <contenttweaker:fluxed_invar_gear>,
        block: <contenttweaker:fluxed_invar_block>
    },
    moon: {
        ingot: <contenttweaker:moon_ingot>,
        plate: <contenttweaker:moon_plate>,
        gear: <contenttweaker:moon_gear>,
        block: <contenttweaker:moon_block>
    },
    beryllium: {
        ingot: <alchemistry:ingot:4>,
        plate: <contenttweaker:beryllium_sheet>,
        block: <contenttweaker:beryllium_block>
    },

    //endgame
    lucky_alloy: {
        ingot: <contenttweaker:lucky_alloy_ingot>,
        plate: <contenttweaker:lucky_alloy_plate>,
        gear: <contenttweaker:lucky_alloy_gear>,
        block: <contenttweaker:lucky_alloy_block>
    },
    neutronium: {
        ingot: <avaritia:resource:4>,
        plate: <moreplates:neutronium_plate>,
        gear: <moreplates:neutronium_gear>,
        block: <avaritia:block_resource>,

        ball: <contenttweaker:neutronium_ball>
    },




    //tconevo and taiga metals
    essence: {
        ingot: <tconevo:metal:15>,
        plate: <tconevo:metal:18>,
        gear: <tconevo:metal:19>,
        block: <tconevo:metal_block:3>,
        dust: <tconevo:metal:16>
    },

    karmesine: {
        ingot: <taiga:karmesine_ingot>,
        block: <taiga:karmesine_block>,
        nugget: <taiga:karmesine_nugget>,
        dust: <taiga:karmesine_dust>
    },
    ovium: {
        ingot: <taiga:ovium_ingot>,
        block: <taiga:ovium_block>,
        nugget: <taiga:ovium_nugget>,
        dust: <taiga:ovium_dust>
    },
    jauxum: {
        ingot: <taiga:jauxum_ingot>,
        block: <taiga:jauxum_block>,
        nugget: <taiga:jauxum_nugget>,
        dust: <taiga:jauxum_dust>
    },
    terrax: {
        ingot: <taiga:terrax_ingot>,
        block: <taiga:terrax_block>,
        nugget: <taiga:terrax_nugget>,
        dust: <taiga:terrax_dust>
    },
    tritonite: {
        ingot: <taiga:tritonite_ingot>,
        block: <taiga:tritonite_block>,
        nugget: <taiga:tritonite_nugget>,
        dust: <taiga:tritonite_dust>
    },

    tiberium: {
        ingot: <taiga:tiberium_ingot>,
        block: <taiga:tiberium_block>,
        nugget: <taiga:tiberium_nugget>,
        dust: <taiga:tiberium_dust>
    },
    triberium: {
        ingot: <taiga:triberium_ingot>,
        block: <taiga:triberium_block>,
        nugget: <taiga:triberium_nugget>,
        dust: <taiga:triberium_dust>
    },
    aurorium: {
        ingot: <taiga:aurorium_ingot>,
        block: <taiga:aurorium_block>,
        nugget: <taiga:aurorium_nugget>,
        dust: <taiga:aurorium_dust>
    },
    prometheum: {
        ingot: <taiga:prometheum_ingot>,
        block: <taiga:prometheum_block>,
        nugget: <taiga:prometheum_nugget>,
        dust: <taiga:prometheum_dust>
    },
    duranite: {
        ingot: <taiga:duranite_ingot>,
        block: <taiga:duranite_block>,
        nugget: <taiga:duranite_nugget>,
        dust: <taiga:duranite_dust>
    },
    vibranium: {
        ingot: <taiga:vibranium_ingot>,
        block: <taiga:vibranium_block>,
        nugget: <taiga:vibranium_nugget>,
        dust: <taiga:vibranium_dust>
    },
    fractum: {
        ingot: <taiga:fractum_ingot>,
        block: <taiga:fractum_block>,
        nugget: <taiga:fractum_nugget>,
        dust: <taiga:fractum_dust>
    },
    violium: {
        ingot: <taiga:violium_ingot>,
        block: <taiga:violium_block>,
        nugget: <taiga:violium_nugget>,
        dust: <taiga:violium_dust>
    },
    ignitz: {
        ingot: <taiga:ignitz_ingot>,
        block: <taiga:ignitz_block>,
        nugget: <taiga:ignitz_nugget>,
        dust: <taiga:ignitz_dust>
    },
    imperomite: {
        ingot: <taiga:imperomite_ingot>,
        block: <taiga:imperomite_block>,
        nugget: <taiga:imperomite_nugget>,
        dust: <taiga:imperomite_dust>
    },
    solarium: {
        ingot: <taiga:solarium_ingot>,
        block: <taiga:solarium_block>,
        nugget: <taiga:solarium_nugget>,
        dust: <taiga:solarium_dust>
    },
    nihilite: {
        ingot: <taiga:nihilite_ingot>,
        block: <taiga:nihilite_block>,
        nugget: <taiga:nihilite_nugget>,
        dust: <taiga:nihilite_dust>
    },
    adamant: {
        ingot: <taiga:adamant_ingot>,
        block: <taiga:adamant_block>,
        nugget: <taiga:adamant_nugget>,
        dust: <taiga:adamant_dust>
    },
    dyonite: {
        ingot: <taiga:dyonite_ingot>,
        block: <taiga:dyonite_block>,
        nugget: <taiga:dyonite_nugget>,
        dust: <taiga:dyonite_dust>
    },
    nucleum: {
        ingot: <taiga:nucleum_ingot>,
        block: <taiga:nucleum_block>,
        nugget: <taiga:nucleum_nugget>,
        dust: <taiga:nucleum_dust>
    },
    lumix: {
        ingot: <taiga:lumix_ingot>,
        block: <taiga:lumix_block>,
        nugget: <taiga:lumix_nugget>,
        dust: <taiga:lumix_dust>
    },
    seismum: {
        ingot: <taiga:seismum_ingot>,
        block: <taiga:seismum_block>,
        nugget: <taiga:seismum_nugget>,
        dust: <taiga:seismum_dust>
    },
    astrium: {
        ingot: <taiga:astrium_ingot>,
        block: <taiga:astrium_block>,
        nugget: <taiga:astrium_nugget>,
        dust: <taiga:astrium_dust>
    },
    niob: {
        ingot: <taiga:niob_ingot>,
        block: <taiga:niob_block>,
        nugget: <taiga:niob_nugget>,
        dust: <taiga:niob_dust>
    },
    dilithium: {
        ingot: <taiga:dilithium_ingot>,
        block: <taiga:dilithium_block>,
        nugget: <taiga:dilithium_nugget>,
        dust: <taiga:dilithium_dust>
    },
    meteorite: {
        ingot: <taiga:meteorite_ingot>,
        block: <taiga:meteorite_block>,
        nugget: <taiga:meteorite_nugget>,
        dust: <taiga:meteorite_dust>
    },
    obsidiorite: {
        ingot: <taiga:obsidiorite_ingot>,
        block: <taiga:obsidiorite_block>,
        nugget: <taiga:obsidiorite_nugget>,
        dust: <taiga:obsidiorite_dust>
    },
    iox: {
        ingot: <taiga:iox_ingot>,
        block: <taiga:iox_block>,
        nugget: <taiga:iox_nugget>,
        dust: <taiga:iox_dust>
    },


    eezo: {
        ingot: <taiga:eezo_ingot>,
        block: <taiga:eezo_block>,
        nugget: <taiga:eezo_nugget>,
        dust: <taiga:eezo_dust>
    },
    osram: {
        ingot: <taiga:osram_ingot>,
        block: <taiga:osram_block>,
        nugget: <taiga:osram_nugget>,
        dust: <taiga:osram_dust>
    },
    valyrium: {
        ingot: <taiga:valyrium_ingot>,
        block: <taiga:valyrium_block>,
        nugget: <taiga:valyrium_nugget>,
        dust: <taiga:valyrium_dust>
    },
    abyssum: {
        ingot: <taiga:abyssum_ingot>,
        block: <taiga:abyssum_block>,
        nugget: <taiga:abyssum_nugget>,
        dust: <taiga:abyssum_dust>
    },
    uru: {
        ingot: <taiga:uru_ingot>,
        block: <taiga:uru_block>,
        nugget: <taiga:uru_nugget>,
        dust: <taiga:uru_dust>
    },
    yrdeen: {
        ingot: <taiga:yrdeen_ingot>,
        plate: <contenttweaker:yrdeen_plate>,
        gear: <contenttweaker:yrdeen_gear>,
        block: <taiga:yrdeen_block>,
        nugget: <taiga:yrdeen_nugget>,
        dust: <taiga:yrdeen_dust>
    },
    proxii: {
        ingot: <taiga:proxii_ingot>,
        plate: <contenttweaker:proxii_plate>,
        gear: <contenttweaker:proxii_gear>,
        block: <taiga:proxii_block>,
        nugget: <taiga:proxii_nugget>,
        dust: <taiga:proxii_dust>,

        ball: <contenttweaker:proxii_ball>
    },

    //mystical agric
    mystical_base: {
        ingot: <mysticalagriculture:crafting:32>,
        block: <mysticalagriculture:ingot_storage>
    },
    mystical_metal0: {
        ingot: <mysticalagriculture:crafting:33>,
        plate: <moreplates:inferium_plate>,
        gear: <moreplates:inferium_gear>,
        block: <mysticalagriculture:ingot_storage:1>,
    },
    mystical_metal1: {
        ingot: <mysticalagriculture:crafting:34>,
        plate: <moreplates:prudentium_plate>,
        gear: <moreplates:prudentium_gear>,
        block: <mysticalagriculture:ingot_storage:2>,
    },
    mystical_metal2: {
        ingot: <mysticalagriculture:crafting:35>,
        plate: <moreplates:intermedium_plate>,
        gear: <moreplates:intermedium_gear>,
        block: <mysticalagriculture:ingot_storage:3>,
    },
    mystical_metal3: {
        ingot: <mysticalagriculture:crafting:36>,
        plate: <moreplates:superium_plate>,
        gear: <moreplates:superium_gear>,
        block: <mysticalagriculture:ingot_storage:4>,
    },
    mystical_metal4: {
        ingot: <mysticalagriculture:crafting:37>,
        plate: <moreplates:supremium_plate>,
        gear: <moreplates:supremium_gear>,
        block: <mysticalagriculture:ingot_storage:5>,
    },
    mystical_metal5: {
        ingot: <mysticalagradditions:insanium:2>,
        plate: <moreplates:insanium_plate>,
        gear: <moreplates:insanium_gear>,
        block: <mysticalagradditions:storage:1>
    },

    soulium: {
        ingot: <mysticalagriculture:crafting:38>,
        plate: <moreplates:soulium_plate>,
        gear: <moreplates:soulium_gear>,
        block: <mysticalagriculture:ingot_storage:6>
    },

    // non metals
    modularium_paste: {
        ingot: <contenttweaker:modularium_paste>
    },
    basic_modularium: {
        ingot: <contenttweaker:basic_modularium>
    },
    modularium: {
        ingot: <modularmachinery:itemmodularium>
    },
    menril_berry: {
        ingot: <integrateddynamics:menril_berries>,
        dust: <integrateddynamics:menril_berries>
    },
    resin: {
        ingot: <thermalfoundation:material:832>,
        dust: <thermalfoundation:material:832>
    },
    balsam_resin: {
        ingot: <erebus:materials:40>,
        dust: <erebus:materials:40>
    },
    clay: {
        ingot: <minecraft:clay_ball>
    },
    seared: {
        ingot: <tconstruct:materials>
    },
    obsidian: {
        ingot: <minecraft:obsidian>,
        block: <minecraft:obsidian> * 9
    },
    melodic_paste: {
        ingot: <contenttweaker:melodic_paste>,
        block: <contenttweaker:melodic_paste> * 9
    },
    lightning_cell: {
        ingot: <contenttweaker:lightning_cell>,
        block: <contenttweaker:lightning_cell> * 9
    },

    // dusts
    redstone: {
        ingot: <minecraft:redstone>,
        block: <minecraft:redstone_block>,
        dust: <minecraft:redstone>,

        singularity: <extendedcrafting:singularity:3>
    },
    electrotine: {
        ingot: <projectred-core:resource_item:105>,
        block: <projectred-core:resource_item:105> * 9,
        dust: <projectred-core:resource_item:105>
    },
    glowstone: {
        ingot: <minecraft:glowstone_dust>,
        block: <minecraft:glowstone>,
        dust: <minecraft:glowstone_dust>,

        singularity: <extendedcrafting:singularity:4>
    },
    glowcrystal: {
        ingot: <contenttweaker:glowcrystal>,
        block: <contenttweaker:glowcrystal> * 9
    },
    silicon: {
        ingot: <appliedenergistics2:material:5>,
        block: <appliedenergistics2:material:5> * 9,
        dust: <appliedenergistics2:material:5>
    },
    solar_silicon: {
        ingot: <contenttweaker:solar_silicon>,
        block: <contenttweaker:solar_silicon> * 9,
        dust: <contenttweaker:solar_silicon>
    },
    energized_compound: {
        ingot: <contenttweaker:energized_compound>,
        dust: <contenttweaker:energized_compound>,
        block: <contenttweaker:energized_compound> * 9
    },
    gambrosium: {
        ingot: <contenttweaker:gambrosium_dust>,
        dust: <contenttweaker:gambrosium_dust>,
        block: <contenttweaker:gambrosium_dust> * 9
    },

    prescience: {
        ingot: <enderio:item_material:34>,
        dust: <enderio:item_material:34>,
        block: <enderio:item_material:34> * 9
    },
    

    singularity: {
        ingot: <contenttweaker:singularity_dust>,
        dust: <contenttweaker:singularity_dust>,
        block: <contenttweaker:singularity_dust> * 9
    },

    // gems
    flint: {
        ingot: <minecraft:flint>,
        block: <excompressum:compressed_block:5>,

        singularity: <extendedcrafting:singularity_custom:1>
    },
    coal: {
        ingot: <minecraft:coal>,
        block: <minecraft:coal_block>,
        dust: <thermalfoundation:material:768>,

        singularity: <extendedcrafting:singularity>
    },
    diamond: {
        ingot: <minecraft:diamond>,
        plate: <moreplates:diamond_plate>,
        gear: <thermalfoundation:material:26>,
        block: <minecraft:diamond_block>,
        dust: <mekanism:otherdust>,

        singularity: <extendedcrafting:singularity:6>
    },
    emerald: {
        ingot: <minecraft:emerald>,
        plate: <moreplates:emerald_plate>,
        gear: <thermalfoundation:material:27>,
        block: <minecraft:emerald_block>,
        dust: <prodigytech:emerald_dust>,

        singularity: <extendedcrafting:singularity:7>
    },
    lapis: {
        ingot: <minecraft:dye:4>,
        block: <minecraft:lapis_block>,
        dust: <enderio:item_material:32>,

        singularity: <extendedcrafting:singularity:2>
    },
    jade: {
        ingot: <erebus:materials:1>,
        block: <erebus:jade_block>,
        dust: <contenttweaker:jade_dust>
    },
    redgem: {
        ingot: <erebus:materials:11>
    },
    cincinnasite: {
        ingot: <betternether:cincinnasite>,
        block: <betternether:cincinnasite_block>
    },
    biotide: {
        ingot: <quark:biotite>,
        block: <quark:biotite> * 9
    },

    // quartz
    black_quartz: {
        ingot: <actuallyadditions:item_misc:5>,
        block: <actuallyadditions:block_misc:2>,
        dust: <actuallyadditions:item_dust:7>
    },
    certus: {
        ingot: <appliedenergistics2:material>,
        block: <appliedenergistics2:quartz_block>,
        dust: <appliedenergistics2:material:2>
    },
    fluix: {
        ingot: <appliedenergistics2:material:7>,
        block: <appliedenergistics2:fluix_block>,
        dust: <appliedenergistics2:material:8>
    },

    //drops
    purple_slime: {
        ingot: <tconstruct:edible:2>
    },
    blood: {
        ingot: <tconstruct:edible:3>,
        block: <tconstruct:slime:3>
    },
    molten_core: {
        ingot: <xreliquary:mob_ingredient:7>,
        block: <xreliquary:mob_ingredient:7> * 9
    },

    dragon_breath: {
        ingot: <minecraft:dragon_breath>,
        block: <minecraft:dragon_breath> * 9,
        dust: <minecraft:dragon_breath>
    },

    iron_heart: {
        ingot: <contenttweaker:iron_heart>,
        block: <contenttweaker:iron_heart> * 9
    },

    petals: {
        ingot: <roots:petals>,
        block: <roots:petals> * 9,
        dust: <roots:petals>
    },
    plant_sample: {
        ingot: <contenttweaker:plant_sample>,
        block: <contenttweaker:plant_sample> * 9
    }
};
static all_metals_molten as ILiquidStack[string] = {
    iron: <liquid:iron>,
    copper: <liquid:copper>,
    tin: <liquid:tin>,
    bronze: <liquid:bronze>,
    pigiron: <liquid:pigiron>,
    knightslime: <liquid:knightslime>,

    aluminum: <liquid:aluminum>,
    nickel: <liquid:nickel>,
    zinc: <liquid:zinc>,

    ferramic: <liquid:ferramic>,
    constantan: <liquid:constantan>,
    invar: <liquid:invar>,
    steel: <liquid:steel>,
    alumite: <liquid:alumite>,
    duraluminum: <liquid:duraluminum>,
    watertight_steel: <liquid:watertight_steel>,
    alubrass: <liquid:alubrass>,
    nial: <liquid:nial>,

    cobalt: <liquid:cobalt>,
    ardite: <liquid:ardite>,
    manyullyn: <liquid:manyullyn>,
    wear_resistant_alloy: <liquid:wear_resistant_alloy>,

    gold: <liquid:gold>,
    silver: <liquid:silver>,
    lead: <liquid:lead>,
    osmium: <liquid:osmium>,

    electrum: <liquid:electrum>,
    lesmium: <liquid:lesmium>,

    demon: <liquid:xu_demonic_metal>,
    angel: <liquid:angel>,
    enchanted: <liquid:xu_enchanted_metal>,
    evil: <liquid:xu_evil_metal>,

    electric_steel: <liquid:electrical_steel>,
    thermal_steel: <liquid:thermal>,

    lumium: <liquid:lumium>,
    signalum: <liquid:signalum>,
    enderium: <liquid:enderium>,
    
    electric_manyullyn_base: <liquid:electric_manyullyn_base>,
    electric_manyullyn: <liquid:electric_manyullyn>,

    platinum: <liquid:platinum>,
    iridium: <liquid:iridium>,
    titanium: <liquid:titanium>,
    tungsten: <liquid:tungsten>,
    uranium: <liquid:uranium>,
    yellorium: <liquid:yellorium>,

    mithril: <liquid:mithril>,
    chrome: <liquid:chrome>,
    neodymium: <liquid:neodymium>,
    
    mekanized_steel: <liquid:mekanized_steel>,

    refined_obsidian: <liquid:refinedobsidian>,
    refined_glowstone: <liquid:refinedglowstone>,
    osgloglass: <liquid:osgloglas>,
    osmiridium: <liquid:osmiridium>,
    osgloridium: <liquid:osgloridium>, 

    fluix_steel: <liquid:fluix_steel>,

    fiery: <liquid:fierymetal>,
    knight: <liquid:knightmetal>,

    black_bronze: <liquid:black_bronze>,
    medical_alloy: <liquid:medical_alloy>,

    conductive_iron: <liquid:conductive_iron>,
    redstone_alloy: <liquid:redstone_alloy>,
    pulsating_alloy: <liquid:pulsating_iron>,
    soularium: <liquid:soularium>,

    dark_steel: <liquid:dark_steel>,
    end_steel: <liquid:end_steel>,
    melodic_alloy: <liquid:melodic_alloy>,
    stellar_alloy: <liquid:stellar_alloy>,

    energetic_gold1: <liquid:energetic_alloy>,
    energetic_gold2: <liquid:vibrant_alloy>,
    energetic_silver1: <liquid:energetic_silver>,
    energetic_silver2: <liquid:vivid_alloy>,

    crystalline_alloy: <liquid:crystalline_alloy>,
    crystalline_pink_slime: <liquid:crystalline_pink_slime>,

    tignalum: <liquid:tignalum>,

    arkenium: <liquid:arkenium>,
    gallium: <liquid:gallium>,

    UU_matter: <liquid:universal_metal>,

    sentient: <liquid:sentient_metal>,
    blood_bronze: <liquid:bloodbronze>,
    bound: <liquid:bound_metal>,

    mana_steel: <liquid:manasteel>,
    elementium: <liquid:elementium>,
    terra_steel: <liquid:terrasteel>,
    mirion: <liquid:mirion>,

    gem_steel: <liquid:gem_steel>,
    mirion2: <liquid:mirion2>,
    orichalcum: <liquid:orichalcum>,

    draconium: <liquid:draconium>,
    starmetal: <liquid:starmetal>,
    zirconium: <liquid:zirconium>,

    //taiga
    karmesine: <liquid:karmesine_fluid>,
    ovium: <liquid:ovium_fluid>,
    jauxum: <liquid:jauxum_fluid>,
    terrax: <liquid:terrax_fluid>,
    tritonite: <liquid:tritonite_fluid>,
    palladium: <liquid:palladium_fluid>,

    tiberium: <liquid:tiberium_fluid>,
    triberium: <liquid:triberium_fluid>,
    aurorium: <liquid:aurorium_fluid>,
    prometheum: <liquid:prometheum_fluid>,
    duranite: <liquid:duranite_fluid>,
    vibranium: <liquid:vibranium_fluid>,
    fractum: <liquid:fractum_fluid>,
    violium: <liquid:violium_fluid>,
    ignitz: <liquid:ignitz_fluid>,
    imperomite: <liquid:imperomite_fluid>,
    solarium: <liquid:solarium_fluid>,
    nihilite: <liquid:nihilite_fluid>,
    adamant: <liquid:adamant_fluid>,
    dyonite: <liquid:dyonite_fluid>,
    nucleum: <liquid:nucleum_fluid>,
    lumix: <liquid:lumix_fluid>,
    seismum: <liquid:seismum_fluid>,
    astrium: <liquid:astrium_fluid>,
    niob: <liquid:niob_fluid>,
    dilithium: <liquid:dilithium_fluid>,
    meteorite: <liquid:meteorite_fluid>,
    obsidiorite: <liquid:obsidiorite_fluid>,
    iox: <liquid:iox_fluid>,

    eezo: <liquid:eezo_fluid>,
    osram: <liquid:osram_fluid>,
    valyrium: <liquid:valyrium_fluid>,
    abyssum: <liquid:abyssum_fluid>,
    uru: <liquid:uru_fluid>,
    yrdeen: <liquid:yrdeen_fluid>,
    proxii: <liquid:proxii_fluid>,

    mystical_metal0: <liquid:inferium>,
    mystical_metal1: <liquid:prudentium>,
    mystical_metal2: <liquid:intermedium>,
    mystical_metal3: <liquid:superium>,
    mystical_metal4: <liquid:supremium>
};
static metals_to_clean as string[] = [
    "iron", "copper", "tin", "bronze",
    "aluminum", "nickel",
    "invar", "constantan", "steel", "alumite",
    "gold", "silver", "lead", "osmium",
    "electrum", "pigiron", "knightslime",

    "cobalt", "ardite", "manyullyn",

    "demon", "enchanted", "evil",
    "electric_steel", 
    "red_alloy", "blue_alloy", 

    "lumium", "signalum", "fluxed_electrum",
    "platinum", "iridium", "mithril", "enderium",
    "osmiridium",

    "refined_obsidian",
    "refined_glowstone",
    "osgloglass",

    "uranium",

    "ironwood", "knight", "fiery", 

    "conductive_iron", "redstone_alloy", "pulsating_alloy", "soularium",
    "dark_steel", "end_steel", "melodic_alloy", "stellar_alloy",
    
    "energetic_gold1", "energetic_gold2", "energetic_silver1", "energetic_silver2",
    "crystalline_alloy", "crystalline_pink_slime",

    "gallium",

    "sentient", "bound", "essence",

    "mana_steel", "elementium", "terra_steel", "mirion",

    "draconium",

    "neutronium",

    "mystical_metal0",
    "mystical_metal1",
    "mystical_metal2",
    "mystical_metal3",
    "mystical_metal4",
    "mystical_metal5",
    "soulium",
    
    "diamond", "emerald",

    "black_quartz", "certus", "fluix"
];
static custom_metals as string[] = [
    "zinc", "duraluminum",
    "lesmium", "nial", "wear_resistant_alloy",
    "watertight_steel",
    "angel",
    "thermal_steel",
    "electric_manyullyn_base", "electric_manyullyn",
    "mekanized_steel", 
    "osmiridium",
    "gastight_steel","chrome", "neodymium",
    "fluix_steel", "menril_steel", "medical_alloy",
    "arkenium", "gallium", "UU_matter",
    "black_bronze", "tinezo", "tignalum", "orichalcum",
    "gem_steel", "mirion2"
];


//Press.addRecipe(IItemStack output, IIngredient input, IItemStack mold, int energy, @Optional int inputSize);
static IE_molds as IItemStack[string] = {
    plate: <contenttweaker:plate_mold>,
    gear: <contenttweaker:gear_mold>,
    wire: <immersiveengineering:mold:4>,
    rod: <contenttweaker:rod_mold>
};


function add2alloy(
    alloy_level as int, alloy as string, alloyn as int, 
    metal1 as string, n1 as int, 
    metal2 as string, n2 as int){
    //todo modded alloyers

    if (alloy_level <= 1){
        //try adding dust recipe
        if (9 - alloy_level >= n1 + n2){
            //todo lvl1 alloys with book
            if ((all_metals[alloy].keys has "dust")&&(all_metals[metal1].keys has "dust")&&(all_metals[metal2].keys has "dust")){
                var ing as IItemStack[int] = {};
                for i in 0 to n1{
                    ing[i] = all_metals[metal1].dust;
                }
                for i in 0 to n2{
                    ing[n1 + i] = all_metals[metal2].dust;
                }
                recipes.addShapeless(
                    "ia_dust_alloying_" + metal1 + "_" + metal2,
                    all_metals[alloy].dust * alloyn,
                    ing.values  
                );
            }
        }

        //try adding molten recipe
        if ((all_metals_molten.keys has alloy)&&(all_metals_molten.keys has metal1)&&(all_metals_molten.keys has metal2)){
            Alloy.addRecipe( all_metals_molten[alloy] * (8 * alloyn), [
                all_metals_molten[metal1] * (8 * n1),
                all_metals_molten[metal2] * (8 * n2)
            ] );
        }
    }

    if (alloy_level <= 4){
        //>
        TEAlloyer.addRecipe(
            all_metals[alloy].ingot * alloyn, 
            all_metals[metal1].ingot * n1,
            all_metals[metal2].ingot * n2,
            2000 * (alloy_level + 1)
        );
        mods.enderio.AlloySmelter.addRecipe(all_metals[alloy].ingot * alloyn, 
            [
                all_metals[metal1].ingot * n1,
                all_metals[metal2].ingot * n2
            ], 5000 * (alloy_level + 1)
        );
    }

    scripts.helper.addHighOvenAlloy(
        "ho_" + alloy, alloy_level,
        [all_metals[alloy].ingot * alloyn] as IItemStack[],
        [
            all_metals[metal1].ingot * n1,
            all_metals[metal2].ingot * n2
        ] as IItemStack[]
    );
}

function add3alloy(
    alloy_level as int, alloy as string, alloyn as int, 
    metal1 as string, n1 as int, 
    metal2 as string, n2 as int,
    metal3 as string, n3 as int){
    
    if (alloy_level <= 1){
        //try adding dust recipe >
        if (9 - alloy_level >= n1 + n2 + n3){
            //todo lvl1 alloys with book
            if ((all_metals[alloy].keys has "dust")&&
            (all_metals[metal1].keys has "dust")&&
            (all_metals[metal2].keys has "dust")&&
            (all_metals[metal3].keys has "dust")){
                var ing as IItemStack[int] = {};
                for i in 0 to n1{
                    ing[i] = all_metals[metal1].dust;
                }
                for i in 0 to n2{
                    ing[n1 + i] = all_metals[metal2].dust;
                }
                for i in 0 to n3{
                    ing[n1 + n2 + i] = all_metals[metal3].dust;
                }
                recipes.addShapeless(
                    "ia_dust_alloying_" + metal1 + "_" + metal2 + "_" + metal3,
                    all_metals[alloy].dust * alloyn,
                    ing.values  
                );
            }
        }

        //try adding molten recipe
        if ((all_metals_molten.keys has alloy)&&(all_metals_molten.keys has metal1)&&(all_metals_molten.keys has metal2)&&(all_metals_molten.keys has metal3)){
            Alloy.addRecipe( all_metals_molten[alloy] * (8 * alloyn), [
                all_metals_molten[metal1] * (8 * n1),
                all_metals_molten[metal2] * (8 * n2),
                all_metals_molten[metal3] * (8 * n3)
            ] );
        }
    }

    mods.enderio.AlloySmelter.addRecipe(all_metals[alloy].ingot * alloyn, 
        [
            all_metals[metal1].ingot * n1,
            all_metals[metal2].ingot * n2,
            all_metals[metal3].ingot * n3
        ], 8000 * (alloy_level + 1)
    );

    scripts.helper.addHighOvenAlloy(
        "ho_" + alloy + metal1 + metal2 + metal3, alloy_level,
        [all_metals[alloy].ingot * alloyn] as IItemStack[],
        [
            all_metals[metal1].ingot * n1,
            all_metals[metal2].ingot * n2,
            all_metals[metal3].ingot * n3
        ] as IItemStack[]
    );
}


function addPlate(ingot as IItemStack, plate as IItemStack){
    recipes.addShaped(
        "ingot_to_plate_ct_" + ingot.displayName,
        plate,
        [[null, <moreplates:hammer>.anyDamage().transformDamage(), null],
        [ingot, ingot, ingot],
        [ingot, ingot, ingot]]
    );

    IEPress.addRecipe(plate, ingot, IE_molds.plate, 2000, 4);
    TEPress.addStorageRecipe(plate, ingot * 4, 1500);
}
function addRod(ingot as IItemStack, rod as IItemStack, block as IItemStack){
    recipes.addShaped(
        "ingot_to_rod_ct_" + ingot.displayName,
        rod,
        [[null, ingot, ingot],
        [<moreplates:hammer>.anyDamage().transformDamage(), ingot, ingot],
        [null, ingot, ingot]]
    );

    PTsaw.addRecipe(block, rod * 2);
    TEsaw.addRecipe(rod, ingot * 3, 1500);
    IEPress.addRecipe(rod, ingot, IE_molds.rod, 2000, 3);
}
function addGear(ingot as IItemStack, block as IItemStack, gear as IItemStack){
    recipes.addShaped(
        "ingot_to_gear_ct_" + ingot.displayName,
        gear,
        [[<moreplates:hammer>.anyDamage().transformDamage(), ingot, null],
        [ingot, block, ingot],
        [null, ingot, null]]
    );
    IEPress.addRecipe(gear, ingot, IE_molds.gear, 2000, 8);
    TEPress.addGearRecipe(gear, ingot * 8, 1500);
}
function addWire(ingot as IItemStack, plate as IItemStack, wire as IItemStack){
    recipes.addShapeless(
        "plate_to_wire_ct_" + plate.name,
        wire * 2,
        [plate, <immersiveengineering:tool:1>]
    );
    IEPress.addRecipe(wire, ingot, IE_molds.wire, 2000);
    TEsaw.addRecipe(wire * 4, plate, 2500);
}

function addBall(ingot as IItemStack, ball as IItemStack){
    recipes.addShaped("ia_ball_" ~ ingot.displayName, ball * 24, [
        [<contenttweaker:porous_dust>, ingot, <contenttweaker:porous_dust>],
        [ingot, ingot, ingot],
        [<contenttweaker:porous_dust>, ingot, <contenttweaker:porous_dust>]
    ]);
}

//mods.tconstruct.Casting.addTableRecipe(IItemStack output, IIngredient cast, ILiquidStack fluid, int amount, @Optional boolean consumeCast, @Optional int time);



//mods.tconstruct.Casting.addBasinRecipe(IItemStack output, IIngredient cast, ILiquidStack fluid, int amount, @Optional boolean consumeCast, @Optional int time);
function addCasting(metal as IItemStack[string], molten as ILiquidStack){
    Casting.addTableRecipe(metal.ingot, <tconstruct:cast_custom>, molten, 144, false);
    Casting.addBasinRecipe(metal.block, null, molten, 1296);

    Melting.addRecipe(molten * 144, metal.ingot, 700);
    if (metal.keys has "dust") {Melting.addRecipe(molten * 144, metal.dust, 500);}
    Melting.addRecipe(molten * 1296, metal.block, 1000);

    mods.thermalexpansion.Crucible.addRecipe(molten * 144, metal.ingot, 4000);
    if (metal.keys has "dust") {mods.thermalexpansion.Crucible.addRecipe(molten * 144, metal.dust, 4000);}
    mods.thermalexpansion.Crucible.addRecipe(molten * 1296, metal.block, 32000);
}
function addAll(mat as IItemStack[string]){
    val ingot as IItemStack = mat.ingot;
    val block as IItemStack = mat.block;

    for key in mat{
        if (key == "plate"){
            addPlate(ingot, mat.plate);
        }
        if (key == "wire"){
            addWire(mat.ingot, mat.plate, mat.wire);
        }
        
        if (key == "rod"){
            addRod(ingot, mat.rod, block);
        }
        if (key == "gear"){
            addGear(ingot, block, mat.gear);
        }
        if (key == "ball"){
            addBall(ingot, mat.ball);
        }
    }
}
function finalizeMetal(metal as string){
    if (all_metals[metal].keys has "dust"){
        furnace.addRecipe(all_metals[metal].ingot, all_metals[metal].dust);

        scripts.helper.addSimpleCrushingRecipe(all_metals[metal].ingot, all_metals[metal].dust);

    }
    if (all_metals_molten.keys has metal){
        addCasting(all_metals[metal], all_metals_molten[metal]);
    }
}



{//main part
    print("[IA] removing old metalworks");
    print("[IA] cleaning moar plates");
    recipes.removeByMod("moreplates");

    recipes.remove(<extendedcrafting:material:2>);
    recipes.remove(<extendedcrafting:material:3>);

    recipes.addShaped(
        "plate_hammer_recipe_blocks",
        <moreplates:hammer>,
        [[<minecraft:iron_block>, <ore:ingotBronze>, <minecraft:iron_block>],
        [null, <ore:stickWood>, null],
        [null, <ore:stickWood>, null]]
    );
    recipes.addShaped(
        "plate_hammer_recipe_plates",
        <moreplates:hammer>,
        [[<ore:plateIron>, <ore:ingotBronze>, <ore:plateIron>],
        [null, <ore:stickWood>, null],
        [null, <ore:stickWood>, null]]
    );

    for metal in metals_to_clean {
        print("[IA] cleaning " + metal);
        if (all_metals[metal].keys has "plate") {
            TEPress.removeStorageRecipe(all_metals[metal].ingot);
        }
        if (all_metals[metal].keys has "gear") {
            TEPress.removeGearRecipe(all_metals[metal].ingot);
        }
    }
    for metal in custom_metals {
        print("[IA] finalizing " + metal);
        finalizeMetal(metal);
    }
    TEPress.removeGearRecipe(all_metals.ferramic.ingot);

    IEPress.removeRecipeByMold(IE_molds.wire);


    for ore in <ore:plate*> {
        if (ore.name != "plateCarbon") {
            recipes.remove(ore);
            Casting.removeTableRecipe(ore.firstItem);
        }
    }
    for ore in <ore:stick*> {
        if ((ore.name != "stickWood")&&(ore.name != "stickStone")&&(ore.name != "stickTreatedWood")) {recipes.remove(ore); }
    }
    for ore in <ore:gear*> {
        if (ore.name != "gearRedstone") {
            recipes.remove(ore);
            Casting.removeTableRecipe(ore.firstItem);
        }
    }

    //print("[IA] removing metal press recipes");

    print("[IA] removing ie wires");
    recipes.remove(all_metals.copper.wire);
    recipes.remove(all_metals.electrum.wire);
    recipes.remove(all_metals.aluminum.wire);
    recipes.remove(all_metals.steel.wire);

    for ball in [
        "electric_steel", //<enderio:item_alloy_ball>,
		"conductive_iron", //<enderio:item_alloy_ball:1>,
		"redstone_alloy", //<enderio:item_alloy_ball:2>,
		"pulsating_alloy", //<enderio:item_alloy_ball:3>,
		"soularium", //<enderio:item_alloy_ball:4>,
		"dark_steel", //<enderio:item_alloy_ball:5>,
        "end_steel",
        "melodic_alloy",
        "stellar_alloy",
        "energetic_gold1",
        "energetic_gold2",
        "energetic_silver1",
        "energetic_silver2",

        "crystalline_alloy",
        "crystalline_pink_slime",

        "signalum",
        "lumium",
        "enderium"
    
    ] as string[]{
        recipes.remove(all_metals[ball].ball);
        Melting.removeRecipe(all_metals_molten[ball], all_metals[ball].ball);
        Casting.removeTableRecipe(all_metals[ball].ball);
    }

    //deleting useless
    Melting.removeRecipe(<liquid:construction_alloy>);
    Melting.removeRecipe(<liquid:crude_steel>);
    recipes.remove(<enderio:item_alloy_ball:9>);
    recipes.remove(<enderio:item_alloy_endergy_ball>);
    

    print("[IA] starting adding metalworks");
    for metal in all_metals {
        addAll(all_metals[metal]);

        if (all_metals_molten has metal) {
            mods.thermalexpansion.Transposer.addFillRecipe(
                all_metals[metal].ingot, <contenttweaker:empty_ingot>, 
                all_metals_molten[metal] * 144, 
                2000
            );
        }
    }
    print("[IA] added components, adding molten and dust recipes");

    
    addCasting(all_metals.duraluminum, all_metals_molten.duraluminum);

    addCasting(all_metals.zinc, all_metals_molten.zinc);

    print("[IA] ending adding metalworks");

}

recipes.addShaped("ia_wooden_gear", <thermalfoundation:material:22>, [
    [<ore:stickWood>, <ore:plankWood>, <ore:stickWood>],
    [<ore:plankWood>, null, <ore:plankWood>],
    [<ore:stickWood>, <ore:plankWood>, <ore:stickWood>]
]);



//alloys

{//early game
    add3alloy(1, "pigiron", 4, 
        "iron", 4,
        "clay", 2,
        "blood", 1
    );
    add3alloy(1, "knightslime", 1,
        "iron", 1,
        "purple_slime", 1,
        "seared", 4
    );

    scripts.helper.addFluidAlloyerRecipe(
        <tconstruct:ingots:4> * 2, 
        <minecraft:iron_ingot> * 2, <minecraft:clay_ball>, <liquid:blood> * 80, 
        32, 10
    );

    add2alloy(0, "nial", 4,
        "nickel", 3,
        "aluminum", 1
    );

    add2alloy(0, "lesmium", 2, 
        "lead", 1,
        "osmium", 1
    );
    mods.immersiveengineering.AlloySmelter.addRecipe(
        <contenttweaker:lesmium_ingot> * 2, 
        <thermalfoundation:material:131>,
        <mekanism:ingot:1>,
            200
    );

    {//watertight_steel
        add3alloy(0, "watertight_steel", 2,
            "steel", 2,
            "bronze", 2,
            "lapis", 1
        );
        add3alloy(0, "watertight_steel", 3,
            "steel", 2,
            "bronze", 2,
            "resin", 1
        );
        add3alloy(0, "watertight_steel", 5,
            "steel", 2,
            "bronze", 2,
            "balsam_resin", 1
        );
    }

    add2alloy(0, "wear_resistant_alloy", 5,
        "cobalt", 2,
        "zinc", 3
    );
    add3alloy(1, "duraluminum", 6,
        "steel", 4,
        "alumite", 2,
        "copper", 1
    );
}

mods.thermalexpansion.Crucible.addRecipe(<liquid:electrotine> * 250, <projectred-core:resource_item:105>, 1000);

addCasting(all_metals.ferramic, <liquid:ferramic>);

add3alloy(1, "flower_steel", 4,
    "zorra_steel", 1,
    "plant_sample", 2,
    "petals", 8
);

{//extra ut
    recipes.addShapeless("compound_metal_stack_main", <contenttweaker:compound_metal_stack> * 2, [
        <liquid:malachite_glue> * 1000,
        <tconstruct:ingots:5>, 
        <extrautils2:ingredients:12>,
        <contenttweaker:watertight_steel_ingot>
    ]);
    recipes.addShapeless("compound_metal_stack_2", <contenttweaker:compound_metal_stack> * 4, [
        <liquid:malachite_glue> * 1000,
        <tconstruct:ingots:5>, 
        <extrautils2:ingredients:12>,
        <contenttweaker:watertight_steel_ingot>,
        <contenttweaker:creosolon> | <contenttweaker:mushroomite_ingot> | <exnihilocreatio:item_ore_tungsten:3> | <industrialforegoing:pink_slime_ingot>
    ]);


    scripts.content_machines.addFluidMixerRecipe(<liquid:malachite_glue> * 1000, 
        <liquid:canolaoil> * 500, <liquid:witchwater> * 1000, 
        <contenttweaker:malachite_polycrystal>, 
        120, 80
    );
    mods.thermalexpansion.Imbuer.addRecipe(<liquid:malachite_glue> * 1000, <contenttweaker:gelatin>, <liquid:rich_malachite_solution> * 250, 4000);

    mods.tconstruct.Casting.addTableRecipe(<contenttweaker:compound_metal>, <contenttweaker:compound_metal_stack>, <liquid:electrical_steel>, 288, true);
    TEAlloyer.addRecipe(
        <contenttweaker:compound_metal>, 
        <contenttweaker:compound_metal_stack>,
        <enderio:item_alloy_ingot>,
        3000
    );
}



{//thermal
    recipes.addShapeless("ia_manyullyn_dust", <contenttweaker:manyullyn_dust> * 2, [<ore:dustCobalt>, <ore:dustArdite>]);

    {//thermal_steel
        recipes.addShapeless("ia_thermal_paste", <contenttweaker:thermal_paste_base> * 8, 
            [<contenttweaker:manyullyn_dust>, <contenttweaker:jade_dust>, <ore:dustZinc>, 
            <contenttweaker:industrial_clay>, <erebus:materials:40>, <erebus:materials:40>, <contenttweaker:hot_energion>]
        );
        mods.tconstruct.Casting.addTableRecipe(
            <contenttweaker:thermal_paste>, <contenttweaker:thermal_paste_base>, 
            <liquid:honey>, 250, 
            true
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <contenttweaker:thermal_paste>, 
            <contenttweaker:thermal_paste_base>, 
            <liquid:honey> * 250, 1000
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <contenttweaker:compound_metal2>, 
            <contenttweaker:compound_metal>, 
            <liquid:formic_acid> * 400, 1000
        );
        add3alloy(1, "thermal_steel", 8,
            "thermal_paste", 12,
            "duraluminum", 3,
            "compound_metal", 2
        );
    }

    {//simple alloys
            
        scripts.helper.addHighOvenAlloy(
            "bronze_ho" as string, 0,
            [all_metals.bronze.ingot * 4] as IItemStack[],
            [
                all_metals.copper.ingot * 3,
                all_metals.tin.ingot
            ] as IItemStack[]
        );
        scripts.helper.addHighOvenAlloy(
            "electrum_ho" as string, 0,
            [all_metals.electrum.ingot * 2] as IItemStack[],
            [
                all_metals.gold.ingot,
                all_metals.silver.ingot
            ] as IItemStack[]
        );
        add3alloy(1, "alumite", 3,
            "aluminum", 5,
            "iron", 2,
            "obsidian", 1
        );
        scripts.helper.addHighOvenAlloy(
            "alumite_ho" as string, 0,
            [all_metals.alumite.ingot * 3] as IItemStack[],
            [
                all_metals.aluminum.ingot * 5,
                all_metals.iron.ingot * 2,
                <minecraft:obsidian>
            ] as IItemStack[]
        );


        add2alloy(1, "red_alloy", 1,
            "copper", 1,
            "redstone", 4
        );
        add2alloy(1, "blue_alloy", 1,
            "zinc", 1,
            "electrotine", 4
        );
        mods.immersiveengineering.AlloySmelter.addRecipe(
            <projectred-core:resource_item:104>, 
            <contenttweaker:zinc_ingot>,
            <projectred-core:resource_item:105> * 4,
            200
        );

        mods.enderio.AlloySmelter.removeRecipe(all_metals.redstone_alloy.ingot);
        add3alloy(1, "redstone_alloy", 2,
            "electric_steel", 2,
            "red_alloy", 1,
            "conductive_iron", 3
        );

        add3alloy(1, "lumium", 4,
            "tin", 3,
            "silver", 1,
            "glowcrystal", 3
        );
    }

    {//enderium 
        print("enderium");
        recipes.remove(<thermalfoundation:material:103>);
        mods.enderio.AlloySmelter.removeRecipe(<thermalfoundation:material:167>);
        mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:39>);
        mods.tconstruct.Alloy.removeRecipe(<liquid:enderium>);

        add2alloy(1, "enderium_base", 4,
            "mushroomite", 3,
            "platinum", 1
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <thermalfoundation:material:167>,
            <enderio:item_material:39>, <liquid:ender> * 250,
            5000
        );
        mods.thermalexpansion.Centrifuge.removeRecipe(<thermalfoundation:material:103>);
    }

    {//logic steels
        add2alloy(1, "fluix_steel", 4,
            "cincinnasite", 2,
            "fluix", 3
        );
        add2alloy(1, "menril_steel_base", 2,
            "fluix_steel", 1,
            "menril_berry", 4
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            all_metals.menril_steel.ingot, 
            all_metals.menril_steel_base.ingot, 
            <liquid:menrilresin> * 3000, 2000
        );

        scripts.helper.addFluidAlloyerRecipe(
            <contenttweaker:xnet_ingot> * 2, 
            <contenttweaker:fluix_steel_ingot>, <contenttweaker:lesmium_ingot> * 3, <liquid:emerald> * 222, 
            512, 100
        );
    }

    {//mushroomite
        recipes.addShapeless("ia_raw_mushroomite", 
            <contenttweaker:raw_mushroomite> * 2, 
            [<erebus:dark_capped_mushroom>,
            <erebus:sarcastic_czech_mushroom>,
            <erebus:grandmas_shoes_mushroom>,
            <erebus:dutch_cap_mushroom>,
            <erebus:kaizers_fingers_mushroom>, 
            <ore:dustSteel> | <mekanism:enrichediron>, <ore:dustLead>, <ore:dustLead>]
        );
        recipes.addShapeless("ia_raw_mushroomite2", 
            <contenttweaker:raw_mushroomite> * 4, 
            [<erebus:dark_capped_mushroom>,
            <erebus:sarcastic_czech_mushroom>,
            <erebus:grandmas_shoes_mushroom>,
            <erebus:dutch_cap_mushroom>,
            <erebus:kaizers_fingers_mushroom>, 
            <ore:dustSteel> | <mekanism:enrichediron>, <ore:dustLead>, <ore:dustLead>, <deepmoblearning:living_matter_erebus>]
        );
        
        scripts.helper.addSimpleCrushingRecipeWByproduct(<contenttweaker:raw_mushroomite>, <contenttweaker:mushroomite_dust>, <contenttweaker:mushroomite_dust>, 50.0);
        mods.thermalexpansion.Transposer.addFillRecipe(all_metals.mushroomite.ingot, <contenttweaker:mushroomite_dust>, <liquid:mushroom_stew> * 350, 2000);
    }

    {//electric_manyullyn    
        add3alloy(1, "electric_manyullyn_base", 7,
            "manyullyn", 2,
            "electrum", 3,
            "lesmium", 3
        );
        Infuser.addRecipe(all_metals.electric_manyullyn.nugget, all_metals.electric_manyullyn_base.nugget, 2000);
        Infuser.addRecipe(all_metals.electric_manyullyn.ingot, all_metals.electric_manyullyn_base.ingot, 8000);
        Infuser.addRecipe(all_metals.electric_manyullyn.block, all_metals.electric_manyullyn_base.block, 32000);
    }

    {//mekanized_steel
        add3alloy(1, "mekanized_steel_base", 3,
            "electric_manyullyn", 1,
            "enderium", 2,
            "thermal_steel", 1
        );

        mods.thermalexpansion.Transposer.addFillRecipe(
            <contenttweaker:mekanized_steel_ingot>, 
            <contenttweaker:mekanized_steel_base_ingot>, 
            <liquid:mekanization_catalyst> * 250, 2000
        );
    }    
}


{//mekanism
    add3alloy(1, "osgloglass", 1,
        "osmium", 1,
        "refined_obsidian", 1,
        "refined_glowstone", 1
    );

    {//osgloridium
        add2alloy(1, "osmiridium", 2,
            "osmium", 1,
            "iridium", 1
        );

        mods.enderio.AlloySmelter.addRecipe(all_metals.osgloridium.dust * 2, 
                [all_metals.osgloglass.ingot,
                all_metals.osmiridium.ingot,
                <mekanism:shard:2> * 2]
        );

        mods.mekanism.compressor.addRecipe(
            all_metals.osgloridium.dust, 
            all_metals.osgloridium.ingot
        );
    }

    scripts.helper.addFluidAlloyerRecipe(
        all_metals.gastight_steel.ingot, 
        all_metals.watertight_steel.ingot * 2, <prodigytech:energion_dust> * 1, <liquid:steam> * 1000, 
        512, 60
    );

        
    {//fluxed electrum
        recipes.remove(<redstonearsenal:material>);
        mods.thermalexpansion.Transposer.removeFillRecipe(<thermalfoundation:material:97>, <liquid:redstone>);
        mods.tconstruct.Alloy.removeRecipe(<liquid:electrumflux>);
        Melting.removeRecipe(<liquid:electrumflux>);
        //mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:gilded_soot>, <contenttweaker:soot>, <liquid:gold> * 144, 5000);
        mods.mekanism.enrichment.addRecipe(<contenttweaker:gilded_soot>, <contenttweaker:gold_crystal>);

        scripts.helper.addFluidAlloyerRecipe(
            <contenttweaker:prefluxed_electrum_blend>, 
            <contenttweaker:gold_crystal> * 4, <thermalfoundation:material:97> * 12, <liquid:redstone_alloy> * 250, 
            512, 120
        );

        scripts.helper.addFluidAlloyerRecipe(
            <contenttweaker:prefluxed_electrum_blend>, 
            <contenttweaker:gold_crystal> * 4, <thermalfoundation:material:97> * 12, <liquid:redstone_alloy> * 250, 
            512, 120
        );

        scripts.helper.addFluidAlloyerRecipe(
            <redstonearsenal:material>,
            <contenttweaker:prefluxed_electrum_blend>, <twilightforest:fiery_ingot> * 2, <liquid:liquidfusionfuel> * 250, 
            512, 120
        );
    }


    {//lithium_tungstate
        game.setLocalization("item.alchemistry:ingot_tungsten.name", "Lithium Tungstate Ingot");
        //<alchemistry:ingot:74>.displayName = "Lithium Tungstate Ingot";
        TEAlloyer.addRecipe(
            all_metals.lithium_tungstate.ingot, 
            all_metals.tungsten.ingot,
            all_metals.lithium.ingot * 8,
            4000
        );
        mods.enderio.AlloySmelter.addRecipe(all_metals.lithium_tungstate.ingot * 3, 
            [
                all_metals.tungsten.ingot,
                all_metals.lithium.ingot * 8,
                <taiga:dilithium_dust> * 2
            ]
        );
    }
    {//enheavied
        game.setLocalization("item.alchemistry:ingot_titanium.name", "Heavy Ingot");
        <ore:ingotTitanium>.remove(<alchemistry:ingot:22>);
        add2alloy(2, "calitunti_base", 1,
            "lithium_tungstate", 2,
            "titanium", 3
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            all_metals.enheavied.ingot, 
            all_metals.calitunti_base.ingot, <liquid:empoweredoil> * 2000, 
            10000
        );

        scripts.helper.addFluidAlloyerRecipe(
            all_metals.enheavied.ingot, 
            all_metals.titanium.ingot, all_metals.lithium_tungstate.ingot, <liquid:empoweredoil> * 2000, 
            100, 100
        );
    }

}

add3alloy(2, "black_bronze", 3,
    "bronze", 24,
    "black_quartz", 4,
    "carminium", 2
);

{//twilight
    mods.enderio.AlloySmelter.addRecipe(<twilightforest:armor_shard> * 6, 
        [
            <moreplates:alumite_plate>,
            <actuallyadditions:item_crystal:5> * 3,
            <twilightforest:steeleaf_ingot> * 2
        ]
    );
    mods.enderio.AlloySmelter.addRecipe(<twilightforest:armor_shard> * 4, 
            [<moreplates:alumite_plate>,
            <mekanism:reinforcedalloy> * 3,
            <twilightforest:steeleaf_ingot> * 2]
    );
    add2alloy(1, "knight", 2,
        "armor_shard", 2,
        "knightslime", 1
    );


    add2alloy(1, "carminite", 1,
        "restonia", 6,
        "redgem", 3
    );

    mods.immersiveengineering.BlastFurnace.addRecipe(
        <contenttweaker:steelwood_ingot>, <twilightforest:ironwood_ingot>, 
        20 * 45, 
        <contenttweaker:biocoal>
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:steelwood_ingot> * 3, [
        <twilightforest:ironwood_ingot> * 2,
        <twilightforest:liveroot>,
        <immersiveengineering:material:17>
    ]);
    add3alloy(2, "duraluminumwood", 2,
        "duraluminum", 1,
        "steelwood", 1,
        "steeleaf", 2
    );
}

addCasting(all_metals["arkenium"], all_metals_molten["arkenium"]);

scripts.helper.addFluidAlloyerRecipe(
    all_metals.soy_steel.ingot, 
    all_metals.electric_steel.ingot * 4, all_metals.nickel.ingot * 4, <liquid:soy_milk> * 2000, 
    512, 60
);

{//potion zinc
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:glass_ingot>, 
        [
            <enderio:block_fused_glass> * 4,
            <contenttweaker:zinc_dust> * 4,
            <thermalfoundation:material:1026>
        ]
    );
    recipes.addShaped("ia_potion_zinc", all_metals.potion_zinc.ingot, [
        [null, <minecraft:potion>.withTag({Potion: "cofhcore:regeneration4"}), null], 
        [<minecraft:potion>.withTag({Potion: "cofhcore:haste4"}), <contenttweaker:glass_ingot>, <minecraft:potion>.withTag({Potion: "cofhcore:swiftness4"})], 
        [null, <minecraft:potion>.withTag({Potion: "cofhcore:strength4"}), null]
    ]);
    add3alloy(3, "solar_potion_zinc", 1,
        "potion_zinc", 1,
        "solar_silicon", 1,
        "dragon_breath", 1
    );
}

{//tunril
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:tunril_dust>, 
        [
            <exnihilocreatio:item_ore_tungsten:2>,
            <integrateddynamics:crystalized_menril_chunk> * 9,
            <industrialforegoing:pink_slime> * 3
        ], 10000
    );

    mods.actuallyadditions.AtomicReconstructor.addRecipe(<contenttweaker:tunril_ingot>, <contenttweaker:tunril_dust>, 10000);
    mods.actuallyadditions.AtomicReconstructor.addRecipe(<contenttweaker:tunril_block>, <contenttweaker:tunril_dust_big>, 100000);
    mods.actuallyadditions.Empowerer.addRecipe(
    	<contenttweaker:tunril_ingot> * 4, <industrialforegoing:pink_slime>, 
    	<contenttweaker:tunril_dust>, <contenttweaker:tunril_dust>, <contenttweaker:tunril_dust>, <contenttweaker:tunril_dust>, 
    	12500, 20, [0.0, 0.0, 0.0]
    );

    scripts.helper.addSimpleCrushingRecipe(<contenttweaker:tunril_ingot>, <contenttweaker:tunril_dust>);
}
{//tinezo
    TEAlloyer.addRecipe(
        all_metals.tinezo.ingot, 
        all_metals.eezo.ingot,
        all_metals.tin.ingot * 3,
        2000
    );
    add2alloy(1, "tinezo", 3,
        "eezo", 2,
        "nittin", 4
    );

    add3alloy(0, "tinezo", 3,
        "eezo", 1,
        "tin", 8,
        "platinum", 1
    );
    add3alloy(0, "tinezo", 3,
        "eezo", 1,
        "tin", 8,
        "chrome", 1
    );
    add3alloy(0, "tinezo", 2,
        "eezo", 1,
        "tin", 6,
        "lesmium", 3
    );
    add3alloy(0, "tinezo", 2,
        "eezo", 1,
        "tin", 5,
        "angel", 2
    );
}

{////////////////enderio alloys
    {//illagerite
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:illagerite> * 2500, 
            <contenttweaker:illagerite>, 
            <liquid:hexane> * 600, 
            5000
        );
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:illagerite> * 1000, 
            <contenttweaker:illagerite>, 
            <liquid:aqua_regia> * 1000, 
            5000
        );

        scripts.content_machines.addFluidSieveRecipeRandom(
            [
                <contenttweaker:illagerite_dust> % 90,
                <biomesoplenty:ash> % 40
            ], null, 
            <liquid:illagerite> * 800, <prodigytech:ash>,
            <exnihilocreatio:item_mesh:4>,
            20, 1000
        );
        scripts.content_machines.addFluidSieveRecipeRandom(
            [
                <contenttweaker:illagerite_dust> % 70,
                <mekores:mekanismore:283> % 10,
                <actuallyadditions:item_dust:3> % 10,
                <biomesoplenty:ash> % 40
            ], null, 
            <liquid:illagerite> * 700, <contenttweaker:soot>,
            <exnihilocreatio:item_mesh:4>,
            20, 1000
        );
        scripts.content_machines.addFluidSieveRecipeRandom(
            [
                <contenttweaker:illagerite_dust> % 60,
                <mekores:mekanismore:283> % 20,
                <actuallyadditions:item_dust:3> % 20,
                <biomesoplenty:ash> % 50
            ], null, 
            <liquid:illagerite> * 700, <contenttweaker:soot>,
            <contenttweaker:palladium_mesh>,
            20, 1000
        );


        mods.roots.Mortar.addRecipe(
            "illagerite",
            <contenttweaker:illagerite_dust>, [<contenttweaker:illagerite>]
        );
    }

    {//infinity reagent
        mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:75>);


        recipes.addShaped("ia_infinity_reagent", <enderio:item_material:75> * 8, [
            [<contenttweaker:illagerite_dust> | <extrautils2:ingredients:10> | <darkutils:wither_block>, <actuallyadditions:item_crystal_empowered:3>, <enderio:item_material:50>], 
            [<actuallyadditions:item_crystal_empowered:3>, <contenttweaker:singularity_dust>, <actuallyadditions:item_crystal_empowered:3>], 
            [<enderio:item_material:50>, <actuallyadditions:item_crystal_empowered:3>, <contenttweaker:illagerite_dust> | <extrautils2:ingredients:10> | <darkutils:wither_block>]
        ]);

        mods.roots.Mortar.addRecipe(
            "infinity_reagent1", <enderio:item_material:75> * 12,
            [
                <contenttweaker:singularity_dust>,
                <actuallyadditions:block_crystal_empowered:3>,
                <enderio:item_material:50>,
                <enderio:item_material:50>,
                <contenttweaker:illagerite_dust> | <extrautils2:ingredients:10> | <darkutils:wither_block>
            ]
        );
        mods.roots.Mortar.addRecipe(
            "infinity_reagent2", <enderio:item_material:75> * 16,
            [
                <contenttweaker:singularity_dust>,
                <actuallyadditions:block_crystal_empowered:3>,
                <enderio:item_material:50>,
                <contenttweaker:druidic_dust>,
                <contenttweaker:illagerite_dust> | <extrautils2:ingredients:10> | <darkutils:wither_block>
            ]
        );
         mods.roots.Mortar.addRecipe(
            "infinity_reagent3", <enderio:item_material:75> * 24,
            [
                <contenttweaker:singularity_dust>,
                <actuallyadditions:block_crystal_empowered:3>,
                <enderio:item_material:50>,
                <contenttweaker:transmut_gel>,
                <contenttweaker:illagerite_dust>
            ]
        );

        mods.enderio.AlloySmelter.addRecipe(
            <enderio:item_material:75> * 12,
            [
                <contenttweaker:singularity_dust>,
                <enderio:item_material:50> * 4,
                <actuallyadditions:item_crystal_empowered:3> * 12
            ]
        );
        mods.enderio.AlloySmelter.addRecipe(
            <enderio:item_material:75> * 16,
            [
                <contenttweaker:singularity_dust>,
                <contenttweaker:illagerite_dust> * 16,
                <actuallyadditions:item_crystal_empowered:3> * 12
            ]
        );
        mods.bloodmagic.TartaricForge.addRecipe(
            <enderio:item_material:75> * 24, 
            [
                <contenttweaker:singularity_dust>,
                <actuallyadditions:block_crystal_empowered:3>,
                <actuallyadditions:block_crystal_empowered:3>,
                <enderio:item_material:75>
            ], 400, 40
        );
        mods.bloodmagic.TartaricForge.addRecipe(
            <enderio:item_material:75> * 18, 
            [
                <contenttweaker:singularity_dust>,
                <actuallyadditions:block_crystal_empowered:3>,
                <contenttweaker:illagerite_dust>,
                <enderio:item_material:75>
            ], 400, 32
        );

    }

    {//mitanium
        add3alloy(3, "mitanium", 1,
            "titanium", 4,
            "meteorite", 3,
            "knight", 5
        );
        add3alloy(3, "mitanium", 1,
            "titanium", 4,
            "meteorite", 3,
            "steelwood", 4
        );
    
        add3alloy(3, "mitanium", 1,
            "tignalum", 3,
            "meteorite", 2,
            "knight", 4
        );
        add3alloy(3, "mitanium", 1,
            "tignalum", 3,
            "meteorite", 2,
            "steelwood", 3
        );
    }

    {//dark steel
        //mods.thermalexpansion.InductionSmelter.removeRecipe(all_metals.dark_steel.ingot);
        mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:96>, <thermalfoundation:material:770>);
        mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:770>);

        mods.tconstruct.Alloy.removeRecipe(<liquid:dark_steel>);
        mods.immersiveengineering.ArcFurnace.removeRecipe(all_metals.dark_steel.ingot);
        mods.enderio.AlloySmelter.removeRecipe(all_metals.dark_steel.ingot);


        add3alloy(3, "dark_steel", 2,
            "mitanium", 1,
            "mekanized_steel", 9,
            "evoid", 1
        );
        add3alloy(3, "dark_steel", 6,
            "mitanium", 1,
            "mekanized_steel", 9,
            "inf_reagent", 1
        );
    }
    {//end steel
        mods.enderio.AlloySmelter.removeRecipe(all_metals.end_steel.ingot);

        add3alloy(3, "end_steel", 4,
            "dark_steel", 6,
            "palladium", 3,
            "biotide", 8
        );
    }
    {//melodic
        mods.enderio.AlloySmelter.removeRecipe(all_metals.melodic_alloy.ingot);

        scripts.content_machines.addFluidAlloyerRecipe(
            <contenttweaker:melodic_paste>,
            <contenttweaker:elastic_clay> * 8, <integrateddynamics:crystalized_chorus_chunk> * 32, <liquid:vapor_of_levity> * 1000,
            20, 500
        );
        mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:melodic_reagent>, [
            <extrautils2:ingredients>,
            <trumpetskeleton:trumpet>,
            <enderio:block_enderman_skull>,
            <mekanism:mufflingupgrade>
        ], 300, 24);
        scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:melodic_paste> * 4], [<liquid:radioactive_waste> * 200], [
                <contenttweaker:elastic_clay> * 2,
                <integrateddynamics:crystalized_chorus_chunk> * 24,
                <contenttweaker:melodic_reagent>,
                <contenttweaker:pulse_generator>
            ], [
                <liquid:vapor_of_levity> * 400,
                <liquid:mana> * 500,
                <liquid:prometheum_fluid> * 200
            ], 20, 1000
        );
        scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:melodic_paste> * 4], [<liquid:radioactive_waste> * 200], [
                <deepmoblearning:polymer_clay> * 12,
                <integrateddynamics:crystalized_chorus_chunk> * 24,
                <contenttweaker:melodic_reagent>,
                <contenttweaker:pulse_generator>
            ], [
                <liquid:vapor_of_levity> * 400,
                <liquid:mana> * 500,
                <liquid:prometheum_fluid> * 200
            ], 20, 1000
        );

        add3alloy(3, "melodic_alloy", 3,
            "end_steel", 6,
            "draconium", 3,
            "melodic_paste", 1
        );
        add3alloy(3, "melodic_alloy", 3,
            "end_steel", 8,
            "purple_gold", 5,
            "melodic_paste", 1
        );
    }

    recipes.addShapeless("ia_energized_compound1", <contenttweaker:energized_compound> * 6, [
        <contenttweaker:irradiated_compound>, <contenttweaker:solar_silicon>, <minecraft:experience_bottle>, <taiga:dilithium_dust>, <thermalfoundation:material:103>
    ]);
    recipes.addShapeless("ia_energized_compound2", <contenttweaker:energized_compound> * 8, [
        <contenttweaker:irradiated_compound>, <contenttweaker:solar_silicon>, <minecraft:experience_bottle>, <taiga:dilithium_dust>, <thermalfoundation:material:103>,
        <biomesoplenty:shroompowder>
    ]);
    recipes.addShapeless("ia_energized_compound3", <contenttweaker:energized_compound> * 12, [
        <contenttweaker:irradiated_compound>, <contenttweaker:solar_silicon>, <minecraft:experience_bottle>, <taiga:dilithium_dust>, <thermalfoundation:material:103>,
        <biomesoplenty:shroompowder>, <biomesoplenty:gem>
    ]);
    
    
    
    {//energetic gold
        mods.tconstruct.Alloy.removeRecipe(<liquid:energetic_alloy>);
        mods.immersiveengineering.ArcFurnace.removeRecipe(all_metals.energetic_gold1.ingot);
        mods.enderio.AlloySmelter.removeRecipe(all_metals.energetic_gold1.ingot);
        
        add3alloy(3, "energetic_gold1", 4,
            "gold", 16,
            "chrome", 3,
            "energized_compound", 1
        );
    }
    {//energetic silver
        mods.tconstruct.Alloy.removeRecipe(<liquid:energetic_silver>);
        //mods.immersiveengineering.ArcFurnace.removeRecipe(all_metals.energetic_gold1.ingot);
        mods.enderio.AlloySmelter.removeRecipe(all_metals.energetic_silver1.ingot);
        
        add3alloy(3, "energetic_silver1", 4,
            "silver", 16,
            "chrome", 3,
            "energized_compound", 1
        );
    }


    {//vibrant
        mods.tconstruct.Alloy.removeRecipe(<liquid:vibrant_alloy>);
        mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_alloy_ingot:1>, <minecraft:ender_pearl>);
        mods.enderio.AlloySmelter.removeRecipe(all_metals.energetic_gold2.ingot);

        add3alloy(3, "energetic_gold2", 1,
            "energetic_gold1", 1,
            "gambrosium", 1,
            "osgloridium", 1
        );
    }
    {//vivid
        mods.tconstruct.Alloy.removeRecipe(<liquid:vivid_alloy>);
        mods.enderio.AlloySmelter.removeRecipe(all_metals.energetic_silver2.ingot);

        add3alloy(3, "energetic_silver2", 1,
            "energetic_silver1", 1,
            "gambrosium", 1,
            "osgloridium", 1
        );
    }


    //dark soularium
    mods.enderio.AlloySmelter.removeRecipe(all_metals.dark_soularium.ingot);
    add3alloy(3, "dark_soularium", 4,
        "soularium", 16,
        "dark_steel", 4,
        "iron_heart", 1
    );


    {//crystalline
        mods.enderio.AlloySmelter.removeRecipe(all_metals.crystalline_alloy.ingot);

        mods.enderio.AlloySmelter.addRecipe(all_metals.crystalline_alloy.ingot * 4, [
            <enderio:item_material:36> * 2,
            <taiga:yrdeen_ingot> * 4,
            <enderio:item_material:18>
        ], 20000);
        mods.enderio.AlloySmelter.addRecipe(all_metals.crystalline_alloy.ingot * 2, [
            <enderio:item_material:36> * 1,
            <taiga:yrdeen_ingot> * 2,
            <biomesoplenty:crystal_shard> * 64
        ], 20000);
        mods.enderio.AlloySmelter.addRecipe(all_metals.crystalline_alloy.ingot * 12, [
            <enderio:item_material:36> * 4,
            <taiga:yrdeen_ingot> * 8,
            <contenttweaker:crystal_metal_nugget>
        ], 20000);


        mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:4>);
        mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_endergy_ingot:4> * 8, [
            <industrialforegoing:pink_slime_ingot> * 16,
            all_metals.crystalline_alloy.ingot,
            <aether_legacy:aercloud:3> * 4
        ], 20000);
        mods.enderio.AlloySmelter.addRecipe(<enderio:item_alloy_endergy_ingot:4> * 8, [
            <industrialforegoing:pink_slime_ingot> * 16,
            all_metals.crystalline_alloy.ingot,
            <botania:petal:6> * 48
        ], 20000);
    }



    {//clathrode
        mods.enderio.SagMill.removeRecipe(<minecraft:ender_pearl>);
        mods.enderio.SagMill.removeRecipe(<appliedenergistics2:material:46>);
        //ender dust from end air

        scripts.content_machines.addAdvancedMixerRecipe(
            [<thermalfoundation:material:895>], [],
            [
                <enderio:item_material:28>,
                <extrautils2:endershard>,
                <thermalfoundation:material:865>
            ], [],
            20, 128
        );
    }    
}

{//bedrockium alloy
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:bedrockium_chunk>, 
        [
            <extrautils2:compressedcobblestone:3> * 4,
            <contenttweaker:anubis_godshard>,
            <minecraft:diamond_block> * 2
        ]
    );
    mods.thermalexpansion.Imbuer.addRecipe(<liquid:bedrockium_solution> * 1000, <contenttweaker:bedrockium_chunk>, <liquid:endacid> * 1000, 10000);
    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:bedrockium_solution> * 1200],
        [
            <contenttweaker:bedrockium_chunk>
        ], [
            <liquid:endacid> * 1000,
            <liquid:raw_bedrockium_solution> * 200
        ], 20, 1000
    );


    mods.thermalexpansion.Imbuer.addRecipe(<liquid:refined_bedrockium_solution> * 1000, <contenttweaker:bedrockium_small_chunk>, <liquid:bedrockium_solution> * 1000, 10000);
    mods.thermalexpansion.Refinery.addRecipe(<liquid:refined_bedrockium_solution> * 500, <contenttweaker:bedrockium_small_chunk> % 55, <liquid:bedrockium_solution> * 1000, 10000);

    
    
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:bedrockium_crystal>, 
        <contenttweaker:osmiridium_support>, <liquid:refined_bedrockium_solution> * 1000, 
        10000
    );
    mods.enderio.SagMill.addRecipe(
        [<contenttweaker:bedrockium_fine_powder>, <contenttweaker:osmiridium_dust> * 3, <contenttweaker:bedrockium_small_chunk>], 
        [0.9, 0.8, 0.25], 
        <contenttweaker:bedrockium_crystal>, "CHANCE_ONLY", 10000
    );

    recipes.addShapeless("ia_bedrockium_alloy_mix", <contenttweaker:bedrockium_alloy_mix>, 
        [<contenttweaker:bedrockium_fine_powder>, 
        <projectred-core:resource_item:200>, <projectred-core:resource_item:201>, 
        <ore:dustDraconium>,
        <enderio:block_infinity_fog>, <enderio:block_infinity_fog>]
    );

    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:bedrockium_alloy_ingot>, 
        [
            <contenttweaker:bedrockium_alloy_mix>,
            <contenttweaker:tunril_ingot> * 2,
            <enderio:item_alloy_ingot:6>
        ], 10000
    );
}
add3alloy(2, "explosion_resistant", 8,
    "bedrockium_alloy", 1,
    "terrax", 4,
    "invar", 24
);
recipes.addShaped("ia_explosion_resistant_sheetmetal", <contenttweaker:explosion_resistant_sheetmetal> * 4, [
	[null, <contenttweaker:explosion_resistant_plate>, null], 
	[<contenttweaker:explosion_resistant_plate>, <immersiveengineering:sheetmetal:8>, <contenttweaker:explosion_resistant_plate>], 
	[null, <contenttweaker:explosion_resistant_plate>, null]
]);

add3alloy(2, "hot", 1,
    "thermal_steel", 2,
    "molten_core", 1,
    "osram", 1
);

//cursed gold
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:cursed_gold_ingot> * 4, 
    [
        <contenttweaker:cursed_gold_dust> * 4,
        <contenttweaker:ptah_godshard> * 2,
        <contenttweaker:relic_ingot> * 5
    ]
);

//purple gold
//in chem lines

{//peridotite
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:peridotite_ingot> * 2, 
        [
            <enderio:item_material:15>,
            <taiga:niob_ingot> * 4,
            <twilightforest:steeleaf_ingot> * 8
        ], 25000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:peridotite_ingot> * 4, 
        [
            <enderio:item_material:15>,
            <taiga:niob_ingot> * 4,
            <contenttweaker:stoneleaf> * 6
        ], 25000
    );


    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:peridotite_sheet>, 
        [
            <contenttweaker:peridotite_ingot> * 3,
            <contenttweaker:flolit_sheet> * 8,
            <contenttweaker:gallium_sheet> * 8
        ], 50000
    );
}

{//noble & imperomite
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:noble_gases_ingot>, <contenttweaker:glass_ingot>, 
        <liquid:noble_gases> * 1000, 
        2000
    );

    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:imperomite_catalyst>, 
        [
            <contenttweaker:noble_gases_ingot>,
            <contenttweaker:cursed_gold_ingot>,
            <taiga:imperomite_ingot>
        ],
        300000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:imperomite_catalyst> * 2, 
        [
            <contenttweaker:imperomite_catalyst>,
            <contenttweaker:imperomite_catalyst_dust>,
            <mekanism:enrichediron>
        ],
        10000
    );


    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:imperial_iron_ingot> * 8, 
        [
            <minecraft:iron_ingot> * 32,
            <twilightforest:knightmetal_ingot> * 16,
            <contenttweaker:imperomite_catalyst>
        ],
        10000
    );

    mods.immersiveengineering.BlastFurnace.addRecipe(
        <contenttweaker:imperial_steel_ingot>, <contenttweaker:imperial_iron_ingot>, 
        20 * 30, 
        <contenttweaker:soot>
    );
    //todo tignalum furnace
}

//neodymium
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:neodymium_ingot>, 
    [
        <contenttweaker:neodymium_dust>,
        <prodigytech:aeternus_crystal>,
        <contenttweaker:duraluminum_dust>
    ]
);



//tignalum
add3alloy(2, "tignalum", 2,
    "titanium", 1,
    "signalum", 4,
    "wear_resistant_alloy", 6
);

{//awaken uru
    mods.actuallyadditions.Empowerer.addRecipe(
        <contenttweaker:awaken_uru_dust>, <taiga:uru_dust>, 
        <appliedenergistics2:material:12>, 
        <mekores:mekanismore:295>, 
        <mekores:mekanismore:20>, 
        <tinkersaether:swet_crystal>, 
        4000, 100, [154.0 / 255.0, 80.0 / 255.0, 137.0 / 255.0]
    );
    mods.immersiveengineering.BlastFurnace.addRecipe(
        <contenttweaker:awaken_uru_ingot>, <contenttweaker:awaken_uru_dust>, 
        20 * 60, 
        <contenttweaker:soot>
    );
}

//ender ingot
recipes.removeByRecipeName("extendedcrafting:ender_ingot");
add3alloy(3, "ender_ingot", 1,
    "enderium", 12,
    "yrdeen", 4,
    "prescience", 1
);

{//uu ingot
    mods.prodigytech.atomicreshaper.addRecipeMulti(<contenttweaker:duraluminumwood_ingot>, 150, 80, [<contenttweaker:uu_base1>, <prodigytech:ash>], [9, 1]);
    mods.prodigytech.atomicreshaper.addRecipeMulti(<contenttweaker:mitanium_ingot>, 150, 80, [<contenttweaker:uu_base2>, <prodigytech:ash>], [9, 1]);
    mods.prodigytech.atomicreshaper.addRecipeMulti(<redstonearsenal:material:32>, 150, 80, [<contenttweaker:uu_base3>, <prodigytech:ash>], [9, 1]);
    mods.enderio.AlloySmelter.addRecipe(<tconevo:metal:40>, 
        [
            <contenttweaker:uu_base1>,
            <contenttweaker:uu_base2>,
            <contenttweaker:uu_base3>
        ]
    );

    mods.jei.JEI.addItem(<tconevo:metal:40>);
    mods.jei.JEI.addItem(<tconevo:metal:43>);
    mods.jei.JEI.addItem(<tconevo:metal:44>);
    
}

{//blood magic
    //blood bronze
    mods.tconstruct.Alloy.removeRecipe(<liquid:bloodbronze>);

	//in blood_magic.zs

    //bound
    mods.bloodmagic.BloodAltar.removeRecipe(<tconevo:material>);
    //in blood_magic.zs

    {//alchemical brass
        mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:alchemical_brass_ingot>, 
            [<contenttweaker:solar_potion_zinc_ingot>, <bloodtinker:blood_bronze_ingot>, <contenttweaker:calitunti_ingot>, <tconstruct:metal:5>], 
            32, 16
        );
        mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:alchemical_brass_ingot>, 
            [
                <contenttweaker:solar_potion_zinc_ingot>, <bloodtinker:blood_bronze_ingot>, <contenttweaker:calitunti_ingot>, 
                <tconstruct:metal:5>
            ], 
            1000, 20, 1
        );
        mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:alchemical_brass_ingot>, 
            [
                <contenttweaker:solar_potion_zinc_ingot>, <bloodtinker:blood_bronze_ingot>, <contenttweaker:calitunti_ingot>, 
                <tconstruct:ingots:5>, <tconstruct:ingots:5>, <tconstruct:ingots:5>
            ], 
            3000, 20, 1
        );
    }

    {//living
        mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:skeleton_ingot> * 2, [
            <deepmoblearning:pristine_matter_skeleton>,
            <bloodmagic:demon_extras:10>,
            <contenttweaker:ancient_ingot>,
            <contenttweaker:elemental_clay>
        ], 300, 160);
        mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:skeleton_ingot> * 2, [
            <deepmoblearning:pristine_matter_skeleton>,
            <bloodmagic:demon_extras:10>,
            <contenttweaker:crabolion>,
            <contenttweaker:elemental_clay>
        ], 300, 160);

        mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:living_steel_ingot>, 
            [
                <contenttweaker:skeleton_ingot>, <contenttweaker:primitive_eyes>, <bloodtinker:blood_bronze_block>,
                <extendedcrafting:singularity_custom:41>, <contenttweaker:life>, <contenttweaker:life>
            ], 
            30000, 20, 3
        );
        recipes.addShaped("ia_living_steel_sheetmetal", <contenttweaker:living_steel_sheetmetal> * 4, [
            [null, <contenttweaker:living_steel_plate>, null], 
            [<contenttweaker:living_steel_plate>, <immersiveengineering:sheetmetal:5>, <contenttweaker:living_steel_plate>], 
            [null, <contenttweaker:living_steel_plate>, null]
        ]);
    }

    {//conductive alloy
        mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:conductive_alloy_ingot>, 
            [
                <enderio:item_alloy_ingot:1> * 2, <exnihilocreatio:item_ore_tungsten:3>, <contenttweaker:gallium_ingot>,
                <contenttweaker:electric_manyullyn_ingot>, <thermalfoundation:storage>, <thermalfoundation:storage_alloy:1>
            ], 
            1000, 20, 1
        );
    }

    {//sunlight
        recipes.addShapeless("ia_light_clay1", <contenttweaker:light_clay1>, [
            <enderio:item_material:76>, <contenttweaker:solar_silicon>, <bloodmagic:component:11>, 
            <contenttweaker:holy_thing>, <taiga:solarium_dust>, <extrautils2:suncrystal>, 
            <liquid:glowstone> * 1000
        ]);
        mods.mekanism.compressor.addRecipe(<contenttweaker:light_clay1>, <gas:osgloridium>, <contenttweaker:light_clay2> * 4);

        mods.mekanism.chemical.oxidizer.addRecipe(<contenttweaker:light_clay2>, <gas:light1> * 100);

        mods.mekanism.solarneutronactivator.addRecipe(<gas:light1>, <gas:light2>);

        scripts.helper.addFluidAlloyerRecipe(
            <contenttweaker:light_ingot>, 
            <solarflux:mirror> * 4, <contenttweaker:glass_ingot> * 4, <liquid:light2> * 500, 
            500, 20
        );
    }

    {//glowshroomite
        scripts.helper.addFluidAlloyerRecipe(
            <contenttweaker:glowshroomite_ingot>,
            <contenttweaker:mushroomite_ingot> * 4, <contenttweaker:light_ingot>, <liquid:glowshroom_stew> * 2000, 
            1000, 20
        );
    }

    {//acid_resistant
        mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:acid_resistant_steel_a> * 2, 
            [
                <thermalfoundation:material:160>,
                <thermalfoundation:material:160>,
                <contenttweaker:titanium_ingot>,
                <thermalfoundation:material:132>,
                <contenttweaker:formic_acid_form>,
                <bloodmagic:cutting_fluid>
            ], 
            1000, 20, 2
        );
        mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:acid_resistant_steel_b> * 2, 
            [
                <thermalfoundation:material:160>,
                <thermalfoundation:material:160>,
                <contenttweaker:chrome_ingot>,
                <thermalfoundation:material:133>,
                <contenttweaker:formic_acid_form>,
                <bloodmagic:cutting_fluid>
            ], 
            1000, 20, 2
        ); 
 
        mods.enderio.AlloySmelter.addRecipe(<contenttweaker:acid_resistant_steel_ingot> * 3, 
            [
                <contenttweaker:acid_resistant_steel_a>,
                <contenttweaker:acid_resistant_steel_b>,
                <enderio:item_alloy_ingot:6>
            ]
        );
    }
}
{//botania
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:mana_absorbing_ingot>, 
        [
            <taiga:tritonite_block>, <contenttweaker:atum_godshard>, <enderio:item_alloy_endergy_ingot:2>, 
            <bloodmagic:slate>
        ], 
        128, 16
    );
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:mana_absorbing_ingot> * 2, 
        [
            <taiga:tritonite_block>, <contenttweaker:atum_godshard>, <enderio:item_alloy_endergy_ingot:2>, 
            <bloodmagic:slate:1>
        ], 
        128, 16
    );
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:mana_absorbing_ingot> * 4, 
        [
            <taiga:tritonite_block>, <contenttweaker:atum_godshard>, <enderio:item_alloy_endergy_ingot:2>, 
            <bloodmagic:slate:2>
        ], 
        128, 16
    );
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:mana_absorbing_ingot> * 8, 
        [
            <taiga:tritonite_block>, <contenttweaker:atum_godshard>, <enderio:item_alloy_endergy_ingot:2>, 
            <bloodmagic:slate:3>
        ], 
        128, 16
    );



    //mirion
    mods.tconstruct.Alloy.removeRecipe(<liquid:mirion>);
    mods.actuallyadditions.Empowerer.addRecipe(<plustic:mirioningot> * 4, <minecraft:glass>, <tconstruct:ingots>, <botania:manaresource>, <botania:manaresource:7>, <botania:manaresource:4>, 4000, 100, [0.828125, 0.89453125, 0.546875]);
    mods.actuallyadditions.Empowerer.addRecipe(<plustic:mirioningot> * 6, <contenttweaker:glass_ingot>, <tconstruct:ingots>, <botania:manaresource>, <botania:manaresource:7>, <botania:manaresource:4>, 4000, 100, [0.828125, 0.89453125, 0.546875]);

    //viridium
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:mirion2_ingot> * 2, 102400 * 20, 102400, <contenttweaker:glass_ingot>, 
        [
            <botania:manaresource>, <botania:manaresource:7>, <botania:manaresource:4>, <plustic:mirioningot>,
            <taiga:palladium_ingot>, <simplyjetpacks:metaitemmods:12>, <enderio:item_alloy_endergy_ingot:5>, <redstonearsenal:material:32>
        ]
    );

    //chlorasteel
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:chlorasteel_ingot> * 3, 102400 * 20, 102400, <contenttweaker:glass_ingot>,
        [
            <botania:manaresource:4>, <contenttweaker:flower_steel_ingot>, 
            <twilightforest:steeleaf_ingot>, <twilightforest:steeleaf_ingot>, <twilightforest:steeleaf_ingot>,
            <thermalfoundation:material:166>, <thermalfoundation:material:166>, <contenttweaker:activated_biopower>
        ]
    );

    //gem
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:gem_steel_ingot>, 1024 * 20, 1024, <contenttweaker:glass_ingot>,
        [
            <enderio:item_material:18>, 
            <taiga:proxii_ingot>, <taiga:proxii_ingot>,
            <biomesoplenty:terrestrial_artifact>,
            <mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>
        ]
    );

    //orichalconite
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:orichalconite_ingot>, 1024 * 20, 1024, <contenttweaker:glass_ingot>,
        [
            <contenttweaker:orichalcum_ingot>,
            <twilightforest:knightmetal_block>,
            <contenttweaker:imperial_steel_ingot>,
            <contenttweaker:imperial_steel_ingot>,
            <contenttweaker:arkenium_ingot>,
            <enderio:item_alloy_endergy_ingot:2>,
            <enderio:item_alloy_endergy_ingot:2>,
            <taiga:yrdeen_ingot>
        ]
    );

    //vibralcum
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:vibralcum_ingot> * 3, 1024 * 20, 1024, <contenttweaker:glass_ingot>,
        [
            <taiga:vibranium_ingot>,
            <taiga:vibranium_ingot>,
            <taiga:vibranium_ingot>,
            <contenttweaker:orichalcum_ingot>,
            <exnihilocreatio:item_ore_tungsten:3>,
            <contenttweaker:arkenium_ingot>,
            <taiga:niob_ingot>,
            <contenttweaker:pulse_generator>
        ]
    );
    <contenttweaker:vibralcum_ingot>.addTooltip("Vibration Dumping Alloy");

    //stellar alloy
    mods.enderio.AlloySmelter.removeRecipe(<enderio:item_alloy_endergy_ingot:3>);
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <enderio:item_alloy_endergy_ingot:3>, 1024 * 100, 1024 * 5, <contenttweaker:glass_ingot>,
        [
            <enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:2>, 
            <contenttweaker:conductive_alloy_ingot>, <contenttweaker:conductive_alloy_ingot>, 
            <contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_ingot>, 
            <astralsorcery:itemcraftingcomponent:1>, <astralsorcery:itemcraftingcomponent:1>,
            <minecraft:nether_star>,
            <contenttweaker:rune_lightning>
        ]
    );
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <enderio:item_alloy_endergy_ingot:3> * 2, 1024 * 120, 1024 * 6, <contenttweaker:super_alloy_base_ingot>,
        [
            <enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:2>, 
            <contenttweaker:conductive_alloy_ingot>, <contenttweaker:conductive_alloy_ingot>, 
            <contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_ingot>, 
            <astralsorcery:itemcraftingcomponent:1>, <astralsorcery:itemcraftingcomponent:1>,
            <minecraft:nether_star>,
            <contenttweaker:rune_lightning>
        ]
    );
    
}

recipes.addShapeless("tungsten_mixture", <contenttweaker:tungsten_mixture>, [
    <contenttweaker:tungsten_block>, 
    <thermalfoundation:material:833>, <thermalfoundation:material:833>, 
    <taiga:prometheum_dust>, <taiga:prometheum_dust>, 
    <actuallyadditions:item_dust:7>, 
    <darkutils:material>, <thermalfoundation:material:1027>, <contenttweaker:arkenium_dust>
]);
scripts.content_machines.addAdvancedMixerRecipe(
    [<contenttweaker:super_alloy_base_ingot> * 4, <contenttweaker:imperomite_catalyst_dust>], [],
    [
        <extendedcrafting:singularity_custom:39>, 
        <contenttweaker:tungsten_mixture> * 12, 
        <contenttweaker:rare_earth_dust> * 16,
        <contenttweaker:imperomite_catalyst> * 3,
    ], [
        <liquid:noble_gases> * 2000, 
        <liquid:rune_acid> * 500,
        <liquid:vapor_of_levity> * 250
    ],
    1024, 40
);

{//combination
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:nitinol_ingot> * 3, 1024 * 200, 1024, <contenttweaker:super_alloy_base_ingot>, 
        [
            <contenttweaker:titanium_block>,
            <contenttweaker:titanium_block>,
            <contenttweaker:titanium_block>,
            <thermalfoundation:storage:5>,
            <thermalfoundation:storage:5>,
            <thermalfoundation:storage:5>,
            <contenttweaker:bouncy_matter>,
            <contenttweaker:basic_neuron>,
            <contenttweaker:basic_neuron>,
            <contenttweaker:alchemical_brass_ingot>,
            <contenttweaker:alchemical_brass_ingot>,
            <contenttweaker:alchemical_brass_ingot>
        ]
    );
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:neuronium_ingot> * 2, 1024 * 200, 1024, <contenttweaker:glass_ingot>, 
        [
            <contenttweaker:neuro_crystal>,
            <contenttweaker:neuron_inlay>,
            <contenttweaker:neuron_inlay>,
            <contenttweaker:neuron_inlay>,
            <contenttweaker:neuron_inlay>,
            <contenttweaker:alchemical_brass_ingot>,
            <contenttweaker:alchemical_brass_ingot>,
            <extendedcrafting:material>,
            <contenttweaker:medical_alloy_coil>,
            <bloodmagic:demon_extras:11>
        ]
    );
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:fluxed_invar_ingot> * 3, 10240 * 200, 10240, <contenttweaker:super_alloy_base_ingot>, 
        [
            <extendedcrafting:singularity:28>,
            <redstonearsenal:storage>,
            <redstonearsenal:storage>,
            <redstonearsenal:storage>,
            <redstonearsenal:storage:1>,
            <bloodmagic:demon_extras:14>,
            <tconevo:metal:40>,
            <contenttweaker:bedrockium_alloy_ingot>,
            <enderio:item_alloy_endergy_ingot:6>,
            <contenttweaker:vibralcum_ingot>
        ]
    );
}

{//astral

    recipes.addShaped("ia_starmetal_sheetmetal", <contenttweaker:starmetal_sheetmetal> * 4, [
        [null, <contenttweaker:starmetal_plate>, null], 
        [<contenttweaker:starmetal_plate>, <immersiveengineering:sheetmetal:5>, <contenttweaker:starmetal_plate>], 
        [null, <contenttweaker:starmetal_plate>, null]
    ]);


    
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:moon_ingot> * 3, 1024 * 200, 1024, <contenttweaker:glass_ingot>, 
        [
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:amethyst_ingot>,
            <contenttweaker:purple_gold_ingot>,
            <simplyjetpacks:metaitemmods:12>,
            <contenttweaker:skeleton_ingot>,
            <taiga:nihilite_ingot>,
            <extrautils2:ingredients:5>,
            <extrautils2:ingredients:5>,
            <extrautils2:ingredients:5>
        ]
    );
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:moon_ingot> * 4, 1024 * 100, 1024, <contenttweaker:glass_ingot>, 
        [
            <twilightforest:moonworm>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:moon_dust>,
            <contenttweaker:amethyst_ingot>,
            <contenttweaker:purple_gold_ingot>,
            <simplyjetpacks:metaitemmods:12>,
            <contenttweaker:skeleton_ingot>,
            <taiga:nihilite_ingot>,
            <extrautils2:ingredients:5>,
            <extrautils2:ingredients:5>,
            <extrautils2:ingredients:5>
        ]
    );

    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:star_alloy_ingot> * 8, 10240 * 100, 10240 * 5, <contenttweaker:super_alloy_base_ingot>,
        [
            <contenttweaker:starmetal_block>,
            <contenttweaker:starmetal_block>,
            <enderio:item_alloy_endergy_ingot:3>,
            <enderio:item_alloy_endergy_ingot:3>,
            <enderio:item_alloy_endergy_ingot:3>,
            <enderio:item_alloy_endergy_ingot:3>,
            <taiga:adamant_ingot>,
            <taiga:adamant_ingot>,
            <taiga:adamant_ingot>,
            <taiga:adamant_ingot>,
            <contenttweaker:mirion2_ingot>,
            <contenttweaker:gem_steel_ingot>,
            <extendedcrafting:singularity:29>,
            <extendedcrafting:singularity_custom:55>
        ]
    );


    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:true_titanium>, 1024000 * 100, 1024000 * 5, <contenttweaker:super_alloy_base_ingot>,
        [
            <extendedcrafting:singularity:31>,
            <extendedcrafting:singularity:31>,
            <contenttweaker:tablet_good>,
            <contenttweaker:star_alloy_ingot>,
            <botania:specialflower>.withTag({type: "puredaisy"}),
            <contenttweaker:pure_sheetmetal>,
            <contenttweaker:crystal_metal_ingot>,
            <aether_legacy:enchanted_gravitite>,
            <aether_legacy:enchanted_gravitite>,
            <aether_legacy:enchanted_gravitite>,
            <bloodmagic:demon_extras:10>
        ]
    );
}
{//draconic
    //draconium
    

}
{//project e
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:pandemonium_ingot>, 10240 * 100, 10240 * 5, <contenttweaker:super_alloy_base_ingot>,
        [
            <extendedcrafting:singularity_custom:41>, 
            <extendedcrafting:singularity_custom:41>,
            <contenttweaker:fiery_singularity>,
            <contenttweaker:crystal_metal_block>,
            <enderio:block_alloy_endergy:1>,
            <enderio:block_alloy_endergy:1>,
            <contenttweaker:living_steel_block>,
            <contenttweaker:living_steel_block>,
            <contenttweaker:death_metal_block>,
            <bloodmagic:demon_extras:13>,
            <bloodmagic:demon_extras:13>,
            <projecte:matter_block:1>
        ]
    );
    addPlate(<contenttweaker:pandemonium_ingot>, <contenttweaker:pandemonium_plate>);
}

//neutronium

recipes.addShaped("ia_neutronium_sheetmetal", <contenttweaker:neutronium_sheetmetal> * 4, [
	[null, <moreplates:neutronium_plate>, null], 
	[<moreplates:neutronium_plate>, <contenttweaker:living_steel_sheetmetal>, <moreplates:neutronium_plate>], 
	[null, <moreplates:neutronium_plate>, null]
]);



{//taiga metals
    add3alloy(1, "terrax", 2,
        "karmesine", 1,
        "ovium", 1,
        "jauxum", 1
    );
    add2alloy(1, "tritonite", 2,
        "cobalt", 3,
        "terrax", 2
    );

    add2alloy(1, "triberium", 1,
        "tiberium", 5,
        "dilithium", 2
    );
    add3alloy(1, "fractum", 4,
        "triberium", 6,
        "obsidian", 3,
        "abyssum", 2
    );

    add2alloy(1, "violium", 2,
        "aurorium", 3,
        "ardite", 2
    );

    add3alloy(2, "proxii", 3,
        "prometheum", 3,
        "palladium", 3,
        "eezo", 1
    );

    add3alloy(1, "ignitz", 2,
        "ardite", 2,
        "terrax", 2,
        "osram", 1
    );
    add3alloy(1, "ignitz", 5,
        "signalum", 2,
        "terrax", 2,
        "osram", 1
    );
    
    add3alloy(2, "imperomite", 2,
        "duranite", 3,
        "prometheum", 1,
        "abyssum", 1
    );
    add3alloy(2, "solarium", 2,
        "valyrium", 2,
        "uru", 2,
        "nucleum", 1    
    );

    add2alloy(3, "nihilite", 1,
        "vibranium", 1,
        "solarium", 1
    );
    add2alloy(3, "adamant", 3,
        "nihilite", 1,
        "iox", 3
    );

    add2alloy(2, "lumix", 1,
        "palladium", 1,
        "terrax", 1
    );

    
    add3alloy(2, "yrdeen", 3,
        "uru", 3,
        "valyrium", 3,
        "eezo", 1
    );
    add3alloy(2, "yrdeen", 3,
        "uru", 3,
        "valyrium", 3,
        "osram", 1
    );
    add3alloy(2, "yrdeen", 3,
        "uru", 3,
        "valyrium", 3,
        "abyssum", 1
    );

    add3alloy(2, "seismum", 4,
        "obsidian", 2,
        "triberium", 2,
        "eezo", 1
    );
    add2alloy(1, "astrium", 2,
        "terrax", 3,
        "aurorium", 2
    );
    add3alloy(2, "niob", 3,
        "palladium", 3,
        "duranite", 1,
        "osram", 1
    );
}

{//mystical alloys
    
    TEAlloyer.addRecipe(
        <tconevo:metal:15>, 
        <tconevo:material>,
        <minecraft:experience_bottle> * 64,
        50000
    );

    mods.thermalexpansion.Transposer.addFillRecipe(
        <mysticalagriculture:crafting:32>, <actuallyadditions:item_crystal_empowered:5> * 2, 
        <liquid:osmiridium> * 216, 
        8000
    );

    add3alloy(4, "mystical_metal0", 2,
        "mystical_base", 1,
        "essence", 1,
        "steelwood", 1
    );
    add3alloy(4, "mystical_metal0", 1,
        "mystical_base", 1,
        "emerald", 1,
        "steelwood", 1
    );

    add3alloy(4, "mystical_metal1", 1,
        "mystical_metal0", 2,
        "mitanium", 2,
        "imperomite", 1
    );
    add3alloy(4, "mystical_metal1", 1,
        "mystical_metal0", 2,
        "mitanium", 2,
        "triberium", 4
    );

    add3alloy(4, "mystical_metal2", 1,
        "mystical_metal1", 2,
        "fluxed_electrum", 2,
        "energetic_gold1", 4
    );



    

}

//modularium
add2alloy(1, "basic_modularium", 2,
    "modularium_paste", 1,
    "bronze", 1
);
add3alloy(1, "modularium", 1,
    "basic_modularium", 3,
    "mekanized_steel", 1,
    "steeleaf", 10 
);

{//black iron
    recipes.removeByRecipeName("extendedcrafting:black_iron_ingot");
    add3alloy(3, "preblack_iron", 8,
        "ender_ingot", 8,
        "steeleaf_singularity", 1,
        "singularity", 2
    );

    <contenttweaker:preblack_ingot>.addTooltip("Consider using Auxiliary Sieve");
    <contenttweaker:preblack_ingot>.addTooltip("when making Black Iron");
    TEAlloyer.addRecipe(
        <contenttweaker:reinforced_cell>, 
        <contenttweaker:preblack_ingot> * 8,
        <contenttweaker:lightning_cell>,
        100000,
        <extendedcrafting:material> * 4,
        95
    );
}