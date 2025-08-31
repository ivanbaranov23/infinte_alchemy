import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;

import mods.botania.RuneAltar;


for rune_id in 0 to 16{ 
    RuneAltar.removeRecipe(<botania:rune>.definition.makeStack(rune_id));
}

static rune_bases as IItemStack[] = [
    <contenttweaker:rune_base>,
    <contenttweaker:improved_rune_base>,
    <contenttweaker:advanced_rune_base>,
    <contenttweaker:terra_rune_base>
];
static rune_bonus as int[] = [
    0,
    0,
    1,
    0
];

function addRuneRecipes(rune as IItemStack, cracked as IItemStack, inps as IIngredient[], tier as int, mana as int){
    RuneAltar.addRecipe(rune * (1 + rune_bonus[tier]), inps + rune_bases[tier], mana);
    RuneAltar.addRecipe(rune * (3 + rune_bonus[tier]), inps + rune_bases[tier + 1], mana);
    RuneAltar.addRecipe(rune * (2 + rune_bonus[tier]), inps + rune_bases[tier] + cracked, mana);
    RuneAltar.addRecipe(rune * (4 + rune_bonus[tier]), inps + rune_bases[tier + 1] + cracked, mana);

    {
        var rec = RecipeBuilder.newBuilder(rune.name, "rune_cracker", 20 * 1);

		rec.addEnergyPerTickInput(2048 * 1000);

        rec.addItemOutput(cracked);
        rec.addItemOutput(cracked).setChance(0.5 - 0.1*tier);
		
	
    	rec.addItemInput(rune);

		rec.build();
    }
}

{//t 1
    addRuneRecipes(
        <botania:rune>, <contenttweaker:rune_water_cracked>, [
            <contenttweaker:advanced_cryotheum>, 
            <thermalexpansion:device:2>, 
            <openblocks:tank>.withTag({tank: {FluidName: "ocean_water", Amount: 16000}}), 
            <thermalexpansion:augment:433>,
            <contenttweaker:watertight_steel_block>,
            <taiga:abyssum_block>,
            <moreplates:osmiridium_gear>
    ], 0, 15000);
    addRuneRecipes(
        <botania:rune:1>, <contenttweaker:rune_fire_cracked>, [
            <contenttweaker:advanced_pyrotheum>, 
            <thermalexpansion:machine:6>,
            <openblocks:tank>.withTag({tank: {FluidName: "enriched_diesel1", Amount: 16000}}), 
            <contenttweaker:tignalum_blast_brick>, 
            <contenttweaker:thermal_block>, 
            <taiga:ignitz_block>,
            <moreplates:demon_gear>
    ], 0, 15000);
    addRuneRecipes(
        <botania:rune:2>, <contenttweaker:rune_earth_cracked>, [
            <contenttweaker:advanced_petrotheum>, 
            <thermalexpansion:machine:15>,
            <openblocks:tank>.withTag({tank: {FluidName: "andesite_magma", Amount: 16000}}),
            <extrautils2:compressedcobblestone:3>, 
            <moretcon:blockgravitonium>,
            <taiga:seismum_block>,
            <contenttweaker:wear_resistant_alloy_gear>
    ], 0, 15000);
    addRuneRecipes(
        <botania:rune:3>, <contenttweaker:rune_air_cracked>, [
            <contenttweaker:advanced_aerotheum>,
            <excompressum:auto_heavy_sieve>,
            <openblocks:tank>.withTag({tank: {FluidName: "cloud_seed_concentrated", Amount: 16000}}),
            <extrautils2:chickenring:1>,
            <contenttweaker:flower_steel_block>,
            <tinkersaether:valkyrie_block>,
            <contenttweaker:soy_gear> 
    ], 0, 15000);
    
}
{//t 1.5
    addRuneRecipes(
        <botania:rune:8>, <contenttweaker:rune_mana_cracked>, [
            <bloodmagic:component:9>,
            
            <openblocks:tank>.withTag({tank: {FluidName: "mana_juice", Amount: 16000}}),
            <contenttweaker:mana_focus>, <contenttweaker:mana_focus>,
            <contenttweaker:mana_circuit>, <contenttweaker:mana_circuit>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>
    ], 0, 15000);
    addRuneRecipes(
        <contenttweaker:rune_lightning>, <contenttweaker:rune_lightning_cracked>, [
            <contenttweaker:electricium>,
            <thermalexpansion:machine:9>,
            <openblocks:tank>.withTag({tank: {FluidName: "empoweredoil", Amount: 16000}}),
            <contenttweaker:neuron2_inlay>,
            <moretcon:blockelectarite>,
            <contenttweaker:electric_manyullyn_block>,
            <moreplates:energetic_silver_gear>,
            <botania:rune:8>
    ], 0, 25000);
    addRuneRecipes(
        <contenttweaker:rune_acid>, <contenttweaker:rune_acid_cracked>, [
            <contenttweaker:reagent_acid>,
            <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "chloroauric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "nitric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "acetic_acid", Amount: 1000}),
            <mod_lavacow:acidicheart>,
            <contenttweaker:vitamin_c>,
            <contenttweaker:ecoppra_block>,
            <contenttweaker:acid_resistant_steel_gear>,
            <botania:rune:8>
    ], 0, 25000);

    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:rune_acid> * (1000), 
        <contenttweaker:rune_acid>, 
        <liquid:acid1> * 2000, 
        25000
    );

    /*{//mana
        RuneAltar.addRecipe(<botania:rune:8>, [
            <contenttweaker:rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>, <contenttweaker:mana_circuit>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>
            ], 100000
        );
        RuneAltar.addRecipe(<botania:rune:8> * 2, [
            <contenttweaker:improved_rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>, <contenttweaker:mana_circuit>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>
            ], 150000
        );

        RuneAltar.addRecipe(<botania:rune:8> * 2, [
            <contenttweaker:rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>, <contenttweaker:mana_circuit>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>,
            <contenttweaker:rune_mana_cracked>
            ], 100000
        );
        RuneAltar.addRecipe(<botania:rune:8> * 3, [
            <contenttweaker:improved_rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>, <contenttweaker:mana_circuit>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>,
            <contenttweaker:rune_mana_cracked>
            ], 150000
        );
    }
    {//lightning
        RuneAltar.addRecipe(<contenttweaker:rune_lightning>, [
            <contenttweaker:rune_base>, <contenttweaker:electricium>,
            <thermalexpansion:machine:9>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>
            ], 40000
        );
        RuneAltar.addRecipe(<contenttweaker:rune_lightning> * 2, [
            <contenttweaker:improved_rune_base>, <contenttweaker:electricium>,
            <thermalexpansion:machine:9>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>
            ], 60000
        );

        RuneAltar.addRecipe(<contenttweaker:rune_lightning> * 2, [
            <contenttweaker:rune_base>, <contenttweaker:electricium>,
            <thermalexpansion:machine:9>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>, <contenttweaker:rune_lightning_cracked>
            ], 40000
        );
        RuneAltar.addRecipe(<contenttweaker:rune_lightning> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:electricium>,
            <thermalexpansion:machine:9>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>, <contenttweaker:rune_lightning_cracked>
            ], 60000
        );
    }
    {//acid
        RuneAltar.addRecipe(<contenttweaker:rune_acid>, [
            <contenttweaker:rune_base>, <contenttweaker:reagent_acid>,
            <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "chloroauric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "nitric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "acetic_acid", Amount: 1000}),
            <contenttweaker:vitamin_c>,
            <contenttweaker:acid_resistant_steel_gear>,
            <botania:rune:8>
            ], 40000
        );
        RuneAltar.addRecipe(<contenttweaker:rune_acid> * 2, [
            <contenttweaker:improved_rune_base>, <contenttweaker:reagent_acid>,
            <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "chloroauric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "nitric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "acetic_acid", Amount: 1000}),
            <contenttweaker:vitamin_c>,
            <contenttweaker:acid_resistant_steel_gear>,
            <botania:rune:8>
            ], 60000
        );

        RuneAltar.addRecipe(<contenttweaker:rune_acid> * 2, [
            <contenttweaker:rune_base>, <contenttweaker:reagent_acid>,
            <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "chloroauric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "nitric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "acetic_acid", Amount: 1000}),
            <contenttweaker:vitamin_c>,
            <contenttweaker:acid_resistant_steel_gear>,
            <botania:rune:8>, <contenttweaker:rune_acid_cracked>
            ], 40000
        );
        RuneAltar.addRecipe(<contenttweaker:rune_acid> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:reagent_acid>,
            <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "chloroauric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "nitric_acid", Amount: 1000}),
            <forge:bucketfilled>.withTag({FluidName: "acetic_acid", Amount: 1000}),
            <contenttweaker:vitamin_c>,
            <contenttweaker:acid_resistant_steel_gear>,
            <botania:rune:8>, <contenttweaker:rune_acid_cracked>
            ], 60000
        );
    }    
    

    {//glass
        RuneAltar.addRecipe(<contenttweaker:rune_glass>, [
            <contenttweaker:improved_rune_base>,
            <contenttweaker:reagent_glass>,
            <botania:elfglass>,
            <contenttweaker:glass_star>,
            <contenttweaker:neutronium_mirror>,
            <bloodmagic:demon_extras:14>,
            <ironchest:iron_chest:5>,
            <botania:rune:8>
        ], 100000);

        RuneAltar.addRecipe(<contenttweaker:rune_glass> * 3, [
            <contenttweaker:advanced_rune_base>,
            <contenttweaker:reagent_glass>,
            <botania:elfglass>,
            <contenttweaker:glass_star>,
            <contenttweaker:neutronium_mirror>,
            <bloodmagic:demon_extras:14>,
            <ironchest:iron_chest:5>,
            <botania:rune:8>
        ], 200000);
    }*/
}
{//t 2
    addRuneRecipes(//summer
        <botania:rune:5>, <contenttweaker:rune_summer_cracked>, [
            <contenttweaker:rune_fire_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "high_heat_lava", Amount: 16000}}), 
            <mekanism:machineblock3:4>,
            <contenttweaker:crucible>,
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>, <botania:quartz:2>,
            <botania:rune:1>
    ], 1, 25000);
    addRuneRecipes(//spring
        <botania:rune:4>, <contenttweaker:rune_spring_cracked>, [
            <contenttweaker:rune_earth_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}),
            <mekanism:machineblock3:1>,
            <enderio:item_material:41>,
            <extendedcrafting:singularity_custom:42>, <extendedcrafting:singularity_custom:57>, <botania:quartz:6>,
            <botania:rune:2>
    ], 1, 25000);
    addRuneRecipes(//autumn
        <botania:rune:6>, <contenttweaker:rune_autumn_cracked>, [
            <contenttweaker:rune_air_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "fermented_bacteria_broth", Amount: 16000}}),
            <mekanism:machineblock2:10>,
            <contenttweaker:plant_unit>,
            <extendedcrafting:singularity_custom:60>, <extendedcrafting:singularity_custom:20>, <botania:quartz>,
            <botania:rune:2>
    ], 1, 25000);
    addRuneRecipes(//winter
        <botania:rune:7>, <contenttweaker:rune_winter_cracked>, [
            <contenttweaker:rune_water_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "cold_nitrogen", Amount: 16000}}),
            <mekanism:machineblock2:8>,
            <contenttweaker:cooling_system>,
            <extendedcrafting:singularity:34>, <extendedcrafting:singularity_custom:14>, <botania:quartz:1>,
            <botania:rune:2>
    ], 1, 25000);
/*
    {//summer
        RuneAltar.addRecipe(<botania:rune:5>, [
            <contenttweaker:improved_rune_base>, 
            
            ], 50000
        );
        RuneAltar.addRecipe(<botania:rune:5> * 3, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "high_heat_lava", Amount: 16000}}), 
            <contenttweaker:crucible>,
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>, <botania:quartz:2>,
            <botania:rune:1>], 100000
        );

        RuneAltar.addRecipe(<botania:rune:5> * 2, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "high_heat_lava", Amount: 16000}}), 
            <contenttweaker:crucible>,
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>, <botania:quartz:2>,
            <contenttweaker:rune_summer_cracked>,
            <botania:rune:1>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:5> * 4, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "high_heat_lava", Amount: 16000}}), 
            <contenttweaker:crucible>,
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>, <botania:quartz:2>,
            <contenttweaker:rune_summer_cracked>,
            <botania:rune:1>], 100000
        );

    }
    {//spring
        RuneAltar.addRecipe(<botania:rune:4>, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_earth_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}),
            <extendedcrafting:singularity_custom:42>, <extendedcrafting:singularity_custom:57>, <botania:quartz:6>,
            <botania:rune:2>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:4> * 3, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_earth_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}),
            <extendedcrafting:singularity_custom:42>, <extendedcrafting:singularity_custom:57>, <botania:quartz:6>,
            <botania:rune:2>], 100000
        );

        RuneAltar.addRecipe(<botania:rune:4> * 2, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_earth_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}),
            <extendedcrafting:singularity_custom:42>, <extendedcrafting:singularity_custom:57>, <botania:quartz:6>,
            <contenttweaker:rune_summer_cracked>,
            <botania:rune:2>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:4> * 4, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_earth_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}),
            <extendedcrafting:singularity_custom:42>, <extendedcrafting:singularity_custom:57>, <botania:quartz:6>,
            <contenttweaker:rune_summer_cracked>,
            <botania:rune:2>], 100000
        );
    }
    {//autumn
        RuneAltar.addRecipe(<botania:rune:6>, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_air_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "fermented_bacteria_broth", Amount: 16000}}), 
            <contenttweaker:plant_unit>,
            <extendedcrafting:singularity_custom:60>, <extendedcrafting:singularity_custom:20>, <botania:quartz>,
            <botania:rune:3>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:6> * 3, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_air_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "fermented_bacteria_broth", Amount: 16000}}), 
            <contenttweaker:plant_unit>,
            <extendedcrafting:singularity_custom:60>, <extendedcrafting:singularity_custom:20>, <botania:quartz>,
            <botania:rune:3>], 100000
        );

        RuneAltar.addRecipe(<botania:rune:6> * 2, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_air_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "fermented_bacteria_broth", Amount: 16000}}), 
            <contenttweaker:plant_unit>,
            <extendedcrafting:singularity_custom:60>, <extendedcrafting:singularity_custom:20>, <botania:quartz>,
            <contenttweaker:rune_autumn_cracked>,
            <botania:rune:3>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:6> * 4, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_air_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "fermented_bacteria_broth", Amount: 16000}}), 
            <contenttweaker:plant_unit>,
            <extendedcrafting:singularity_custom:60>, <extendedcrafting:singularity_custom:20>, <botania:quartz>,
            <contenttweaker:rune_autumn_cracked>,
            <botania:rune:3>], 100000
        );
    }
    {//winter
        RuneAltar.addRecipe(<botania:rune:7>, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_water_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "cold_nitrogen", Amount: 16000}}), 
            <contenttweaker:cooling_system>,
            <extendedcrafting:singularity:34>, <extendedcrafting:singularity_custom:14>, <botania:quartz:1>,
            <botania:rune:3>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:7> * 3, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_water_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "cold_nitrogen", Amount: 16000}}), 
            <contenttweaker:cooling_system>,
            <extendedcrafting:singularity:34>, <extendedcrafting:singularity_custom:14>, <botania:quartz:1>,
            <botania:rune:3>], 100000
        );

        RuneAltar.addRecipe(<botania:rune:7> * 2, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_water_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "cold_nitrogen", Amount: 16000}}), 
            <contenttweaker:cooling_system>,
            <extendedcrafting:singularity:34>, <extendedcrafting:singularity_custom:14>, <botania:quartz:1>,
            <contenttweaker:rune_autumn_cracked>,
            <botania:rune:3>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:7> * 4, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_water_block>, 
            <openblocks:tank>.withTag({tank: {FluidName: "cold_nitrogen", Amount: 16000}}), 
            <contenttweaker:cooling_system>,
            <extendedcrafting:singularity:34>, <extendedcrafting:singularity_custom:14>, <botania:quartz:1>,
            <contenttweaker:rune_autumn_cracked>,
            <botania:rune:3>], 100000
        );
    }
    */
}
{//t 3
    addRuneRecipes(<botania:rune:9>, <contenttweaker:rune_lust_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,//super alloy gear
        <extendedcrafting:singularity_custom:18>,//gem sing
        <extendedcrafting:singularity_custom:64>,//sing
        <openblocks:tank>.withTag({tank: {FluidName: "potion", Amount: 16000, Tag: {Potion: "extrautils2:xu2.love"}}}),//tank
        <contenttweaker:spice_rabbit>,//smt
    ], 2, 50000);
    addRuneRecipes(<botania:rune:10>, <contenttweaker:rune_gluttony_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,
        <extendedcrafting:singularity_custom:24>,//gem sing
        <extendedcrafting:singularity_custom:36>,
        <openblocks:tank>.withTag({tank: {FluidName: "cool_soup", Amount: 16000}}),
        <thermalexpansion:machine:3>,
        <thermalexpansion:augment:256>,
        <harvestcraft:gourmetvenisonburgeritem>
    ], 2, 50000);
    addRuneRecipes(<botania:rune:11>, <contenttweaker:rune_greed_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,
        <extendedcrafting:singularity_custom:23>,//gem sing
        <extendedcrafting:singularity_custom:70>,
        <openblocks:tank>.withTag({tank: {FluidName: "emerald", Amount: 16000}}),
        <thermalexpansion:dynamo:5>
    ], 2, 50000);
    addRuneRecipes(<botania:rune:12>, <contenttweaker:rune_sloth_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,//ingot
        <extendedcrafting:singularity_custom:20>,//gem sing
        <extendedcrafting:singularity_custom:53>,//sing
        <openblocks:tank>.withTag({tank: {FluidName: "cyanoacrylate", Amount: 16000}}),//tank
        <openblocks:tank>.withTag({tank: {FluidName: "cyanoacrylate", Amount: 16000}}),//tank
        <contenttweaker:lazy_soup>,//smt
    ], 2, 50000);
    addRuneRecipes(<botania:rune:13>, <contenttweaker:rune_wraith_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,//ingot
        <extendedcrafting:singularity_custom:19>, //gem sing
        <extendedcrafting:singularity_custom:65>, //sing
        <openblocks:tank>.withTag({tank: {FluidName: "potion", Amount: 16000, Tag: {Potion: "cofhcore:strength4"}}}),
        <mob_grinding_utils:saw>//smt
    ], 2, 50000);
    addRuneRecipes(<botania:rune:14>, <contenttweaker:rune_envy_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,//ingot
        <extendedcrafting:singularity_custom:21>, //gem sing
        <extendedcrafting:singularity_custom:67>, //sing
        <openblocks:tank>.withTag({tank: {FluidName: "napalm", Amount: 16000}}),
        <openblocks:tank>.withTag({tank: {FluidName: "napalm", Amount: 16000}}),
        <thermalexpansion:machine:13>,//smt
    ], 2, 50000);
    addRuneRecipes(<botania:rune:15>, <contenttweaker:rune_pride_cracked>, [
        <contenttweaker:fluxed_invar_ingot>,//ingot
        <extendedcrafting:singularity_custom:22>,//gem sing
        <extendedcrafting:singularity_custom:38>,//sing
        <openblocks:tank>.withTag({tank: {FluidName: "potion", Amount: 16000, Tag: {Potion: "extrautils2:xu2.gravity"}}}),
        <appliedenergistics2:inscriber>//smt
    ], 2, 50000);
    /*{//lust
        RuneAltar.addRecipe(<botania:rune:9>, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:gem_steel_gear>,//gear
            <extendedcrafting:singularity_custom:18>,//gem sing
            <extendedcrafting:singularity_custom:64>,//sing
            <openblocks:tank>.withTag({tank: {FluidName: "potion", Amount: 16000, Tag: {Potion: "extrautils2:xu2.love"}}}),//tank
            <contenttweaker:spice_rabbit>,//smt
            <extrautils2:opinium:8>,
            <mysticalagriculture:crafting:4>
            ], 200000
        );
    }
    {//sloth
        RuneAltar.addRecipe(<botania:rune:12>, [
            <contenttweaker:advanced_rune_base>, 
            <moreplates:stellar_alloy_gear>,//gear
            <extendedcrafting:singularity_custom:20>,//gem sing
            <extendedcrafting:singularity_custom:53>,//sing
            <openblocks:tank>.withTag({tank: {FluidName: "cyanoacrylate", Amount: 16000}}),//tank
            <contenttweaker:lazy_soup>,//smt
            <extrautils2:opinium:8>,
            <mysticalagriculture:crafting:4>
            ], 200000
        );
    }
    {//pride
        RuneAltar.addRecipe(<botania:rune:15>, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:fluxed_invar_gear>,//gear
            <extendedcrafting:singularity_custom:22>,//gem sing
            <extendedcrafting:singularity_custom:38>,//sing
            <openblocks:tank>.withTag({tank: {FluidName: "cyanoacrylate", Amount: 16000}}),//tank
            <contenttweaker:gearbox_great>,//smt
            <extrautils2:opinium:8>,
            <mysticalagriculture:crafting:4>
            ], 200000
        );
    }*/
}

mods.botania.ElvenTrade.addRecipe([
    <contenttweaker:rune_cyclic>,
    <contenttweaker:nether_star_waste>
], [
    <botania:rune:4>,
    <botania:rune:5>,
    <botania:rune:6>,
    <botania:rune:7>,
    <bloodmagic:component:6>,
    <minecraft:nether_star>,
    <contenttweaker:nether_star_catalyst>
]);
/*
{//ultimate
    var rec = RecipeBuilder.newBuilder("ultimate", "rune_cracker", 20 * 1, 1000);

	rec.addEnergyPerTickInput(2048 * 10000);

    rec.addItemOutput(<contenttweaker:ultimate_rune>);
		
	
    rec.addItemInput(<contenttweaker:terra_rune_base>);
    rec.addItemInput(<contenttweaker:rune_cyclic>).setChance(0.3);
    rec.addItemInput(<botania:rune:9>).setChance(0.3);
    rec.addItemInput(<botania:rune:10>).setChance(0.3);
    rec.addItemInput(<botania:rune:11>).setChance(0.3);
    rec.addItemInput(<botania:rune:12>).setChance(0.3);
    rec.addItemInput(<botania:rune:13>).setChance(0.3);
    rec.addItemInput(<botania:rune:14>).setChance(0.3);
    rec.addItemInput(<botania:rune:15>).setChance(0.3);



	rec.build();
}*/