
//mechs

{//tincan
    //tincan plating
    recipes.addShaped("ia_advanced_plating1_1", <contenttweaker:advanced_plating1_1>, [
        [null, <contenttweaker:wear_resistant_alloy_plate>, null], 
        [<contenttweaker:thermal_plate>, <tconstruct:materials:9>, <contenttweaker:watertight_steel_plate>], 
        [null, <contenttweaker:wear_resistant_alloy_plate>, null]
    ]);
    mods.mekanism.infuser.addRecipe("TIN", 400, <contenttweaker:advanced_plating1_1>, <contenttweaker:advanced_plating1_2>);
    mods.mekanism.compressor.addRecipe(
        <contenttweaker:advanced_plating1_2>,
        <gas:liquidosmium> * 500, 
        <contenttweaker:advanced_plating1_3>);
    mods.mekanism.compressor.addRecipe(
        <contenttweaker:advanced_plating1_3>,
        <gas:fusionfuel> * 50, 
        <contenttweaker:advanced_plating1_4>);
    <contenttweaker:advanced_plating1_4>.addTooltip("Resistant to erosion, water and high heat.");
    recipes.addShaped("ia_advanced_plating1_5", <contenttweaker:advanced_plating1_5>, [
        [null, <contenttweaker:advanced_plating1_4>, null], 
        [<enderio:item_gas_conduit>, <enderio:item_data_conduit>, <enderio:item_liquid_conduit>], 
        [null, <contenttweaker:advanced_plating1_4>, null]
    ]);


    recipes.addShaped("ia_tincan_sawhand", <contenttweaker:tincan_sawhand>, [
        [<contenttweaker:advanced_plating1_4>, <contenttweaker:advanced_plating1_5>, <projectred-core:resource_item:410>], 
        [<contenttweaker:advanced_plating1_4>, <projectred-core:resource_item:410>, <contenttweaker:advanced_plating1_4>], 
        [null, <thermalfoundation:material:657>, null]
    ]);
    recipes.addShaped("ia_tincan_drillhand", <contenttweaker:tincan_drillhand>, [
        [<projectred-core:resource_item:410>, <contenttweaker:advanced_plating1_5>, <contenttweaker:advanced_plating1_4>], 
        [<contenttweaker:advanced_plating1_4>, <projectred-core:resource_item:410>, <contenttweaker:advanced_plating1_4>], 
        [null, <thermalfoundation:material:656>, null]
    ]);
    recipes.addShaped("ia_tincan_legs", <contenttweaker:tincan_legs>, [
        [<projectred-core:resource_item:410>, <projectred-core:resource_item:410>, <projectred-core:resource_item:410>], 
        [<contenttweaker:advanced_plating1_5>, null, <contenttweaker:advanced_plating1_5>], 
        [<contenttweaker:advanced_plating1_5>, null, <contenttweaker:advanced_plating1_5>]
    ]);
    recipes.addShaped("ia_tincan_body", <contenttweaker:tincan_body>, [
        [<contenttweaker:advanced_plating1_5>, <projectred-core:resource_item:410>, <contenttweaker:advanced_plating1_5>], 
        [<thermalexpansion:dynamo>, <contenttweaker:compact_empowerer>, <thermalexpansion:dynamo>], 
        [<simplyjetpacks:metaitemmods:21>, <projectred-core:resource_item:410>, <simplyjetpacks:metaitemmods:21>]
    ]);
    recipes.addShaped("ia_tincan_head", <contenttweaker:tincan_head>, [
        [<contenttweaker:advanced_plating1_4>, <ore:stickMithril>, <contenttweaker:advanced_plating1_4>], 
        [<actuallyadditions:item_crystal_empowered:4>, <contenttweaker:basic_neuron>, <actuallyadditions:item_crystal_empowered:4>], 
        [<contenttweaker:advanced_plating1_4>, <contenttweaker:advanced_plating1_5>, <contenttweaker:advanced_plating1_4>]
    ]);
    <contenttweaker:tincan_head>.addTooltip("A single brain cell");

    recipes.addShaped("ia_tincan_mech", <contenttweaker:tincan_mech>, [
        [null, <contenttweaker:tincan_head>, null], 
        [<contenttweaker:tincan_sawhand>, <contenttweaker:tincan_body>, <contenttweaker:tincan_drillhand>], 
        [null, <contenttweaker:tincan_legs>, null]
    ]);
}

{//radiotoad
    recipes.addShaped("ia_advanced_plating2_1", <contenttweaker:advanced_plating2_1>, [
        [<ore:plateLead>, <contenttweaker:osgloridium_plate>, <ore:plateLead>], 
        [<contenttweaker:malachite_polycrystal>, <contenttweaker:irradiated_compound>, <contenttweaker:malachite_polycrystal>], 
        [<ore:plateLead>, <solarflux:mirror>, <ore:plateLead>]
    ]);
    <contenttweaker:advanced_plating2_1>.addTooltip("Did you just put radioactive material");
    <contenttweaker:advanced_plating2_1>.addTooltip("inbetween reflective surfaces?");

    mods.mekanism.compressor.addRecipe(
        <contenttweaker:advanced_plating2_1>,
        <gas:liquidosmium>,
        <contenttweaker:advanced_plating2_2>
    );
    <contenttweaker:advanced_plating2_2>.addTooltip("You see, by trapping radiation inside between two mirrors");
    <contenttweaker:advanced_plating2_2>.addTooltip("outside radiation can't enter, because inside is already");
    <contenttweaker:advanced_plating2_2>.addTooltip("filled with radiation.");

    recipes.addShaped("ia_advanced_plating2_3", <contenttweaker:advanced_plating2_3>, [
        [<contenttweaker:gas_processor>, <contenttweaker:advanced_plating2_2>, <contenttweaker:gas_processor>], 
        [<contenttweaker:calitunti_gear>, <mekanism:electrolyticcore>, <contenttweaker:calitunti_gear>]
    ]);
    recipes.addShaped("ia_advanced_plating2_4", <contenttweaker:advanced_plating2_4>, [
        [<contenttweaker:insulation_strand>, <contenttweaker:advanced_plating2_3>, <contenttweaker:insulation_strand>], 
        [<enderio:item_gas_conduit:2>, <immersiveengineering:metal:35>, <enderio:item_liquid_conduit:2>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:advanced_plating1_4>, <contenttweaker:insulation_strand>]
    ]);

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:radiotoad_arm>, [
        [null, <projectred-core:resource_item:410>, <contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>, null], 
        [null, <contenttweaker:bedrockium_alloy_ingot>, <projectred-core:resource_item:410>, <contenttweaker:advanced_plating2_4>, null], 
        [null, <contenttweaker:bedrockium_alloy_ingot>, <thermalfoundation:material:640>, <contenttweaker:advanced_plating2_4>, null], 
        [null, <contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:explosion_device_full>, <contenttweaker:advanced_plating2_4>, null], 
        [null, <thermalfoundation:material:656>, <thermalfoundation:material:656>, <thermalfoundation:material:656>, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:radiotoad_legs>, [
        [null, <projectred-core:resource_item:410>, <contenttweaker:bedrockium_alloy_plate>, <projectred-core:resource_item:410>, null], 
        [<contenttweaker:advanced_plating2_4>, <projectred-core:resource_item:410>, null, <projectred-core:resource_item:410>, <contenttweaker:advanced_plating2_4>], 
        [<contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>, null, <contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>], 
        [<contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>, null, <contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>], 
        [<contenttweaker:explosion_device_full>, <contenttweaker:explosion_device_full>, null, <contenttweaker:explosion_device_full>, <contenttweaker:explosion_device_full>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:radiotoad_body>, [
        [null, <openblocks:tank>.withTag({tank: {FluidName: "poison", Amount: 16000}}), <projectred-core:resource_item:410>, <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}), null], 
        [<projectred-core:resource_item:410>, <openblocks:tank>.withTag({tank: {FluidName: "poison", Amount: 16000}}), <contenttweaker:bedrockium_alloy_gear>, <openblocks:tank>.withTag({tank: {FluidName: "hot_spring_water", Amount: 16000}}), <projectred-core:resource_item:410>], 
        [<contenttweaker:advanced_plating2_4>, <thermalexpansion:dynamo:3>, <extrautils2:machine>.withTag({Type: "extrautils2:generator_dragonsbreath"}), <thermalexpansion:dynamo:3>, <contenttweaker:advanced_plating2_4>], 
        [<simplyjetpacks:metaitemmods:21>, <contenttweaker:advanced_plating2_4>, <contenttweaker:bedrockium_alloy_gear>, <contenttweaker:advanced_plating2_4>, <simplyjetpacks:metaitemmods:21>], 
        [null, <simplyjetpacks:metaitemmods:21>, <projectred-core:resource_item:410>, <simplyjetpacks:metaitemmods:21>, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:radiotoad_head>, [
        [null, <contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>, <contenttweaker:advanced_plating2_4>, null], 
        [null, <contenttweaker:advanced_plating2_4>, <enderio:item_capacitor_melodic>, <contenttweaker:advanced_plating2_4>, null], 
        [null, <contenttweaker:mechanical_eye>, <contenttweaker:bedrockium_alloy_gear>, <contenttweaker:mechanical_eye>, null], 
        [null, <contenttweaker:advanced_plating2_4>, <enderio:item_capacitor_melodic>, <contenttweaker:advanced_plating2_4>, null], 
        [null, null, <projectred-core:resource_item:410>, null, null]
    ]);

    recipes.addShaped("ia_radiotoad_mech", <contenttweaker:radiotoad_mech>, [
        [null, <contenttweaker:radiotoad_head>, null], 
        [<contenttweaker:radiotoad_arm>, <contenttweaker:radiotoad_body>, <contenttweaker:radiotoad_arm>], 
        [null, <contenttweaker:radiotoad_legs>, null]
    ]);

    recipes.addShaped("ia_radiotoad_target1", <contenttweaker:radiotoad_target1>, [
        [<contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>], 
        [<contenttweaker:advanced_plating2_3>, <extendedcrafting:singularity:30>, <contenttweaker:advanced_plating2_3>], 
        [<contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>]
    ]);
    recipes.addShaped("ia_radiotoad_target2", <contenttweaker:radiotoad_target2>, [
        [<contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>], 
        [<contenttweaker:advanced_plating2_3>, <extendedcrafting:singularity>, <contenttweaker:advanced_plating2_3>], 
        [<contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>, <contenttweaker:advanced_plating2_3>]
    ]);
}

{//lavaboat
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:nether_boat_plating>, 
        [<immersivepetroleum:upgrades>, <contenttweaker:hot_plate> * 2, <contenttweaker:watertight_steel_plate> * 5], 
        50000
    );


    recipes.addShaped("ia_nether_boat", <contenttweaker:nether_boat>, [
        [null, <contenttweaker:robot_arm>, null], 
        [<contenttweaker:high_heat_glass>, <enderio:item_capacitor_crystalline>, <contenttweaker:mechanical_eye>], 
        [<contenttweaker:nether_boat_plating>, <contenttweaker:nether_boat_plating>, <contenttweaker:nether_boat_plating>]
    ]);

    recipes.addShaped("ia_nether_boat_ores", <contenttweaker:nether_boat_ores>, [
        [<enderio:item_material:72>, <enderio:item_material:72>, <enderio:item_material:72>], 
        [<enderio:item_material:72>, <contenttweaker:nether_boat_plating>, <enderio:item_material:72>], 
        [<enderio:item_material:72>, <enderio:item_material:72>, <enderio:item_material:72>]
    ]);
    recipes.addShaped("ia_nether_boat_osram", <contenttweaker:nether_boat_osram>, [
        [<taiga:osram_ingot>, <enderio:item_material:72>, <taiga:osram_ingot>], 
        [<enderio:item_material:72>, <contenttweaker:nether_boat_plating>, <enderio:item_material:72>], 
        [<taiga:osram_ingot>, <enderio:item_material:72>, <taiga:osram_ingot>]
    ]);
    recipes.addShaped("ia_nether_boat_quartz", <contenttweaker:nether_boat_quartz>, [
        [<contenttweaker:nether_boat_plating>, <enderio:item_material:72>, <contenttweaker:nether_boat_plating>], 
        [<enderio:item_material:72>, <botania:quartz:2>, <enderio:item_material:72>], 
        [<contenttweaker:nether_boat_plating>, <enderio:item_material:72>, <contenttweaker:nether_boat_plating>]
    ]);
}

{//skyfinder
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:advanced_plating5_1>, 
        [<contenttweaker:arkenium_plate>, <aether_legacy:zanite_gemstone> * 4, <contenttweaker:perovskite_plate>], 
        150000
    );
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:advanced_plating5_2> * 4, <contenttweaker:dirty_biocell>], [
            <contenttweaker:advanced_plating5_1> * 4,
            <contenttweaker:skymass1>
        ], <liquid:gravitite> * 576, 20, 10000
    );
    mods.thermalexpansion.Compactor.addStorageRecipe(<contenttweaker:advanced_plating5_4>, <contenttweaker:advanced_plating5_2> * 4, 15000);
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:advanced_plating5_5>, 
        [<contenttweaker:advanced_plating5_4> * 4, <taiga:adamant_ingot> * 12, <tconevo:metal:40> * 24], 
        1500000
    );

    
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:skyfinder_leg>], [
            <contenttweaker:advanced_plating5_5>,
            <contenttweaker:rocket_engine>,
            <enderio:item_capacitor_melodic>
        ], null, 20, 10000
    );
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:skyfinder_head>], [
            <contenttweaker:advanced_plating5_5>,
            <contenttweaker:laser>,
            <enderio:item_capacitor_melodic>
        ], null, 20, 10000
    );
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:skyfinder_body>], [
            <contenttweaker:advanced_plating5_5>,
            <contenttweaker:advanced_plating5_4>,
            <enderio:item_capacitor_melodic>
        ], null, 20, 10000
    );

    recipes.addShaped("ia_skyfinder_mech", <contenttweaker:skyfinder_mech>, [
        [null, <contenttweaker:skyfinder_head>, null], 
        [<contenttweaker:skyfinder_leg>, <contenttweaker:skyfinder_body>, <contenttweaker:skyfinder_leg>], 
        [<contenttweaker:skyfinder_leg>, null, <contenttweaker:skyfinder_leg>]
    ]);

    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:skyfinder_target_zanite>], [
            <contenttweaker:advanced_plating5_5>,
            <aether_legacy:zanite_gemstone> * 16
        ], null, 20, 10000
    );
}

{//robodruid
    

    mods.roots.Mortar.addRecipe("wildwood_pulp",
        <contenttweaker:wildwood_pulp>,
        [
            <roots:bark_wildwood>, <roots:bark_wildwood>, <roots:wildwood_log>,
            <minecraft:diamond> | <minecraft:emerald> | <mysticalworld:amethyst_gem>,
            <erebus:materials:48> | <quark:glowshroom> | <betternether:bone_mushroom> | <betternether:lucis_spore>
        ]
    );
    

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:robodruid_plating1>, [
        [null, null, <mod_lavacow:foul_bristle>, <roots:runed_wildwood>, <roots:strange_ooze>], 
        [null, <mod_lavacow:foul_bristle>, <roots:living_arrow>, <contenttweaker:wildwood_pulp>, <roots:runed_wildwood>], 
        [<mod_lavacow:foul_bristle>, <roots:living_arrow>, <contenttweaker:wildwood_pulp>, <contenttweaker:wildwood_pulp>, <roots:fey_leather>], 
        [<roots:runed_wildwood>, <contenttweaker:wildwood_pulp>, <contenttweaker:wildwood_pulp>, <roots:fey_leather>, null], 
        [<roots:strange_ooze>, <roots:runed_wildwood>, <roots:fey_leather>, null, null]
    ]);
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:robodruid_plating2>, 
        [<contenttweaker:robodruid_plating1>, <contenttweaker:steelwood_ingot> * 8, <contenttweaker:fine_wooden_board> * 8], 
        12000
    );
    mods.roots.Fey.addRecipe("robodruid_plating3", 
        <contenttweaker:robodruid_plating3>, 
        [
            <contenttweaker:robodruid_plating2>, 
            <mysticalworld:amethyst_block>, 
            <actuallyadditions:block_crystal_empowered:2>,
            <extrautils2:simpledecorative>,
            <contenttweaker:mushroomite_block>
        ]
    );

    {//fuel
        recipes.addShapeless("ia_pereskia_soup1", <contenttweaker:pereskia_soup>, [
            <minecraft:bowl>, 
            <roots:cooked_pereskia>, <roots:cooked_pereskia>, 
            <erebus:erebus_food:5>, <contenttweaker:carrot_pulp>, <harvestcraft:sweetpotatoitem>,
            <liquid:mushroom_stew> * 2000
        ]);
        recipes.addShapeless("ia_pereskia_soup2", <contenttweaker:pereskia_soup> * 2, [
            <minecraft:bowl>, <minecraft:bowl>, 
            <roots:cooked_pereskia>, <roots:cooked_pereskia>, 
            <erebus:erebus_food:5>, <contenttweaker:carrot_pulp>, <harvestcraft:sweetpotatoitem>,
            <liquid:glowshroom_stew> * 1000
        ]);

        mods.thermalexpansion.Transposer.addFillRecipe(
            <contenttweaker:pereskia_soup>, <minecraft:bowl>, <liquid:pereskia_soup> * 250, 1000
        );
        mods.thermalexpansion.Transposer.addExtractRecipe(
            <liquid:pereskia_soup> * 250, <contenttweaker:pereskia_soup>, 1000, <minecraft:bowl>
        );
    }    

    //mech parts
    recipes.addShaped("ia_robodruid_arm", <contenttweaker:robodruid_arm>, [
        [<contenttweaker:robodruid_plating3>, <contenttweaker:robodruid_plating2>, null], 
        [<contenttweaker:wildwood_pulp>, <contenttweaker:robot_arm>, <contenttweaker:robodruid_plating2>], 
        [null, <contenttweaker:blood_runic_dust>, <contenttweaker:robot_arm>]
    ]);
    recipes.addShaped("ia_robodruid_leg", <contenttweaker:robodruid_leg>, [
        [<contenttweaker:robodruid_plating3>, <contenttweaker:robodruid_plating2>, null], 
        [<contenttweaker:robodruid_plating2>, <projectred-core:resource_item:410>, <contenttweaker:wildwood_pulp>], 
        [<contenttweaker:robodruid_plating2>, <projectred-core:resource_item:410>, <contenttweaker:blood_runic_dust>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:robodruid_body>, [
        [<contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating2>, <projectred-core:resource_item:410>, <contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating2>], 
        [<projectred-core:resource_item:410>, <enderio:block_enhanced_combustion_generator>, <contenttweaker:compact_empowerer>, <enderio:block_enhanced_combustion_generator>, <projectred-core:resource_item:410>], 
        [<contenttweaker:robodruid_plating2>, <quark:crystal:4>, <quark:diamond_heart>, <quark:crystal:4>, <contenttweaker:robodruid_plating2>], 
        [null, <contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating3>, <contenttweaker:robodruid_plating2>, null], 
        [null, <projectred-core:resource_item:410>, <contenttweaker:robodruid_plating2>, <projectred-core:resource_item:410>, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:robodruid_head>, [
        [<contenttweaker:robodruid_plating2>, null, <contenttweaker:robodruid_plating2>, null, <contenttweaker:robodruid_plating2>], 
        [<contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating2>, <contenttweaker:robodruid_plating2>], 
        [<contenttweaker:robodruid_plating3>, <contenttweaker:neuron_inlay>, <enderio:item_capacitor_melodic> | <contenttweaker:entwood_heart>, <contenttweaker:neuron_inlay>, <contenttweaker:robodruid_plating3>], 
        [<contenttweaker:robodruid_plating2>, <contenttweaker:neuron_inlay>, <enderio:item_capacitor_melodic> | <contenttweaker:entwood_heart>, <contenttweaker:neuron_inlay>, <contenttweaker:robodruid_plating2>], 
        [null, <contenttweaker:robodruid_plating2>, <projectred-core:resource_item:410>, <contenttweaker:robodruid_plating2>, null]
    ]);

    recipes.addShaped("robodruid_mech", <contenttweaker:robodruid_mech>, [
        [<contenttweaker:robodruid_arm>, <contenttweaker:robodruid_head>, <contenttweaker:robodruid_arm>], 
        [<contenttweaker:robodruid_arm>, <contenttweaker:robodruid_body>, <contenttweaker:robodruid_arm>], 
        [<contenttweaker:robodruid_leg>, null, <contenttweaker:robodruid_leg>]
    ]);


    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:robodruid_target_gems>, 
        [<contenttweaker:robodruid_plating3>, <contenttweaker:druidic_dust>, <extendedcrafting:singularity_custom:37>], 
        20000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:robodruid_target_wood>, 
        [<contenttweaker:robodruid_plating3>, <contenttweaker:druidic_dust>, <extendedcrafting:singularity_custom:100> * 2], 
        20000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:robodruid_target_wood>, 
        [<contenttweaker:robodruid_plating3>, <contenttweaker:druidic_dust>, <botania:livingwood> * 32], 
        20000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:robodruid_target_metal>, 
        [<contenttweaker:robodruid_plating3>, <contenttweaker:druidic_dust>, <extendedcrafting:singularity:29>], 
        20000
    );
}

{//scarab
    recipes.addShaped("ia_advanced_plating3_1", <contenttweaker:advanced_plating3_1>, [
        [<contenttweaker:ra_godshard>, <contenttweaker:cursed_gold_plate>, <contenttweaker:ra_godshard>], 
        [<contenttweaker:cursed_gold_plate>, <projectred-core:resource_item:410>, <contenttweaker:cursed_gold_plate>], 
        [<contenttweaker:montu_godshard>, <contenttweaker:power_core_active>, <contenttweaker:montu_godshard>]
    ]);
    mods.enderio.SliceNSplice.addRecipe(<contenttweaker:advanced_plating3_2>, 
        [
            <contenttweaker:sandworm_chitin>, <contenttweaker:advanced_plating3_1>, <contenttweaker:sandworm_chitin>,
            <moreplates:fiery_plate>, <contenttweaker:montu_godshard>, <moreplates:fiery_plate>
        ], 8000, 0
    );
    mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:advanced_plating3_3>, <contenttweaker:advanced_plating3_2>, <liquid:sand> * 4000, 5000);
    mods.mekanism.infuser.addRecipe("GOLD", 240, <contenttweaker:advanced_plating3_3>, <contenttweaker:advanced_plating3_4>);
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:advanced_plating3_5> * 4, 
        [<contenttweaker:advanced_plating3_4> * 4, <contenttweaker:guarding_crystal>, <atum:golden_date_enchanted>], 
        8000
    );



    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:goldscarab_arm>, [
        [null, null, null, <contenttweaker:advanced_plating3_5>, null], 
        [null, null, <contenttweaker:advanced_plating3_5>, <contenttweaker:black_bronze_rod>, <projectred-core:resource_item:410>], 
        [null, <contenttweaker:advanced_plating3_5>, <thermalfoundation:material:640>, <contenttweaker:tignalum_rod>, <contenttweaker:black_bronze_rod>], 
        [null, <contenttweaker:advanced_plating3_5>, <contenttweaker:tignalum_rod>, null, null], 
        [null, <contenttweaker:advanced_plating3_5>, null, null, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:goldscarab_leg>, [
        [null, null, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, null], 
        [null, <contenttweaker:advanced_plating3_5>, <thermalfoundation:material:640>, <projectred-core:resource_item:410>, <contenttweaker:tignalum_rod>], 
        [null, <contenttweaker:advanced_plating3_5>, <contenttweaker:black_bronze_rod>, <contenttweaker:advanced_plating3_5>, null], 
        [null, null, null, <contenttweaker:black_bronze_rod>, null], 
        [null, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, <contenttweaker:black_bronze_rod>, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:goldscarab_body>, [
        [<contenttweaker:advanced_plating3_5>, <atum:radiant_beacon>, <quantumflux:craftingpiece:1>, <atum:radiant_beacon>, <contenttweaker:advanced_plating3_5>], 
        [<contenttweaker:advanced_plating3_5>, <immersiveengineering:metal_decoration0:5>, <atum:idol_of_labor>, <immersiveengineering:metal_decoration0:5>, <contenttweaker:advanced_plating3_5>], 
        [<contenttweaker:advanced_plating3_5>, <immersiveengineering:metal_decoration0:5>, <thermalfoundation:material:640>, <immersiveengineering:metal_decoration0:5>, <contenttweaker:advanced_plating3_5>], 
        [<simplyjetpacks:metaitemmods:28>, <immersiveengineering:metal_decoration0:5>, <thermalfoundation:material:640>, <immersiveengineering:metal_decoration0:5>, <simplyjetpacks:metaitemmods:28>], 
        [null, <simplyjetpacks:metaitemmods:28>, <quantumflux:craftingpiece:1>, <simplyjetpacks:metaitemmods:28>, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:goldscarab_head>, [
        [null, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, null], 
        [<contenttweaker:advanced_plating3_5>, <contenttweaker:cursed_processor>, <enderio:item_capacitor_crystalline>, <contenttweaker:cursed_processor>, <contenttweaker:advanced_plating3_5>], 
        [<contenttweaker:advanced_plating3_5>, <contenttweaker:mechanical_eye>, <contenttweaker:cursed_processor>, <contenttweaker:mechanical_eye>, <contenttweaker:advanced_plating3_5>], 
        [null, <contenttweaker:advanced_plating3_5>, <contenttweaker:cursed_processor>, <contenttweaker:advanced_plating3_5>, null], 
        [null, null, <contenttweaker:advanced_plating3_5>, null, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:goldscarab_sun>, [
        [null, <moreplates:refined_glowstone_gear>, <moreplates:refined_glowstone_gear>, <moreplates:refined_glowstone_gear>, null], 
        [<moreplates:refined_glowstone_gear>, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, <moreplates:refined_glowstone_gear>], 
        [<moreplates:refined_glowstone_gear>, <contenttweaker:advanced_plating3_5>, <extendedcrafting:singularity:4>, <contenttweaker:advanced_plating3_5>, <moreplates:refined_glowstone_gear>], 
        [<moreplates:refined_glowstone_gear>, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, <contenttweaker:advanced_plating3_5>, <moreplates:refined_glowstone_gear>], 
        [null, <moreplates:refined_glowstone_gear>, <moreplates:refined_glowstone_gear>, <moreplates:refined_glowstone_gear>, null]
    ]);

    recipes.addShaped("ia_goldscarab_mech", <contenttweaker:goldscarab_mech>, [
        [<contenttweaker:goldscarab_arm>, <contenttweaker:goldscarab_sun>, <contenttweaker:goldscarab_arm>], 
        [<contenttweaker:goldscarab_arm>, <contenttweaker:goldscarab_head>, <contenttweaker:goldscarab_arm>], 
        [<contenttweaker:goldscarab_leg>, <contenttweaker:goldscarab_body>, <contenttweaker:goldscarab_leg>]
    ]);



    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:goldscarab_target_water>,
        [
            <mekanism:basicblock:9> * 64,
            <contenttweaker:cursed_gold_plate> * 4,
            <betternether:cincinnasite> * 64
        ],
        50000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:goldscarab_target_oil>,
        [
            <contenttweaker:gold_crystal> * 64,
            <contenttweaker:cursed_gold_plate> * 4,
            <thermalfoundation:material:892> * 64
        ],
        50000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:goldscarab_target_shard>,
        [
            <atum:heart_of_ra> * 32,
            <contenttweaker:cursed_gold_plate> * 4,
            <contenttweaker:treasure_block> * 64
        ],
        50000
    );
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:goldscarab_target_ore>,
        [
            <extendedcrafting:singularity_custom:33> * 2,
            <contenttweaker:cursed_gold_plate> * 4,
            <contenttweaker:treasure_block> * 64
        ],
        50000
    );
}

{//bloodhunter
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:advanced_plating4_1>, 
        [<contenttweaker:slate_steel_plate>, <tconevo:metal:28>, <contenttweaker:advanced_plating1_4>], 
        12000
    );
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:advanced_plating4_2>, [
        <contenttweaker:advanced_plating4_1>, <bloodmagic:item_demon_crystal:3>, <bloodmagic:component:12>, <bloodmagic:slate:4>
    ], 256, 64);
    mods.bloodmagic.BloodAltar.addRecipe(
        <contenttweaker:advanced_plating4_3>, <contenttweaker:advanced_plating4_2>, 
        4, 150000, (150000 / (20 * 5)), 120
    );
    mods.appliedenergistics2.Inscriber.addRecipe(<contenttweaker:advanced_plating4_4>, 
        <bloodmagic:blood_rune:3>, false, 
        <contenttweaker:advanced_plating4_3>, <contenttweaker:advanced_plating4_3>
    );

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bloodhunter_arm>, [
        [null, <contenttweaker:blood_spike>, <contenttweaker:blood_spike>, <contenttweaker:advanced_plating4_4>, null], 
        [<contenttweaker:blood_spike>, <contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, <contenttweaker:living_steel_gear>, <contenttweaker:living_steel_gear>], 
        [null, <contenttweaker:advanced_plating4_4>, <bloodmagic:slate:4>, <contenttweaker:advanced_plating4_4>, null], 
        [null, <bloodmagic:decorative_brick>, <bloodmagic:decorative_brick>, <contenttweaker:blood_spike>, null], 
        [null, <contenttweaker:blood_spike>, <contenttweaker:blood_spike>, null, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bloodhunter_leg>, [
        [null, null, <contenttweaker:advanced_plating4_4>, null, null], 
        [null, <contenttweaker:advanced_plating4_4>, <bloodmagic:slate:4>, <contenttweaker:living_steel_gear>, <contenttweaker:living_steel_gear>], 
        [<contenttweaker:advanced_plating4_4>, <bloodmagic:slate:4>, <bloodmagic:decorative_brick>, <contenttweaker:advanced_plating4_4>, null], 
        [<contenttweaker:advanced_plating4_4>, <bloodmagic:decorative_brick>, <contenttweaker:advanced_plating4_4>, null, null], 
        [<contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, null, null, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bloodhunter_body>, [
        [<contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, <bloodmagic:component:8>, <contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>], 
        [<bloodmagic:component:8>, <bloodmagic:blood_rune:3>, <bloodmagic:altar>, <bloodmagic:blood_rune:3>, <bloodmagic:component:8>], 
        [<contenttweaker:advanced_plating4_4>, <bloodmagic:blood_rune:3>, <openblocks:tank>.withTag({tank: {FluidName: "lifeessence", Amount: 16000}}), <bloodmagic:blood_rune:3>, <contenttweaker:advanced_plating4_4>], 
        [null, <contenttweaker:advanced_plating4_4>, <bloodmagic:blood_rune:3>, <contenttweaker:advanced_plating4_4>, null], 
        [<bloodmagic:component:8>, <contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, <bloodmagic:component:8>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bloodhunter_head>, [
        [null, <contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, <contenttweaker:advanced_plating4_4>, null], 
        [<contenttweaker:mechanical_eye>, <scannable:module_monster>, <contenttweaker:robot_brain>, <scannable:module_animal>, <contenttweaker:mechanical_eye>], 
        [<contenttweaker:advanced_plating4_4>, <contenttweaker:mechanical_eye>, <contenttweaker:mechanical_eye>, <contenttweaker:mechanical_eye>, <contenttweaker:advanced_plating4_4>], 
        [null, <contenttweaker:advanced_plating4_4>, <scannable:scanner>, <contenttweaker:advanced_plating4_4>, null], 
        [null, null, <contenttweaker:advanced_plating4_4>, null, null]
    ]);


    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:bloodhunter_mech>], null, 
        [
            <contenttweaker:bloodhunter_head>,
            <contenttweaker:bloodhunter_body>,
            <contenttweaker:bloodhunter_arm> * 2,
            <contenttweaker:bloodhunter_leg> * 4,
            <minecraft:nether_star> * 4
        ], [
            <liquid:bound_metal> * 1440,
            <liquid:evil_blood> * 1000
        ], <contenttweaker:sewing_unit>,
        60, 100 * 1000
    );
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:bloodhunter_mech>], null, 
        [
            <contenttweaker:bloodhunter_head>,
            <contenttweaker:bloodhunter_body>,
            <contenttweaker:bloodhunter_arm> * 2,
            <contenttweaker:bloodhunter_leg> * 4,
            <contenttweaker:fear>
        ], [
            <liquid:bound_metal> * 1440,
            <liquid:evil_blood> * 1000
        ], <contenttweaker:sewing_unit>,
        60, 100 * 1000
    );


    recipes.addShaped("ia_bloodhunter_target_blood", <contenttweaker:bloodhunter_target_blood>, [
        [<contenttweaker:blood_shard1>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard1>], 
        [<contenttweaker:advanced_plating4_1>, <extendedcrafting:singularity_custom:9>, <contenttweaker:advanced_plating4_1>], 
        [<contenttweaker:blood_shard1>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard1>]
    ]);
    recipes.addShaped("ia_bloodhunter_target_slate", <contenttweaker:bloodhunter_target_slate>, [
        [<contenttweaker:blood_shard2>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard2>], 
        [<contenttweaker:advanced_plating4_1>, <bloodmagic:slate:4>, <contenttweaker:advanced_plating4_1>], 
        [<contenttweaker:blood_shard2>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard2>]
    ]);
    recipes.addShaped("ia_bloodhunter_target_fairy", <contenttweaker:bloodhunter_target_fairy>, [
        [<contenttweaker:blood_shard1>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard1>], 
        [<contenttweaker:advanced_plating4_1>, <erebus:materials:6>, <contenttweaker:advanced_plating4_1>], 
        [<contenttweaker:blood_shard1>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard1>]
    ]);
    recipes.addShaped("ia_bloodhunter_target_mana", <contenttweaker:bloodhunter_target_mana>, [
        [<contenttweaker:blood_shard3>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard3>], 
        [<contenttweaker:advanced_plating4_1>, <botania:blacklotus:1>, <contenttweaker:advanced_plating4_1>], 
        [<contenttweaker:blood_shard3>, <contenttweaker:advanced_plating4_1>, <contenttweaker:blood_shard3>]
    ]);
    <contenttweaker:bloodhunter_target_mana>.addTooltip(game.localize("ia.tooltip.bloodhunter_target_mana"));

    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:bloodhunter_target_wither>], 
        [
            <contenttweaker:advanced_plating4_1>,
            <minecraft:skull:1> * 64,
            <enderio:item_alloy_ingot:7> * 16,
            <extrautils2:ingredients:10> * 16
        ],
        null, 20, 4000 
    );
    recipes.addShaped("ia_bloodhunter_target_cool_slate", <contenttweaker:tribute>, [
        [<contenttweaker:slate_9>, <contenttweaker:evil_singularity>, <contenttweaker:slate_9>], 
        [<contenttweaker:slate_9>, <contenttweaker:cursed_star>, <contenttweaker:slate_9>], 
        [<contenttweaker:slate_9>, <contenttweaker:pandemonium_plate>, <contenttweaker:slate_9>]
    ]);
}

//mech planes

{//taxi
    recipes.addShaped("ia_flight_computer", <contenttweaker:flight_computer>, [
        [<actuallyadditions:block_crystal_empowered:1>, <aether_legacy:enchanted_gravitite>, <actuallyadditions:block_crystal_empowered:1>], 
        [<contenttweaker:tinezo_plate>, <simplyjetpacks:metaitemmods:28>, <contenttweaker:tinezo_plate>], 
        [<quantumflux:craftingpiece:5>, <aether_legacy:enchanted_gravitite>, <quantumflux:craftingpiece:5>]
    ]);
    recipes.addShaped("ia_mech_taxi_wing", <contenttweaker:mech_taxi_wing>, [
        [null, <ore:ingotValkyrie>, <ore:ingotValkyrie>], 
        [<ore:ingotValkyrie>, <ore:ingotValkyrie>, <ore:plateKnightslime>], 
        [<contenttweaker:calitunti_plate>, <simplyjetpacks:metaitemmods:21>, <contenttweaker:calitunti_plate>]
    ]);
    recipes.addShaped("ia_mech_taxi", <contenttweaker:mech_taxi>, [
        [null, <contenttweaker:flight_computer>, null],
        [<contenttweaker:diode2>, <actuallyadditions:item_battery_quintuple>, <contenttweaker:diode2>], 
        [<contenttweaker:mech_taxi_wing>, <aether_legacy:valkyrie_cape>, <contenttweaker:mech_taxi_wing>]
    ]);

    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:mech_taxi2> * 2], [
            <contenttweaker:flight_computer>,
            <actuallyadditions:item_battery_quintuple>,
            <contenttweaker:elf_mana_circuit>,
            <contenttweaker:rocket_engine> * 3,
            <contenttweaker:caelumite_plate> * 64
        ], null, 
        20, 100000
    );
}


