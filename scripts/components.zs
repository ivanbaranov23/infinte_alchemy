import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeBuilder;

{//aa coils
	recipes.addShapeless("ia_coil_core1_1", <contenttweaker:coil_core1> * 2, [<contenttweaker:black_bronze_rod>, <contenttweaker:tunril_rod>, <moreplates:lumium_stick>, <thermalfoundation:material:515>, <immersiveengineering:wirecoil:2>, <contenttweaker:platinum_wire>]);
	recipes.addShapeless("ia_coil_core1_2", <contenttweaker:coil_core1> * 3, [<contenttweaker:black_bronze_rod>, <contenttweaker:tunril_rod>, <moreplates:lumium_stick>, <thermalfoundation:material:515>, <immersiveengineering:wirecoil:2>, <contenttweaker:platinum_wire>, <contenttweaker:insulation_strand>]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:coil_core1> * 4], [
			<contenttweaker:black_bronze_rod>, <contenttweaker:tunril_rod>, <moreplates:lumium_stick>, 
			<thermalfoundation:material:515>, 
			<contenttweaker:platinum_wire>, 
			<contenttweaker:insulation_strand> * 2
		], <liquid:steel> * (144 * 6),
		40, 256
	);


	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:coil_core2>, 
		<contenttweaker:coil_core1>, <taiga:eezo_ingot> * 4, 
		<liquid:electrotine> * 1000, 
		40, 128
	);
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:coil_core2>, 
		<contenttweaker:coil_core1>, <contenttweaker:tinezo_ingot> * 4, 
		<liquid:electrotine> * 1000, 
		40, 128
	);
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:coil_core2> * 2, 
		<contenttweaker:coil_core1>, <projectred-core:resource_item:400> | <projectred-core:resource_item:401> | <projectred-core:resource_item:402>, 
		<liquid:electrotine> * 1500, 
		40, 128
	);

	

	recipes.remove(<actuallyadditions:item_misc:7>);
	recipes.addShaped("ia_aa_coil1", <actuallyadditions:item_misc:7> * 2, [
		[null, <actuallyadditions:item_crystal:5>, <prodigytech:heat_capacitor_0>], 
		[<actuallyadditions:item_crystal:5>, <contenttweaker:coil_core2>, <actuallyadditions:item_crystal:5>], 
		[<prodigytech:heat_capacitor_0>, <actuallyadditions:item_crystal:5>, null]
	]);
	recipes.addShaped("ia_aa_coil1gall", <actuallyadditions:item_misc:7> * 3, [
		[<contenttweaker:gallium_sheet>, <actuallyadditions:item_crystal:5>, <prodigytech:heat_capacitor_0>], 
		[<actuallyadditions:item_crystal:5>, <contenttweaker:coil_core2>, <actuallyadditions:item_crystal:5>], 
		[<prodigytech:heat_capacitor_0>, <actuallyadditions:item_crystal:5>, <contenttweaker:gallium_sheet>]
	]);
	<actuallyadditions:item_misc:7>.displayName = "Basic Laser Coil";
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_misc:7> * 4],
		[
			<prodigytech:heat_capacitor_1>,
			<contenttweaker:coil_core2>,
			<actuallyadditions:item_crystal:5> * 4,
			<contenttweaker:gallium_sheet>
		], null,
		20, 500
	);


	recipes.remove(<actuallyadditions:item_misc:8>);
	recipes.addShaped("ia_aa_coil2", <actuallyadditions:item_misc:8>, [
		[<appliedenergistics2:material:22>, <contenttweaker:egoold>, <contenttweaker:titanium_gear>], 
		[<contenttweaker:egoold>, <actuallyadditions:item_misc:7>, <contenttweaker:egoold>], 
		[<contenttweaker:titanium_gear>, <contenttweaker:egoold>, <appliedenergistics2:material:22>]
	]);
	<actuallyadditions:item_misc:8>.displayName = "Advanced Laser Coil";
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_misc:8> * 2],
		[
			<actuallyadditions:item_misc:7>,
			<appliedenergistics2:material:22> * 2,
			<contenttweaker:egoold> * 4
		], <fluid:titanium> * (144 * 8),
		20, 1000
	);

	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:laser_mirror>, 
		[
			<solarflux:photovoltaic_cell_1>, 
			<contenttweaker:osmiridium_support>, 
			<contenttweaker:tunril_plate>
		], 100000
	);
	recipes.addShapeless("ia_laser_mirror", <contenttweaker:laser_mirror>, [<solarflux:photovoltaic_cell_1>, <contenttweaker:osmiridium_support>, <contenttweaker:tunril_plate>, <contenttweaker:superglue>]);
}


{//circuit like
	//mek circuits
	recipes.remove(<mekanism:controlcircuit:1>);
	recipes.addShaped("ia_mek_circuit1", <mekanism:controlcircuit:1>, [
		[<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>], 
		[<ore:ingotRedstoneAlloy>, <prodigytech:circuit_refined>, <ore:ingotRedstoneAlloy>], 
		[<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>]
	]);
	recipes.remove(<mekanism:controlcircuit:2>);
	recipes.addShaped("ia_mek_circuit2", <mekanism:controlcircuit:2>, [
		[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>], 
		[<prodigytech:energion_dust>, <immersiveengineering:material:27>, <prodigytech:energion_dust>], 
		[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>]
	]);
	recipes.remove(<mekanism:controlcircuit:3>);
	recipes.addShaped("ia_mek_circuit3", <mekanism:controlcircuit:3>, [
		[<ore:alloyUltimate>, <ore:circuitElite>, <ore:alloyUltimate>], 
		[<ore:slimecrystalPink>, <contenttweaker:advanced_circuit_plate>, <ore:slimecrystalPink>], 
		[<ore:alloyUltimate>, <ore:circuitElite>, <ore:alloyUltimate>]
	]);

	//adv circuit plate
	scripts.helper.addFluidAlloyerRecipe(
		<contenttweaker:fine_wooden_board> * 8,
		<moreplates:ironwood_plate>, <roots:terra_moss> * 5, 
		<liquid:tree_oil> * 1000,
		128, 20
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:soggy_wooden_board>, 
		<contenttweaker:fine_wooden_board>, 
		<liquid:formic_acid> * 2000, 10000
	);
	recipes.addShaped("ia_wired_wooden_board", <contenttweaker:wired_wooden_board>, [
		[null, <contenttweaker:fluix_steel_wire>, null], 
		[<contenttweaker:gold_wire>, <contenttweaker:soggy_wooden_board>, <contenttweaker:zinc_wire>], 
		[null, <tconstruct:materials:10>, null]
	]);
	recipes.addShaped("ia_advanced_circuit_plate_base", <contenttweaker:advanced_circuit_plate_base>, [
		[null, <prodigytech:circuit_plate>, null], 
		[<appliedenergistics2:material:23>, <contenttweaker:wired_wooden_board>, <appliedenergistics2:material:23>], 
		[null, <ore:itemRubber>, null]
	]);
	mods.mekanism.compressor.addRecipe(
		<contenttweaker:advanced_circuit_plate_base>,
		<gas:sulfuricacid> * 50, 
		<contenttweaker:advanced_circuit_plate>
	);
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:advanced_circuit_plate> * 3,
		<contenttweaker:advanced_circuit_plate_base> * 2, <contenttweaker:gallium_sheet>,
		<liquid:sulfuricacid> * 500,
		500, 10
	);

	mods.thermalexpansion.Compactor.addStorageRecipe(<contenttweaker:gallium_sheet>, <contenttweaker:gallium_ingot>, 5000);

	mods.thermalexpansion.Crucible.addRecipe(
		<liquid:circuit> * 250, <quantumflux:craftingpiece:5>, 10000
	);

	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:bloody_circuit>], null,
		[
			<contenttweaker:neuro_crystal2> * 4,
			<contenttweaker:platinum_wire> * 32,
			<contenttweaker:conductive_alloy_wire> * 12,
			<projectred-core:resource_item:320> * 32
		], [
			<liquid:bound_metal> * (144 * 8),
			<liquid:circuit> * 1000
		], <contenttweaker:laser>,
		20, 10000
	);
}


{//tanks
	recipes.addShaped("ia_tank_component", <contenttweaker:tank>, [
		[null, <contenttweaker:watertight_steel_rod>, null], 
		[<contenttweaker:mekanized_steel_plate>, <liquid:tar> * 1000, <contenttweaker:mekanized_steel_plate>], 
		[null, <contenttweaker:rotor_blades>, null]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:tank> * 2], 
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:watertight_steel_rod>, <contenttweaker:rotor_blades>], 
		<liquid:tar> * 500, 
		10, 64
	);

	recipes.addShaped("ia_tank_array", <contenttweaker:tank2>, [
		[null, <contenttweaker:tank>, <immersiveengineering:material:9>], 
		[<contenttweaker:tank>, <thermalfoundation:material:512>, <contenttweaker:tank>], 
		[<immersiveengineering:material:9>, <contenttweaker:tank>, null]
	]);

	//cooling system
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:pump> * 2],
		[
			<contenttweaker:rotor_blades> * 2,
			<projectred-core:resource_item:410> * 2,
			<contenttweaker:fluid_processor> * 3,
			<immersiveengineering:metal_device0:5>
		],
		<liquid:watertight_steel> * (6 * 144), 20, 256
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:cooling_system>],
		[
			<contenttweaker:pump> * 2,
			<contenttweaker:tank2>,
			<enderio:item_basic_capacitor:2> | <enderio:item_capacitor_vivid>,
			<bloodmagic:component:32>,
			<contenttweaker:potion_processor>
		],
		<liquid:cold_nitrogen> * 1000, 20, 256
	);

	recipes.addShaped("ia_crucible", <contenttweaker:crucible>, [
		[<contenttweaker:high_heat_glass>, <exnihilocreatio:block_crucible:1>, <contenttweaker:high_heat_glass>], 
		[<contenttweaker:high_heat_glass>, <enderio:block_tank:1>, <contenttweaker:high_heat_glass>], 
		[<contenttweaker:tungsten_plate>, <contenttweaker:chrome_block>, <contenttweaker:tungsten_plate>]
	]);

	//pressure cutter
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:pressure_cutter>],
		[
			<contenttweaker:pump> * 8,
			<contenttweaker:tank2>,
			<contenttweaker:potion_processor> * 2,
			<contenttweaker:tignalum_plate> * 3,
			<mekanism:machineblock2:7>
		],
		<liquid:watertight_steel> * (144 * 8), 20, 256
	);
}


{//quantum flux
	recipes.remove(<quantumflux:craftingpiece:5>);
	recipes.addShaped("ia_advanced_circuit", <quantumflux:craftingpiece:5>, [
		[<ore:circuitUltimate>, <prodigytech:circuit_perfected>, <ore:circuitUltimate>], 
		[<appliedenergistics2:material:24>, <quantumflux:craftingpiece:3>, <appliedenergistics2:material:24>], 
		[<ore:circuitUltimate>, <prodigytech:circuit_perfected>, <ore:circuitUltimate>]
	]);

	recipes.remove(<quantumflux:craftingpiece>);
	recipes.addShaped("ia_quibit", <quantumflux:craftingpiece>, [
		[<actuallyadditions:item_crystal_empowered:4>, <immersiveengineering:connector:5>, <actuallyadditions:item_crystal_empowered:4>], 
		[<contenttweaker:ecoppra>, <immersiveengineering:connector:5>, <contenttweaker:ecoppra>], 
		[<moreplates:signalum_stick>, <actuallyadditions:item_misc:8>, <moreplates:signalum_stick>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<quantumflux:craftingpiece> * 2],
		[
			<actuallyadditions:item_crystal_empowered:4> * 2,
			<contenttweaker:ecoppra> * 2,
			<immersiveengineering:connector:5> * 4,
			<moreplates:signalum_stick> * 2, 
			<actuallyadditions:item_misc:8>
		], null,
		20, 256
	);

	recipes.remove(<quantumflux:craftingpiece:2>);
	recipes.addShaped("ia_amplification_catalyst", <quantumflux:craftingpiece:2>, [
		[null, <contenttweaker:gold_crystal>, <contenttweaker:gold_crystal>], 
		[<ore:stickGold>, <actuallyadditions:item_misc:8>, <ore:gemCrystalFlux>], 
		[null, <ore:stickGold>, null]
	]);
}

{//flux crystal
	recipes.removeByRecipeName("redstonearsenal:gem_crystal_flux");
	mods.thermalexpansion.Transposer.removeFillRecipe(<minecraft:diamond>, <liquid:redstone>);

	mods.thermalexpansion.Transposer.addFillRecipe(
		<redstonearsenal:material:160>, 
		<projectred-core:resource_item:200>, <liquid:redstone_alloy> * (144), 
		3000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<redstonearsenal:material:160>, 
		<biomesoplenty:gem:1>, <liquid:redstone_alloy> * (144 * 9), 
		8000
	);
}

{//gearboxes and motors
	recipes.addShaped("ia_gearbox_empty", <contenttweaker:gearbox_empty>, [
		[<immersiveengineering:material:2>, <moreplates:cobalt_plate>, <immersiveengineering:material:2>], 
		[<contenttweaker:tungsten_plate>, <thermalfoundation:material:32>, <contenttweaker:tungsten_plate>], 
		[<immersiveengineering:material:2>, <moreplates:cobalt_plate>, <immersiveengineering:material:2>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:gearbox_empty>],
		[
			<moreplates:cobalt_plate>,
			<contenttweaker:tungsten_plate>
		],
		<liquid:steel> * (144 * 6), 10, 64
	);


	recipes.addShapeless("ia_gearbox_normal", <contenttweaker:gearbox_normal> * 2, [
		<contenttweaker:gearbox_empty>, <contenttweaker:gearbox_empty>,
		<contenttweaker:duraluminum_gear>, <contenttweaker:titanium_gear>, <contenttweaker:black_bronze_gear>, <moreplates:knightmetal_gear>, <contenttweaker:mekanical_core>,
		<liquid:lubricant> * 1000
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:gearbox_normal> * 4],
		[
			<contenttweaker:gearbox_empty> * 4,
			<contenttweaker:duraluminum_gear>, <contenttweaker:titanium_gear>, <contenttweaker:black_bronze_gear>, <moreplates:knightmetal_gear>, <contenttweaker:mekanical_core>			
		],
		<liquid:lubricant> * 500, 20, 256
	);


	recipes.addShaped("ia_gearbox_funky", <contenttweaker:gearbox_funky>, [
		[<thermalfoundation:material:295>, <contenttweaker:hot_gear>, <contenttweaker:black_bronze_gear>], 
		[<contenttweaker:soy_gear>, <contenttweaker:gearbox_empty>, <contenttweaker:electric_manyullyn_gear>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:gearbox_funky> * 2],
		[
			<contenttweaker:gearbox_empty> * 2, 
			<thermalfoundation:material:295>, 
			<contenttweaker:hot_gear>, 
			<contenttweaker:black_bronze_gear>, 
			<contenttweaker:soy_gear>, 
			<contenttweaker:electric_manyullyn_gear>
		],
		null, 10, 128
	);


	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:imperomite_catalyst_dust>],
		[<liquid:mekanized_lubricant> * 400],
		[
			<contenttweaker:imperomite_catalyst>,
			<minecraft:dragon_breath> * 2,
			(<enderio:item_material:51> | <enderio:item_material:52>) * 12,
			<taiga:seismum_dust> * 2
		], [
			<liquid:lubricant> * 1500,
			<liquid:mekanization_catalyst> * 1000,
			<liquid:polyethylene> * 1000
		], 10, 1000
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:imperomite_catalyst_dust>],
		[<liquid:mekanized_lubricant> * 400],
		[
			<contenttweaker:imperomite_catalyst>,
			(<enderio:item_material:51> | <enderio:item_material:52>) * 12,
			<taiga:seismum_dust> * 2
		], [
			<liquid:lubricant> * 1500,
			<liquid:mekanization_catalyst> * 1000,
			<liquid:polyethylene> * 1000,
			<liquid:noble_gases> * 250
		], 10, 1000
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:imperomite_catalyst_dust>],
		[<liquid:mekanized_lubricant> * 400],
		[
			<contenttweaker:imperomite_catalyst>,
			(<enderio:item_material:51> | <enderio:item_material:52>) * 12,
			<taiga:seismum_dust> * 2
		], [
			<liquid:lubricant> * 1500,
			<liquid:mekanization_catalyst> * 1000,
			<liquid:polyethylene> * 1000,
			<liquid:dragon_spit> * 500
		], 10, 1000
	);
	
	/*recipes.addShaped("ia_gearbox_good", <contenttweaker:gearbox_good>, [
		[<contenttweaker:gearbox_normal>, <contenttweaker:gearbox_normal>, <projectred-core:resource_item:410>], 
		[<contenttweaker:palladium_gear>, <enderio:item_material:73>, <moreplates:melodic_alloy_gear>], 
		[<contenttweaker:neodymium_rod>, <liquid:mekanized_lubricant> * 2000, null]
	]);*/
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:gearbox_good>], 
		[
			<contenttweaker:gearbox_normal> * 2,
			<contenttweaker:palladium_gear> * 3,
			<projectred-core:resource_item:410>,
			<enderio:item_material:73>, 
			<moreplates:melodic_alloy_gear>
		], <liquid:mekanized_lubricant> * 1500,
		20, 1000
	);


	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:living_motor>], null,
		[
			<projectred-core:resource_item:410> * 3,
			<contenttweaker:gearbox_good>,
			<contenttweaker:arkenium_gear> * 2,
			<contenttweaker:neodymium_rod> * 6,
			<contenttweaker:living_steel_ingot> * 4,
			<contenttweaker:muscle> * 6
		], [
			<liquid:mekanized_lubricant> * 1000,
			<liquid:bound_metal> * 576
		], <contenttweaker:bio_injector>,
		20, 4000
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:rotor>], 
		[
			<contenttweaker:crystal_metal_plate> * 4,
			<contenttweaker:living_motor>,
			<contenttweaker:ev_coil> * 4,
			<contenttweaker:tablet_evil>,
			<requious:advanced_mixer>,
			<bloodmagic:demon_extras:13> * 2
		], <liquid:watertight_steel> * 1500,
		20, 10000
	);


	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:gearbox_great>], null,
		[
			<contenttweaker:living_motor> * 2,
			<contenttweaker:conductive_alloy_gear> * 3,
			<contenttweaker:vibralcum_gear> * 3,
			<moreplates:manasteel_gear> * 3,
			<tconevo:metal:44> * 3,
			<contenttweaker:nitinol_rod> * 2
		], [
			<liquid:mirion2> * 576,
			<liquid:circuit> * 400
		], <contenttweaker:bio_injector>,
		20, 4000
	);
}

scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:nuke>], 
	[
		<contenttweaker:rtg> * 3,
		<contenttweaker:irradiated_compound> * 64,
		<contenttweaker:neutronium_mirror> * 24,
		<contenttweaker:secure_switch>
	], null,
	20, 10000
);

{//grinding wheel
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:porous_dust> * 2,
		<actuallyadditions:item_crystal:2>, <contenttweaker:gravel_wool>,
		<liquid:naphthalene> * 1000,
		500, 20
	);
	recipes.addShaped(0, <contenttweaker:grinding_wheel>, [
		[<contenttweaker:porous_dust>, <contenttweaker:porous_dust>, <contenttweaker:porous_dust>], 
		[<contenttweaker:porous_dust>, <contenttweaker:arkenium_gear>, <contenttweaker:porous_dust>], 
		[<contenttweaker:porous_dust>, <contenttweaker:porous_dust>, <contenttweaker:porous_dust>]
	]);
}

mods.actuallyadditions.Empowerer.addRecipe(
	<contenttweaker:compact_empowerer>, <actuallyadditions:block_empowerer>, 
	<actuallyadditions:block_display_stand>,
	<actuallyadditions:block_display_stand>,
	<actuallyadditions:block_display_stand>,
	<actuallyadditions:block_display_stand>,
	40000, 40,
	[1.0, 1.0, 1.0]
);


{//EIO
	{//neuro_crystal
		mods.enderio.SliceNSplice.addRecipe(<contenttweaker:neuro_crystal> * 2, 
			[
				<contenttweaker:neuron_inlay>, <enderio:item_material:18>, <contenttweaker:neuron_inlay>, 
				<quantumflux:craftingpiece:2>, <enderio:item_material:41> | <enderio:item_material:45>, <quantumflux:craftingpiece:2>
			], 10000
		);

		mods.enderio.SliceNSplice.addRecipe(<contenttweaker:neuro_crystal> * 8, 
			[
				<contenttweaker:neuron2_inlay>, <enderio:item_material:18>, <contenttweaker:neuron2_inlay>, 
				<quantumflux:craftingpiece:2>, <enderio:item_material:41> | <enderio:item_material:45>, <quantumflux:craftingpiece:2>
			], 10000
		);

		mods.enderio.SliceNSplice.addRecipe(<contenttweaker:neuro_crystal2> * 2, 
			[
				<contenttweaker:blood_gem>, <contenttweaker:neuron2_inlay>, <contenttweaker:blood_gem>, 
				<contenttweaker:chitin>, <enderio:item_capacitor_crystalline>, <contenttweaker:chitin>
			], 50000
		);
	}

	{//capacitors
		recipes.remove(<enderio:item_capacitor_grainy>);
		recipes.addShaped("ia_cheap_capacitor", <enderio:item_capacitor_grainy>, [
			[null, <ore:ingotHOPGraphite>, null], 
			[<ore:dustBedrock>, <ore:ingotHOPGraphite>, <ore:dustBedrock>], 
			[<ore:stickSteel>, null, <ore:stickSteel>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_grainy> * 2],
			[
				<ore:dustBedrock> * 3,
				<ore:ingotHOPGraphite> * 2
			], <fluid:steel> * 576, 10, 256
		);

		recipes.remove(<enderio:item_basic_capacitor>);
		recipes.addShaped("ia_eio_capacitor_1l", <enderio:item_basic_capacitor>, [
			[<ore:ingotEezo>, <contenttweaker:ecoppra>, <ore:ingotEezo>], 
			[<ore:ingotEezo>, <contenttweaker:ecoppra>, <ore:ingotEezo>], 
			[<ore:stickIridium>, <actuallyadditions:item_misc:7>, <ore:stickIridium>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_basic_capacitor> * 2],
			[
				<contenttweaker:ecoppra> * 2,
				<ore:stickIridium>,
				<ore:ingotEezo> * 3,
				<actuallyadditions:item_misc:7>
			],
			null, 10, 256
		);

		recipes.remove(<enderio:item_basic_capacitor:1>);
		recipes.addShaped("ia_eio_capacitor_2l", <enderio:item_basic_capacitor:1>, [
			[null, <moreplates:energetic_alloy_plate>, null], 
			[<enderio:item_material:71>, <mekanism:controlcircuit:3>, <enderio:item_material:71>], 
			[<enderio:item_basic_capacitor>, <enderio:item_capacitor_grainy>, <enderio:item_basic_capacitor>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_basic_capacitor:1> * 2],
			[
				<enderio:item_basic_capacitor> * 3,
				<enderio:item_capacitor_grainy>,
				<mekanism:controlcircuit:3>,
				<moreplates:energetic_alloy_plate>,
				<enderio:item_material:71>
			],
			null, 10, 384
		);

		recipes.remove(<enderio:item_basic_capacitor:2>);
		recipes.addShaped("ia_eio_capacitor_3l", <enderio:item_basic_capacitor:2>, [
			[null, <moreplates:vibrant_alloy_plate>, null], 
			[<enderio:item_material:71>, <quantumflux:craftingpiece>, <enderio:item_material:71>], 
			[<enderio:item_basic_capacitor:1>, <enderio:item_capacitor_grainy>, <enderio:item_basic_capacitor:1>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_basic_capacitor:2> * 2],
			[
				<enderio:item_basic_capacitor:1> * 3,
				<enderio:item_capacitor_grainy>,
				<quantumflux:craftingpiece>,
				<moreplates:vibrant_alloy_plate>,
				<enderio:item_material:71>
			],
			null, 10, 512
		);


		recipes.remove(<enderio:item_capacitor_silver>);
		recipes.addShaped("ia_eio_capacitor_1r", <enderio:item_capacitor_silver>, [
			[<ore:ingotEezo>, <contenttweaker:enittin>, <ore:ingotEezo>], 
			[<ore:ingotEezo>, <contenttweaker:enittin>, <ore:ingotEezo>], 
			[<ore:stickIridium>, <actuallyadditions:item_misc:7>, <ore:stickIridium>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_silver> * 2],
			[
				<contenttweaker:enittin> * 2,
				<ore:stickIridium>,
				<ore:ingotEezo> * 3,
				<actuallyadditions:item_misc:7>
			],
			null, 10, 256
		);

		recipes.remove(<enderio:item_capacitor_energetic_silver>);
		recipes.addShaped("ia_eio_capacitor_2r", <enderio:item_capacitor_energetic_silver>, [
			[null, <moreplates:energetic_silver_plate>, null], 
			[<enderio:item_material:71>, <mekanism:controlcircuit:3>, <enderio:item_material:71>], 
			[<enderio:item_capacitor_silver>, <enderio:item_capacitor_grainy>, <enderio:item_capacitor_silver>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_energetic_silver> * 2],
			[
				<enderio:item_capacitor_silver> * 3,
				<enderio:item_capacitor_grainy>,
				<mekanism:controlcircuit:3>,
				<moreplates:energetic_silver_plate>,
				<enderio:item_material:71>
			],
			null, 10, 384
		);

		recipes.remove(<enderio:item_capacitor_vivid>);
		recipes.addShaped("ia_eio_capacitor_3r", <enderio:item_capacitor_vivid>, [
			[null, <moreplates:vivid_alloy_plate>, null], 
			[<enderio:item_material:71>, <quantumflux:craftingpiece>, <enderio:item_material:71>], 
			[<enderio:item_capacitor_energetic_silver>, <enderio:item_capacitor_grainy>, <enderio:item_capacitor_energetic_silver>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_vivid> * 2],
			[
				<enderio:item_capacitor_energetic_silver> * 3,
				<enderio:item_capacitor_grainy>,
				<quantumflux:craftingpiece>,
				<moreplates:vivid_alloy_plate>,
				<enderio:item_material:71>
			],
			null, 10, 512
		);

		recipes.remove(<enderio:item_capacitor_crystalline>);
		recipes.addShaped("ia_eio_capacitor_4", <enderio:item_capacitor_crystalline> * 2, [
			[<enderio:item_alloy_endergy_ingot:1>, <contenttweaker:mana_focus>, <enderio:item_alloy_endergy_ingot:1>], 
			[<enderio:item_basic_capacitor:2>, <contenttweaker:neuro_crystal>, <enderio:item_basic_capacitor:2>], 
			[<enderio:item_capacitor_vivid>, <quantumflux:craftingpiece:5>, <enderio:item_capacitor_vivid>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_crystalline> * 3],
			[
				<enderio:item_basic_capacitor:2> * 2,
				<enderio:item_capacitor_vivid> * 2,
				<contenttweaker:mana_focus>,
				<contenttweaker:neuro_crystal>,
				<quantumflux:craftingpiece:5>
			],
			<liquid:crystalline_alloy> * 144, 20, 1024
		);

		recipes.remove(<enderio:item_capacitor_melodic>);
		recipes.addShaped("ia_eio_capacitor_5", <enderio:item_capacitor_melodic>, [
			[<contenttweaker:potion_processor>, <moreplates:melodic_alloy_gear>, <contenttweaker:potion_processor>], 
			[<moreplates:end_steel_plate>, <contenttweaker:lightning_cell>, <moreplates:end_steel_plate>], 
			[<enderio:item_capacitor_crystalline>, <moreplates:melodic_alloy_gear>, <enderio:item_capacitor_crystalline>]
		]);
	}
	//enderman
	mods.enderio.SliceNSplice.removeRecipe(<enderio:block_enderman_skull:2>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:block_enderman_skull:2>, 
		[
			<contenttweaker:wear_resistant_alloy_rod>, <enderio:block_enderman_skull>, <contenttweaker:wear_resistant_alloy_rod>, 
			<contenttweaker:watertight_steel_rod>, <cookingforblockheads:sink>, <contenttweaker:watertight_steel_rod>
		], 10000
	);
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:43>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:43>, 
		[
			<contenttweaker:fluxed_rod>, <enderio:block_enderman_skull:2>, <contenttweaker:fluxed_rod>, 
			<contenttweaker:osgloridium_rod>, <quantumflux:craftingpiece:5>, <contenttweaker:osgloridium_rod>
		], 30000, 0
	);
	//creeper
	mods.enderio.SliceNSplice.addRecipe(<contenttweaker:creeper_component>, 
		[
			<contenttweaker:electric_manyullyn_rod>, <minecraft:skull:4>, <contenttweaker:electric_manyullyn_rod>,
			<contenttweaker:thermal_rod>, <mekanism:controlcircuit:3>, <contenttweaker:thermal_rod>
		], 30000, 0
	);

	//zombie
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:41>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:41>, 
		[
			<moreplates:soularium_plate>, <minecraft:skull:2>, <moreplates:soularium_plate>, 
			<projectred-core:resource_item:20>, <enderio:item_capacitor_silver> | <enderio:item_basic_capacitor>, <projectred-core:resource_item:20>
		], 20000, 0
	);
	//skeleton
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:45>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:45>, 
		[
			<moreplates:soularium_plate>, <minecraft:skull:0>, <moreplates:soularium_plate>, 
			<projectred-core:resource_item:21>, <enderio:item_capacitor_silver> | <enderio:item_basic_capacitor>, <projectred-core:resource_item:21>
		], 20000, 0
	);
	//guardian
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:56>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:56>,
		[
			<quark:elder_sea_lantern>, <exnihilocreatio:item_doll:3>, <quark:elder_sea_lantern>,
			<enderio:item_alloy_endergy_ingot:6>, <contenttweaker:guarding_crystal>, <enderio:item_alloy_endergy_ingot:6>
		], 20000, 0
	);


	{//soul codex
		<contenttweaker:soul_codex1>.addTooltip("An empty board for advanced soul manipulation");
		recipes.addShaped("soul_codex", <contenttweaker:soul_codex1>, [
			[<contenttweaker:mana_focus>, <moreplates:soularium_gear>, <moreplates:soularium_gear>], 
			[<moreplates:soularium_gear>, <enderio:item_material:73>, <moreplates:soularium_gear>], 
			[<moreplates:soularium_gear>, <moreplates:soularium_gear>, <contenttweaker:mana_focus>]
		]);
		
		//2 1
		<contenttweaker:soul_codex2>.addTooltip("A soul of powerful fiend");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex2>, <contenttweaker:soul_codex1>, 
			["illagers_plus:necromancer", "minecraft:illusion_illager", "minecraft:evocation_illager", "primitivemobs:trollager", "illagers_plus:enchanter"], 50000, 12
		);
		<contenttweaker:soul_codex3>.addTooltip("A soul of a large insect (or centipede)");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex3>, <contenttweaker:soul_codex2>, 
			[
				"erebus:erebus.bombardier_beetle",
				"erebus:erebus.centipede",
				"erebus:erebus.dragon_fly",
				"erebus:erebus.grasshopper",
				"erebus:erebus.locust",
				"erebus:erebus.mosquito",
				"erebus:erebus.pond_skater",
				"erebus:erebus.praying_mantis",
				"erebus:erebus.rhino_beetle",
				"erebus:erebus.stag_beetle",
				"erebus:erebus.titan_beetle"
			], 50000, 12
		);
		<contenttweaker:soul_codex4>.addTooltip("A soul of an ancient undead");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex4>, <contenttweaker:soul_codex3>, 
			[
				"atum:bonestorm",
				"atum:forsaken",
				"atum:mummy",
				"atum:wraith"
			], 50000, 12
		);
		<contenttweaker:soul_codex5>.addTooltip("A soul of blazing hot creature from the underworld");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex5>, <contenttweaker:soul_codex4>, 
			[
				"minecraft:blaze",
				"minecraft:magma_cube",
				"primitivemobs:blazing_juggernaut",
				"quark:foxhound",
				"realmrpg_wyrms:red_wyrm"
			], 50000, 12
		);
		<contenttweaker:soul_codex6>.addTooltip("A soul of [TODO twilightforest thing desciption]");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex6>, <contenttweaker:soul_codex5>, 
			[
				"twilightforest:armored_giant",
				"twilightforest:death_tome",
				"twilightforest:slime_beetle",
				"twilightforest:giant_miner",
				"twilightforest:helmet_crab",
				"twilightforest:maze_slime",
				"twilightforest:minotaur",
				"twilightforest:skeleton_druid",
				"twilightforest:tower_golem",
				"twilightforest:troll",
				"twilightforest:yeti"
			], 50000, 12
		);
		<contenttweaker:soul_codex7>.addTooltip("A soul from the forgotten paradise");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex7>, <contenttweaker:soul_codex6>, 
			["aether_legacy:swet", "aether_legacy:zephyr", "aether_legacy:aechor_plant"], 50000, 12
		);
		<contenttweaker:soul_codex8>.addTooltip("A soul of a creature waiting for you at the End(dimension)");
		mods.enderio.SoulBinder.addRecipe(
			<contenttweaker:soul_codex8>, <contenttweaker:soul_codex7>, 
			[
				"minecraft:enderman",
				"minecraft:shulker",
				"realmrpg_wyrms:ender_wyrm"
			], 50000, 12
		);
	}

	recipes.addShaped("eio_slab", <contenttweaker:eio_slab>, [
		[<enderio:item_material:68>, <contenttweaker:gearbox_good>, <enderio:item_material:68>], 
		[<contenttweaker:power_tap>, <enderio:item_material:18>, <contenttweaker:power_tap>], 
		[<enderio:item_material:68>, null, <enderio:item_material:68>]
	]);
}

{//electrostatic wool
	scripts.helper.addFluidAlloyerRecipe(
		<contenttweaker:electric_wool> * 4, 
		<mekanism:otherdust> * 6, <immersiveengineering:material:22> * 4, <liquid:cloud_seed_concentrated> * 1000, 
		512, 20
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:electric_wool2_base> * 4], [],
		[
			<contenttweaker:gravel_wool> * 16,
			<contenttweaker:rare_earth_dust> * 6,
			<contenttweaker:nickel_oxide> * 8,
			<contenttweaker:conductive_alloy_wire> * 3
		], [
			<liquid:biotite> * 1000,
			<liquid:ender_distillation> * 500,
			<liquid:electrical_steel> * 288,
			<liquid:chloroauric_acid> * 1000
		],
		40, 1000
	);
	mods.botania.RuneAltar.addRecipe(<contenttweaker:electric_wool2> * 3, [
		<contenttweaker:electric_wool2_base>,
		<contenttweaker:electric_wool2_base>,
		<contenttweaker:electric_wool2_base>,
		<contenttweaker:electric_wool>,
		<contenttweaker:electric_wool>,
		<contenttweaker:electric_wool>,
		<contenttweaker:electric_wool>,

		<extendedcrafting:singularity_custom:28>,
		<extendedcrafting:singularity:27>,
		<contenttweaker:mana_dust_singularity>,
		
		<contenttweaker:indium_dust>,
		<contenttweaker:indium_dust>,
		
		<mysticalworld:amethyst_gem>,
		<mysticalworld:amethyst_gem>,
		<botania:rune:3>
	], 25000);

}
{//ev coils
	recipes.addShaped("ia_insulated_rod", <contenttweaker:insulated_rod>, [
		[<contenttweaker:insulation_fabric>, <contenttweaker:electric_manyullyn_rod>, <contenttweaker:insulation_fabric>]
	]);
	recipes.addShaped("ia_electromagnet_core", <contenttweaker:electromagnet_core>, [
		[<contenttweaker:tungsten_coil>, <contenttweaker:insulated_rod>, <contenttweaker:tungsten_coil>], 
		[<contenttweaker:insulated_rod>, <contenttweaker:coil_core2>, <contenttweaker:insulated_rod>], 
		[<contenttweaker:tungsten_coil>, <contenttweaker:insulated_rod>, <contenttweaker:tungsten_coil>]
	]);
	/*scripts.helper.addAssemblerRecipe(
		<contenttweaker:electromagnet_core>,
		<contenttweaker:insulation_fabric>, <contenttweaker:tungsten_coil> * 2, <contenttweaker:insulated_rod>, null,
		4096, 20
	);*/

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:ev_coil>],
		[
			<contenttweaker:electromagnet_core>,
			<projectred-core:resource_item:342> * 6,
			<contenttweaker:electric_wool> * 4,
			<contenttweaker:arkenium_plate>
		],
		null,
		30, 256
	);
}
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:medical_alloy_coil>, 
    [
        <contenttweaker:medical_alloy_wire> * 16,
        <contenttweaker:osmiridium_rod> * 2,
        <simplyjetpacks:metaitemmods:12> * 4
    ]
);



mods.mekanism.reaction.addRecipe(
    <moreplates:refined_glowstone_plate> * 4, <liquid:vibrant_alloy> * (144 * 8), <gas:neutron_active> * 200, 
    <contenttweaker:super_vibrant_plate>, <gas:waste_gas> * 50, 1600, 160
);
{//mana wire
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<immersiveengineering:material:21>, 
		<liquid:mana> * 1000, 8000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<immersiveengineering:material:23>, 
		<liquid:mana> * 950, 8000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<contenttweaker:fluix_steel_wire>, 
		<liquid:mana> * 900, 10000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<contenttweaker:tungsten_wire>, 
		<liquid:mana> * 800, 10000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<contenttweaker:platinum_wire>, 
		<liquid:mana> * 850, 10000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<contenttweaker:gold_wire>, 
		<liquid:mana> * 1000, 10000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:mana_wire>, 
		<contenttweaker:medical_alloy_wire>, 
		<liquid:mana> * 750, 10000
	);
	
	mods.actuallyadditions.Empowerer.addRecipe(
		<contenttweaker:mana_focus>, <contenttweaker:amethyst_ingot>, 
		<quantumflux:craftingpiece:2>,
		<contenttweaker:mana_wire>,
		<quantumflux:craftingpiece:6>,
		<thermalfoundation:storage_alloy:6>,
		40000, 40,
		[1.0, 1.0, 1.0]
	);
}


{//mirrors
    mods.thermalexpansion.Compactor.addStorageRecipe(<contenttweaker:moissanite_plate>, <contenttweaker:moissanite> * 4, 15000);

	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:layered_glass>, 
		[
			<contenttweaker:moissanite_plate>,
			<contenttweaker:delicate_amber>,
			<appliedenergistics2:quartz_glass> * 6
		], 50000
	);

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:perfect_mirror>],
		[
			<contenttweaker:layered_glass> * 16,
			<contenttweaker:glass_cloth> * 16,
			<engineersdecor:panzerglass_block> * 4,
			<contenttweaker:neutronium_mirror> * 2
		], <liquid:sunnarium> * 1000,
		20, 4000
	);

	recipes.addShaped("ia_perfect_mirror_array", <contenttweaker:perfect_mirror_array>, [
		[<contenttweaker:perfect_mirror>, <contenttweaker:perfect_mirror>, <contenttweaker:perfect_mirror>],
		[<contenttweaker:perfect_mirror>, <extrautils2:opinium:8>, <contenttweaker:perfect_mirror>],
		[<contenttweaker:perfect_mirror>, <contenttweaker:flesh_support>,<contenttweaker:perfect_mirror>]
	]);

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:neutronium_mirror> * 3],
		[
			<solarflux:mirror> * 8,
			<quantumflux:graphitedust> * 4,
			<contenttweaker:titanium_plate> * 8,
			<thermalfoundation:material:325> * 8
		], null,
		20, 4000
	);

	{
        var rec = RecipeBuilder.newBuilder("neutronium_mirror2", "explosion_compressor", 30);

        rec.addEnergyPerTickInput(1000000);

        rec.addItemOutput(<contenttweaker:neutronium_mirror2>);
        rec.addItemOutput(<contenttweaker:explosion_device> * 4);

        rec.addItemInput(<contenttweaker:carminium_sheet> * 8);
        rec.addItemInput(<contenttweaker:perfect_mirror_array>);
        rec.addItemInput(<extendedcrafting:singularity:35> * 2);
		rec.addItemInput(<contenttweaker:satellite_plating_base2> * 3);
        rec.addItemInput(<contenttweaker:explosion_device_full> * 4);

        rec.build();
    }
}
{//uv lamp
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:algan> * 2,
		<thermalfoundation:material:132> | <contenttweaker:ferramic_base>, <contenttweaker:gallium_ingot>,
		<liquid:nitrogen> * 1000,
		500, 20
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:uv_lamp>],
		[
			<enderio:item_capacitor_crystalline>,
			<contenttweaker:algan> * 16,
			<immersiveengineering:material:26> * 16,
			<contenttweaker:noble_gases_ingot> * 8,
			<quantumflux:craftingpiece:2> * 4
		], null, 20, 1000
	);
}





{//arms
	recipes.addShaped("ia_robot_arm", <contenttweaker:robot_arm>, [
		[<projectred-core:resource_item:410>, null, null], 
		[<contenttweaker:titanium_rod>, <projectred-core:resource_item:410>, <contenttweaker:titanium_rod>], 
		[<contenttweaker:tungsten_coil>, <contenttweaker:tungsten_coil>, <enderio:item_capacitor_crystalline>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:robot_arm>],
		[
			<enderio:item_capacitor_crystalline>, 
			<contenttweaker:tungsten_coil>, 
			<contenttweaker:titanium_rod>, 
			<projectred-core:resource_item:410>
		],
		null,
		20, 4096
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:bio_injector>],
		[
			<contenttweaker:robot_arm>,
			<thermalinnovation:injector:4>,
			<contenttweaker:medical_alloy_coil> * 2,
			<contenttweaker:conductive_alloy_wire> * 4,
			<bloodmagic:component:30>
		],
		<liquid:hot_spring_water> * 1000,
		20, 4096
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:sewing_unit>],
		[
			<contenttweaker:robot_arm>,
			<contenttweaker:bio_injector>,
			<contenttweaker:gearbox_good> * 2,
			<contenttweaker:bedrockium_alloy_plate> * 3,
			<tconevo:metal:18> * 12,
			<contenttweaker:neuro_crystal> * 8
		],
		null,
		20, 4096
	);
	
}
{//lenses
	
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:lens_out>],
		[
			<contenttweaker:delicate_topaz>,
			<tconstruct:clear_glass> * 8,
			<contenttweaker:glass_fiber> * 2,
			<extrautils2:ineffableglass:2>
		],
		<liquid:tin> * 1000,
		20, 512
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:lens_in>],
		[
			<contenttweaker:delicate_amber>,
			<tconstruct:clear_glass> * 8,
			<contenttweaker:glass_fiber> * 2,
			<extrautils2:ineffableglass:2>
		],
		<liquid:tin> * 1000,
		20, 512
	);

	for i in 0 to 16{
		recipes.removeByRecipeName("industrialforegoing:laser_lens_" ~ i);
	}
	recipes.addShaped("ia_red_lens", <industrialforegoing:laser_lens:14>, [
		[<atum:crystal_red_stained_glass>, <tconevo:material:1>, <atum:crystal_red_stained_glass>], 
		[<actuallyadditions:item_crystal_empowered>, <contenttweaker:lens_in>, <actuallyadditions:item_crystal_empowered>], 
		[<atum:crystal_red_stained_glass>, <tconevo:material:1>, <atum:crystal_red_stained_glass>]
	]);


	scripts.content_machines.addBioAssemblerRecipeRandom(
		[<contenttweaker:zirconium_lens> % 80, <contenttweaker:zirconium_dust> % 30, <contenttweaker:zirconium_dust> % 30], null, 
        [
			<contenttweaker:zirconium_gem> * 8,
			<industrialforegoing:laser_lens:1>,
			<contenttweaker:lens_out>
		], [
			<liquid:lubricant> * 1000
		], <contenttweaker:pressure_cutter>,
        80, 1000
	);
}
{//laser and wafer
	scripts.content_machines.addAssemblerRecipe(
		[<mekanism:machineblock2:13> * 2],
		[
			<mekanism:basicblock:8>,
			<quantumflux:craftingpiece:2> * 2,
			<mekanism:controlcircuit:3>,
			<actuallyadditions:item_crystal_empowered> * 6
		],
		null,
		20, 1000
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:laser>],
		[
			<mekanism:machineblock2:13> * 4,
			<contenttweaker:lens_in> * 16,
			<mekanism:machineblock2:15>,
			<moreplates:crystalline_pink_slime_plate> * 4,
			<contenttweaker:pulse_generator> * 2
		],
		<liquid:empoweredoil> * 1000,
		20, 4096
	);

	scripts.content_machines.addBioAssemblerRecipe(
		[<projectred-core:resource_item:320>], null, 
        [
			<projectred-core:resource_item:301>
		], [
			<liquid:redstone> * 400
		], <contenttweaker:laser>,
        5, 1000
	);
	scripts.content_machines.addBioAssemblerRecipe(
		[<projectred-core:resource_item:341>], null, 
        [
			<projectred-core:resource_item:301>
		], [
			<liquid:glowstone> * 1000
		], <contenttweaker:laser>,
        5, 1000
	);
	scripts.content_machines.addBioAssemblerRecipe(
		[<projectred-core:resource_item:342>], null, 
        [
			<projectred-core:resource_item:301>
		], [
			<liquid:electrotine> * 1000
		], <contenttweaker:laser>,
        5, 1000
	);
}


scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:reinforced_cell>],
	[
		<taiga:prometheum_block> * 2, 
		<contenttweaker:tungsten_coil> * 8, 
		<contenttweaker:glass_ingot> * 16, 
		<quantumflux:craftingpiece> * 2,
		<contenttweaker:power_tap>
	],
	<liquid:tignalum> * 576,
	20, 4096
);

function addElementCellRecipe(outp as IItemStack[], inp as IItemStack[]){
	var rec = RecipeBuilder.newBuilder(outp[0].name, "energy_infuser", 40);

    rec.addEnergyPerTickInput(32000);

	for out in outp{
	    rec.addItemOutput(out);
	}
    rec.addItemInput(<contenttweaker:reinforced_cell>);
	
	for i in inp{
		rec.addItemInput(i);
	}

	rec.addMekanismLaserInput(25000000 as double);
    
    rec.build();
}
{//element cell
	addElementCellRecipe([<contenttweaker:lightning_cell>], [<contenttweaker:electric_manyullyn_dust> * 64]);

	addElementCellRecipe([<contenttweaker:fire_cell>], [<contenttweaker:advanced_pyrotheum> * 8, <extendedcrafting:singularity_custom:100>]);

	addElementCellRecipe([<contenttweaker:light_cell>], [<contenttweaker:light_ingot> * 8, <enderio:block_holy_fog> * 32, <erebus:materials:12> * 32]);

}

recipes.addShaped("ia_explosion_device", <contenttweaker:explosion_device>, [
	[<contenttweaker:electric_manyullyn_rod>, <contenttweaker:explosion_resistant_plate>, null], 
	[<contenttweaker:explosion_resistant_plate>, <contenttweaker:hot_gear>, <contenttweaker:explosion_resistant_plate>], 
	[<contenttweaker:explosion_resistant_gear>, <contenttweaker:creeper_component>, <contenttweaker:electric_manyullyn_rod>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:explosion_device> * 2],
	[
		<contenttweaker:creeper_component>,
		<contenttweaker:hot_gear>,
		<contenttweaker:explosion_resistant_plate> * 4,
		<contenttweaker:electric_manyullyn_rod> * 3
	], null,
	20, 1000
);
mods.mekanism.compressor.addRecipe(
    <contenttweaker:explosion_device>,
    <gas:ammonium_nitrate>, 
    <contenttweaker:explosion_device_full>
);

{//eye
	mods.thermalexpansion.Centrifuge.addRecipe(
		[<contenttweaker:primitive_eyes> % 25], 
		<erebus:materials:4>, null, 
		3000
	);
	mods.thermalexpansion.Centrifuge.addRecipe(
		[<contenttweaker:primitive_eyes> % 25], 
		<contenttweaker:flower_nether_eye>, null, 
		3000
	);
	mods.thermalexpansion.Centrifuge.addRecipe(
		[<contenttweaker:primitive_eyes> % 25], 
		<erebus:materials:60>, null, 
		3000
	);
	mods.thermalexpansion.Centrifuge.addRecipe(
		[<contenttweaker:primitive_eyes> % 10], 
		<minecraft:spider_eye>, null, 
		3000
	);
	mods.thermalexpansion.Centrifuge.addRecipe(
		[<contenttweaker:primitive_eyes> % 30], 
		<biomesoplenty:double_plant:2>, null, 
		3000
	);
	//todo biolab eyes

	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:mute_eye>, 
		[
			<contenttweaker:primitive_eyes> * 4,
			<contenttweaker:basic_neuron> * 3,
			<industrialforegoing:laser_lens:14>
		]
	);
	//todo eye fluid
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:eye>, 
		<contenttweaker:mute_eye>, <liquid:nutrient_distillation> * 5000, 
		10000
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:mechanical_eye>],
		[<contenttweaker:eye>, <contenttweaker:neuron_inlay> * 2, <contenttweaker:medical_alloy_coil>, <quantumflux:craftingpiece>],
		null, 20, 1024
	);

}

recipes.addShapeless("ia_osmiridium_support", <contenttweaker:osmiridium_support>, [<contenttweaker:osmiridium_rod>, <contenttweaker:osmiridium_rod>, <ore:slimeball>]);
recipes.addShapeless("ia_osmiridium_support2", <contenttweaker:osmiridium_support> * 2, [<contenttweaker:osmiridium_rod>, <contenttweaker:osmiridium_rod>, <contenttweaker:superglue>]);


//robot brain
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:robot_brain>],
	[<contenttweaker:neuron> * 4, <contenttweaker:neuron_inlay> * 8, <enderio:item_capacitor_melodic> * 4, <contenttweaker:osmiridium_support>],
	null, 80, 1024
);

{
	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:carminium_sheet>, 
		[
			<botania:rune:13>,
			<contenttweaker:beryllium_sheet> * 8,
			<contenttweaker:carminium_ingot> * 48
		], 1000000
	);
}

{//elven circuit
	recipes.addShaped("ia_conductive_alloy_coil", <contenttweaker:conductive_alloy_coil>, [
		[<contenttweaker:conductive_alloy_wire>, <contenttweaker:tungsten_coil>, <contenttweaker:conductive_alloy_wire>], 
		[<immersiveengineering:wirecoil:2>, <botania:manaresource:3>, <immersiveengineering:wirecoil:2>], 
		[<contenttweaker:conductive_alloy_wire>, <contenttweaker:tungsten_coil>, <contenttweaker:conductive_alloy_wire>]
	]);

	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:very_advanced_circuit_base>, 
		[
			<contenttweaker:glass_cloth> * 3,
			<contenttweaker:advanced_circuit_plate> * 4,
			<contenttweaker:conductive_alloy_coil> * 2
		], 10000
	);

	mods.botania.RuneAltar.addRecipe(<contenttweaker:very_advanced_circuit>,
		[
			<contenttweaker:very_advanced_circuit_base>, <contenttweaker:cursed_processor>, 
			<enderio:item_material:44>, <contenttweaker:delicate_amber>, <bloodmagic:component:31>,
			<botania:rune:8>
		], 5000
	);

	mods.mekanism.infuser.addRecipe("MANA", 30, <contenttweaker:very_advanced_circuit>, <contenttweaker:very_advanced_mana_circuit>);

	<ore:elfPayCheck>.add(<thermalfoundation:coin:103>);
	<ore:elfPayCheck>.add(<thermalfoundation:coin:71>);
	<ore:elfPayCheck>.add(<harvestcraft:deluxecheeseburgeritem>);
	<ore:elfPayCheck>.add(<actuallyadditions:item_food:8>);

	mods.botania.ElvenTrade.addRecipe([<contenttweaker:elf_mana_circuit>], [
		<contenttweaker:very_advanced_mana_circuit>, <contenttweaker:mana_circuit>, <moreplates:elementium_plate>, <quantumflux:craftingpiece:2>, <ore:elfPayCheck>
	]);


}


{//signal
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:pulse_generator>, 
		<contenttweaker:iron_heart>, <projectred-core:resource_item:402>, 
		<liquid:pulsating_iron> * (144 * 8), 
		40, 128
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:signal_reciever>],
		[
			<contenttweaker:lightning_cell>,
			<enderio:block_transceiver>,
			<contenttweaker:pulse_generator> * 8,
			<enderio:item_material:16> * 4,
			<extendedcrafting:material:36> * 24
		],
		<liquid:mekanized_steel> * 1000, 40, 1024
	);
}

{//rtg
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:rtg>],
		[
			<bigreactors:reactorcasingcores>,
			<contenttweaker:cooling_system>,
			<solarflux:mirror> * 32,
			<immersiveengineering:metal_device1:3> * 8,
			<extendedcrafting:singularity_custom:17> | <extendedcrafting:singularity:32>,
			<contenttweaker:bedrockium_alloy_plate> * 4
		],
		null, 40, 1024
	);

	mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rtg2>, [
		[<contenttweaker:polonium_block>, <contenttweaker:carminium_sheet>, <contenttweaker:c14_gem>, <contenttweaker:carminium_sheet>, <contenttweaker:polonium_block>], 
		[<contenttweaker:carminium_sheet>, <contenttweaker:rtg>, <contenttweaker:rtg>, <contenttweaker:rtg>, <contenttweaker:carminium_sheet>], 
		[<contenttweaker:c14_gem>, <contenttweaker:rtg>, <contenttweaker:vortexed_ingot>, <contenttweaker:rtg>, <contenttweaker:c14_gem>], 
		[<contenttweaker:carminium_sheet>, <contenttweaker:rtg>, <contenttweaker:rtg>, <contenttweaker:rtg>, <contenttweaker:carminium_sheet>], 
		[<contenttweaker:polonium_block>, <contenttweaker:carminium_sheet>, <contenttweaker:c14_gem>, <contenttweaker:carminium_sheet>, <contenttweaker:polonium_block>]
	]);
}

{//rocket
	mods.mekanism.compressor.addRecipe(<contenttweaker:tank>, <gas:oxygen>, <contenttweaker:tank_oxygen>);

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:rocket_engine>], 
		[
			<contenttweaker:explosion_device_full>,
			<contenttweaker:tank_oxygen> * 4,
			<contenttweaker:cooling_system>,
			<contenttweaker:tank2>,
			<contenttweaker:explosion_resistant_plate> * 4,
			<contenttweaker:tignalum_plate> * 4
		],
		<liquid:thermal> * (144 * 8), 20, 1024 
	);
	
}
{//alien
	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:alien_wreck> % 20,
			<contenttweaker:alien_electrode> % 25,
			<contenttweaker:alien_motor> % 10
		], <liquid:radioactive_waste> * 400, 
        <liquid:mekanized_lubricant> * 1000, <contenttweaker:alien_wreck>,
        <contenttweaker:pressure_cutter>,
        100, 10000
	);
}

scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:secure_switch>], 
	[
		<minecraft:lever>,
		<contenttweaker:advanced_plating1_4> * 4,
		<contenttweaker:explosion_resistant_plate> * 4,
		<contenttweaker:advanced_plating2_2> * 4,
		<contenttweaker:acid_resistant_steel_plate> * 4
	],
	<liquid:tignalum> * (144 * 8), 20, 1024 
);

{//wither
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:cursed_skull>], [],
		[
			<minecraft:skull:1>,
			<contenttweaker:cursed_processor> * 16,
			<extendedcrafting:singularity_custom:35>
		], [
			<liquid:xu_evil_metal> * (144 * 12),
			<liquid:empowered_steam> * 1000,
			<liquid:evil_blood> * 1000
		],
		20, 4000
	);
	scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:cursed_frame>], null, 
        [
			<contenttweaker:flesh_support>, 
			<contenttweaker:compact_empowerer> * 3, 
			<simplyjetpacks:metaitemmods:11>,
			<contenttweaker:cursed_gold_plate> * 16,
			<moreplates:evil_infused_iron_plate> * 16,
			<extendedcrafting:singularity:5> * 8
		], [
			<liquid:evil_blood> * 1000
		], null,
        80, 10000
    );
	
	scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:cursed_wither>], null, 
        [
			<contenttweaker:cursed_skull> * 5,
			<contenttweaker:cursed_frame>,
			<contenttweaker:laser> * 4,
			<extendedcrafting:storage:2>,
			<contenttweaker:secure_switch>
		], [
			<liquid:evil_blood> * 1000
		], null,
        80, 10000
    );
	<contenttweaker:cursed_wither>.addTooltip("Laser-Super-Wither-Death Machine");
	<contenttweaker:cursed_wither>.addTooltip("Thankfully deactivated");
	<contenttweaker:cursed_wither>.addTooltip("Do not activate in places you don't want evaporated.");

	mods.enderio.SagMill.addRecipe(
        [<contenttweaker:cursed_star>, <minecraft:nether_star>, <contenttweaker:nether_star_dust>, <contenttweaker:cursed_gold_pieces> * 4], 
        [0.8, 0.2, 0.05, 0.55], 
        <contenttweaker:cursed_star>, "CHANCE_ONLY", 500000
    );
}