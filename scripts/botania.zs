import mods.botania.ManaInfusion;

import mods.botania.RuneAltar;
//RuneAltar.addRecipe(IItemStack output, IIngredient[] input, int mana);

import mods.botania.PureDaisy;
//PureDaisy.addRecipe(IIngredient blockInput, IItemStack blockOutput, @Optional int time);

import mods.botania.ElvenTrade;
//ElvenTrade.addRecipe(IIngredient[] outputs, IIngredient[] input);

import mods.botania.Apothecary;

import mods.modularmachinery.RecipeBuilder;

{//floral fert
    recipes.remove(<botania:fertilizer>);
    recipes.addShapeless("ia_floral_fertilizer1", <botania:fertilizer> * 2, 
        [<prodigytech:meat_ground>, <prodigytech:meat_ground>, <roots:petals>, <minecraft:dye:15>, <roots:terra_moss>]
    );
    recipes.addShapeless("ia_floral_fertilizer2", <botania:fertilizer> * 4, 
        [<prodigytech:meat_ground>, <prodigytech:meat_ground>, <roots:petals>, <minecraft:dye:15>, <roots:terra_moss>, <contenttweaker:bamboo_dust>]
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<botania:fertilizer> * 16], [],
        [
            <roots:petals> * 2,
            <roots:terra_moss>, 
            <contenttweaker:bamboo_dust> * 3,
            <contenttweaker:enriched_biocoal>
        ],
        [
            <liquid:seed_oil> * 1000,
            <liquid:biofuel> * 500,
            <liquid:if.protein> * 500
        ], 20, 500
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<botania:fertilizer> * 16], [],
        [
            <roots:petals> * 2,
            <roots:terra_moss>, 
            <contenttweaker:bamboo_dust> * 3,
            <contenttweaker:enriched_biocoal>
        ],
        [
            <liquid:tree_oil> * 1000,
            <liquid:biofuel> * 500,
            <liquid:if.protein> * 500
        ], 20, 500
    );
}


//ender air
mods.thermalexpansion.Transposer.addFillRecipe(
    <botania:manaresource:15>, 
    <minecraft:glass_bottle>, 
    <liquid:end_air> * 250, 1000
);


{//mana things
    recipes.addShaped("ia_manaclay_block_expensive", <contenttweaker:manaclay_block>, [
        [<ore:powderMana>, <contenttweaker:elemental_clay>], 
        [<contenttweaker:elemental_clay>, <ore:powderMana>], 
    ]);

    {//manabrick
        var rec = RecipeBuilder.newBuilder("manabrick", "tignalum_oven", 20);

        rec.addEnergyPerTickInput(1024);

        rec.addItemOutput(<contenttweaker:manabrick>);

        rec.addItemInput(<contenttweaker:manaclay>);
        
        
        rec.addHotAirInput(250, 250, 1001);

        rec.build();
    }

    //mana pools
    recipes.remove(<botania:pool:2>);
    recipes.remove(<botania:pool>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:pool>, [
        [null, null, null, null, null], 
        [<contenttweaker:rune_base>, null, null, null, <contenttweaker:rune_base>], 
        [<ore:livingrock>, <ore:plateMithril>, <ore:plateMithril>, <ore:plateMithril>, <ore:livingrock>], 
        [<ore:livingrock>, <contenttweaker:manabrick_block>, <contenttweaker:manabrick_block>, <contenttweaker:manabrick_block>, <ore:livingrock>], 
        [<ore:livingrock>, <ore:livingrock>, <ore:livingrock>, <ore:livingrock>, <ore:livingrock>]
    ]);

    //mana powder
    ManaInfusion.removeRecipe(<botania:manaresource:23>);//500
    ManaInfusion.addInfusion(<botania:manaresource:23>, <contenttweaker:blood_runic_dust>, 5000);

    //mana steel
    ManaInfusion.removeRecipe(<botania:manaresource>); //3000
    ManaInfusion.removeRecipe(<botania:storage>); //27000
    ManaInfusion.removeRecipe(<moreplates:manasteel_plate>); //3000
    ManaInfusion.removeRecipe(<moreplates:manasteel_gear>); //3000
    ManaInfusion.addInfusion(<botania:manaresource>, <contenttweaker:mana_absorbing_ingot>, 7500);

    //mana diamond
    ManaInfusion.removeRecipe(<botania:manaresource:2>); //10000
    ManaInfusion.addInfusion(<botania:manaresource:2>, <enderio:item_material:16>, 150000);
    ManaInfusion.addInfusion(<botania:manaresource:2>, <enderio:item_material:18>, 15000);
    ManaInfusion.addInfusion(<botania:manaresource:2>, <contenttweaker:blood_gem>, 15000);

    //mana circuit
    ManaInfusion.addInfusion(<contenttweaker:mana_circuit>, <quantumflux:craftingpiece:5>, 30000);

    //managlass
    ManaInfusion.removeRecipe(<botania:managlass>);//150
    ManaInfusion.addInfusion(<botania:managlass>, <engineersdecor:panzerglass_block>, 1000);

    //mana cloth
    ManaInfusion.removeRecipe(<botania:manaresource:16>);//5000
    ManaInfusion.addInfusion(<botania:manaresource:16>, <contenttweaker:insulation_strand>, 4000);

    recipes.remove(<botania:manaresource:22>);
    recipes.addShaped("ia_mana_cloth", <botania:manaresource:22>, [
        [<botania:manaresource:16>, <contenttweaker:insulation_fabric>, <botania:manaresource:16>], 
        [<contenttweaker:glass_cloth>, <bloodmagic:component:8>, <contenttweaker:glass_cloth>], 
        [<botania:manaresource:16>, <contenttweaker:insulation_fabric>, <botania:manaresource:16>]
    ]);

    //ManaInfusion.removeRecipe();
    /*
    ManaInfusion.addInfusion(<botania:manaresource:1>, <minecraft:ender_pearl>, 6000);
    ManaInfusion.addInfusion(<botania:storage:3>, <minecraft:diamond_block>, 90000);
    ManaInfusion.addInfusion(<botania:pistonrelay>, <minecraft:piston>, 15000);
    ManaInfusion.addInfusion(<botania:manacookie>, <minecraft:cookie>, 20000);
    ManaInfusion.addInfusion(<botania:grassseeds>, <minecraft:tallgrass:1>, 2500);
    ManaInfusion.addInfusion(<botania:grassseeds:1>, <minecraft:deadbush>, 2500);
    ManaInfusion.addInfusion(<botania:grassseeds:2>, <minecraft:red_mushroom>, 6500);
    ManaInfusion.addInfusion(<botania:grassseeds:2>, <minecraft:brown_mushroom>, 6500);
    ManaInfusion.addInfusion(<botania:quartz:1>, <minecraft:quartz>, 250);
    */

    {//alchemy
        ManaInfusion.addAlchemy(<taiga:tritonite_ingot>, <taiga:terrax_ingot>, 5000);
    }
}

recipes.addShaped("ia_frame13", <contenttweaker:mana_frame>, [
	[<moreplates:manasteel_plate>, <contenttweaker:rune_base>, <moreplates:manasteel_plate>], 
	[<contenttweaker:pure_cincinnasite>, <contenttweaker:blood_frame>, <contenttweaker:pure_cincinnasite>], 
	[<moreplates:crystalline_alloy_plate>, <contenttweaker:bloody_circuit>, <moreplates:crystalline_alloy_plate>]
]);
recipes.remove(<botania:runealtar>);
mods.extendedcrafting.TableCrafting.addShaped(0, <botania:runealtar>, [
	[<bloodmagic:points_upgrade>, null, null, null, <bloodmagic:points_upgrade>], 
	[<contenttweaker:rune_base>, <botania:manaresource:2>, <botania:manaresource:2>, <botania:manaresource:2>, <contenttweaker:rune_base>], 
	[<botania:livingrock>, <contenttweaker:compact_empowerer>, <contenttweaker:slate_6>, <contenttweaker:compact_empowerer>, <botania:livingrock>], 
	[null, <contenttweaker:manabrick_block>, <contenttweaker:mana_frame>, <contenttweaker:manabrick_block>, null], 
	[null, <botania:livingrock>, <botania:pool>, <botania:livingrock>, null]
]);

{//flowers
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:revived_bush>, <minecraft:deadbush>, 
        <liquid:potion>.withTag({Potion: "extrautils2:xu2.second.chance"}) * 4000, 
        40000
    );

    recipes.remove(<botania:altar>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:altar>, [
        [<bloodmagic:blood_rune>, null, null, null, <bloodmagic:blood_rune>], 
        [<bloodmagic:blood_rune>, <contenttweaker:revived_bush>, <contenttweaker:revived_bush>, <contenttweaker:revived_bush>, <bloodmagic:blood_rune>], 
        [null, <bloodmagic:blood_rune>, <contenttweaker:manabrick_block>, <bloodmagic:blood_rune>, null], 
        [null, <bloodmagic:blood_rune>, <contenttweaker:manabrick_block>, <bloodmagic:blood_rune>, null], 
        [<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <bloodmagic:altar>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>]
    ]);


    Apothecary.removeRecipe("endoflame");
    Apothecary.addRecipe("endoflame", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator"}),
        <botania:petalblock:8>, <botania:petalblock:14>, <botania:petalblock:12>
    ]);

    Apothecary.removeRecipe("thermalily");
    Apothecary.addRecipe("thermalily", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}),
        <botania:petalblock:14>, <botania:petalblock:1>, <botania:petalblock:1>, 
        <botania:rune:1>, <botania:rune:2>
    ]);
}
{//pure daisy
    Apothecary.removeRecipe("puredaisy");
    Apothecary.addRecipe("puredaisy", [
        <contenttweaker:revived_bush>,
        <tconstruct:soil:4>, <contenttweaker:soap>,
        <botania:petalblock>, <botania:petalblock>, <botania:petalblock>
    ]);

    PureDaisy.removeRecipe(<botania:livingwood>);
    PureDaisy.addRecipe(<contenttweaker:revived_log>, <botania:livingwood>);

    PureDaisy.removeRecipe(<botania:livingrock>);
    PureDaisy.addRecipe(<engineersdecor:gas_concrete>, <botania:livingrock>);

    PureDaisy.addRecipe(<minecraft:sand:1>, <thermalfoundation:ore_fluid:5>);
    PureDaisy.addRecipe(<minecraft:diamond_ore>, <mysticalworld:amethyst_ore>);
    PureDaisy.addRecipe(<erebus:ore_copper>, <erebus:ore_jade>);
    PureDaisy.addRecipe(<quark:biome_brick:1>, <netherendingores:ore_other_1:10>);
    PureDaisy.addRecipe(<quark:biome_cobblestone:1>, <aether_legacy:icestone>);

    PureDaisy.addRecipe(<contenttweaker:living_steel_sheetmetal>, <contenttweaker:pure_sheetmetal>);
    PureDaisy.addRecipe(<contenttweaker:crystal_metal_block>, <contenttweaker:pure_metal>);
    PureDaisy.addRecipe(<betternether:cincinnasite_forged>, <contenttweaker:pure_cincinnasite>);

    
}
{//quartz
    ManaInfusion.removeRecipe(<botania:quartz:1>);
    ManaInfusion.addInfusion(<botania:quartz:1> * 2, <extendedcrafting:singularity_custom:26>, 5000);
    ManaInfusion.addInfusion(<botania:quartz:1> * 2, <extendedcrafting:singularity_custom:25>, 5000);

    recipes.remove(<botania:quartz>);
    ManaInfusion.addInfusion(<botania:quartz> * 2, <extendedcrafting:singularity_custom:27>, 5000);

    recipes.remove(<botania:quartz:6>);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <botania:quartz:6> * 2,
        <extendedcrafting:singularity_custom:25>, <liquid:sunnarium> * 11000,
        5000
    );

    recipes.remove(<botania:quartz:2>);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <botania:quartz:2> * 2,
        <extendedcrafting:singularity_custom:25>, <liquid:super_heat_lava> * 500,
        5000
    );
}

recipes.addShaped("ia_opencrate", <botania:opencrate>, [
	[<erebus:planks_petrified_wood>, <erebus:materials:7>, <erebus:planks_petrified_wood>], 
	[<erebus:materials:7>, <actuallyadditions:block_dropper>, <erebus:materials:7>], 
	[<erebus:planks_petrified_wood>, null, <erebus:planks_petrified_wood>]
]);

{
    mods.industrialforegoing.Extractor.add(<contenttweaker:revived_log>, <liquid:premana_juice>);
    mods.industrialforegoing.Extractor.add(<botania:livingwood>, <liquid:premana_juice> * 2);
    mods.industrialforegoing.Extractor.add(<contenttweaker:revived_log>, <liquid:premana_juice>);
}



//runes
for rune_id in 0 to 16{ 
    mods.botania.RuneAltar.removeRecipe(<botania:rune>.definition.makeStack(rune_id));
}

{//rune base
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:rune_base>], [],
        [
            <bloodmagic:slate:4>,
            <contenttweaker:flower_steel_gear>,
            <contenttweaker:luck_particle> * 3,
            <contenttweaker:gambrosium_processor>
        ], [
            <liquid:mana_juice> * 1000,
            <liquid:livingrock> * (144 * 4),
            <liquid:draconium> * 216,
            <liquid:biotite> * 1000
        ],
        20, 20000
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:rune_base> * 2], [],
        [
            <bloodmagic:slate:4>,
            <contenttweaker:flower_steel_gear>,
            <contenttweaker:chitin>,
            <contenttweaker:gambrosium_processor>
        ], [
            <liquid:mana_juice> * 1500,
            <liquid:livingrock> * (144 * 6),
            <liquid:draconium> * 288,
            <liquid:biotite> * 1000
        ],
        20, 20000
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:rune_base> * 2], [],
        [
            <bloodmagic:slate:4> * 3,
            <contenttweaker:flower_steel_gear> * 3,
            <contenttweaker:entwood_dust> * 8,
            <contenttweaker:gambrosium_processor> * 2
        ], [
            <liquid:mana_juice> * 1000,
            <liquid:livingrock> * (144 * 6),
            <liquid:draconium> * 288,
            <liquid:biotite> * 1000
        ],
        20, 20000
    );
}

scripts.content_machines.addBioAssemblerRecipe(
    [<contenttweaker:improved_rune_base> * 2, <contenttweaker:reinforced_cell>], null,
    [
        <contenttweaker:rune_base> * 3,
        <moreplates:manasteel_plate> * 2,
        <contenttweaker:slate_6>,
        <contenttweaker:lightning_cell>,
        <bigreactors:mineralanglesite> * 3
    ], [
        <liquid:rune_acid> * 200,
        <liquid:livingrock> * 576
    ], <botania:rune:8>, 
    40, 2000
);
scripts.content_machines.addAdvancedMixerRecipe(
    [<contenttweaker:advanced_rune_base> * 2], [],
    [
        <contenttweaker:elemental_essence>,
        <contenttweaker:improved_rune_base> * 3,
        <contenttweaker:super_vibrant_plate> * 12,
        <contenttweaker:gem_steel_gear>
    ], [
        <liquid:rune_acid> * 1000,
        <liquid:mana> * 1000,
        <liquid:terrasteel> * 288,
        <liquid:stellar_alloy> * 72
    ],
    20, 20000
);


//t 1
{
    {//water
        RuneAltar.addRecipe(<botania:rune>, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_cryotheum>, 
            <contenttweaker:watertight_steel_block>, <enderio:block_reservoir>, <enderio:block_reservoir>, <moreplates:osmiridium_gear>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_cryotheum>, 
            <contenttweaker:watertight_steel_block>, <enderio:block_reservoir>, <enderio:block_reservoir>, <moreplates:osmiridium_gear>
            ], 30000
        );

        RuneAltar.addRecipe(<botania:rune> * 2, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_cryotheum>, 
            <contenttweaker:watertight_steel_block>, <enderio:block_reservoir>, <enderio:block_reservoir>, <moreplates:osmiridium_gear>,
            <contenttweaker:rune_water_cracked>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune> * 4, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_cryotheum>, 
            <contenttweaker:watertight_steel_block>, <enderio:block_reservoir>, <enderio:block_reservoir>, <moreplates:osmiridium_gear>,
            <contenttweaker:rune_water_cracked>
            ], 30000
        );
    }
    {//fire
        RuneAltar.addRecipe(<botania:rune:1>, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_pyrotheum>, 
            <contenttweaker:thermal_block>, <contenttweaker:firebrick_block>, <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}), <moreplates:demon_gear>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune:1> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_pyrotheum>, 
            <contenttweaker:thermal_block>, <contenttweaker:firebrick_block>, <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}), <moreplates:demon_gear>
            ], 30000
        );

        RuneAltar.addRecipe(<botania:rune:1> * 2, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_pyrotheum>, 
            <contenttweaker:thermal_block>, <contenttweaker:firebrick_block>, <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}), <moreplates:demon_gear>,
            <contenttweaker:rune_fire_cracked>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune:1> * 4, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_pyrotheum>, 
            <contenttweaker:thermal_block>, <contenttweaker:firebrick_block>, <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}), <moreplates:demon_gear>,
            <contenttweaker:rune_fire_cracked>
            ], 30000
        );
    }
    {//earth
        RuneAltar.addRecipe(<botania:rune:2>, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_petrotheum>, 
            <thermalfoundation:storage_alloy:4>, <extrautils2:compressedcobblestone:1>, <contenttweaker:flower_steel_ingot>, <contenttweaker:wear_resistant_alloy_gear>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune:2> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_petrotheum>, 
            <thermalfoundation:storage_alloy:4>, <extrautils2:compressedcobblestone:1>, <contenttweaker:flower_steel_ingot>, <contenttweaker:wear_resistant_alloy_gear>
            ], 30000
        );

        RuneAltar.addRecipe(<botania:rune:2>, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_petrotheum>, 
            <thermalfoundation:storage_alloy:4>, <extrautils2:compressedcobblestone:1>, <contenttweaker:flower_steel_ingot>, <contenttweaker:wear_resistant_alloy_gear>,
            <contenttweaker:rune_earth_cracked>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune:2> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_petrotheum>, 
            <thermalfoundation:storage_alloy:4>, <extrautils2:compressedcobblestone:1>, <contenttweaker:flower_steel_ingot>, <contenttweaker:wear_resistant_alloy_gear>,
            <contenttweaker:rune_earth_cracked>
            ], 30000
        );
    }
    {//air
        RuneAltar.addRecipe(<botania:rune:3>, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_aerotheum>,
            <contenttweaker:angel_block>, <aether_legacy:aerogel>, <erebus:materials:16>, <contenttweaker:soy_gear> 
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune:3> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_aerotheum>,
            <contenttweaker:angel_block>, <aether_legacy:aerogel>, <erebus:materials:16>, <contenttweaker:soy_gear> 
            ], 30000
        );

        RuneAltar.addRecipe(<botania:rune:3> * 2, [
            <contenttweaker:rune_base>, <contenttweaker:advanced_aerotheum>,
            <contenttweaker:angel_block>, <aether_legacy:aerogel>, <erebus:materials:16>, <contenttweaker:soy_gear>,
            <contenttweaker:rune_air_cracked>
            ], 15000
        );
        RuneAltar.addRecipe(<botania:rune:3> * 4, [
            <contenttweaker:improved_rune_base>, <contenttweaker:advanced_aerotheum>,
            <contenttweaker:angel_block>, <aether_legacy:aerogel>, <erebus:materials:16>, <contenttweaker:soy_gear>,
            <contenttweaker:rune_air_cracked>
            ], 30000
        );
    }
}
{//t 1.5
    {//mana
        RuneAltar.addRecipe(<botania:rune:8>, [
            <contenttweaker:rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>
            ], 100000
        );
        RuneAltar.addRecipe(<botania:rune:8> * 2, [
            <contenttweaker:improved_rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>
            ], 150000
        );

        RuneAltar.addRecipe(<botania:rune:8> * 2, [
            <contenttweaker:rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>,
            <contenttweaker:rune_mana_cracked>
            ], 100000
        );
        RuneAltar.addRecipe(<botania:rune:8> * 3, [
            <contenttweaker:improved_rune_base>, <bloodmagic:component:9>,
            <enderio:item_material:44>, <contenttweaker:manaclay>,
            <botania:rune>, <botania:rune:1>, <botania:rune:2>, <botania:rune:3>,
            <contenttweaker:rune_mana_cracked>
            ], 150000
        );
    }
    {//lightning
        RuneAltar.addRecipe(<contenttweaker:rune_lightning>, [
            <contenttweaker:rune_base>, <contenttweaker:electricium>,
            <contenttweaker:power_tap>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>
            ], 40000
        );
        RuneAltar.addRecipe(<contenttweaker:rune_lightning> * 2, [
            <contenttweaker:improved_rune_base>, <contenttweaker:electricium>,
            <contenttweaker:power_tap>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>
            ], 60000
        );

        RuneAltar.addRecipe(<contenttweaker:rune_lightning> * 2, [
            <contenttweaker:rune_base>, <contenttweaker:electricium>,
            <contenttweaker:power_tap>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
            <botania:rune:8>, <contenttweaker:rune_lightning_cracked>
            ], 40000
        );
        RuneAltar.addRecipe(<contenttweaker:rune_lightning> * 3, [
            <contenttweaker:improved_rune_base>, <contenttweaker:electricium>,
            <contenttweaker:power_tap>, <erebus:lightning_speed_block>, <contenttweaker:basic_neuron>, <moreplates:energetic_silver_gear>,
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
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:rune_acid> * (3000), 
        <contenttweaker:rune_acid>, 
        <liquid:endacid> * 2000, 
        8000
    );
}
{//t 2
    {//summer
        RuneAltar.addRecipe(<botania:rune:5>, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>,
            <botania:rune:1>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:5> * 3, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>,
            <botania:rune:1>], 100000
        );

        RuneAltar.addRecipe(<botania:rune:5> * 2, [
            <contenttweaker:improved_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>,
            <contenttweaker:rune_summer_cracked>,
            <botania:rune:1>], 50000
        );
        RuneAltar.addRecipe(<botania:rune:5> * 4, [
            <contenttweaker:advanced_rune_base>, 
            <contenttweaker:rune_fire_block>, 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <forge:bucketfilled>.withTag({FluidName: "high_heat_lava", Amount: 1000}), 
            <extendedcrafting:singularity:64>, <contenttweaker:fiery_singularity>,
            <contenttweaker:rune_summer_cracked>,
            <botania:rune:1>], 100000
        );
    }
}


{//block of rune
    recipes.addShaped("ia_botania_block_rune_water", <contenttweaker:rune_water_block>, [
        [<botania:rune>, <botania:rune>, <botania:rune>], 
        [<botania:rune>, <bloodmagic:ritual_stone:1>, <botania:rune>], 
        [<botania:rune>, <botania:rune>, <botania:rune>]
    ]);
    recipes.addShaped("ia_botania_block_rune_fire", <contenttweaker:rune_fire_block>, [
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>], 
        [<botania:rune:1>, <bloodmagic:ritual_stone:2>, <botania:rune:1>], 
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>]
    ]);
    recipes.addShaped("ia_botania_block_rune_earth", <contenttweaker:rune_earth_block>, [
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>], 
        [<botania:rune:2>, <bloodmagic:ritual_stone:3>, <botania:rune:2>], 
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>]
    ]);
    recipes.addShaped("ia_botania_block_rune_air", <contenttweaker:rune_air_block>, [
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>], 
        [<botania:rune:3>, <bloodmagic:ritual_stone:4>, <botania:rune:3>], 
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>]
    ]);
}


{//elven trade
    //elementum
    ElvenTrade.removeRecipe(<botania:manaresource:7>);
    ElvenTrade.removeRecipe(<moreplates:elementium_plate>);
    ElvenTrade.removeRecipe(<moreplates:elementium_gear>);
    ElvenTrade.removeRecipe(<botania:storage:2>);
    ElvenTrade.addRecipe(
        [<botania:manaresource:7>],
        [<botania:manaresource>, <botania:manaresource>, <contenttweaker:neodymium_ingot>, <prodigytech:ferramic_block>, <contenttweaker:elemental_clay>, <ore:elfPayCheck>]
    );

    //glass
    ElvenTrade.removeRecipe(<botania:elfglass>);
    ElvenTrade.addRecipe(
        [<botania:elfglass>, <botania:elfglass>],
        [<botania:managlass>, <botania:managlass>, <contenttweaker:high_heat_glass>, <thermalfoundation:glass:8>, <ore:elfPayCheck>]
    );
}
//terra
recipes.remove(<botania:terraplate>);
mods.extendedcrafting.TableCrafting.addShaped(0, <botania:terraplate>, [
	[null, null, null, null, null], 
	[<minecraft:lapis_block>, <minecraft:lapis_block>, <contenttweaker:poisotheum>, <minecraft:lapis_block>, <minecraft:lapis_block>], 
	[<moreplates:manasteel_gear>, <botania:rune:6>, <extendedcrafting:singularity_custom:23>, <botania:rune:5>, <moreplates:manasteel_gear>], 
	[<moreplates:draconium_gear>, <contenttweaker:slate_7>, <contenttweaker:mana_frame>, <contenttweaker:slate_7>, <moreplates:draconium_gear>], 
	[<moreplates:manasteel_gear>, <botania:rune:4>, <botania:rune:8>, <botania:rune:7>, <moreplates:manasteel_gear>]
]);
recipes.addShaped("ia_terra_coral", <contenttweaker:terra_coral>, [
    [<botania:manaresource:4>, <contenttweaker:life>, <botania:manaresource:4>], 
    [<botania:manaresource:4>, <contenttweaker:coral_dust>, <botania:manaresource:4>], 
    [<botania:manaresource:4>, <contenttweaker:life>, <botania:manaresource:4>]
]);
//gaia
recipes.remove(<botania:manaresource:14>);
mods.extendedcrafting.TableCrafting.addShaped(0, <botania:manaresource:14>, [
	[null, null, null, <botania:rune:9>, null, null, null], 
	[null, <botania:rune:11>, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>, <botania:rune:10>, null], 
	[null, <thermalfoundation:material:1028>, <botania:manaresource:5>, <botania:manaresource:4>, <botania:manaresource:5>, <thermalfoundation:material:1028>, null], 
	[null, <thermalfoundation:material:1028>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>, <thermalfoundation:material:1028>, null], 
	[<botania:rune:13>, <thermalfoundation:material:1028>, <botania:manaresource:5>, <botania:manaresource:4>, <botania:manaresource:5>, <thermalfoundation:material:1028>, <botania:rune:12>], 
	[null, null, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>, null, null], 
	[null, null, <botania:rune:14>, null, <botania:rune:15>, null, null]
]);


mods.extendedcrafting.CombinationCrafting.addRecipe(
    <contenttweaker:mana_star>, 4096 * 200, 4096, <contenttweaker:glass_star>, 
    [
        <bloodmagic:demon_extras:11>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>,

        <bloodmagic:demon_extras:12>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>,

        <bloodmagic:demon_extras:13>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>,

        <bloodmagic:demon_extras:14>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>
    ]
);


recipes.addShaped("ia_overgrowthseed", <botania:overgrowthseed>, [
	[<contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>], 
	[<contenttweaker:fertilizer7>, <contenttweaker:chlorasteel_gear>, <contenttweaker:fertilizer7>], 
	[<contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>]
]);
scripts.jei.addJEIhint(
    [<minecraft:grass>], [], 
    [<botania:overgrowthseed>], 
    [<botania:enchantedsoil>.withDisplayName("Increases work speed/mana generated for botania flowers")]
);