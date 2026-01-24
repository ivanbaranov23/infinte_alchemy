import crafttweaker.item.IItemStack;
import mods.enderio.AlloySmelter;
import mods.enderio.Vat;
//mods.enderio.Vat.addRecipe(ILiquidStack output, ILiquidStack input, IIngredient[] slot1Solids, float[] slot1Mults, IIngredient[] slot2Solids, float[] slot2Mults, @Optional int energyCost);


//frame 6
recipes.remove(<enderio:item_material:1>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_material>, <enderio:item_material:51>);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:1>);
recipes.addShaped("ia_machine_frame6", <enderio:item_material:1>, [
	[<ore:ingotEezo>, <ore:blockAmethyst>, <ore:ingotEezo>], 
	[<enderio:item_capacitor_silver>, <actuallyadditions:block_misc:9>, <enderio:item_basic_capacitor>], 
	[<ore:ingotEezo>, <ore:blockAmethyst>, <ore:ingotEezo>]
]);
recipes.remove(<enderio:item_material>);
recipes.addShaped("ia_machine_frame6_alt", <enderio:item_material>, [
	[null, <ore:itemChassiParts>, null], 
	[<ore:itemChassiParts>, <enderio:item_capacitor_grainy>, <ore:itemChassiParts>], 
	[null, <ore:itemChassiParts>, null]
]);

//frame 7
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_material>, <enderio:item_material:52>);
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:53>);
recipes.addShaped("ia_machine_frame7", <enderio:item_material:53>, [
	[<simplyjetpacks:metaitemmods:12>, <moreplates:energetic_silver_plate>, <simplyjetpacks:metaitemmods:12>], 
	[<enderio:item_material:52>, <enderio:item_material:1>, <enderio:item_material:52>], 
	[<simplyjetpacks:metaitemmods:12>, <moreplates:energetic_silver_plate>, <simplyjetpacks:metaitemmods:12>]
]);

//frame 8
recipes.remove(<enderio:item_material:66>);
recipes.addShaped("ia_machine_frame8", <enderio:item_material:66>, [
	[<moreplates:end_steel_plate>, <moreplates:vivid_alloy_gear>, <moreplates:end_steel_plate>], 
	[<enderio:item_material:56>, <enderio:item_material:53>, <enderio:item_material:56>], 
	[<moreplates:end_steel_plate>, <moreplates:vivid_alloy_gear>, <moreplates:end_steel_plate>]
]);

//frame 9
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:54>);
recipes.addShaped("ia_machine_frame9", <enderio:item_material:54>, [
	[<moreplates:crystalline_pink_slime_plate>, <quantumflux:craftingpiece:1>, <moreplates:crystalline_pink_slime_plate>], 
	[<enderio:item_material:67>, <enderio:item_material:66>, <enderio:item_material:67>], 
	[<moreplates:melodic_alloy_plate>, <quantumflux:craftingpiece:1>, <moreplates:melodic_alloy_plate>]
]);

//tank
recipes.remove(<enderio:block_tank>);
recipes.addShapeless("ia_eio_tank_reset", <enderio:block_tank>, [<enderio:block_tank>]);
recipes.addShaped("ia_eio_tank", <enderio:block_tank>, [
	[<minecraft:iron_bars>, <extrautils2:grocket:2>, <minecraft:iron_bars>],
	[<minecraft:iron_bars>, <openblocks:tank>, <minecraft:iron_bars>],
	[<minecraft:iron_bars>, <extrautils2:grocket:2>, <minecraft:iron_bars>]
]);
recipes.remove(<enderio:block_tank:1>);
recipes.addShapeless("ia_eio_tank2_reset", <enderio:block_tank:1>, [<enderio:block_tank:1>]);
recipes.addShaped("ia_eio_tank2", <enderio:block_tank:1>, [
	[<immersiveengineering:sheetmetal:8>, <ore:dyeBlack>, <immersiveengineering:sheetmetal:8>],
	[<ore:dyeBlack>, <enderio:block_tank>, <ore:dyeBlack>],
	[<immersiveengineering:sheetmetal:8>, <immersiveengineering:metal_device0:5>, <immersiveengineering:sheetmetal:8>]
]);

//glass
<ore:blockGlassHardened>.remove(<enderio:block_fused_quartz:*>);

recipes.remove(<enderio:item_soul_vial>);
recipes.addShaped("ia_item_soul_vial", <enderio:item_soul_vial>, [
	[null, <ore:blockSoularium>, null], 
	[<appliedenergistics2:quartz_vibrant_glass>, <contenttweaker:medical_alloy_gear>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <extendedcrafting:singularity_custom:3>, <appliedenergistics2:quartz_vibrant_glass>]
]);

recipes.remove(<enderio:item_material:22>);
recipes.addShaped("ia_conduit_binder_dust", <enderio:item_material:22> * 8, [
	[<tconstruct:soil>, <contenttweaker:fireclay>, <tconstruct:soil>], 
	[<tconstruct:edible:33>, <immersivepetroleum:material>, <tconstruct:edible:33>], 
	[<tconstruct:soil>, <contenttweaker:fireclay>, <tconstruct:soil>]
]);


{//conduit
	furnace.remove(<enderio:item_material:4>);
	//conduit binders recipes
	//2cbd + 1brass(l) = 2cb
	mods.tconstruct.Casting.addTableRecipe(
		<enderio:item_material:4>, 
		<enderio:item_material:22>, 
		<liquid:alubrass>, 72, 
		true);
	//4cbd + 2brass = 5cb
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<enderio:item_material:4> * 5, 
		<enderio:item_material:22> * 4, <tconstruct:ingots:5> * 2, 
		2500);
	AlloySmelter.addRecipe(<enderio:item_material:4> * 8, 
		[
			<enderio:item_material:22> * 3,
			<tconstruct:ingots:5>,
			<harvestcraft:noodlesitem> * 2
		]
	);

	recipes.remove(<enderio:item_advanced_item_filter>);
	recipes.addShaped("ia_item_advanced_item_filter", <enderio:item_advanced_item_filter>, [
		[null, <thermaldynamics:filter:3>, null], 
		[<thermaldynamics:filter:3>, <enderio:item_basic_item_filter>, <thermaldynamics:filter:3>], 
		[null, <thermaldynamics:filter:3>, null]
	]);
}

//crystals

mods.enderio.SoulBinder.addRecipe(<contenttweaker:guarding_crystal>, <actuallyadditions:item_crystal_empowered:4>, ["atum:stoneguard"], 50000, 8);

{//dyes
	AlloySmelter.removeRecipe(<enderio:item_material:49>);
	AlloySmelter.addRecipe(<enderio:item_material:49>, 
		[
			<enderio:item_material:47> * 6,
			<tconstruct:edible:2>,
			<industrialforegoing:fertilizer>
		]
	);

	recipes.remove(<enderio:item_material:52>);
	recipes.addShaped("soul_dye_base", <contenttweaker:soul_dye_base> * 6, 
		[
			[<enderio:item_material:50>, <appliedenergistics2:material:3>, <enderio:item_material:49>],
			[<appliedenergistics2:material:3>, <contenttweaker:delicate_amber>, <appliedenergistics2:material:3>],
			[<enderio:item_material:49>, <appliedenergistics2:material:3>, <enderio:item_material:50>]
		]
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
        <enderio:item_material:52> * 2, <contenttweaker:soul_dye_base>, 
        <liquid:soularium> * 216, 
        2000
    );
	recipes.remove(<enderio:item_material:67>);
	AlloySmelter.addRecipe(<enderio:item_material:67>, 
		[
			<enderio:item_material:52> * 8,
			<contenttweaker:insulation_strand> * 8,
			<enderio:item_material:36>
		]
	);
}

{//insulation
	AlloySmelter.removeRecipe(<enderio:block_industrial_insulation>);
	AlloySmelter.addRecipe(<contenttweaker:aluminum_silicon> * 4, 
		[<thermalfoundation:material:68> * 12, <appliedenergistics2:material:5> * 12, <enderio:item_material:22>], 
		8000
	);
	AlloySmelter.addRecipe(<contenttweaker:insulation_base> * 2, 
		[<appliedenergistics2:part:140>, <contenttweaker:aluminum_silicon> * 2, <contenttweaker:calcium>], 
		8000
	);
	AlloySmelter.addRecipe(<contenttweaker:insulation_base> * 3, 
		[<appliedenergistics2:part:140>, <contenttweaker:aluminum_silicon> * 3, <alchemistry:element:20> * 6], 
		4000
	);
	mods.thermalexpansion.Centrifuge.addRecipe(
		[(<contenttweaker:insulation_strand> * 2) % 100, <contenttweaker:insulation_strand> % 50, <contenttweaker:insulation_strand> % 25], <contenttweaker:insulation_base> * 4, null, 
		8000
	);
	AlloySmelter.addRecipe(<contenttweaker:insulation_fabric> * 2, 
		[<moreplates:pulsating_iron_plate>, <contenttweaker:insulation_strand> * 8, <immersiveengineering:material:23> * 4], 
		8000
	);
	AlloySmelter.addRecipe(<contenttweaker:insulation_fabric>, 
		[<immersiveengineering:stone_decoration:8>, <contenttweaker:insulation_strand> * 4, <immersiveengineering:material:23> * 2], 
		4000
	);
}

recipes.addShaped("ia_terrible_recipe_block_industrial_insulation", <enderio:block_industrial_insulation>, [
	[<contenttweaker:insulation_strand>, <contenttweaker:insulation_fabric>, <contenttweaker:insulation_strand>], 
	[<contenttweaker:insulation_fabric>, <immersiveengineering:metal_decoration1:5>, <contenttweaker:insulation_fabric>], 
	[<contenttweaker:insulation_strand>, <contenttweaker:insulation_fabric>, <contenttweaker:insulation_strand>]
]);



//components
{//capacitors and enchanced tooltip
	<enderio:item_basic_capacitor>.addTooltip("Capacitor Level 1");
	<enderio:item_capacitor_silver>.addTooltip("Capacitor Level 1");
	<enderio:item_capacitor_grainy>.addTooltip("Capacitor Level 1");

	<enderio:item_basic_capacitor:1>.addTooltip("Capacitor Level 2");
	<enderio:item_capacitor_energetic_silver>.addTooltip("Capacitor Level 2");

	<enderio:item_basic_capacitor:2>.addTooltip("Capacitor Level 3");
	<enderio:item_capacitor_vivid>.addTooltip("Capacitor Level 3");

	<enderio:item_capacitor_crystalline>.addTooltip("Capacitor Level 3.5");
	<enderio:item_capacitor_totemic>.addTooltip("Capacitor Level 3.5");

	<enderio:item_capacitor_melodic>.addTooltip("Capacitor Level 4");

	<enderio:item_capacitor_stellar>.addTooltip("Capacitor Level 5");


	<ometweaks:cake_capacitor>.addShiftTooltip("Cake is a lie", "Capacitor Level 3");
	<ometweaks:crab_capacitor>.addTooltip("Capacitor Level 4.5");
	<ometweaks:neutronium_capacitor>.addTooltip("Capacitor Level 7");


	<enderio:block_enhanced_alloy_smelter>.addTooltip("Capacitor Level +1");
	<enderio:block_enhanced_combustion_generator>.addTooltip("Capacitor Level +1");
	<enderio:block_enhanced_sag_mill>.addTooltip("Capacitor Level +1");
	<enderio:block_enhanced_vat>.addTooltip("Capacitor Level +1");
	<enderio:block_enhanced_wired_charger>.addTooltip("Capacitor Level +1");
}

{//parts
	recipes.remove(<enderio:item_material:68>);
	recipes.addShaped("ia_eio_enhanced_parts", <enderio:item_material:68> * 16, [
		[<enderio:item_alloy_ingot:8>, <deepmoblearning:soot_covered_plate>, <enderio:item_alloy_ingot:8>], 
		[<contenttweaker:arkenium_plate>, <enderio:item_material:54>, <contenttweaker:arkenium_plate>], 
		[<enderio:item_alloy_ingot:8>, <deepmoblearning:soot_covered_plate>, <enderio:item_alloy_ingot:8>]
	]);
}

recipes.remove(<enderio:block_travel_anchor>);
/*recipes.addShaped("ia_block_travel_anchor", <enderio:block_travel_anchor>, [
	[<thermalfoundation:storage_alloy:7>, , <thermalfoundation:storage_alloy:7>],
	[],
	[<thermalfoundation:storage_alloy:7>, , <thermalfoundation:storage_alloy:7>]
]);*/
recipes.addShaped("ia_block_travel_anchor2", <enderio:block_travel_anchor> * 4, [
	[<mekanism:basicblock:7>, <enderio:item_material:14>, <mekanism:basicblock:7>], 
	[<enderio:item_material:14>, <mekanism:machineblock:11>, <enderio:item_material:14>], 
	[<mekanism:basicblock:7>, <enderio:item_material:14>, <mekanism:basicblock:7>]
]);

recipes.remove(<enderio:block_reservoir>);
recipes.addShaped("ia_eio_block_reservoir", <enderio:block_reservoir> * 4, [
	[<minecraft:iron_bars>, <minecraft:glass>, <minecraft:iron_bars>], 
	[<minecraft:glass>, <roots:unending_bowl>, <minecraft:glass>], 
	[<minecraft:iron_bars>, <minecraft:glass>, <minecraft:iron_bars>]
]);
recipes.addShaped("ia_eio_block_reservoir2", <enderio:block_reservoir> * 16, [
	[<enderio:block_dark_iron_bars>, <enderio:block_fused_quartz>, <enderio:block_dark_iron_bars>], 
	[<enderio:block_fused_quartz>, <roots:unending_bowl>, <enderio:block_fused_quartz>], 
	[<enderio:block_dark_iron_bars>, <enderio:block_fused_quartz>, <enderio:block_dark_iron_bars>]
]);

recipes.remove(<enderio:block_transceiver>);
recipes.addShaped("ia_eio_block_transceiver", <enderio:block_transceiver>, [
	[<projectred-core:resource_item>, <contenttweaker:entangled_particles>, <projectred-core:resource_item>], 
	[<contenttweaker:pulse_generator>, <enderio:item_material>, <contenttweaker:pulse_generator>], 
	[<projectred-core:resource_item>, <enderio:item_material:43>, <projectred-core:resource_item>]
]);

{//gears
	recipes.addShaped("ia_eio_gear1", <enderio:item_material:11>, [
		[<enderio:item_material:20>, <moreplates:electrical_steel_gear>, <enderio:item_material:20>], 
		[<moreplates:electrical_steel_gear>, <moreplates:electrical_steel_gear>, <moreplates:electrical_steel_gear>], 
		[<enderio:item_material:20>, <moreplates:electrical_steel_gear>, <enderio:item_material:20>]
	]);
	recipes.addShaped("ia_eio_gear2", <enderio:item_material:12>, [
		[<enderio:item_material:20>, <moreplates:energetic_alloy_gear>, <enderio:item_material:20>], 
		[<moreplates:energetic_alloy_gear>, <enderio:item_material:11>, <moreplates:energetic_alloy_gear>], 
		[<enderio:item_material:20>, <moreplates:energetic_alloy_gear>, <enderio:item_material:20>]
	]);
	recipes.addShaped("ia_eio_gear3", <enderio:item_material:13>, [
		[<enderio:item_material:20>, <moreplates:vibrant_alloy_gear>, <enderio:item_material:20>], 
		[<moreplates:vibrant_alloy_gear>, <enderio:item_material:12>, <moreplates:vibrant_alloy_gear>], 
		[<enderio:item_material:20>, <moreplates:vibrant_alloy_gear>, <enderio:item_material:20>]
	]);
	recipes.addShaped("ia_eio_gear4", <enderio:item_material:73>*2, [
		[<enderio:block_infinity>, <enderio:item_material:13>, <enderio:block_infinity>], 
		[<enderio:item_material:13>, <contenttweaker:bedrockium_alloy_gear>, <enderio:item_material:13>], 
		[<enderio:block_infinity>, <enderio:item_material:13>, <enderio:block_infinity>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<enderio:item_material:73> * 3],
		[
			<contenttweaker:bedrockium_alloy_gear>,
			<enderio:item_material:13> * 4,
			<enderio:item_material:20> * 32
		], null,
		40, 512
	);
}
//dark steel upgardes
recipes.remove(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:direct"}));
recipes.addShaped("ia_dark_steel_direct", <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:direct"}), [
	[null, <immersiveengineering:toolupgrade:12>, null], 
	[<immersiveengineering:toolupgrade:12>, <contenttweaker:electric_manyullyn_plate>, <immersiveengineering:toolupgrade:12>], 
	[null, <immersiveengineering:toolupgrade:12>, null]
]);

{//machines
	recipes.remove(<enderio:block_simple_crafter>);
	recipes.addShaped("ia_simple_crafter1", <enderio:block_simple_crafter>, [
		[<moreplates:electrical_steel_plate>, <avaritia:compressed_crafting_table>, <moreplates:electrical_steel_plate>],
		[<enderio:item_material:11>, <extrautils2:machine>, <enderio:item_material:11>],
		[<moreplates:electrical_steel_plate>, <avaritia:compressed_crafting_table>, <moreplates:electrical_steel_plate>]
	]);

	recipes.remove(<enderio:block_simple_alloy_smelter>);
	recipes.addShaped("ia_simple_alloy_smelter1", <enderio:block_simple_alloy_smelter>, [
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:anput_godshard>, <contenttweaker:mekanized_steel_plate>], 
		[<thermalexpansion:machine:3>, <mekanism:basicblock:8>, <thermalexpansion:machine:3>], 
		[<ore:gearIronInfinity>, <forge:bucketfilled>.withTag({FluidName: "xu_enchanted_metal", Amount: 1000}).noReturn(), <ore:gearIronInfinity>]
	]);
	recipes.addShaped("ia_simple_alloy_smelter2", <enderio:block_simple_alloy_smelter>, [
		[<contenttweaker:mekanized_steel_plate>, <enderio:item_capacitor_grainy>, <contenttweaker:mekanized_steel_plate>], 
		[<morefurnaces:furnaceblock:1>, <ore:itemSimpleMachineChassi>, <morefurnaces:furnaceblock:1>], 
		[<ore:gearIronInfinity>, <ore:gearPulsatingIron>, <ore:gearIronInfinity>]
	]);
	recipes.remove(<enderio:block_alloy_smelter>);
	recipes.addShaped("ia_eio_alloyer2", <enderio:block_alloy_smelter>, [
		[<moreplates:dark_steel_plate>, <tconstruct:smeltery_controller>, <moreplates:dark_steel_plate>], 
		[<enderio:item_material:12>, <enderio:item_material:1>, <enderio:item_material:12>], 
		[<moreplates:dark_steel_plate>, <enderio:block_simple_alloy_smelter>, <moreplates:dark_steel_plate>]
	]);

	recipes.remove(<enderio:block_vat>);
	recipes.addShaped("ia_vat", <enderio:block_vat>, [
		[<enderio:block_tank:1>, <thermalexpansion:machine:12>, <enderio:block_tank:1>], 
		[<moreplates:dark_steel_plate>, <enderio:item_material:1>, <moreplates:dark_steel_plate>], 
		[<moreplates:dark_steel_plate>, <morefurnaces:furnaceblock:2>, <moreplates:dark_steel_plate>]
	]);

	recipes.remove(<enderio:block_simple_sag_mill>);
	recipes.addShaped("ia_sag1", <enderio:block_simple_sag_mill>, [
		[<contenttweaker:mekanized_steel_plate>, <minecraft:flint>, <contenttweaker:mekanized_steel_plate>], 
		[<enderio:item_material:11>, <enderio:item_material>, <enderio:item_material:11>], 
		[<contenttweaker:mekanized_steel_plate>, <minecraft:flint>, <contenttweaker:mekanized_steel_plate>]
	]);
	recipes.remove(<enderio:block_sag_mill>);
	recipes.addShaped("ia_sag2", <enderio:block_sag_mill>, [
		[<moreplates:dark_steel_plate>, <enderio:item_material:12>, <moreplates:dark_steel_plate>], 
		[<contenttweaker:grinding_wheel>, <enderio:item_material:1>, <contenttweaker:grinding_wheel>], 
		[<moreplates:dark_steel_plate>, <enderio:block_simple_sag_mill>, <moreplates:dark_steel_plate>]
	]);

	recipes.remove(<enderio:block_combustion_generator>);
	recipes.addShaped("ia_combustion_generator", <enderio:block_combustion_generator>, [
		[<immersiveengineering:metal_decoration0:7>, <immersiveengineering:metal_decoration0:6>, <immersiveengineering:metal_decoration0:7>], 
		[<contenttweaker:tank>, <enderio:item_material:1>, <contenttweaker:tank>], 
		[<enderio:block_industrial_insulation>, <contenttweaker:crucible>, <enderio:block_industrial_insulation>]
	]);


	recipes.remove(<enderio:block_killer_joe>);
	recipes.addShaped("ia_block_killer_joe", <enderio:block_killer_joe>, [
		[<ore:plateDarkSteel>, <contenttweaker:bedrockium_alloy_plate>, <ore:plateDarkSteel>], 
		[<engineersdecor:panzerglass_block>, <ore:skullZombieFrankenstein>, <contenttweaker:robot_arm>], 
		[<engineersdecor:panzerglass_block>, <actuallyadditions:block_misc:8>, <engineersdecor:panzerglass_block>]
	]);
}



{//cheap chassi machines
	recipes.remove(<enderio:block_painter>);
	recipes.addShaped("ia_eio_block_painter", <enderio:block_painter>, [
		[<contenttweaker:tungsten_plate>, <appliedenergistics2:paint_ball:*>, <contenttweaker:tungsten_plate>], 
		[<enderio:item_material:11>, <enderio:item_material>, <enderio:item_material:11>], 
		[<contenttweaker:tungsten_plate>, <openblocks:paintbrush>, <contenttweaker:tungsten_plate>]
	]);

	recipes.remove(<enderio:block_impulse_hopper>);
	recipes.addShaped("ia_eio_block_impulse_hopper", <enderio:block_impulse_hopper> * 2, [
		[<minecraft:iron_bars>, <engineersdecor:factory_hopper>, <minecraft:iron_bars>], 
		[<moreplates:redstone_alloy_plate>, <enderio:item_material>, <moreplates:redstone_alloy_plate>], 
		[<minecraft:iron_bars>, <engineersdecor:factory_hopper>, <minecraft:iron_bars>]
	]);

	recipes.remove(<enderio:block_enchanter>);
	recipes.addShaped("ia_eio_enchanter", <enderio:block_enchanter>, [
		[<moreplates:dark_steel_plate>, <thermalexpansion:machine:13>, <moreplates:dark_steel_plate>],
		[null, <enderio:item_material>, null],
		[null, <moreplates:dark_steel_plate>, null]
	]);
}

{//soul machines
	recipes.remove(<enderio:block_slice_and_splice>);
	recipes.addShaped("ia_block_slice_and_splice", <enderio:block_slice_and_splice>, [
		[<moreplates:soularium_plate>, <enderio:item_basic_capacitor> | <enderio:item_capacitor_silver>, <moreplates:soularium_plate>], 
		[<enderio:item_dark_steel_axe>, <enderio:item_material:53>, <enderio:item_dark_steel_shears>], 
		[<moreplates:soularium_plate>, <enderio:item_basic_capacitor> | <enderio:item_capacitor_silver>, <moreplates:soularium_plate>]
	]);
	recipes.remove(<enderio:block_soul_binder>);
	recipes.addShaped("ia_block_soul_binder", <enderio:block_soul_binder>, [
		[<moreplates:soularium_plate>, <enderio:item_material:43>, <moreplates:soularium_plate>], 
		[<enderio:item_material:41>, <enderio:item_material:53>, <enderio:item_material:45>], 
		[<moreplates:soularium_plate>, <contenttweaker:creeper_component>, <moreplates:soularium_plate>]
	]);

	recipes.remove(<enderio:block_farm_station>);
	recipes.addShaped("ia_block_farm_station", <enderio:block_farm_station>, [
		[<natura:redwood_logs:1> | <actuallyadditions:block_farmer>, <contenttweaker:plant_unit>, <natura:redwood_logs:1> | <actuallyadditions:block_farmer>], 
		[<enderio:item_material:44>, <enderio:item_material:53>, <enderio:item_material:44>], 
		[<natura:redwood_logs:1> | <actuallyadditions:block_farmer>, <enderio:item_material:73>, <natura:redwood_logs:1> | <actuallyadditions:block_farmer>]
	]);

	recipes.remove(<enderio:block_powered_spawner>);
	recipes.addShaped("ia_block_powered_spawner", <enderio:block_powered_spawner>, [
		[<enderio:item_material:44>, <contenttweaker:soul_codex8>, <enderio:item_material:44>], 
		[<minecraft:nether_star>, <enderio:item_material:53>, <minecraft:nether_star>], 
		[<simplyjetpacks:metaitemmods:11>, <enderio:item_capacitor_melodic>, <simplyjetpacks:metaitemmods:11>]
	]);
}

{//enchanced
	recipes.remove(<enderio:block_enhanced_alloy_smelter>);
	recipes.addShaped("ia_eio_block_enhanced_alloy_smelter", <enderio:block_enhanced_alloy_smelter>, [
		[<contenttweaker:arkenium_plate>, <contenttweaker:eio_slab>, <contenttweaker:arkenium_plate>], 
		[<enderio:block_alloy_smelter>, <enderio:item_material:54>, <enderio:block_alloy_smelter>], 
		[<enderio:item_material:73>, <enderio:item_capacitor_crystalline>, <enderio:item_material:73>]
	]);

	recipes.remove(<enderio:block_enhanced_sag_mill>);
	recipes.addShaped("ia_eio_block_enhanced_sag_mill", <enderio:block_enhanced_sag_mill>, [
		[<contenttweaker:grinding_wheel>, <contenttweaker:eio_slab>, <contenttweaker:grinding_wheel>], 
		[<enderio:block_sag_mill>, <enderio:item_material:54>, <enderio:block_sag_mill>], 
		[<enderio:item_material:73>, <enderio:item_capacitor_crystalline>, <enderio:item_material:73>]
	]);

	recipes.remove(<enderio:block_enhanced_vat>);
	recipes.addShaped("ia_eio_block_enhanced_vat", <enderio:block_enhanced_vat>, [
		[<contenttweaker:awaken_uru_plate>, <contenttweaker:eio_slab>, <contenttweaker:awaken_uru_plate>], 
		[<enderio:block_vat>, <enderio:item_material:54>, <enderio:block_vat>], 
		[<enderio:item_material:73>, <enderio:item_capacitor_crystalline>, <enderio:item_material:73>]
	]);

	recipes.remove(<enderio:block_enhanced_combustion_generator>);
	recipes.addShaped("ia_eio_block_enhanced_combustion_generator", <enderio:block_enhanced_combustion_generator>, [
		[<contenttweaker:pump>, <contenttweaker:eio_slab>, <contenttweaker:pump>], 
		[<enderio:block_combustion_generator>, <enderio:item_material:54>, <enderio:block_combustion_generator>], 
		[<enderio:item_material:73>, <enderio:item_capacitor_crystalline>, <enderio:item_material:73>]
	]);
}
{//solar
	recipes.remove(<enderio:block_solar_panel:1>);
	recipes.addShaped("ia_eio_solar1", <enderio:block_solar_panel:1>, [
		[<enderio:item_material:3>, <moreplates:energetic_alloy_plate>, <enderio:item_material:3>], 
		[<enderio:item_material:3>, <thermalfoundation:material:327>, <enderio:item_material:3>], 
		[<enderio:item_capacitor_silver>, <enderio:block_solar_panel>, <enderio:item_capacitor_silver>]
	]);

	recipes.remove(<enderio:block_solar_panel:2>);
	recipes.addShaped("ia_eio_solar2", <enderio:block_solar_panel:2>, [
		[<moreplates:pulsating_iron_plate>, <moreplates:pulsating_iron_plate>, <moreplates:pulsating_iron_plate>], 
		[<enderio:item_material:3>, <moreplates:vibrant_alloy_plate>, <enderio:item_material:3>], 
		[<enderio:item_capacitor_energetic_silver>, <enderio:block_solar_panel:1>, <enderio:item_capacitor_energetic_silver>]
	]);

	recipes.remove(<enderio:block_solar_panel:3>);
	recipes.addShaped("ia_eio_solar3", <enderio:block_solar_panel:3>, [
		[<enderio:item_material:3>, <contenttweaker:super_vibrant_plate>, <enderio:item_material:3>], 
		[<enderio:block_solar_panel>, <enderio:block_solar_panel>, <enderio:block_solar_panel>], 
		[<enderio:item_capacitor_vivid>, <enderio:block_solar_panel:2>, <enderio:item_capacitor_vivid>]
	]);
}




{//balls
	var balls as int[IItemStack] = {
		<enderio:item_alloy_ball>: 40000,
		<enderio:item_alloy_ball:1>: 80000,
		<enderio:item_alloy_ball:2>: 80000,
		<enderio:item_alloy_ball:3>: 30000,
		<enderio:item_alloy_ball:4>: 40000,
		<enderio:item_alloy_ball:5>: 100000,
		<enderio:item_alloy_ball:6>: 125000,
		<enderio:item_alloy_ball:7>: 80000,
		<enderio:item_alloy_ball:8>: 75000,
		<enderio:item_material:57>: 100000,
		<enderio:item_material:58>: 120000,
		<enderio:item_material:59>: 100000,
		<enderio:item_alloy_endergy_ball:1>: 80000,
		<enderio:item_alloy_endergy_ball:2>: 80000,
		<enderio:item_alloy_endergy_ball:3>: 160000,
		<enderio:item_alloy_endergy_ball:4>: 80000,
		<enderio:item_alloy_endergy_ball:5>: 80000,
		<enderio:item_alloy_endergy_ball:6>: 80000,

		<contenttweaker:wear_resistant_alloy_ball>: 150000
		
	};
	for ball in balls{
		ball.addTooltip("Durability in SAG mill: " ~ balls[ball] ~ " rf");
	}
}

recipes.remove(<enderio:item_material:6>);
recipes.addShaped("ia_wing", <enderio:item_material:6>, [
	[null, <contenttweaker:superglue>, <enderio:item_alloy_ingot:6>], 
	[<contenttweaker:superglue>, <enderio:item_alloy_ingot:6>, <minecraft:leather>], 
	[<enderio:item_alloy_ingot:6>, <minecraft:leather>, <minecraft:leather>]
]);
recipes.remove(<enderio:item_material:7>);
recipes.addShaped("ia_wings", <enderio:item_material:7>, [
	[null, <moreplates:dark_steel_plate>, null], 
	[<enderio:item_material:6>, <contenttweaker:gearbox_good>, <enderio:item_material:6>]
]);



AlloySmelter.removeRecipe(<enderio:item_dark_steel_upgrade>);
scripts.content_machines.addFluidAlloyerRecipe(<enderio:item_dark_steel_upgrade>, 
	<mekanism:energyupgrade> * 8, <moreplates:dark_steel_plate> * 4, <liquid:circuit> * 500, 
	200, 1000
);