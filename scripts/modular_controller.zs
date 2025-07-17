import mods.modularmachinery.RecipeBuilder;
import scripts.recycler.addRecycle;

//early game
recipes.addShaped("mm_tree_powered_compressor_controller",
    <modularcontroller:tree_powered_compressor_controller>,
    [[<contenttweaker:simple_motor>, <thermalfoundation:material:24>, <contenttweaker:simple_motor>],
    [<thermalfoundation:material:320>, <modularmachinery:blockcasing>, <thermalfoundation:material:320>],
    [<contenttweaker:simple_motor>, <minecraft:furnace>, <contenttweaker:simple_motor>],]
);
addRecycle(<modularcontroller:tree_powered_compressor_controller>, [
	<modularmachinery:blockcasing>, <minecraft:furnace>, 
	<minecraft:iron_ingot> * 8, <thermalfoundation:material:128> * 8, 
	<contenttweaker:simple_motor> * 4
]);

//IE
recipes.addShaped("mm_high_oven_controller", <modularcontroller:high_oven_controller>, [
	[<immersiveengineering:stone_decoration:2>, <tconstruct:smeltery_controller>, <immersiveengineering:stone_decoration:2>], 
	[<morefurnaces:furnaceblock>, <immersiveengineering:metal_decoration0:5>, <morefurnaces:furnaceblock>], 
	[<immersiveengineering:stone_decoration:2>, <tconstruct:smeltery_controller>, <immersiveengineering:stone_decoration:2>]
]);
addRecycle(<modularcontroller:high_oven_controller>, [
	<immersiveengineering:metal_decoration0:5>, <morefurnaces:furnaceblock> * 2, <tconstruct:smeltery_controller> * 2,
	<immersiveengineering:stone_decoration:2> * 4
]);
recipes.addShaped("mm_garden_cloche_controller", <modularcontroller:garden_cloche_controller>, [
	[<ore:plankTreatedWood>, <contenttweaker:greenhouse_lamps>, <ore:plankTreatedWood>], 
	[<botania:fertilizer>, <immersiveengineering:metal_decoration0:5>, <botania:fertilizer>], 
	[<ore:plankTreatedWood>, <extendedcrafting:singularity_custom:100>, <ore:plankTreatedWood>]
]);
addRecycle(<modularcontroller:garden_cloche_controller>, [
	<immersiveengineering:metal_decoration0:5>, <contenttweaker:greenhouse_lamps>, <botania:fertilizer> * 2, <extendedcrafting:singularity_custom:100>,
	<immersiveengineering:treated_wood> * 4
]);
recipes.addShaped("mm_heat_engine_controller", <modularcontroller:heat_engine_controller>, [
	[<immersiveengineering:metal_decoration0:7>, <prodigytech:energion_aeroheater>, <immersiveengineering:metal_decoration0:7>], 
	[<prodigytech:heat_capacitor_1>, <extrautils2:machine>, <prodigytech:heat_capacitor_1>], 
	[<immersiveengineering:metal_decoration0:7>, <prodigytech:energion_aeroheater>, <immersiveengineering:metal_decoration0:7>]
]);
addRecycle(<modularcontroller:heat_engine_controller>, [
	<extrautils2:machine>, <prodigytech:energion_aeroheater> * 2, <prodigytech:heat_capacitor_1:1200>, <prodigytech:heat_capacitor_1:1200>,
	<immersiveengineering:metal_decoration0:7> * 4
]);

//XU
recipes.addShaped("mm_research_station_controller", <modularcontroller:research_station_controller>, [
	[<ore:bookshelf>, <contenttweaker:power_core_active>, <ore:bookshelf>], 
	[<contenttweaker:power_core_active>, <extrautils2:machine>, <contenttweaker:power_core_active>], 
	[<ore:bookshelf>, <extendedcrafting:singularity_custom:1>, <ore:bookshelf>]
]);
addRecycle(<modularcontroller:research_station_controller>, [
	<extrautils2:machine>, <contenttweaker:power_core_active> * 3, <extendedcrafting:singularity_custom:1>,
	<ore:bookshelf>.firstItem * 4
]);
recipes.addShaped("mm_gp_gen_controller", <modularcontroller:gp_gen_controller>, [
	[<contenttweaker:lapis_tile>, <immersiveengineering:metal_decoration0:6>, <contenttweaker:lapis_tile>], 
	[<moreplates:enchanted_plate>, <thermalexpansion:frame:64>, <moreplates:enchanted_plate>], 
	[<contenttweaker:lapis_tile>, <immersiveengineering:metal_decoration0:6>, <contenttweaker:lapis_tile>]
]);


//TE

recipes.addShaped("mm_large_sifter", <modularcontroller:large_sifter_controller>, [
	[<ore:foodNoodles>, <thermalexpansion:augment:497>, <ore:foodNoodles>], 
	[<contenttweaker:mushroomite_plate>, <excompressum:auto_heavy_sieve>, <contenttweaker:mushroomite_plate>], 
	[<ore:foodNoodles>, <thermalexpansion:augment:497>, <ore:foodNoodles>]
]);
recipes.addShaped("mm_plant_station_controller", <modularcontroller:plant_station_controller>, [
	[<betternether:cincinnasite_forged>, <erebus:planks_petrified_wood>, <betternether:cincinnasite_forged>], 
	[<contenttweaker:geb_godshard>, <thermalexpansion:frame>, <contenttweaker:geb_godshard>], 
	[<betternether:cincinnasite_forged>, <erebus:planks_petrified_wood>, <betternether:cincinnasite_forged>]
]);

recipes.addShaped("bug_hill_controller", <modularcontroller:bug_hill_controller>, [
	[<erebus:materials:15>, <excompressum:auto_heavy_sieve>, <erebus:materials:15>], 
	[<twilightforest:borer_essence>, <thermalexpansion:frame>, <twilightforest:borer_essence>], 
	[<erebus:materials:15>, <thermalexpansion:device:9>, <erebus:materials:15>]
]);

recipes.addShaped("fish_tank_controller", <modularcontroller:fish_tank_controller>, [
	[<minecraft:sea_lantern>, <thermalfoundation:tool.fishing_rod_platinum>, <minecraft:sea_lantern>], 
	[<harvestcraft:watertrap>, <thermalexpansion:frame>, <harvestcraft:watertrap>], 
	[<minecraft:sea_lantern>, <thermalexpansion:device:4>, <minecraft:sea_lantern>]
]);

//mek

recipes.addShaped("mm_carmine_reactor_controller", <modularcontroller:carmine_reactor_controller>, [
	[<contenttweaker:carminium_ingot>, <redstonearsenal:material:96>, <contenttweaker:carminium_ingot>], 
	[<quantumflux:craftingpiece:5>, <actuallyadditions:block_misc:9>, <quantumflux:craftingpiece:5>], 
	[<contenttweaker:carminium_ingot>, <redstonearsenal:material:96>, <contenttweaker:carminium_ingot>]
]);
recipes.addShaped("mm_gas_column_controller", <modularcontroller:gas_column_controller>, [
	[<contenttweaker:osgloridium_processor>, <mekanism:gastank>.withTag({'tier': 3}), <contenttweaker:osgloridium_processor>], 
	[<aeadditions:gas_interface>, <mekanism:basicblock:14>, <aeadditions:gas_interface>], 
	[<contenttweaker:osgloridium_processor>, <actuallyadditions:block_misc:9>, <contenttweaker:osgloridium_processor>]
]);
recipes.addShaped("mm_tar_pit_controller", <modularcontroller:tar_pit_controller>, [
	[<contenttweaker:tungsten_plate>, <mekanism:gastank>.withTag({tier: 3}), <contenttweaker:tungsten_plate>], 
	[<openblocks:tank>.withTag({tank: {FluidName: "tar", Amount: 16000}}), <mekanism:basicblock:8>, <openblocks:tank>.withTag({tank: {FluidName: "tar", Amount: 16000}})], 
	[<contenttweaker:tungsten_plate>, <contenttweaker:arkenium_plate>, <contenttweaker:tungsten_plate>]
]);

//AA
recipes.addShaped("mm_explosion_compressor_controller", <modularcontroller:explosion_compressor_controller>, [
	[<ore:plateRefinedObsidian>, <bigreactors:reactorcasing>, <ore:plateRefinedObsidian>], 
	[<mekanism:obsidiantnt>, <actuallyadditions:block_misc:9>, <mekanism:obsidiantnt>], 
	[<ore:plateRefinedObsidian>, <bigreactors:reactorcasing>, <ore:plateRefinedObsidian>]
]);
recipes.addShaped("mm_biolab_controller", <modularcontroller:biolab_controller>, [
	[<mekanism:plasticblock:15>, <actuallyadditions:block_crystal_empowered:2>, <mekanism:plasticblock:15>], 
	[<contenttweaker:medical_alloy_plate>, <actuallyadditions:block_misc:9>, <contenttweaker:medical_alloy_plate>], 
	[<mekanism:plasticblock:15>, <modularcontroller:garden_cloche_controller>, <mekanism:plasticblock:15>]
]);
recipes.addShaped("mm_pworld_oregen", <modularcontroller:pworld_oregen_controller>, [
	[<contenttweaker:mitanium_block>, <extendedcrafting:singularity:26>, <contenttweaker:mitanium_block>], 
	[<extendedcrafting:singularity:24>, <actuallyadditions:block_misc:9>, <extendedcrafting:singularity:24>], 
	[<contenttweaker:mitanium_block>, <extendedcrafting:singularity:19>, <contenttweaker:mitanium_block>]
]);
recipes.addShaped("mm_worm_pit_controller", <modularcontroller:worm_pit_controller>, [
	[<contenttweaker:sandworm_chitin>, <quantumflux:craftingpiece:5>, <contenttweaker:sandworm_chitin>], 
	[<contenttweaker:enspiced_spicy_bioblend>, <actuallyadditions:block_misc:9>, <contenttweaker:enspiced_spicy_bioblend>], 
	[<contenttweaker:sandworm_chitin>, <contenttweaker:stomper>, <contenttweaker:sandworm_chitin>]
]);

//MA
recipes.addShaped("mm_essence_extractor_controller", <modularcontroller:essence_extractor_controller>, [
	[<immersiveengineering:metal_device1:6>, <contenttweaker:essence_pump1>, <immersiveengineering:metal_device1:6>], 
	[<industrialforegoing:tree_fluid_extractor>, <mysticalagriculture:crafting:4>, <industrialforegoing:tree_fluid_extractor>], 
	[<immersiveengineering:metal_device1:6>, <mysticalagriculture:mystical_machine_frame>, <immersiveengineering:metal_device1:6>]
]);

//EIO
recipes.addShaped("mm_large_cobblegen_controller", <modularcontroller:large_cobblegen_controller>, [
	[<ore:plateDarkSteel>, <thermalexpansion:machine:15>, <ore:plateDarkSteel>], 
	[<thermalexpansion:machine:15>, <ore:itemSimpleMachineChassi>, <thermalexpansion:machine:15>], 
	[<ore:plateDarkSteel>, <twilightforest:giant_cobblestone>, <ore:plateDarkSteel>]
]);
recipes.addShaped("mm_bonsai_controller", <modularcontroller:bonsai_controller>, [
	[<actuallyadditions:block_misc:4>, <engineersdecor:small_tree_cutter>, <actuallyadditions:block_misc:4>], 
	[<bonsaitrees:bonsaipot:1>, <enderio:item_material>, <bonsaitrees:bonsaipot:1>], 
	[<actuallyadditions:block_misc:4>, <engineersdecor:small_tree_cutter>, <actuallyadditions:block_misc:4>]
]);
recipes.addShaped("mm_vial_processor_controller", <modularcontroller:vial_processor_controller>, [
	[<simplyjetpacks:metaitemmods:12>, <mob_grinding_utils:saw>, <simplyjetpacks:metaitemmods:12>], 
	[<contenttweaker:soul_codex8>, <enderio:item_material:53>, <contenttweaker:soul_codex8>], 
	[<simplyjetpacks:metaitemmods:12>, <mob_grinding_utils:saw>, <simplyjetpacks:metaitemmods:12>]
]);

recipes.addShaped("mm_heat_exchanger_controller", <modularcontroller:heat_exchanger_controller>, [
	[<contenttweaker:zorra_steel_gem> | <tconevo:metal:43>, <prodigytech:heat_capacitor_3>, <contenttweaker:zorra_steel_gem> | <tconevo:metal:43>], 
	[<prodigytech:tartaric_aeroheater>, <extendedcrafting:singularity_custom:4>, <prodigytech:tartaric_aeroheater>], 
	[<contenttweaker:zorra_steel_gem> | <tconevo:metal:43>, <contenttweaker:research_heat>.reuse(), <contenttweaker:zorra_steel_gem> | <tconevo:metal:43>]
]);

recipes.addShaped("mm_air_collector_controller", <modularcontroller:air_collector_controller>, [
	[<enderio:item_material:73>, <enderio:item_capacitor_crystalline>, <enderio:item_material:73>], 
	[<mekanism:filterupgrade>, <enderio:item_material:66>, <mekanism:filterupgrade>], 
	[<enderio:item_material:73>, <contenttweaker:shu_godshard>, <enderio:item_material:73>]
]);

recipes.addShaped("mm_energy_infuser_controller", <modularcontroller:energy_infuser_controller>, [
	[<thermalexpansion:machine:9>, <enderio:block_industrial_insulation>, <thermalexpansion:machine:9>], 
	[<immersiveengineering:metal_device1:8>, <enderio:item_material:54>, <immersiveengineering:metal_device1:8>], 
	[<thermalexpansion:machine:9>, <contenttweaker:ev_coil>, <thermalexpansion:machine:9>]
]);


recipes.addShaped("mm_tingalum_oven_controller", <modularcontroller:tignalum_oven_controller>, [
	[<contenttweaker:tignalum_blast_brick>, <prodigytech:heat_capacitor_3>, <contenttweaker:tignalum_blast_brick>], 
	[<immersiveengineering:metal_device1>, <actuallyadditions:block_misc:8>, <immersiveengineering:metal_device1>], 
	[<contenttweaker:tignalum_blast_brick>, <modularcontroller:high_oven_controller>, <contenttweaker:tignalum_blast_brick>]
]);

//bloodmagic
recipes.addShaped("mm_blood_meat_infuser_controller", <modularcontroller:blood_meat_infuser_controller>, [
	[<contenttweaker:blood_bronze_plate>, <industrialforegoing:meat_feeder>, <contenttweaker:blood_bronze_plate>], 
	[<industrialforegoing:ore_washer>, <contenttweaker:blood_frame>, <industrialforegoing:ore_washer>], 
	[<contenttweaker:blood_bronze_plate>, <contenttweaker:tignalum_gear>, <contenttweaker:blood_bronze_plate>]
]);
recipes.addShaped("mm_will_machine_controller", <modularcontroller:will_machine_controller>, [
	[<taiga:violium_block>, <tconevo:metal:34>, <taiga:violium_block>], 
	[<contenttweaker:glass_cloth>, <contenttweaker:soul_frame>, <contenttweaker:glass_cloth>], 
	[<taiga:violium_block>, <tconevo:metal:34>, <taiga:violium_block>]
]);

recipes.addShaped("mm_regen_chamber_controller", <modularcontroller:regen_chamber_controller>, [
	[<tconevo:metal:28>, <contenttweaker:solar_potion_zinc_gear>, <tconevo:metal:28>], 
	[<bloodmagic:component:31>, <contenttweaker:blood_frame>, <bloodmagic:component:31>], 
	[<tconevo:metal:28>, <contenttweaker:solar_potion_zinc_gear>, <tconevo:metal:28>]
]);

recipes.addShaped("mm_luck_extractor_controller", <modularcontroller:luck_extractor_controller>, [
	[<tconevo:metal:18>, <minecraft:potion>.withTag({Potion: "cofhcore:luck4"}), <tconevo:metal:18>], 
	[<minecraft:potion>.withTag({Potion: "cofhcore:luck4"}), <industrialforegoing:tree_fluid_extractor>, <minecraft:potion>.withTag({Potion: "cofhcore:luck4"})], 
	[<contenttweaker:alchemical_brass_plate>, <contenttweaker:soul_frame>, <contenttweaker:alchemical_brass_plate>]
]);

scripts.content_machines.addBioAssemblerRecipe(
    [<modularcontroller:blood_altar_controller>], null,
	[
		<contenttweaker:blood_frame>,
		<contenttweaker:bloody_gearbox>,
		<contenttweaker:tank2> * 4,
		<contenttweaker:slate_6>,
		<bloodmagic:blood_rune:3> * 4,
		<bloodmagic:blood_rune:6> * 4
	],
	[],
	<contenttweaker:research_magic2>,
	20, 1000
);

mods.extendedcrafting.TableCrafting.addShaped(0, <modularcontroller:super_mixer_controller>, [
	[<tconevo:metal:28>, <requious:advanced_mixer>, <tconevo:metal:28>, <requious:advanced_mixer>, <tconevo:metal:28>], 
	[<requious:advanced_mixer>, <contenttweaker:living_motor>, <contenttweaker:slate_6>, <contenttweaker:living_motor>, <requious:advanced_mixer>], 
	[<tconevo:metal:28>, <contenttweaker:bloody_circuit>, <contenttweaker:blood_frame>, <contenttweaker:bloody_circuit>, <tconevo:metal:28>], 
	[<requious:advanced_mixer>, <contenttweaker:living_motor>, <contenttweaker:slate_6>, <contenttweaker:living_motor>, <requious:advanced_mixer>], 
	[<tconevo:metal:28>, <requious:advanced_mixer>, <tconevo:metal:28>, <requious:advanced_mixer>, <tconevo:metal:28>]
]);

//botania
mods.extendedcrafting.TableCrafting.addShaped(0, <modularcontroller:mana_bifuser_controller>, [
	[<moreplates:manasteel_gear>, <moreplates:manasteel_plate>, <moreplates:manasteel_plate>, <moreplates:manasteel_plate>, <moreplates:manasteel_gear>], 
	[<moreplates:manasteel_plate>, <modularcontroller:energy_infuser_controller>, <contenttweaker:flesh_support>, <modularcontroller:energy_infuser_controller>, <moreplates:manasteel_plate>], 
	[<botania:bellows>, <botania:pool>, <contenttweaker:mana_frame>, <botania:pool>, <botania:bellows>], 
	[<botania:quartztypeelf>, <modularcontroller:energy_infuser_controller>, <contenttweaker:flesh_support>, <modularcontroller:energy_infuser_controller>, <botania:quartztypeelf>], 
	[<botania:quartztypeelf>, <botania:quartztypeelf>, <botania:quartztypeelf>, <botania:quartztypeelf>, <botania:quartztypeelf>]
]);
mods.botania.ElvenTrade.addRecipe(
	[<modularcontroller:flower_controller>], [
		<contenttweaker:mana_frame>,
		<extendedcrafting:singularity_custom:11>,
		<contenttweaker:terracrux>,
		<contenttweaker:plasma_gen>,
		<contenttweaker:plasma_gen>
	]
);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularcontroller:rune_cutter_controller>, [
	[<contenttweaker:pure_metal>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:pure_metal>], 
	[<contenttweaker:rune_base>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <contenttweaker:rune_base>], 
	[<contenttweaker:rune_base>, <thermalfoundation:material:657>, <contenttweaker:gem_steel_plate>, <contenttweaker:rune_mana_chip>, <contenttweaker:gem_steel_plate>, <thermalfoundation:material:657>, <contenttweaker:rune_base>], 
	[<contenttweaker:rune_base>, <thermalfoundation:material:657>, <extendedcrafting:singularity_custom:63>, <contenttweaker:mana_frame>, <extendedcrafting:singularity_custom:63>, <thermalfoundation:material:657>, <contenttweaker:rune_base>], 
	[<contenttweaker:rune_base>, <thermalfoundation:material:657>, <contenttweaker:gem_steel_plate>, <contenttweaker:rune_mana_chip>, <contenttweaker:gem_steel_plate>, <thermalfoundation:material:657>, <contenttweaker:rune_base>], 
	[<contenttweaker:rune_base>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <thermalfoundation:material:657>, <contenttweaker:rune_base>], 
	[<contenttweaker:pure_metal>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:vibralcum_plate>, <contenttweaker:pure_metal>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularcontroller:rune_cracker_controller>, [
	[<botania:quartztypesunny>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartztypesunny>], 
	[<botania:quartz:6>, <contenttweaker:rune_base>, <contenttweaker:improved_rune_base>, <contenttweaker:laser>, <contenttweaker:improved_rune_base>, <contenttweaker:rune_base>, <botania:quartz:6>], 
	[<botania:quartz:6>, <contenttweaker:rune_base>, <contenttweaker:laser_mirror>, <contenttweaker:laser_mirror>, <contenttweaker:laser_mirror>, <contenttweaker:rune_base>, <botania:quartz:6>], 
	[<botania:quartz:6>, <contenttweaker:rune_base>, <actuallyadditions:item_drill:3>, <contenttweaker:mana_frame>, <actuallyadditions:item_drill:3>, <contenttweaker:rune_base>, <botania:quartz:6>], 
	[<botania:quartz:6>, <contenttweaker:rune_base>, <contenttweaker:laser_mirror>, <contenttweaker:laser_mirror>, <contenttweaker:laser_mirror>, <contenttweaker:rune_base>, <botania:quartz:6>], 
	[<botania:quartz:6>, <contenttweaker:rune_base>, <contenttweaker:improved_rune_base>, <contenttweaker:improved_rune_base>, <contenttweaker:improved_rune_base>, <contenttweaker:rune_base>, <botania:quartz:6>], 
	[<botania:quartztypesunny>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartz:6>, <botania:quartztypesunny>]
]);

//astral
mods.extendedcrafting.TableCrafting.addShaped(0, <modularcontroller:satellite_launch_pad_controller>, [
	[<contenttweaker:satellite_plating>, <contenttweaker:satellite_plating>, <contenttweaker:satellite_chip>, <contenttweaker:satellite_plating>, <contenttweaker:satellite_plating>], 
	[<contenttweaker:satellite_plating>, <contenttweaker:explosion_resistant_plate>, <modularcontroller:pworld_oregen_controller>, <contenttweaker:explosion_resistant_plate>, <contenttweaker:satellite_plating>], 
	[<contenttweaker:satellite_chip>, <contenttweaker:mana_star>, <contenttweaker:star_frame>, <contenttweaker:mana_star>, <contenttweaker:satellite_chip>], 
	[<contenttweaker:satellite_plating>, <contenttweaker:explosion_resistant_plate>, <modularcontroller:pworld_oregen_controller>, <contenttweaker:explosion_resistant_plate>, <contenttweaker:satellite_plating>], 
	[<contenttweaker:satellite_plating>, <contenttweaker:satellite_plating>, <contenttweaker:satellite_chip>, <contenttweaker:satellite_plating>, <contenttweaker:satellite_plating>]
]);
{
	var rec = RecipeBuilder.newBuilder("satellite_assembler_drone", "satellite_launch_pad", 2000);
	rec.addEnergyPerTickInput(1000000);

	rec.addItemInput(<contenttweaker:space_navigator>.withTag({target: "energy_vortex"}));

    rec.addItemInput(<contenttweaker:drone> * 32);
    rec.addItemInput(<contenttweaker:sewing_unit> * 32);
	rec.addItemInput(<contenttweaker:laser> * 32);
	rec.addItemInput(<requious:assembler> * 64);
	rec.addItemInput(<contenttweaker:conveyor_block> * 12);
	rec.addItemInput(<contenttweaker:ultimate_rune>);
	rec.addItemInput(<contenttweaker:star_frame>);
	
    rec.addItemOutput(<modularcontroller:space_assembler_controller>);
	rec.addFluidInput(<liquid:rocket_fuel> * 10000);
	

	rec.build();
}

//draconic
{//
    var rec = RecipeBuilder.newBuilder("donut_controller", "space_assembler", 200);
	rec.addEnergyPerTickInput(10 * 1000 * 1000);

    rec.addFluidInput(<liquid:circuit> * 10000);

    rec.addItemInput(<mekanism:machineblock3:1> * 64);
    rec.addItemInput(<contenttweaker:neutronium_mirror2> * 16);
	rec.addItemInput(<contenttweaker:laser> * 24);
    
    rec.addItemOutput(<modularcontroller:donut_controller>);
	rec.build();
}