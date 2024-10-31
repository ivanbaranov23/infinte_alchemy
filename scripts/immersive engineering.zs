import mods.immersiveengineering.Blueprint;
import mods.immersivepetroleum.Distillation;
import mods.modularmachinery.RecipeBuilder;


//molds
Blueprint.removeRecipe(<immersiveengineering:mold>);
Blueprint.removeRecipe(<immersiveengineering:mold:1>);
Blueprint.removeRecipe(<immersiveengineering:mold:2>);

Blueprint.addRecipe("molds", <contenttweaker:plate_mold>, [<contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>]);
Blueprint.addRecipe("molds", <contenttweaker:rod_mold>, [<contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>]);
Blueprint.addRecipe("molds", <contenttweaker:gear_mold>, [<contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>]);

{//glass hull and vacuum tube
	mods.tconstruct.Casting.addTableRecipe(
		<contenttweaker:glass_hull>, 
		<ore:ingotSteel>,
		<liquid:glass>, 1000,
		true
	);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:glass_hull>, 
		<thermalfoundation:material:160>, <minecraft:glass>, 1500
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:glass_hull> * 2],
		[<thermalfoundation:material:160>],
		<liquid:glass> * 1000,
		5, 16
	);

	Blueprint.removeRecipe(<immersiveengineering:material:26>);
	Blueprint.addRecipe("components", 
		<immersiveengineering:material:26> * 2, 
		[
			<contenttweaker:glass_hull>, <contenttweaker:glass_hull>, 
			<ore:wireCopper>, <contenttweaker:zinc_wire>, <ore:wireAluminum>, 
			<ore:stickCopper>
		]
	);
	
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:material:26> * 4],
		[<contenttweaker:glass_hull> * 4, <ore:wireCopper>, <contenttweaker:zinc_wire>, <ore:wireAluminum>],
		null,
		10, 128
	);
	//circuit
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:material:27> * 2],
		[<immersiveengineering:stone_decoration:8>, <immersiveengineering:material:26> * 2],
		<liquid:copper> * 288,
		10, 128
	);
}

//pipe
scripts.content_machines.addAssemblerRecipe(
	[<immersiveengineering:metal_device1:6> * 2],
	[<thermalfoundation:material:32>],
	<liquid:watertight_steel> * 144,
	5, 120
);

//conveyor
recipes.remove(<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}));
recipes.addShaped("ia_conveyor", <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 8, [
	[<minecraft:leather>, <minecraft:leather>, <minecraft:leather>], 
	[<immersiveengineering:material:9>, <contenttweaker:simple_motor>, <immersiveengineering:material:9>]
]);
recipes.addShaped("ia_conveyor", <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 16, [
	[<roots:fey_leather>, <roots:fey_leather>, <roots:fey_leather>], 
	[<immersiveengineering:material:9>, <contenttweaker:simple_motor>, <immersiveengineering:material:9>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 12],
	[
		<minecraft:leather> * 2,
		<immersiveengineering:material:9>, 
		<contenttweaker:simple_motor>
	], null, 20, 120
);

//water wheel
recipes.remove(<immersiveengineering:wooden_device1>);
recipes.addShapeless("ia_ie_water_wheel", <immersiveengineering:wooden_device1>, [
	<exnihilocreatio:block_waterwheel>, <immersiveengineering:material:8>,
	<immersiveengineering:material:10>, <immersiveengineering:material:10>, <immersiveengineering:material:10>, <immersiveengineering:material:10>
]);
recipes.remove(<immersiveengineering:wooden_device1:1>);
recipes.addShaped("ia_ie_windmill", <immersiveengineering:wooden_device1:1>, [
	[<immersiveengineering:material:11>, <immersiveengineering:material:11>, <immersiveengineering:material:11>],
	[<immersiveengineering:material:11>, <immersiveengineering:material:8>, <immersiveengineering:material:11>],
	[<immersiveengineering:material:11>, <immersiveengineering:material:11>, <immersiveengineering:material:11>]
]);

{//glass
	recipes.remove(<immersiveengineering:stone_decoration:8>);
	{    
        var rec = RecipeBuilder.newBuilder("insulated_glass", "high_oven", 100);
        rec.addEnergyPerTickInput(256);

        rec.addItemInput(<contenttweaker:research_glass_making>);
		rec.setChance(0.0);
        
		rec.addItemInput(<prodigytech:circuit_plate>);
		rec.addItemInput(<contenttweaker:slimy_glass>);
		rec.addItemInput(<contenttweaker:nial_dust>);
        rec.addFluidInput(<liquid:lava> * 2000);
        
        rec.addItemOutput(<immersiveengineering:stone_decoration:8> * 4);
        rec.build();
    }
	recipes.addShaped("ia_insulated_glass", <immersiveengineering:stone_decoration:8> * 2, [
		[null, <contenttweaker:slimy_glass>, null], 
		[<contenttweaker:nial_dust>, <prodigytech:circuit_plate>, <contenttweaker:nial_dust>], 
		[null, <contenttweaker:slimy_glass>, null]
	]);
	/*recipes.addShaped("ia_insulated_glass2", <immersiveengineering:stone_decoration:8> * 4, [
		[<contenttweaker:research_glass_making>.reuse(), <ore:blockGlassColorless>, null], 
		[<ore:dustIron>, <prodigytech:circuit_plate>, <ore:dustIron>], 
		[null, <ore:blockGlassColorless>, null]
	]);*/
}

recipes.remove(<engineersdecor:panzerglass_block>);
recipes.addShaped("ia_panzerglass_block", <engineersdecor:panzerglass_block> * 2, [
	[<contenttweaker:titanium_rod>, <appliedenergistics2:quartz_glass>, <contenttweaker:titanium_rod>], 
	[<appliedenergistics2:quartz_glass>, <contenttweaker:osgloridium_plate>, <appliedenergistics2:quartz_glass>], 
	[<contenttweaker:titanium_rod>, <appliedenergistics2:quartz_glass>, <contenttweaker:titanium_rod>]
]);

recipes.remove(<immersiveengineering:tool>);
recipes.addShaped("ia_ie_hammer", <immersiveengineering:tool>, [
	[<ore:plateInvar>, <prodigytech:heat_capacitor_1>, <ore:plateInvar>], 
	[null, <ore:stickConstantan>, null], 
	[null, <ore:stickConstantan>, null]
]);
recipes.remove(<immersiveengineering:tool:1>);
recipes.addShaped("ia_ie_wirecutter", <immersiveengineering:tool:1>, [
	[null, <contenttweaker:duraluminum_rod>, null], 
	[<ore:stickWood>, <ore:ingotSteel>, <contenttweaker:duraluminum_rod>], 
	[null, <ore:stickWood>, null]
]);

recipes.remove(<immersiveengineering:stone_decoration>);
recipes.addShaped("ia_coke_brick", <immersiveengineering:stone_decoration> * 6, [
	[<contenttweaker:fireclay>, <ore:ingotBrick>, <contenttweaker:fireclay>], 
	[<ore:ingotBrick>, <contenttweaker:industrial_clay>, <ore:ingotBrick>], 
	[<contenttweaker:fireclay>, <ore:ingotBrick>, <contenttweaker:fireclay>]
]);
recipes.remove(<immersiveengineering:stone_decoration:1>);
recipes.addShaped("ia_blast_brick", <immersiveengineering:stone_decoration:1> * 4, [
	[<contenttweaker:firebrick>, <ore:ingotBrickNether>, <contenttweaker:firebrick>], 
	[<ore:ingotBrickNether>, <contenttweaker:industrial_clay>, <ore:ingotBrickNether>], 
	[<contenttweaker:firebrick>, <ore:ingotBrickNether>, <contenttweaker:firebrick>]
]);
recipes.remove(<immersiveengineering:stone_decoration:2>);
recipes.addShaped("ia_improved_blast_brick", <immersiveengineering:stone_decoration:2> * 3, [
	[<immersiveengineering:stone_decoration:1>, <ore:clayPorcelain>, <immersiveengineering:stone_decoration:1>], 
	[<ore:gunpowder>, <ore:plateSteel>, <ore:gunpowder>], 
	[<ore:clayPorcelain>, <immersiveengineering:stone_decoration:1>, <ore:clayPorcelain>]
]);


{// multiblocks parts
	recipes.remove(<immersiveengineering:metal_decoration1:1>);
	recipes.addShaped("ia_steel_scaffold", <immersiveengineering:metal_decoration1:1> * 8, [
		[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], 
		[null, <contenttweaker:duraluminum_rod>, null], 
		[<ore:stickSteel>, null, <ore:stickSteel>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:3>);
	recipes.addShaped("ia_ie_redstone_block", <immersiveengineering:metal_decoration0:3>, [
		[<ore:plateIron> | <contenttweaker:zinc_plate>, <immersiveengineering:connector:12>, <ore:plateIron> | <contenttweaker:zinc_plate>], 
		[<immersiveengineering:connector:12>, <ore:blockRedstone>, <immersiveengineering:connector:12>], 
		[<ore:plateIron> | <contenttweaker:zinc_plate>, <immersiveengineering:connector:12>, <ore:plateIron> | <contenttweaker:zinc_plate>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:4>);
	recipes.addShaped("ia_light_engineering_block", <immersiveengineering:metal_decoration0:4> * 2, [
		[<ore:plateSteel>, <immersiveengineering:material:8>, <ore:plateSteel>], 
		[<ore:gearSilver>, <contenttweaker:duraluminum_gear>, <ore:gearOsmium>], 
		[<ore:plateSteel>, <immersiveengineering:material:8>, <ore:plateSteel>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:5>);
	recipes.addShaped("ia_heavy_engineering_block", <immersiveengineering:metal_decoration0:5> * 2, [
		[<ore:plateSteel>, <immersiveengineering:material:9>, <ore:plateSteel>], 
		[<ore:gearElectrum>, <contenttweaker:duraluminum_gear>, <contenttweaker:lesmium_gear>], 
		[<ore:plateSteel>, <immersiveengineering:material:9>, <ore:plateSteel>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:7>);
	recipes.addShaped("ia_radiator_block", <immersiveengineering:metal_decoration0:7> * 2, [
		[<immersiveengineering:wirecoil:2>, <ore:ingotHOPGraphite>, <immersiveengineering:wirecoil:2>], 
		[<ore:ingotHOPGraphite>, <contenttweaker:duraluminum_gear>, <ore:ingotHOPGraphite>], 
		[<immersiveengineering:wirecoil:2>, <ore:ingotHOPGraphite>, <immersiveengineering:wirecoil:2>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:6>);
	recipes.addShaped("ia_generator_block", <immersiveengineering:metal_decoration0:6> * 2, [
		[<contenttweaker:duraluminum_plate>, <prodigytech:heat_capacitor_1>, <contenttweaker:duraluminum_plate>], 
		[<ore:gearElectrum>, <immersiveengineering:metal_device1:2>, <ore:gearElectrum>], 
		[<contenttweaker:duraluminum_plate>, <ore:gearBronze>, <contenttweaker:duraluminum_plate>]
	]);
	{//research
		recipes.addShapeless("ia_structure_bp", <immersiveengineering:blueprint>.withTag({blueprint: "structure"}), [<contenttweaker:research_structure>]);
		
		Blueprint.addRecipe("structure", 
			<immersiveengineering:metal_decoration0:3>, 
			[
				<moreplates:red_alloy_plate>, <immersiveengineering:connector:12>, <immersiveengineering:connector:12>,
				<contenttweaker:zinc_plate>, <contenttweaker:zinc_plate>
			]
		);
		Blueprint.addRecipe("structure", 
			<immersiveengineering:metal_decoration0:4> * 2, 
			[
				<immersiveengineering:metal_decoration1:1>, <immersiveengineering:material:8>,
				<ore:gearSilver>, <contenttweaker:duraluminum_gear>, <ore:gearOsmium>,
				<ore:plateSteel>
			]
		);
		Blueprint.addRecipe("structure", 
			<immersiveengineering:metal_decoration0:5> * 2, 
			[
				<immersiveengineering:metal_decoration1:1>, <immersiveengineering:material:9>,
				<ore:gearElectrum>, <contenttweaker:duraluminum_gear>, <contenttweaker:lesmium_gear>,
				<ore:plateSteel>
			]
		);
	}
}

{//wires and coils
	recipes.remove(<immersiveengineering:wirecoil:5>);
	recipes.addShaped("ia_ie_redstone_coil", <immersiveengineering:wirecoil:5>, [
		[<projectred-transmission:wire>, <projectred-transmission:wire>, <projectred-transmission:wire>], 
		[<immersiveengineering:material:22>, <immersiveengineering:material>, <immersiveengineering:material:22>], 
		[<projectred-transmission:wire>, <projectred-transmission:wire>, <projectred-transmission:wire>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:wirecoil:5> * 2],
		[<immersiveengineering:material:22>, <immersiveengineering:material>, <projectred-core:resource_item:103>],
		null,
		5, 16
	);

	recipes.remove(<immersiveengineering:wirecoil>);
	recipes.addShaped("ia_ie_lv_coil", <immersiveengineering:wirecoil>, [
		[null, <ore:wireCopper>, <immersiveengineering:treated_wood>], 
		[<ore:wireCopper>, <ore:stickTreatedWood>, <ore:wireCopper>], 
		[<immersiveengineering:treated_wood>, <ore:wireCopper>, null]
	]);
	recipes.remove(<immersiveengineering:wirecoil:1>);
	recipes.addShaped("ia_ie_mv_coil", <immersiveengineering:wirecoil:1>, [
		[null, <ore:wireElectrum>, <immersiveengineering:treated_wood>], 
		[<ore:wireElectrum>, <ore:stickTreatedWood>, <ore:wireElectrum>], 
		[<immersiveengineering:treated_wood>, <ore:wireElectrum>, null]
	]);
	recipes.remove(<immersiveengineering:wirecoil:2>);
	recipes.addShaped("ia_ie_hv_coil", <immersiveengineering:wirecoil:2>, [
		[null, <ore:wireSteel>, <immersiveengineering:treated_wood>], 
		[<ore:wireSteel>, <ore:stickTreatedWood>, <ore:wireSteel>], 
		[<immersiveengineering:treated_wood>, <ore:wireSteel>, null]
	]);
	recipes.addShaped("ia_ie_ev_coil", <contenttweaker:tungsten_coil>, [
		[null, <contenttweaker:tungsten_wire>, <immersiveengineering:treated_wood>], 
		[<contenttweaker:tungsten_wire>, <ore:stickTreatedWood>, <contenttweaker:tungsten_wire>], 
		[<immersiveengineering:treated_wood>, <contenttweaker:tungsten_wire>, null]
	]);

	recipes.addShaped("ia_gold_coil", <contenttweaker:gold_coil>, [
		[null, <contenttweaker:gold_wire>, <immersiveengineering:treated_wood>], 
		[<contenttweaker:gold_wire>, <ore:stickTreatedWood>, <contenttweaker:gold_wire>], 
		[<immersiveengineering:treated_wood>, <contenttweaker:gold_wire>, null]
	]);

	recipes.remove(<immersiveengineering:metal_decoration0>);
	recipes.addShaped("ia_ie_lv_coil_block", <immersiveengineering:metal_decoration0>, [
		[<immersiveengineering:wirecoil>, <immersiveengineering:wirecoil>, <immersiveengineering:wirecoil>], 
		[<immersiveengineering:wirecoil>, <ore:stickIron>, <immersiveengineering:wirecoil>], 
		[<immersiveengineering:wirecoil>, <immersiveengineering:wirecoil>, <immersiveengineering:wirecoil>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:1>);
	recipes.addShaped("ia_ie_mv_coil_block", <immersiveengineering:metal_decoration0:1>, [
		[<immersiveengineering:wirecoil:1>, <immersiveengineering:wirecoil:1>, <immersiveengineering:wirecoil:1>], 
		[<immersiveengineering:wirecoil:1>, <ore:stickSteel>, <immersiveengineering:wirecoil:1>], 
		[<immersiveengineering:wirecoil:1>, <immersiveengineering:wirecoil:1>, <immersiveengineering:wirecoil:1>]
	]);
	recipes.remove(<immersiveengineering:metal_decoration0:2>);
	recipes.addShaped("ia_ie_hv_coil_block", <immersiveengineering:metal_decoration0:2>, [
		[<immersiveengineering:wirecoil:2>, <immersiveengineering:wirecoil:2>, <immersiveengineering:wirecoil:2>], 
		[<immersiveengineering:wirecoil:2>, <contenttweaker:duraluminum_rod>, <immersiveengineering:wirecoil:2>], 
		[<immersiveengineering:wirecoil:2>, <immersiveengineering:wirecoil:2>, <immersiveengineering:wirecoil:2>]
	]);

	recipes.remove(<immersiveengineering:wirecoil:4>);
	recipes.addShapeless("ia_steel_cable", <immersiveengineering:wirecoil:4>, [<immersiveengineering:material:23>, <ore:stickWood>]);
}
{//connectors and relays
	recipes.remove(<immersiveengineering:connector>);
	recipes.addShaped("ie_lv_conn", <immersiveengineering:connector> * 4, [
		[null, <immersiveengineering:material:20>, null], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:20>, <minecraft:hardened_clay>], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:20>, <minecraft:hardened_clay>]
	]);

	recipes.remove(<immersiveengineering:connector:1>);
	recipes.addShaped("ie_lv_relay", <immersiveengineering:connector:1> * 6, [
		[null, <immersiveengineering:material:20>, null], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:20>, <minecraft:hardened_clay>]
	]);


	recipes.remove(<immersiveengineering:connector:2>);
	recipes.addShaped("ie_mv_conn", <immersiveengineering:connector:2> * 4, [
		[null, <immersiveengineering:material:21>, null], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:21>, <minecraft:hardened_clay>], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:21>, <minecraft:hardened_clay>]
	]);

	recipes.remove(<immersiveengineering:connector:3>);
	recipes.addShaped("ie_mv_relay", <immersiveengineering:connector:3> * 6, [
		[null, <immersiveengineering:material:21>, null], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:21>, <minecraft:hardened_clay>]
	]);


	recipes.remove(<immersiveengineering:connector:4>);
	recipes.addShaped("ie_hv_conn", <immersiveengineering:connector:4> * 4, [
		[null, <immersiveengineering:material:22>, null], 
		[<minecraft:hardened_clay>, <immersiveengineering:material:22>, <minecraft:hardened_clay>], 
		[<immersiveengineering:stone_decoration:8>, <immersiveengineering:material:22>, <immersiveengineering:stone_decoration:8>]
	]);

	recipes.remove(<immersiveengineering:connector:5>);
	recipes.addShaped("ie_hv_relay", <immersiveengineering:connector:5> * 6, [
		[null, <immersiveengineering:material:22>, null], 
		[<immersiveengineering:stone_decoration:8>, <immersiveengineering:material:22>, <immersiveengineering:stone_decoration:8>],
		[<immersiveengineering:stone_decoration:8>, <immersiveengineering:material:22>, <immersiveengineering:stone_decoration:8>]
	]);
}


//capacitors
recipes.remove(<immersiveengineering:metal_device0>);
recipes.addShaped("ia_lv_capacitor", <immersiveengineering:metal_device0>, [
	[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], 
	[<ore:gearElectrum>, <immersiveengineering:metal_decoration0>, <contenttweaker:lesmium_gear>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]
]);
recipes.remove(<immersiveengineering:metal_device0:1>);
recipes.addShaped("ia_mv_capacitor", <immersiveengineering:metal_device0:1>, [
	[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], 
	[<ore:gearElectrum>, <immersiveengineering:metal_decoration0:1>, <contenttweaker:lesmium_gear>], 
	[<ore:plankTreatedWood>, <immersiveengineering:metal_device0>, <ore:plankTreatedWood>]
]);
recipes.remove(<immersiveengineering:metal_device0:2>);
recipes.addShaped("ia_hv_capacitor", <immersiveengineering:metal_device0:2>, [
	[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], 
	[<ore:gearElectrum>, <immersiveengineering:metal_decoration0:2>, <contenttweaker:lesmium_gear>], 
	[<ore:plankTreatedWood>, <immersiveengineering:metal_device0:1>, <ore:plankTreatedWood>]
]);

{//components
	recipes.remove(<immersiveengineering:material:8>);
	recipes.addShaped("ia_iron_component", <immersiveengineering:material:8> * 2, [
		[<ore:plateIron>, null, <ore:plateIron>], 
		[<ore:stickGold>, <contenttweaker:duraluminum_ingot>, <ore:stickLead>], 
		[<ore:plateIron>, null, <ore:plateIron>]
	]);
	Blueprint.removeRecipe(<immersiveengineering:material:8>);
	Blueprint.addRecipe(
		"components", <immersiveengineering:material:8> * 3, 
		[<ore:plateIron>, <ore:stickGold>, <contenttweaker:duraluminum_ingot>, <ore:stickLead>]
	);
	recipes.remove(<immersiveengineering:material:9>);
	recipes.addShaped("ia_steel_component", <immersiveengineering:material:9> * 2, [
		[<ore:plateSteel>, null, <ore:plateSteel>], 
		[<ore:stickElectrum>, <contenttweaker:duraluminum_ingot>, <contenttweaker:lesmium_rod>], 
		[<ore:plateSteel>, null, <ore:plateSteel>]
	]);
	Blueprint.removeRecipe(<immersiveengineering:material:9>);
	Blueprint.addRecipe(
		"components", <immersiveengineering:material:9> * 3, 
		[<ore:plateSteel>, <ore:stickElectrum>, <contenttweaker:duraluminum_ingot>, <contenttweaker:lesmium_rod>]
	);
}

recipes.remove(<immersiveengineering:metal_device1:2>);
recipes.addShaped("ia_kinetic_dynamo", <immersiveengineering:metal_device1:2>, [
	[<ore:stickCopper>, <immersiveengineering:wirecoil:2>, <contenttweaker:zinc_rod>], 
	[<ore:stickCopper>, <immersiveengineering:wirecoil:2>, <contenttweaker:zinc_rod>], 
	[<ore:plateSteel>, <prodigytech:circuit_refined>, <ore:plateSteel>]
]);


recipes.remove(<immersiveengineering:metal_device1:3>);
recipes.addShaped("ia_thermo_gen", <immersiveengineering:metal_device1:3>, [
	[<ore:wireCopper>, <prodigytech:heat_capacitor_0>, <contenttweaker:zinc_wire>], 
	[<ore:wireCopper>, <immersiveengineering:wirecoil:2>, <contenttweaker:zinc_wire>], 
	[<ore:wireCopper>, <prodigytech:magmatic_aeroheater>, <contenttweaker:zinc_wire>]
]);

recipes.remove(<immersiveengineering:metal_device1:1>);
recipes.addShaped("ia_external_heater", <immersiveengineering:metal_device1:1>, [
	[<contenttweaker:duraluminum_plate>, <ore:plateCarbon>, <contenttweaker:duraluminum_plate>], 
	[<ore:plateCarbon>, <prodigytech:blower_furnace>, <ore:plateCarbon>], 
	[<contenttweaker:duraluminum_plate>, <ore:blockRedstone>, <contenttweaker:duraluminum_plate>]
]);


recipes.remove(<immersiveengineering:metal_device1:13>);


mods.immersivepetroleum.Lubricant.registerLubricant(<liquid:grease>, 1);
mods.immersivepetroleum.Lubricant.registerLubricant(<liquid:mekanized_lubricant>, 1);
mods.immersivepetroleum.Lubricant.registerLubricant(<liquid:starlight_lubricant>, 1);