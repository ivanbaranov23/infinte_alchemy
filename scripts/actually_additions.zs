import crafttweaker.item.IItemStack;

import mods.actuallyadditions.AtomicReconstructor;
//AtomicReconstructor.addRecipe(IItemStack output, IItemStack input, int energyUsed);
//AtomicReconstructor.removeRecipe(IItemStack output);
import mods.actuallyadditions.Empowerer;
//Empowerer.addRecipe(
//	IItemStack output, IItemStack input, 
//	IItemStack modifier1, IItemStack modifier2, IItemStack modifier3, IItemStack modifier4, 
//	int energyPerStand, int time);



recipes.remove(<actuallyadditions:block_misc:9>);
recipes.addShaped("ia_frame5", <actuallyadditions:block_misc:9>, [
	[<redstonearsenal:material:128>, <ore:circuitUltimate>, <redstonearsenal:material:128>], 
	[<contenttweaker:titanium_rod>, <mekanism:basicblock:8>, <contenttweaker:titanium_rod>], 
	[<contenttweaker:osgloridium_plate>, <contenttweaker:gearbox_normal>, <contenttweaker:osgloridium_plate>]
]);

recipes.remove(<actuallyadditions:block_misc:8>);
recipes.addShaped("ia_frame10", <actuallyadditions:block_misc:8>, [
	[<extendedcrafting:material:36>, <contenttweaker:robot_arm>, <extendedcrafting:material:36>], 
	[<biomesoplenty:terrestrial_artifact>, <enderio:item_material:54>, <biomesoplenty:terrestrial_artifact>], 
	[<extendedcrafting:material:36>, <enderio:item_capacitor_crystalline>, <extendedcrafting:material:36>]
]);

recipes.remove(<actuallyadditions:block_canola_press>);
recipes.addShaped("block_canola_press", <actuallyadditions:block_canola_press>, [
	[<minecraft:piston>, <actuallyadditions:item_misc:13>, <minecraft:piston>], 
	[<enderio:item_material:11>, <thermalexpansion:frame:64>, <enderio:item_material:11>]
]);
scripts.jei.addJEIhint(
    [<actuallyadditions:item_misc:13>], [], 
    [<actuallyadditions:block_canola_press>], 
    [], [<liquid:canolaoil>]
);
mods.thermalexpansion.Crucible.addRecipe(<liquid:canolaoil> * 100, <actuallyadditions:item_misc:13>, 1000);


val atomic_resources as IItemStack[string][string] = {
	redstone: {
		raw: <minecraft:redstone>,
		raw_block: <minecraft:redstone_block>,
		item: <actuallyadditions:item_crystal>,
		item_block: <actuallyadditions:block_crystal>,
		empowered: <actuallyadditions:item_crystal_empowered>,
		empowered_block: <actuallyadditions:block_crystal_empowered>,

		ing1: <tconstruct:slime_congealed:3>,
		ing2: <contenttweaker:thermal_gear>,
		ing3: <roots:infernal_bulb>,
		ing4: <extrautils2:decorativeglass:5>
	},
	lapis: {
		raw: <minecraft:dye:4>,
		raw_block: <minecraft:lapis_block>,
		item: <actuallyadditions:item_crystal:1>,
		item_block: <actuallyadditions:block_crystal:1>,
		empowered: <actuallyadditions:item_crystal_empowered:1>,
		empowered_block: <actuallyadditions:block_crystal_empowered:1>,

		ing1: <botania:petalblock:11>,
		ing2: <contenttweaker:watertight_steel_gear>,
		ing3: <roots:dewgonia>,
		ing4: <integratedterminals:menril_glass>
	},
	diamond: {
		raw: <minecraft:diamond>,
		raw_block: <minecraft:diamond_block>,
		item: <actuallyadditions:item_crystal:2>,
		item_block: <actuallyadditions:block_crystal:2>,
		empowered: <actuallyadditions:item_crystal_empowered:2>,
		empowered_block: <actuallyadditions:block_crystal_empowered:2>,

		ing1: <minecraft:sea_lantern>,
		ing2: <contenttweaker:angel_gear>,
		ing3: <roots:baffle_cap_mushroom>,
		ing4: <roots:glass_eye>
	},

	coal: {
		raw: <minecraft:coal>,
		raw_block: <minecraft:coal_block>,
		item: <actuallyadditions:item_crystal:3>,
		item_block: <actuallyadditions:block_crystal:3>,
		empowered: <actuallyadditions:item_crystal_empowered:3>,
		empowered_block: <actuallyadditions:block_crystal_empowered:3>,

		ing1: <roots:runed_obsidian>,
		ing2: <moreplates:refined_obsidian_gear>,
		ing3: <roots:pereskia>,
		ing4: <extrautils2:decorativeglass:3>
	},
	emerald: {
		raw: <minecraft:emerald>,
		raw_block: <minecraft:emerald_block>,
		item: <actuallyadditions:item_crystal:4>,
		item_block: <actuallyadditions:block_crystal:4>,
		empowered: <actuallyadditions:item_crystal_empowered:4>,
		empowered_block: <actuallyadditions:block_crystal_empowered:4>,

		ing1: <erebus:jade_block>,
		ing2: <moreplates:enchanted_gear>,
		ing3: <roots:spirit_herb>,
		ing4: <immersiveengineering:stone_decoration:8>
	},
	iron: {
		raw: <minecraft:iron_ingot>,
		raw_block: <minecraft:iron_block>,
		item: <actuallyadditions:item_crystal:5>,
		item_block: <actuallyadditions:block_crystal:5>,
		empowered: <actuallyadditions:item_crystal_empowered:5>,
		empowered_block: <actuallyadditions:block_crystal_empowered:5>,

		ing1: <mysticalagriculture:storage:5>,
		ing2: <moreplates:pig_iron_gear>,
		ing3: <roots:cloud_berry>,
		ing4: <appliedenergistics2:part:140>
	},

	copper: {
		raw: <thermalfoundation:material:128>,
		raw_block: <thermalfoundation:storage>,
		item: <contenttweaker:coppra>,
		item_block: <contenttweaker:coppra_block>,
		empowered: <contenttweaker:ecoppra>,
		empowered_block: <contenttweaker:ecoppra_block>,

		ing1: <minecraft:orange_glazed_terracotta>,
		ing2: <thermalfoundation:material:291>,
		ing3: <roots:wildewheet>,
		ing4: <thermalfoundation:glass_alloy:5>
	},
	tin: {
		raw: <thermalfoundation:material:129>,
		raw_block: <thermalfoundation:storage:1>,
		item: <contenttweaker:nittin>,
		item_block: <contenttweaker:nittin_block>,
		empowered: <contenttweaker:enittin>,
		empowered_block: <contenttweaker:enittin_block>,

		ing1: <appliedenergistics2:quartz_block>,
		ing2: <thermalfoundation:material:258>,
		ing3: <roots:moonglow_leaf>,
		ing4: <thermalfoundation:glass:2>
	},
	gold: {
		raw: <minecraft:gold_ingot>,
		raw_block: <minecraft:gold_block>,
		item: <contenttweaker:goold>,
		item_block: <contenttweaker:goold_block>,
		empowered: <contenttweaker:egoold>,
		empowered_block: <contenttweaker:egoold_block>,

		ing1: <roots:elemental_soil_earth>,
		ing2: <moreplates:refined_glowstone_gear>,
		ing3: <roots:stalicripe>,
		ing4: <erebus:amber_glass>
	}
};
val colors256 as float[][string] = {
	redstone: [240, 0, 0], 
	lapis: [16, 18, 136], 
	diamond: [154, 156, 255],
	emerald: [3, 209, 0], 
	coal: [15, 15, 15], 
	iron: [239, 232, 255],
	copper: [255, 181, 26],
	tin: [179, 196, 210],
	gold: [255, 255, 11]
};

val resources_to_clean as string[] = [
	"redstone", "lapis", "diamond",
	"emerald", "coal", "iron"
];
val atomic_res_energy as int = 1000;
val empowered_res_energy as int = 40000;
for res in resources_to_clean{
	AtomicReconstructor.removeRecipe(atomic_resources[res].item);
	AtomicReconstructor.removeRecipe(atomic_resources[res].item_block);
	
	Empowerer.removeRecipe(atomic_resources[res].empowered);
	Empowerer.removeRecipe(atomic_resources[res].empowered_block);
}
for res in atomic_resources{
	AtomicReconstructor.addRecipe(atomic_resources[res].item, atomic_resources[res].raw, atomic_res_energy);
	AtomicReconstructor.addRecipe(atomic_resources[res].item_block, atomic_resources[res].raw_block, atomic_res_energy * 10);

	Empowerer.addRecipe(
		atomic_resources[res].empowered, atomic_resources[res].item, 
		atomic_resources[res].ing1, atomic_resources[res].ing2, atomic_resources[res].ing3, atomic_resources[res].ing4,
		empowered_res_energy, 10,
		[colors256[res][0] / 255.0, colors256[res][1] / 255.0, colors256[res][2] / 255.0]
	);

	Empowerer.addRecipe(
		atomic_resources[res].empowered, <contenttweaker:empowered_shard>, 
		atomic_resources[res].item, atomic_resources[res].item, atomic_resources[res].item, atomic_resources[res].item,
		empowered_res_energy, 40,
		[colors256[res][0] / 255.0, colors256[res][1] / 255.0, colors256[res][2] / 255.0]
	);
}


//drill
recipes.remove(<actuallyadditions:item_misc:16>);
recipes.addShaped("ia_aa_drill_core", <actuallyadditions:item_misc:16>, [
	[<immersiveengineering:wirecoil:5>, <projectred-core:resource_item:410>, <immersiveengineering:metal_decoration0:2>], 
	[<actuallyadditions:item_misc:8>, <thermalfoundation:material:640>, <mekanism:electrolyticcore>], 
	[<immersiveengineering:metal_decoration0:2>, <actuallyadditions:item_misc:8>, <contenttweaker:menril_steel_wire>]
]);
recipes.remove(<actuallyadditions:item_drill:3>);
recipes.addShaped("ia_aa_drill", <actuallyadditions:item_drill:3>.withTag({Energy: 0}), [
	[null, <quantumflux:craftingpiece:2>, <thermalfoundation:material:656>], 
	[<actuallyadditions:item_misc:8>, <actuallyadditions:item_misc:16>, <ore:plateSignalum>], 
	[<ore:plateConstantan>, <actuallyadditions:battery_bauble>, <ore:plateConstantan>]
]);

//machines
recipes.remove(<actuallyadditions:block_display_stand>);
recipes.addShaped("ia_block_display_stand", <actuallyadditions:block_display_stand>, [
	[null, <actuallyadditions:item_misc:7>, null], 
	[<contenttweaker:lesmium_rod>, <contenttweaker:tunril_plate>, <contenttweaker:lesmium_rod>], 
	[<actuallyadditions:block_testifi_bucks_green_wall>, <actuallyadditions:block_testifi_bucks_white_wall>, <actuallyadditions:block_testifi_bucks_green_wall>]
]);
recipes.remove(<actuallyadditions:block_empowerer>);
recipes.addShaped("ia_block_empowerer", <actuallyadditions:block_empowerer>, [
	[<ore:stickLumium>, <projectred-core:resource_item:402>, <ore:stickLumium>], 
	[<actuallyadditions:item_misc:7>, <immersiveengineering:metal_decoration0:1>, <actuallyadditions:item_misc:7>], 
	[<actuallyadditions:block_display_stand>, <actuallyadditions:block_misc:9>, <actuallyadditions:block_display_stand>]
]);
recipes.remove(<actuallyadditions:block_coffee_machine>);
recipes.addShaped("ia_block_coffee_machine", <actuallyadditions:block_coffee_machine>, [
	[null, <harvestcraft:coffeebeanitem>, <harvestcraft:coffeebeanitem>], 
	[<contenttweaker:soy_plate>, <contenttweaker:soy_gear>, <contenttweaker:robot_arm>], 
	[<contenttweaker:soy_plate>, <actuallyadditions:block_misc:8>, <actuallyadditions:item_misc:8>]
]);

//blocks
recipes.remove(<actuallyadditions:block_misc:4>);
recipes.addShaped("ia_wooden_frame", <actuallyadditions:block_misc:4> * 4, [
	[<tconstruct:firewood>, <ore:gearWood>, <tconstruct:firewood>], 
	[<ore:gearWood>, <extendedcrafting:singularity_custom:100>, <ore:gearWood>], 
	[<tconstruct:firewood>, <ore:gearWood>, <tconstruct:firewood>]
]);
recipes.remove(<actuallyadditions:block_giant_chest>);
recipes.addShaped("ia_crate1", <actuallyadditions:block_giant_chest>, [
	[<erebus:bamboo_crate>, <immersiveengineering:wooden_device0>, <erebus:bamboo_crate>], 
	[<immersiveengineering:wooden_device0>, <actuallyadditions:block_misc:4>, <immersiveengineering:wooden_device0>], 
	[<erebus:bamboo_crate>, <immersiveengineering:wooden_device0>, <erebus:bamboo_crate>]
]);

recipes.remove(<actuallyadditions:block_atomic_reconstructor>);
recipes.addShaped("ia_block_atomic_reconstructor", <actuallyadditions:block_atomic_reconstructor>, [
	[<contenttweaker:osgloridium_plate>, <prodigytech:primordium>, <thermalfoundation:material:515>], 
	[<prodigytech:primordium>, <actuallyadditions:block_misc:9>, <twilightforest:knightmetal_ring>], 
	[<contenttweaker:osgloridium_plate>, <prodigytech:primordium>, <thermalfoundation:material:515>]
]);




{//battery
	recipes.removeByRecipeName("actuallyadditions:recipes39");
	recipes.removeByRecipeName("actuallyadditions:double_battery");
	recipes.removeByRecipeName("actuallyadditions:triple_battery");
	recipes.removeByRecipeName("actuallyadditions:quadruple_battery");
	recipes.removeByRecipeName("actuallyadditions:quintuple_battery");

	recipes.addShaped("ia_aa_battery_1", <actuallyadditions:item_battery>, [
		[<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>, <actuallyadditions:item_crystal:5>, <mekanism:energytablet>], 
		[<actuallyadditions:item_crystal:5>, <actuallyadditions:item_misc:8>, <actuallyadditions:item_crystal:5>], 
		[<mekanism:energytablet>, <actuallyadditions:item_crystal:5>, <moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_battery>], 
		[
			<mekanism:energytablet>,
			<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>,
			<actuallyadditions:item_crystal:5> * 2,
			<actuallyadditions:item_misc:8>
		], null,
		20, 1000
	);

	recipes.addShaped("ia_aa_battery_2", <actuallyadditions:item_battery_double>, [
		[<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>, <actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_battery>], 
		[<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_misc:8>, <actuallyadditions:item_crystal_empowered:5>], 
		[<actuallyadditions:item_battery>, <actuallyadditions:item_crystal_empowered:5>, <moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_battery_double>], 
		[
			<mekanism:energytablet>,
			<actuallyadditions:item_battery>,
			<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>,
			<actuallyadditions:item_crystal:5> * 2,
			<actuallyadditions:item_misc:8>
		], null,
		20, 1000
	);

	recipes.addShaped("ia_aa_battery_3", <actuallyadditions:item_battery_triple>, [
		[<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>, <actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_battery_double>], 
		[<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_misc:8>, <actuallyadditions:item_crystal_empowered:5>], 
		[<actuallyadditions:item_battery_double>, <actuallyadditions:item_crystal_empowered:5>, <moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_battery_triple>], 
		[
			<actuallyadditions:item_battery>,
			<actuallyadditions:item_battery_double>,
			<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>,
			<actuallyadditions:item_crystal:5> * 2,
			<actuallyadditions:item_misc:8>
		], null,
		20, 1000
	);

	recipes.addShaped("ia_aa_battery_4", <actuallyadditions:item_battery_quadruple>, [
		[<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>, <actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_battery_triple>], 
		[<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_misc:8>, <actuallyadditions:item_crystal_empowered:5>], 
		[<actuallyadditions:item_battery_triple>, <actuallyadditions:item_crystal_empowered:5>, <moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_battery_quadruple>], 
		[
			<actuallyadditions:item_battery_double>,
			<actuallyadditions:item_battery_triple>,
			<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>,
			<actuallyadditions:item_crystal:5> * 2,
			<actuallyadditions:item_misc:8>
		], null,
		20, 1000
	);

	recipes.addShaped("ia_aa_battery_5", <actuallyadditions:item_battery_quintuple>, [
		[<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>, <actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_battery_quadruple>], 
		[<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_misc:8>, <actuallyadditions:item_crystal_empowered:5>], 
		[<actuallyadditions:item_battery_quadruple>, <actuallyadditions:item_crystal_empowered:5>, <moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_battery_quintuple>], 
		[
			<actuallyadditions:item_battery_triple>,
			<actuallyadditions:item_battery_quadruple>,
			<moreplates:electrotine_alloy_gear> | <projectred-core:resource_item:342>,
			<actuallyadditions:item_crystal:5> * 2,
			<actuallyadditions:item_misc:8>
		], null,
		20, 1000
	);
}