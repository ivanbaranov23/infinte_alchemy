import mods.immersiveengineering.Blueprint;
import mods.immersivepetroleum.Distillation;
import mods.modularmachinery.RecipeBuilder;

import scripts.recycler.addRecycle;

//molds
Blueprint.removeRecipe(<immersiveengineering:mold>);
Blueprint.removeRecipe(<immersiveengineering:mold:1>);
Blueprint.removeRecipe(<immersiveengineering:mold:2>);

Blueprint.addRecipe("molds", <contenttweaker:plate_mold>, [<contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>]);
Blueprint.addRecipe("molds", <contenttweaker:rod_mold>, [<contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>]);
Blueprint.addRecipe("molds", <contenttweaker:gear_mold>, [<contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>]);



//pipe
scripts.content_machines.addAssemblerRecipe(
	[<immersiveengineering:metal_device1:6> * 2],
	[<thermalfoundation:material:32>],
	<liquid:watertight_steel> * 144,
	5, 120
);

//conveyor
recipes.remove(<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}));
recipes.addShaped("ia_conveyor1", <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 8, [
	[<minecraft:leather>, <minecraft:leather>, <minecraft:leather>], 
	[<immersiveengineering:material:9>, <contenttweaker:simple_motor>, <immersiveengineering:material:9>]
]);
recipes.addShaped("ia_conveyor2", <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 16, [
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
addRecycle(<immersiveengineering:wooden_device1>, [<immersiveengineering:material:8>, <immersiveengineering:treated_wood> * 20]);
recipes.remove(<immersiveengineering:wooden_device1:1>);
recipes.addShaped("ia_ie_windmill", <immersiveengineering:wooden_device1:1>, [
	[<immersiveengineering:material:11>, <immersiveengineering:material:11>, <immersiveengineering:material:11>],
	[<immersiveengineering:material:11>, <immersiveengineering:material:8>, <immersiveengineering:material:11>],
	[<immersiveengineering:material:11>, <immersiveengineering:material:11>, <immersiveengineering:material:11>]
]);
addRecycle(<immersiveengineering:wooden_device1:1>, [<immersiveengineering:material:8>, <immersiveengineering:treated_wood> * 40]);

//todo move
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
	[<ore:plateInvar>, <prodigytech:circuit_refined>, <ore:plateInvar>], 
	[null, <prodigytech:heat_capacitor_1>, null], 
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
	[<roots:runestone>, <ore:ingotBrick>, <roots:runestone>], 
	[<ore:ingotBrick>, <contenttweaker:industrial_clay>, <ore:ingotBrick>], 
	[<roots:runestone>, <ore:ingotBrick>, <roots:runestone>]
]);
recipes.remove(<immersiveengineering:stone_decoration:1>);
mods.prodigytech.explosionfurnace.recipes.addRecipe(
	<immersiveengineering:stone_decoration> * 3, <immersiveengineering:stone_decoration:1> * 3, 500, 
	<prodigytech:circuit_crude>, 1
);
mods.prodigytech.explosionfurnace.recipes.addRecipe(
	<immersiveengineering:stone_decoration> * 3, <immersiveengineering:stone_decoration:1> * 3, 500, 
	<integrateddynamics:crystalized_chorus_chunk> * 4, 1
);
mods.prodigytech.explosionfurnace.recipes.addRecipe(
	<immersiveengineering:stone_decoration> * 3, <immersiveengineering:stone_decoration:1> * 3, 500, 
	<contenttweaker:burn_powder> * 4, 1
);

/*recipes.addShaped("ia_blast_brick", <immersiveengineering:stone_decoration:1> * 4, [
	[<contenttweaker:firebrick>, <ore:ingotBrickNether>, <contenttweaker:firebrick>], 
	[<ore:ingotBrickNether>, <contenttweaker:industrial_clay>, <ore:ingotBrickNether>], 
	[<contenttweaker:firebrick>, <ore:ingotBrickNether>, <contenttweaker:firebrick>]
]);*/
recipes.remove(<immersiveengineering:stone_decoration:2>);
recipes.addShaped("ia_improved_blast_brick", <immersiveengineering:stone_decoration:2> * 3, [
	[<immersiveengineering:stone_decoration:1>, <ore:clayPorcelain>, <immersiveengineering:stone_decoration:1>], 
	[<ore:gunpowder>, <ore:plateSteel>, <ore:gunpowder>], 
	[<ore:clayPorcelain>, <immersiveengineering:stone_decoration:1>, <ore:clayPorcelain>]
]);
mods.prodigytech.explosionfurnace.recipes.addRecipe(
	<immersiveengineering:stone_decoration:1> * 3, <immersiveengineering:stone_decoration:2> * 3, 3000, 
	<ore:plateSteel>, 1
);

recipes.remove(<immersiveengineering:stone_decoration:10>);
recipes.addShaped("ia_kiln", <immersiveengineering:stone_decoration:10> * 4, [
	[<contenttweaker:firebrick_block>, <quark:sandy_bricks>, <contenttweaker:firebrick_block>], 
	[<quark:sandy_bricks>, <contenttweaker:industrial_clay>, <quark:sandy_bricks>], 
	[<contenttweaker:firebrick_block>, <quark:sandy_bricks>, <contenttweaker:firebrick_block>]
]);
recipes.addShaped("ia_kiln2", <immersiveengineering:stone_decoration:10> * 8, [
	[<contenttweaker:firebrick_block>, <biomesoplenty:dried_sand>, <contenttweaker:firebrick_block>], 
	[<biomesoplenty:dried_sand>, <contenttweaker:industrial_clay>, <biomesoplenty:dried_sand>], 
	[<contenttweaker:firebrick_block>, <biomesoplenty:dried_sand>, <contenttweaker:firebrick_block>]
]);

mods.immersiveengineering.MetalPress.addRecipe(
	<immersiveengineering:graphite_electrode>.withTag({graphDmg: 48000}), 
	<immersiveengineering:material:19>, 
	<contenttweaker:rod_mold>, 10000, 4
);


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
			<immersiveengineering:metal_decoration0:4> * 3, 
			[
				<immersiveengineering:metal_decoration1:1>, <immersiveengineering:material:8>,
				<ore:gearSilver>, <contenttweaker:duraluminum_gear>, <ore:gearOsmium>,
				<ore:plateSteel>
			]
		);
		Blueprint.addRecipe("structure", 
			<immersiveengineering:metal_decoration0:5> * 3, 
			[
				<immersiveengineering:metal_decoration1:1>, <immersiveengineering:material:9>,
				<ore:gearElectrum>, <contenttweaker:duraluminum_gear>, <contenttweaker:lesmium_gear>,
				<ore:plateSteel>
			]
		);
	}
}
mods.enderio.AlloySmelter.addRecipe(<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1}), 
    [
        <immersiveengineering:graphite_electrode>,
        <quantumflux:craftingpiece:6> * 24,
        <contenttweaker:diode2> * 4
    ], 1000 * 1000 * 100
);

{//wires and coils
	recipes.remove(<immersiveengineering:wirecoil:5>);
	recipes.addShaped("ia_ie_redstone_coil", <immersiveengineering:wirecoil:5> * 2, [
		[<projectred-transmission:wire>, <projectred-transmission:wire>, <projectred-transmission:wire>], 
		[<immersiveengineering:material:22>, <immersiveengineering:material>, <immersiveengineering:material:22>], 
		[<projectred-transmission:wire>, <projectred-transmission:wire>, <projectred-transmission:wire>]
	]);
	recipes.addShaped("ia_ie_redstone_coil2", <immersiveengineering:wirecoil:5> * 4, [
		[<projectred-transmission:wire>, <contenttweaker:algae_string>, <projectred-transmission:wire>], 
		[<immersiveengineering:material:22>, <immersiveengineering:material>, <immersiveengineering:material:22>], 
		[<projectred-transmission:wire>, <contenttweaker:algae_string>, <projectred-transmission:wire>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:wirecoil:5> * 8],
		[<immersiveengineering:material:22>, <contenttweaker:algae_string>, <immersiveengineering:material>, <projectred-core:resource_item:103>],
		null,
		5, 16
	);

	recipes.remove(<immersiveengineering:wirecoil>);
	recipes.addShaped("ia_ie_lv_coil", <immersiveengineering:wirecoil>, [
		[null, <ore:wireCopper>, <immersiveengineering:treated_wood>], 
		[<ore:wireCopper>, <ore:stickTreatedWood>, <ore:wireCopper>], 
		[<immersiveengineering:treated_wood>, <ore:wireCopper>, null]
	]);
	recipes.addShaped("ia_ie_lv_coil2", <immersiveengineering:wirecoil> * 2, [
		[<contenttweaker:algae_string>, <ore:wireCopper>, <immersiveengineering:treated_wood>], 
		[<ore:wireCopper>, <ore:stickTreatedWood>, <ore:wireCopper>], 
		[<immersiveengineering:treated_wood>, <ore:wireCopper>, <contenttweaker:algae_string>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:wirecoil> * 6],
		[<ore:stickTreatedWood>, <ore:wireCopper> * 4, <contenttweaker:algae_string>],
		null,
		5, 16
	);
	recipes.remove(<immersiveengineering:wirecoil:1>);
	recipes.addShaped("ia_ie_mv_coil", <immersiveengineering:wirecoil:1>, [
		[null, <ore:wireElectrum>, <immersiveengineering:treated_wood>], 
		[<ore:wireElectrum>, <ore:stickTreatedWood>, <ore:wireElectrum>], 
		[<immersiveengineering:treated_wood>, <ore:wireElectrum>, null]
	]);
	recipes.addShaped("ia_ie_mv_coil2", <immersiveengineering:wirecoil:1> * 2, [
		[<contenttweaker:algae_string>, <ore:wireElectrum>, <immersiveengineering:treated_wood>], 
		[<ore:wireElectrum>, <ore:stickTreatedWood>, <ore:wireElectrum>], 
		[<immersiveengineering:treated_wood>, <ore:wireElectrum>, <contenttweaker:algae_string>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:wirecoil:1> * 6],
		[<ore:stickTreatedWood>, <ore:wireElectrum> * 4, <contenttweaker:algae_string>],
		null,
		5, 16
	);
	recipes.remove(<immersiveengineering:wirecoil:2>);
	recipes.addShaped("ia_ie_hv_coil", <immersiveengineering:wirecoil:2>, [
		[null, <ore:wireSteel>, <immersiveengineering:treated_wood>], 
		[<ore:wireSteel>, <ore:stickTreatedWood>, <ore:wireSteel>], 
		[<immersiveengineering:treated_wood>, <ore:wireSteel>, null]
	]);
	recipes.addShaped("ia_ie_hv_coil2", <immersiveengineering:wirecoil:2> * 2, [
		[<contenttweaker:algae_string>, <ore:wireSteel>, <immersiveengineering:treated_wood>], 
		[<ore:wireSteel>, <ore:stickTreatedWood>, <ore:wireSteel>], 
		[<immersiveengineering:treated_wood>, <ore:wireSteel>, <contenttweaker:algae_string>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:wirecoil:2> * 6],
		[<ore:stickTreatedWood>, <ore:wireSteel> * 4, <contenttweaker:algae_string>],
		null,
		5, 16
	);
	
	recipes.addShaped("ia_ie_ev_coil", <contenttweaker:tungsten_coil>, [
		[null, <contenttweaker:tungsten_wire>, <immersiveengineering:treated_wood>], 
		[<contenttweaker:tungsten_wire>, <ore:stickTreatedWood>, <contenttweaker:tungsten_wire>], 
		[<immersiveengineering:treated_wood>, <contenttweaker:tungsten_wire>, null]
	]);
	recipes.addShaped("ia_ie_ev_coil2", <contenttweaker:tungsten_coil> * 2, [
		[<contenttweaker:algae_string>, <contenttweaker:tungsten_wire>, <immersiveengineering:treated_wood>], 
		[<contenttweaker:tungsten_wire>, <ore:stickTreatedWood>, <contenttweaker:tungsten_wire>], 
		[<immersiveengineering:treated_wood>, <contenttweaker:tungsten_wire>, <contenttweaker:algae_string>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:tungsten_coil> * 6],
		[<ore:stickTreatedWood>, <contenttweaker:tungsten_wire> * 4, <contenttweaker:algae_string>],
		null,
		5, 16
	);

	recipes.addShaped("ia_gold_coil", <contenttweaker:gold_coil>, [
		[null, <contenttweaker:gold_wire>, <immersiveengineering:treated_wood>], 
		[<contenttweaker:gold_wire>, <ore:stickTreatedWood>, <contenttweaker:gold_wire>], 
		[<immersiveengineering:treated_wood>, <contenttweaker:gold_wire>, null]
	]);
	recipes.addShaped("ia_gold_coil2", <contenttweaker:gold_coil> * 2, [
		[<contenttweaker:algae_string>, <contenttweaker:gold_wire>, <immersiveengineering:treated_wood>], 
		[<contenttweaker:gold_wire>, <ore:stickTreatedWood>, <contenttweaker:gold_wire>], 
		[<immersiveengineering:treated_wood>, <contenttweaker:gold_wire>, <contenttweaker:algae_string>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:gold_coil> * 6],
		[<ore:stickTreatedWood>, <contenttweaker:gold_wire> * 4, <contenttweaker:algae_string>],
		null,
		5, 16
	);

	recipes.remove(<immersiveengineering:metal_decoration0>);
	recipes.addShaped("ia_ie_lv_coil_block", <immersiveengineering:metal_decoration0>, [
		[<immersiveengineering:material:20>, <immersiveengineering:wirecoil>, <immersiveengineering:material:20>], 
		[<immersiveengineering:wirecoil>, <ore:stickIron>, <immersiveengineering:wirecoil>], 
		[<immersiveengineering:material:20>, <immersiveengineering:wirecoil>, <immersiveengineering:material:20>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:metal_decoration0>],
		[<ore:stickIron>, <immersiveengineering:wirecoil> * 2],
		null,
		15, 200
	);
	recipes.remove(<immersiveengineering:metal_decoration0:1>);
	recipes.addShaped("ia_ie_mv_coil_block", <immersiveengineering:metal_decoration0:1>, [
		[<immersiveengineering:material:21>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:21>], 
		[<immersiveengineering:wirecoil:1>, <ore:stickSteel>, <immersiveengineering:wirecoil:1>], 
		[<immersiveengineering:material:21>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:21>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:metal_decoration0:1>],
		[<ore:stickSteel>, <immersiveengineering:wirecoil:1> * 2],
		null,
		15, 200
	);
	recipes.remove(<immersiveengineering:metal_decoration0:2>);
	recipes.addShaped("ia_ie_hv_coil_block", <immersiveengineering:metal_decoration0:2>, [
		[<immersiveengineering:material:23>, <immersiveengineering:wirecoil:2>, <immersiveengineering:material:23>], 
		[<immersiveengineering:wirecoil:2>, <contenttweaker:duraluminum_rod>, <immersiveengineering:wirecoil:2>], 
		[<immersiveengineering:material:23>, <immersiveengineering:wirecoil:2>, <immersiveengineering:material:23>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<immersiveengineering:metal_decoration0:2>],
		[<contenttweaker:duraluminum_rod>, <immersiveengineering:wirecoil:2> * 2],
		null,
		15, 200
	);

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
		[<ore:plateIron>, <contenttweaker:duraluminum_ingot>, <ore:plateIron>], 
		[<ore:stickGold>, <contenttweaker:simple_motor>, <ore:stickLead>], 
		[<ore:plateIron>, <contenttweaker:duraluminum_ingot>, <ore:plateIron>]
	]);
	Blueprint.removeRecipe(<immersiveengineering:material:8>);
	Blueprint.addRecipe(
		"components", <immersiveengineering:material:8> * 3, 
		[<ore:plateIron>, <ore:stickGold>, <contenttweaker:duraluminum_ingot>, <contenttweaker:simple_motor>, <ore:stickLead>]
	);
	recipes.remove(<immersiveengineering:material:9>);
	recipes.addShaped("ia_steel_component", <immersiveengineering:material:9> * 2, [
		[<ore:plateSteel>, <contenttweaker:duraluminum_ingot>, <ore:plateSteel>], 
		[<ore:stickElectrum>, <contenttweaker:simple_motor>, <contenttweaker:lesmium_rod>], 
		[<ore:plateSteel>, <contenttweaker:duraluminum_ingot>, <ore:plateSteel>]
	]);
	Blueprint.removeRecipe(<immersiveengineering:material:9>);
	Blueprint.addRecipe(
		"components", <immersiveengineering:material:9> * 3, 
		[<ore:plateSteel>, <ore:stickElectrum>, <contenttweaker:duraluminum_ingot>, <contenttweaker:simple_motor>, <contenttweaker:lesmium_rod>]
	);
}

recipes.remove(<immersiveengineering:metal_device1:2>);
recipes.addShaped("ia_kinetic_dynamo", <immersiveengineering:metal_device1:2>, [
	[<ore:stickCopper>, <immersiveengineering:wirecoil:2>, <contenttweaker:zinc_rod>], 
	[<ore:stickCopper>, <immersiveengineering:wirecoil:2>, <contenttweaker:zinc_rod>], 
	[<ore:plateSteel>, <prodigytech:circuit_refined>, <ore:plateSteel>]
]);
addRecycle(<immersiveengineering:metal_device1:2>, [
	<prodigytech:circuit_refined>, <immersiveengineering:wirecoil:2> * 2, <ore:ingotCopper>.firstItem * 6, <contenttweaker:zinc_ingot> * 6,
	<ore:ingotSteel>.firstItem * 8
]);

recipes.remove(<immersiveengineering:metal_device1:3>);
recipes.addShaped("ia_thermo_gen", <immersiveengineering:metal_device1:3>, [
	[<ore:wireCopper>, <prodigytech:heat_capacitor_0>, <contenttweaker:zinc_wire>], 
	[<ore:wireCopper>, <immersiveengineering:wirecoil:2>, <contenttweaker:zinc_wire>], 
	[<ore:wireCopper>, <prodigytech:magmatic_aeroheater>, <contenttweaker:zinc_wire>]
]);
addRecycle(<immersiveengineering:metal_device1:3>, [
	<prodigytech:heat_capacitor_0:1200>, <immersiveengineering:wirecoil:2>, <ore:ingotCopper>.firstItem * 3, <contenttweaker:zinc_ingot> * 3,
	<prodigytech:magmatic_aeroheater>
]);

recipes.remove(<immersiveengineering:metal_device1:1>);
recipes.addShaped("ia_external_heater", <immersiveengineering:metal_device1:1>, [
	[<contenttweaker:duraluminum_plate>, <ore:plateCarbon>, <contenttweaker:duraluminum_plate>], 
	[<ore:plateCarbon>, <prodigytech:blower_furnace>, <ore:plateCarbon>], 
	[<contenttweaker:duraluminum_plate>, <ore:blockRedstone>, <contenttweaker:duraluminum_plate>]
]);
addRecycle(<immersiveengineering:metal_device1:1>, [
	<prodigytech:blower_furnace>, <contenttweaker:duraluminum_ingot> * 16, <ore:plateCarbon>.firstItem * 3,
	<minecraft:redstone_block>
]);

addRecycle(<immersiveengineering:metal_device1>, [
	<immersiveengineering:metal_device1:1>, <immersiveengineering:sheetmetal:9> * 7
]);


recipes.remove(<immersiveengineering:metal_device1:13>);


mods.immersivepetroleum.Lubricant.registerLubricant(<liquid:grease>, 1);
mods.immersivepetroleum.Lubricant.registerLubricant(<liquid:mekanized_lubricant>, 1);
mods.immersivepetroleum.Lubricant.registerLubricant(<liquid:starlight_lubricant>, 1);