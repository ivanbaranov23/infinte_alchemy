
import mods.mekanism.infuser;
import mods.mekanism.chemical.oxidizer;





//salt
recipes.remove(<mekanism:saltblock>);
recipes.remove(<mekanism:salt>);
recipes.addShaped("ia_salt_compession",
	<mekanism:saltblock>,
	[[<mekanism:salt>,<mekanism:salt>,<mekanism:salt>],
	[<mekanism:salt>,<mekanism:salt>,<mekanism:salt>],
	[<mekanism:salt>,<mekanism:salt>,<mekanism:salt>]]
);
recipes.addShapeless("ia_salt_decompression",
	<mekanism:salt> * 9,
	[<mekanism:saltblock>]
);

oxidizer.removeRecipe(<gas:brine>);

//infuser fun
mods.mekatweaker.InfuserType.addTypeObject(<thermalfoundation:material:1>, "GOLD", 10);
mods.mekatweaker.InfuserType.addTypeObject(<aether_legacy:golden_amber>, "GOLD", 80);
<aether_legacy:golden_amber>.addTooltip("Gives 80 gold in metallurgic infuser.");

mods.mekatweaker.InfuserType.addTypeObject(<botania:manaresource:23>, "MANA", 10);

mods.mekatweaker.InfuserType.addTypeObject(<harvestcraft:cheeseitem>, "CHEESE", 10);



infuser.addRecipe("FUNGI", 5, <mysticalworld:aubergine_seed>, <exnihilocreatio:item_material:3>);
infuser.addRecipe("FUNGI", 20, <contenttweaker:raw_mushroomite>, <contenttweaker:mushroomite_dust> * 2);
infuser.addRecipe("FUNGI", 15, <harvestcraft:ketchupitem>, <harvestcraft:mushroomketchupitem>);

infuser.addRecipe("GOLD", 20, <contenttweaker:soot>, <contenttweaker:gilded_soot>);

recipes.remove(<quantumflux:craftingpiece:1>);
infuser.addRecipe("GOLD", 500, <bigreactors:reactorcasingcores>, <quantumflux:craftingpiece:1>);

//alloy
infuser.removeRecipe(<mekanism:enrichedalloy>);
infuser.addRecipe("REDSTONE", 40, <thermalfoundation:material:354>, <mekanism:enrichedalloy>);

//gases
mods.mekanism.chemical.infuser.addRecipe(<gas:nitrogen> * 2, <gas:hydrogen> * 3, <gas:ammonia> * 2);

mods.mekanism.chemical.infuser.addRecipe(<gas:ammonia>, <gas:oxygen>, <gas:nitric_oxide>);
mods.mekanism.chemical.infuser.addRecipe(<gas:nitric_oxide>, <gas:oxygen>, <gas:nitric_dioxide>);
mods.mekanism.chemical.infuser.addRecipe(<gas:nitric_dioxide>, <gas:water> * 2, <gas:nitric_acid> * 2);

mods.mekanism.chemical.infuser.addRecipe(<gas:nitric_acid>, <gas:ammonia>, <gas:ammonium_nitrate>);

//box
recipes.remove(<mekanism:cardboardbox>);
recipes.addShaped("ia_cardbox", <mekanism:cardboardbox>, [
	[<ore:dustWood>, <ore:dustWood>, <ore:dustWood>],
	[<contenttweaker:quest_coin>, <actuallyadditions:block_misc:4>, <contenttweaker:quest_coin>],
	[<ore:dustWood>, <ore:dustWood>, <ore:dustWood>]
]);
recipes.addShaped("ia_cardbox2", <mekanism:cardboardbox>, [
	[<ore:dustWood>, <contenttweaker:blood_shard2>, <ore:dustWood>],
	[<bloodmagic:component:18>, <actuallyadditions:block_misc:4>, <bloodmagic:component:18>],
	[<ore:dustWood>,<contenttweaker:blood_shard2>, <ore:dustWood>]
]);


//plastic blocks
for i in 0 to 16{
	recipes.removeByRegex("mekanism:plasticblock_" ~ i);
}

recipes.addShaped("ia_plasticblock", <mekanism:plasticblock:15> * 2, [
	[<mekanism:polyethene:2>, <mekanism:polyethene:2>, <mekanism:polyethene:2>], 
	[<mekanism:polyethene:2>, <contenttweaker:medical_alloy_wire>, <mekanism:polyethene:2>], 
	[<mekanism:polyethene:2>, <mekanism:polyethene:2>, <mekanism:polyethene:2>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<mekanism:plasticblock:15> * 4],
	[
		<mekanism:polyethene:2> * 8
	], <liquid:medical_alloy> * 144,
	20, 250
);

//parts
recipes.remove(<mekanism:electrolyticcore>);
recipes.addShaped("ia_electrolyticcore", <mekanism:electrolyticcore>, [
	[<contenttweaker:gastight_steel_rod>, <immersiveengineering:metal_decoration0:2>, <contenttweaker:gastight_steel_rod>], 
	[<ore:gearRedAlloy>, <contenttweaker:mekanical_core>, <ore:gearElectrotineAlloy>], 
	[<contenttweaker:watertight_steel_rod>, <immersiveengineering:metal_decoration0:2>, <contenttweaker:watertight_steel_rod>]
]);
{//battery and cube
	recipes.remove(<mekanism:energytablet>);
	recipes.addShaped("ia_mek_battery", <mekanism:energytablet>, [
		[<ore:alloyAdvanced>, <contenttweaker:mekanized_steel_ingot> | <contenttweaker:electric_manyullyn_ingot> | <alchemistry:ingot:74>, <ore:alloyAdvanced>], 
		[<ore:circuitBasic>, <ore:plateOsgloglas>, <ore:circuitBasic>], 
		[<ore:alloyAdvanced>, <contenttweaker:mekanized_steel_ingot> | <contenttweaker:electric_manyullyn_ingot> | <alchemistry:ingot:74>, <ore:alloyAdvanced>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<mekanism:energytablet>],
		[
			<mekanism:enrichedalloy> * 2,
			<contenttweaker:mekanized_steel_ingot> | <contenttweaker:electric_manyullyn_ingot> | <alchemistry:ingot:74>,
			<ore:circuitBasic>
		], <liquid:osgloglas> * 288,
		10, 250
	);

	recipes.remove(<mekanism:energycube>.withTag({tier: 0}));
	recipes.addShaped("mek_energycube0", <mekanism:energycube>.withTag({tier: 0}), [
		[<contenttweaker:electric_manyullyn_rod>, <contenttweaker:mekanical_core>, <contenttweaker:electric_manyullyn_rod>], 
		[<mekanism:energytablet>, <immersiveengineering:metal_device0:2>, <mekanism:energytablet>], 
		[<immersiveengineering:wirecoil:2>, <contenttweaker:mekanical_core>, <immersiveengineering:wirecoil:2>]
	]);
}


{//tanks
	recipes.remove(<mekanism:gastank>.withTag({tier: 0}));
	recipes.addShaped("ia_gastank0", <mekanism:gastank>.withTag({tier: 0}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit>, <immersiveengineering:wirecoil:5>], 
		[<moreplates:osmium_plate>, <contenttweaker:tank>, <moreplates:osmium_plate>], 
		[<immersiveengineering:wirecoil:5>, <contenttweaker:mekanical_core>, <immersiveengineering:wirecoil:5>]
	]);
	
	recipes.remove(<mekanism:gastank>.withTag({tier: 1}));
	recipes.addShaped("ia_gastank1", <mekanism:gastank>.withTag({tier: 1}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit:1>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:tank>, <contenttweaker:mekanized_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <mekanism:gastank>.withTag({tier: 0}), <immersiveengineering:wirecoil:5>]
	]);

	recipes.remove(<mekanism:gastank>.withTag({tier: 2}));
	recipes.addShaped("ia_gastank2", <mekanism:gastank>.withTag({tier: 2}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit:2>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:gastight_steel_plate>, <contenttweaker:tank>, <contenttweaker:gastight_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <mekanism:gastank>.withTag({tier: 1}), <immersiveengineering:wirecoil:5>]
	]);

	recipes.remove(<mekanism:gastank>.withTag({tier: 3}));
	recipes.addShaped("ia_gastank3", <mekanism:gastank>.withTag({tier: 3}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit:3>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:gastight_steel_plate>, <contenttweaker:tank>, <contenttweaker:gastight_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <mekanism:gastank>.withTag({tier: 2}), <immersiveengineering:wirecoil:5>]
	]);


	recipes.remove(<mekanism:machineblock2:11>);
	recipes.addShaped("ia_mek_tank_0", <mekanism:machineblock2:11>.withTag({tier: 0}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:mekanized_steel_plate>, <thermalexpansion:tank>, <contenttweaker:mekanized_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <contenttweaker:mekanical_core>, <immersiveengineering:wirecoil:5>]
	]);

	recipes.addShaped("ia_mek_tank_1", <mekanism:machineblock2:11>.withTag({tier: 1}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit:1>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:mekanized_steel_plate>, <thermalexpansion:tank>, <contenttweaker:mekanized_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <mekanism:machineblock2:11>.withTag({tier: 0}), <immersiveengineering:wirecoil:5>]
	]);

	recipes.addShaped("ia_mek_tank_2", <mekanism:machineblock2:11>.withTag({tier: 2}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit:1>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:mekanized_steel_plate>, <thermalexpansion:tank>, <contenttweaker:mekanized_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <mekanism:machineblock2:11>.withTag({tier: 1}), <immersiveengineering:wirecoil:5>]
	]);

	recipes.addShaped("ia_mek_tank_3", <mekanism:machineblock2:11>.withTag({tier: 3}), [
		[<immersiveengineering:wirecoil:5>, <mekanism:controlcircuit:1>, <immersiveengineering:wirecoil:5>], 
		[<contenttweaker:mekanized_steel_plate>, <thermalexpansion:tank>, <contenttweaker:mekanized_steel_plate>], 
		[<immersiveengineering:wirecoil:5>, <mekanism:machineblock2:11>.withTag({tier: 2}), <immersiveengineering:wirecoil:5>]
	]);
}

{//machines
	{//items
		recipes.remove(<mekanism:machineblock:8>);
		recipes.addShaped("ia_met_infuser", <mekanism:machineblock:8>, [
			[<contenttweaker:mushroomite_gear>, <contenttweaker:mushroomite_gear>, null], 
			[<mekanism:basicblock:8>, <tconstruct:casting>, <contenttweaker:mekanized_steel_rod>], 
			[<contenttweaker:eliamondin>, <thermalfoundation:material:513>, <contenttweaker:mekanized_steel_rod>]
		]);
		recipes.remove(<mekanism:machineblock:1>);
		recipes.addShaped("ia_osmium_compressor", <mekanism:machineblock:1>, [
			[<contenttweaker:eliamondin>, <contenttweaker:mekanized_steel_block>, <contenttweaker:eliamondin>], 
			[<ore:alloyElite>, <mekanism:basicblock:8>, <ore:alloyElite>], 
			[<contenttweaker:mekanized_steel_plate>, <ore:gearOsmium>, <contenttweaker:mekanized_steel_plate>]
		]);
		recipes.remove(<mekanism:machineblock>);
		recipes.addShaped("ia_enrichment_chamber", <mekanism:machineblock>, [
			[<contenttweaker:spicy_enriched_bioblend>, <prodigytech:magnetic_reassembler>, <contenttweaker:spicy_enriched_bioblend>], 
			[<thermalfoundation:material:656>, <mekanism:basicblock:8>, <thermalfoundation:material:656>], 
			[<ore:circuitAdvanced>, <appliedenergistics2:quartz_growth_accelerator>, <ore:circuitAdvanced>]
		]);
	
		recipes.remove(<mekanism:machineblock:3>);
		recipes.addShaped("ia_mek_crusher", <mekanism:machineblock:3>, [
			[<contenttweaker:mekanized_steel_gear>, <thermalfoundation:material:656>, <contenttweaker:mekanized_steel_gear>], 
			[<contenttweaker:eliamondin>, <mekanism:basicblock:8>, <contenttweaker:eliamondin>], 
			[<ore:alloyElite>, <ore:gearOsgloglas>, <ore:alloyElite>]
		]);
		recipes.remove(<mekanism:machineblock2:5>);
		recipes.addShaped("ia_mek_sawmill", <mekanism:machineblock2:5>, [
			[<thermalfoundation:material:657>, null, <thermalfoundation:material:657>], 
			[<mekanism:controlcircuit:1>, <mekanism:basicblock:8>, <mekanism:controlcircuit:1>], 
			[<contenttweaker:mekanized_steel_plate>, <contenttweaker:mekanical_core>, <contenttweaker:mekanized_steel_plate>]
		]);
	}

	recipes.remove(<mekanism:machineblock:12>);
	recipes.addShaped("ia_mek_pump", <mekanism:machineblock:12>, [
		[null, <extrautils2:ingredients:8>, null], 
		[<mekanism:controlcircuit:1>, <mekanism:basicblock:8>, <mekanism:controlcircuit:1>], 
		[<contenttweaker:watertight_steel_plate>, <immersiveengineering:metal_device0:5>, <contenttweaker:watertight_steel_plate>]
	]);
	recipes.remove(<mekanism:filterupgrade>);
	recipes.addShaped("ia_filterupgrade", <mekanism:filterupgrade>, [
		[<mekanism:atomicalloy>, <enderio:item_fluid_filter>, <mekanism:atomicalloy>], 
		[<enderio:item_fluid_filter>, <mekanism:controlcircuit:2>, <enderio:item_fluid_filter>], 
		[<mekanism:atomicalloy>, <enderio:item_fluid_filter>, <mekanism:atomicalloy>]
	]);

	{//gas
		recipes.remove(<mekanism:machineblock2>);
		recipes.addShaped("ia_rotary_condenser", <mekanism:machineblock2>, [
			[<contenttweaker:gastight_steel_plate>, <contenttweaker:mekanized_steel_plate>, <contenttweaker:watertight_steel_plate>], 
			[<mekanism:gastank>, <mekanism:basicblock:8>, <mekanism:machineblock2:11>], 
			[<contenttweaker:gastight_steel_plate>, <contenttweaker:mekanized_steel_plate>, <contenttweaker:watertight_steel_plate>]
		]);
		recipes.remove(<mekanism:machineblock2:4>);
		recipes.addShaped("ia_electrolizer", <mekanism:machineblock2:4>, [
			[<contenttweaker:mekanized_steel_rod>, <mekanism:electrolyticcore>, <contenttweaker:mekanized_steel_rod>], 
			[<ore:circuitAdvanced>, <mekanism:basicblock:8>, <ore:circuitAdvanced>], 
			[<contenttweaker:mekanized_steel_plate>, <contenttweaker:ra_burner>, <contenttweaker:mekanized_steel_plate>]
		]);
		recipes.remove(<mekanism:machineblock2:1>);
		recipes.addShaped("ia_chem_oxydizer", <mekanism:machineblock2:1>, [
			[null, <mekanism:controlcircuit:2>, null], 
			[<ironchest:iron_chest:1>, <mekanism:basicblock:8>, <mekanism:gastank>.withTag({tier: 2})], 
			[<moreplates:osmiridium_plate>, <contenttweaker:ra_burner>, <moreplates:osmiridium_plate>]
		]);
		recipes.remove(<mekanism:machineblock2:2>);
		recipes.addShaped("ia_chem_infuser", <mekanism:machineblock2:2>, [
			[null, <contenttweaker:mekanized_steel_plate>, null], 
			[<ore:circuitElite>, <mekanism:gastank>.withTag({tier: 2}), <ore:circuitElite>], 
			[<contenttweaker:mekanized_steel_plate>, <mekanism:basicblock:8>, <contenttweaker:mekanized_steel_plate>]
		]);
		recipes.remove(<mekanism:machineblock2:10>);
		recipes.addShaped("ia_prc", <mekanism:machineblock2:10>, [
			[<mekanism:basicblock:9>, <contenttweaker:gastight_steel_plate>, <contenttweaker:gastight_steel_plate>], 
			[<mekanism:basicblock:9>, <mekanism:electrolyticcore>, <contenttweaker:gastight_steel_plate>], 
			[<mekanism:gastank>.withTag({tier: 2}), <mekanism:basicblock:8>, <mekanism:gastank>.withTag({tier: 2})]
		]);
	}

	recipes.remove(<mekanism:machineblock2:6>);
	recipes.addShaped("ia_chem_dissolver_chamber", <mekanism:machineblock2:6>, [
		[<contenttweaker:mekanized_steel_plate>, <mekanism:electrolyticcore>, <contenttweaker:mekanized_steel_plate>], 
		[<contenttweaker:gastight_steel_gear>, <mekanism:basicblock:8>, <contenttweaker:gastight_steel_gear>], 
		[<ore:circuitUltimate>, <contenttweaker:ra_burner>, <ore:circuitUltimate>]
	]);
	recipes.remove(<mekanism:machineblock2:7>);
	recipes.addShaped("ia_chem_washer", <mekanism:machineblock2:7>, [
		[<contenttweaker:mekanized_steel_plate>, <thermalexpansion:device>, <contenttweaker:mekanized_steel_plate>], 
		[<twilightforest:alpha_fur>, <mekanism:basicblock:8>, <twilightforest:alpha_fur>], 
		[<contenttweaker:mekanized_steel_plate>, <ore:circuitUltimate>, <contenttweaker:mekanized_steel_plate>]
	]);
	recipes.remove(<mekanism:machineblock:9>);
	recipes.addShaped("ia_mek_purification_chamber", <mekanism:machineblock:9>, [
		[<contenttweaker:mekanized_steel_plate>, <ore:circuitElite>, <contenttweaker:mekanized_steel_plate>], 
		[<ore:rodHDPE>, <mekanism:machineblock>, <ore:rodHDPE>], 
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:ra_burner>, <contenttweaker:mekanized_steel_plate>]
	]);
	recipes.remove(<mekanism:machineblock2:3>);
	recipes.addShaped("ia_mek_chemical_injection_chamber", <mekanism:machineblock2:3>, [
		[<mekanism:basicblock:9>, <ore:circuitUltimate>, <mekanism:basicblock:9>], 
		[<ore:rodHDPE>, <mekanism:machineblock:9>, <ore:rodHDPE>], 
		[<mekanism:basicblock:9>, <mekanism:electrolyticcore>, <mekanism:basicblock:9>]
	]);
	recipes.remove(<mekanism:machineblock2:8>);
	recipes.addShaped("ia_mek_chem_crystalizer", <mekanism:machineblock2:8>, [
		[<mekanism:basicblock2:7>, <mekanism:gastank>.withTag({tier: 3}), <mekanism:basicblock2:7>], 
		[<ore:battery>, <mekanism:machineblock:9>, <ore:battery>], 
		[<mekanism:basicblock2:7>, <mekanism:electrolyticcore>, <mekanism:basicblock2:7>]
	]);

	recipes.remove(<mekanism:machineblock3:1>);
	recipes.addShaped("ia_mek_solar", <mekanism:machineblock3:1>, [
		[null, <solarflux:solar_panel_5> | <contenttweaker:neutronium_mirror>, null], 
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:gastight_steel_rod>, <contenttweaker:mekanized_steel_plate>], 
		[<mekanism:gastank>.withTag({tier: 3}), <mekanism:basicblock:8>, <mekanism:gastank>.withTag({tier: 3})]
	]);

	recipes.remove(<mekanism:machineblock2:13>);
	recipes.addShaped("ia_mek_laser", <mekanism:machineblock2:13>, [
		[<actuallyadditions:block_laser_relay>, <quantumflux:craftingpiece:2>, null], 
		[<mekanism:basicblock:8>, <quantumflux:craftingpiece:5>, <actuallyadditions:block_crystal_empowered>], 
		[<actuallyadditions:block_laser_relay>, <quantumflux:craftingpiece:2>, null]
	]);
	recipes.remove(<mekanism:machineblock2:14>);
	recipes.addShaped("ia_mek_laser_redirect", <mekanism:machineblock2:14>, [
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:laser_mirror>, <contenttweaker:mekanized_steel_plate>], 
		[<aether_legacy:ice_ring>.noReturn(), <mekanism:basicblock2:3>, <actuallyadditions:block_crystal_empowered>], 
		[<contenttweaker:mekanized_steel_plate>, <contenttweaker:laser_mirror>, <contenttweaker:mekanized_steel_plate>]
	]);

	recipes.remove(<mekanism:machineblock:4>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:machineblock:4>.withTag({mekData: {}}), [
		[<contenttweaker:awaken_uru_plate>, <enderio:item_material:68>, <contenttweaker:awaken_uru_plate>, <enderio:item_material:68>, <contenttweaker:awaken_uru_plate>], 
		[<enderio:item_material:68>, <contenttweaker:rock_cell>, <extrautils2:opinium:8>, <contenttweaker:rock_cell>, <enderio:item_material:68>], 
		[<enderio:item_material:68>, <mekanism:teleportationcore>, <actuallyadditions:block_misc:8>, <mekanism:teleportationcore>, <enderio:item_material:68>], 
		[<enderio:item_material:68>, <immersiveengineering:metal_device1:7>, <mekanism:teleportationcore>, <immersiveengineering:metal_device1:7>, <enderio:item_material:68>], 
		[<contenttweaker:awaken_uru_plate>, <actuallyadditions:item_drill:3>, <actuallyadditions:item_drill:3>, <actuallyadditions:item_drill:3>, <contenttweaker:awaken_uru_plate>]
	]);



	//factories
	recipes.remove(<mekanism:machineblock:5>);
	recipes.remove(<mekanism:machineblock:6>);
	recipes.remove(<mekanism:machineblock:7>);
}

{//tiers
	recipes.remove(<mekanism:tierinstaller>);
	recipes.addShaped("ia_tierinstaller", <mekanism:tierinstaller>, [
		[<mekanism:enrichedalloy>, <mekanism:controlcircuit:1>, <mekanism:enrichedalloy>], 
		[<mekanism:controlcircuit:1>, <thermalfoundation:upgrade:1>, <mekanism:controlcircuit:1>], 
		[<mekanism:enrichedalloy>, <contenttweaker:mekanical_core>, <mekanism:enrichedalloy>]
	]);
	recipes.addShaped("ia_tierinstaller02", <mekanism:tierinstaller> * 2, [
		[<mekanism:enrichedalloy>, <mekanism:controlcircuit:1>, <mekanism:enrichedalloy>], 
		[<netherite:netheriteingot>, <thermalfoundation:upgrade:1>, <netherite:netheriteingot>], 
		[<mekanism:enrichedalloy>, <contenttweaker:mekanical_core>, <mekanism:enrichedalloy>]
	]);

	recipes.remove(<mekanism:tierinstaller:1>);
	recipes.addShaped("ia_tierinstaller1", <mekanism:tierinstaller:1>, [
		[<mekanism:reinforcedalloy>, <mekanism:controlcircuit:2>, <mekanism:reinforcedalloy>], 
		[<mekanism:controlcircuit:2>, <thermalfoundation:upgrade:2>, <mekanism:controlcircuit:2>], 
		[<mekanism:reinforcedalloy>, <contenttweaker:gearbox_normal>, <mekanism:reinforcedalloy>]
	]);
	recipes.addShaped("ia_tierinstaller12", <mekanism:tierinstaller:1> * 2, [
		[<mekanism:reinforcedalloy>, <mekanism:controlcircuit:2>, <mekanism:reinforcedalloy>], 
		[<netherite:netheriteingot>, <thermalfoundation:upgrade:2>, <netherite:netheriteingot>], 
		[<mekanism:reinforcedalloy>, <contenttweaker:gearbox_normal>, <mekanism:reinforcedalloy>]
	]);

	recipes.remove(<mekanism:tierinstaller:2>);
	recipes.addShaped("ia_tierinstaller2", <mekanism:tierinstaller:2>, [
		[<mekanism:atomicalloy>, <mekanism:controlcircuit:3>, <mekanism:atomicalloy>], 
		[<mekanism:controlcircuit:3>, <thermalfoundation:upgrade:3>, <mekanism:controlcircuit:3>], 
		[<mekanism:atomicalloy>, <mekanism:electrolyticcore>, <mekanism:atomicalloy>]
	]);
	recipes.addShaped("ia_tierinstaller22", <mekanism:tierinstaller:2> * 2, [
		[<mekanism:atomicalloy>, <mekanism:controlcircuit:3>, <mekanism:atomicalloy>], 
		[<netherite:netheriteingot>, <thermalfoundation:upgrade:3>, <netherite:netheriteingot>], 
		[<mekanism:atomicalloy>, <mekanism:electrolyticcore>, <mekanism:atomicalloy>]
	]);
	recipes.remove(<mekanism:tierinstaller:3>);

	recipes.remove(<mekanism:speedupgrade>);
	recipes.addShaped("ia_speedupgrade", <mekanism:speedupgrade>, [
		[null, <mekanism:compressedredstone>, null], 
		[<minecraft:glass>, <contenttweaker:mekanical_core>, <minecraft:glass>], 
		[null, <mekanism:compressedredstone>, null]
	]);
	recipes.remove(<mekanism:energyupgrade>);
	recipes.addShaped("ia_energyupgrade", <mekanism:energyupgrade>, [
		[null, <mekanism:compressedredstone>, null], 
		[<minecraft:glass>, <mekanism:energytablet>, <minecraft:glass>], 
		[null, <mekanism:compressedredstone>, null]
	]);

	recipes.remove(<mekanism:speedupgrade>);
	recipes.addShaped("ia_speedupgrade2", <mekanism:speedupgrade> * 2, [
		[null, <mekanism:compressedredstone>, null], 
		[<erebus:amber_glass>, <contenttweaker:mekanical_core>, <erebus:amber_glass>], 
		[null, <mekanism:compressedredstone>, null]
	]);
	recipes.remove(<mekanism:energyupgrade>);
	recipes.addShaped("ia_energyupgrade2", <mekanism:energyupgrade> * 2, [
		[null, <mekanism:compressedredstone>, null], 
		[<erebus:amber_glass>, <mekanism:energytablet>, <erebus:amber_glass>], 
		[null, <mekanism:compressedredstone>, null]
	]);
}

{//mb parts
	recipes.remove(<mekanism:basicblock:9>);
	recipes.addShaped("ia_mek_tank_wall", <mekanism:basicblock:9> * 2, [
		[<ore:plateSteel>, <contenttweaker:mekanized_steel_plate>, <ore:plateSteel>], 
		[<contenttweaker:watertight_steel_plate>, <openblocks:tank>, <contenttweaker:watertight_steel_plate>], 
		[<ore:plateSteel>, <contenttweaker:mekanized_steel_plate>, <ore:plateSteel>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<mekanism:basicblock:9> * 4],
		[<openblocks:tank>, <contenttweaker:mekanized_steel_plate> * 2],
		<liquid:watertight_steel> * 576,
		10, 64
	);

	recipes.remove(<mekanism:basicblock:10>);
	recipes.addShaped("ia_mek_structure_glass", <mekanism:basicblock:10> * 4, [
		[<enderio:block_fused_glass>, <mekanism:basicblock:9>, <enderio:block_fused_glass>], 
		[<mekanism:basicblock:9>, <enderio:block_fused_glass>, <mekanism:basicblock:9>], 
		[<enderio:block_fused_glass>, <mekanism:basicblock:9>, <enderio:block_fused_glass>]
	]);

	recipes.remove(<mekanism:basicblock2:7>);
	recipes.addShaped("ia_mek_boiler", <mekanism:basicblock2:7> * 2, [
		[<ore:alloyElite>, <mekanism:basicblock:9>, <ore:alloyElite>], 
		[<mekanism:basicblock:9>, <thermalexpansion:augment:640>, <mekanism:basicblock:9>], 
		[<ore:alloyElite>, <mekanism:basicblock:9>, <ore:alloyElite>]
	]);

	recipes.remove(<mekanism:basicblock2>);
	recipes.addShaped("ia_evaporation_block", <mekanism:basicblock2> * 4, [
		[<mekanism:basicblock:9>, <contenttweaker:gastight_steel_gear>, <mekanism:basicblock:9>], 
		[<ore:plateKnightmetal>, <ore:plateOsgloglas>, <ore:plateKnightmetal>], 
		[<mekanism:basicblock:9>, <contenttweaker:gastight_steel_gear>, <mekanism:basicblock:9>]
	]);
	recipes.remove(<mekanism:basicblock:14>);
	recipes.addShaped("ia_evaporation_controller", <mekanism:basicblock:14>, [
		[<mekanism:basicblock2>, <mekanism:controlcircuit:3>, <mekanism:basicblock2>], 
		[<mekanism:electrolyticcore>, <twilightforest:tower_device:12>, <mekanism:electrolyticcore>], 
		[<mekanism:basicblock2>, <alchemistry:evaporator>, <mekanism:basicblock2>]
	]);

	recipes.remove(<mekanism:basicblock2:5>);
	recipes.addShaped("ia_heating_element", <mekanism:basicblock2:5>, [
		[<thermalfoundation:material:1024>, <contenttweaker:hot_plate>, <thermalfoundation:material:1024>], 
		[<contenttweaker:thermal_plate>, <mekanism:basicblock:8>, <contenttweaker:thermal_plate>], 
		[<thermalfoundation:material:1024>, <prodigytech:heat_capacitor_1>, <thermalfoundation:material:1024>]
	]);

	recipes.remove(<mekanism:machineblock3:4>);
	recipes.addShaped("ia_resistive_heater", <mekanism:machineblock3:4>, [
		[<extrautils2:ingredients:13>, <prodigytech:heat_capacitor_2>, <extrautils2:ingredients:13>], 
		[<contenttweaker:electric_manyullyn_plate>, <mekanism:basicblock2:5>, <contenttweaker:electric_manyullyn_plate>], 
		[<immersiveengineering:metal_device1:1>, <mekanism:basicblock:8>, <immersiveengineering:metal_device1:1>]
	]);

	{//induction matrix
		recipes.addShaped("power_tap_empty", <contenttweaker:power_tap_empty> * 2, [
			[<contenttweaker:platinum_wire>, <contenttweaker:mekanized_steel_plate>, <contenttweaker:platinum_wire>], 
			[<immersiveengineering:connector:5>, <immersiveengineering:metal_decoration0:2>, <immersiveengineering:connector:5>], 
			[<contenttweaker:tungsten_wire>, <mekanism:energytablet>, <contenttweaker:tungsten_wire>]
		]);
		mods.mekanism.compressor.addRecipe(
			<contenttweaker:power_tap_empty>,
			<gas:fusionfuel>, 
			<contenttweaker:power_tap>
		);
		scripts.content_machines.addAssemblerRecipe(
			[<contenttweaker:power_tap> * 3],
			[
				<contenttweaker:platinum_wire> * 3,
				<contenttweaker:tungsten_wire> * 3,
				<mekanism:energytablet>,
				<contenttweaker:mekanized_steel_plate>,
				<immersiveengineering:metal_decoration0:2>
			], <liquid:liquidfusionfuel> * 500,
			10, 500
		);

		//casing
		recipes.remove(<mekanism:basicblock2:1>);
		recipes.addShaped("mek_induction_casing1", <mekanism:basicblock2:1> * 2, [
			[<alchemistry:ingot:74> | <immersiveengineering:wirecoil:7> | <contenttweaker:insulation_strand>, <contenttweaker:electric_manyullyn_plate>, <alchemistry:ingot:74> | <immersiveengineering:wirecoil:7> | <contenttweaker:insulation_strand>], 
			[<thermalfoundation:material:352>, <mekanism:energytablet>, <thermalfoundation:material:352>], 
			[<alchemistry:ingot:74> | <immersiveengineering:wirecoil:7> | <contenttweaker:insulation_strand>, <contenttweaker:electric_manyullyn_plate>, <alchemistry:ingot:74> | <immersiveengineering:wirecoil:7> | <contenttweaker:insulation_strand>]
		]);
		recipes.addShaped("mek_induction_casing2", <mekanism:basicblock2:1> * 8, [
			[<alchemistry:ingot:74> | <contenttweaker:insulation_strand>, <contenttweaker:insulation_fabric>, <alchemistry:ingot:74> | <contenttweaker:insulation_strand>], 
			[<contenttweaker:mekanized_steel_plate>, <mekanism:energytablet>, <contenttweaker:mekanized_steel_plate>], 
			[<alchemistry:ingot:74> | <contenttweaker:insulation_strand>, <contenttweaker:insulation_fabric>, <alchemistry:ingot:74> | <contenttweaker:insulation_strand>]
		]);
		recipes.remove(<mekanism:basicblock2:2>);
		recipes.addShaped("mek_induction_port", <mekanism:basicblock2:2>, [
			[<contenttweaker:power_core_active>, <mekanism:controlcircuit:2>, <contenttweaker:power_core_active>], 
			[<contenttweaker:power_tap>, <mekanism:basicblock2:1>, <contenttweaker:power_tap>], 
			[<contenttweaker:power_core_active>, <mekanism:controlcircuit:2>, <contenttweaker:power_core_active>]
		]);

		//innards
		recipes.remove(<mekanism:basicblock2:3>.withTag({tier: 0}));
		recipes.addShaped("mek_induction_matrix_cell", <mekanism:basicblock2:3>.withTag({tier: 0}), [
			[<alchemistry:ingot:74>, <mekanism:energytablet>, <alchemistry:ingot:74>], 
			[<mekanism:energytablet>, <mekanism:energycube>.withTag({tier: 0}), <mekanism:energytablet>], 
			[<alchemistry:ingot:74>, <mekanism:energytablet>, <alchemistry:ingot:74>]
		]);
		recipes.remove(<mekanism:basicblock2:4>.withTag({tier: 0}));
		recipes.addShaped("mek_induction_matrix_provider", <mekanism:basicblock2:4>.withTag({tier: 0}), [
			[<alchemistry:ingot:74>, <contenttweaker:power_tap>, <alchemistry:ingot:74>], 
			[<mekanism:energytablet>, <mekanism:energycube>.withTag({tier: 0}), <mekanism:energytablet>], 
			[<alchemistry:ingot:74>, <contenttweaker:mekanical_core>, <alchemistry:ingot:74>]
		]);
	}
}

{//teleporter
	recipes.remove(<mekanism:basicblock:7>);
	recipes.addShaped("ia_mek_portal1", <mekanism:basicblock:7> * 6, [
		[<redstonearsenal:material:128>, <mekanism:teleportationcore>, <redstonearsenal:material:128>], 
		[<thermalfoundation:glass_alloy:7>, <thermalexpansion:frame>, <thermalfoundation:glass_alloy:7>], 
		[<redstonearsenal:material:128>, <mekanism:teleportationcore>, <redstonearsenal:material:128>]
	]);

	recipes.remove(<mekanism:machineblock:11>);
	recipes.addShaped("ia_mek_portal2", <mekanism:machineblock:11>, [
		[<redstonearsenal:storage>, <mekanism:teleportationcore>, <redstonearsenal:storage>], 
		[<mekanism:basicblock:7>, <mekanism:basicblock:7>, <mekanism:basicblock:7>], 
		[<redstonearsenal:storage>, <mekanism:teleportationcore>, <redstonearsenal:storage>]
	]);
}

recipes.remove(<mekanism:machineblock:13>);
recipes.addShaped("ia_personal_chest", <mekanism:machineblock:13>, [
	[<contenttweaker:mekanized_steel_plate>, <ore:circuitElite>, <contenttweaker:mekanized_steel_plate>], 
	[<ironchest:iron_chest:6>, <appliedenergistics2:smooth_sky_stone_chest>, <ironchest:iron_chest:6>], 
	[<contenttweaker:mekanized_steel_plate>, <ore:circuitElite>, <contenttweaker:mekanized_steel_plate>]
]);

recipes.remove(<mekanism:atomicdisassembler>);
recipes.addShaped("ia_atomicdisassembler", <mekanism:atomicdisassembler>, [
	[<actuallyadditions:block_atomic_reconstructor>, <actuallyadditions:item_battery_quintuple>, <enderio:item_dark_steel_pickaxe>], 
	[null, <contenttweaker:rainbow_crystal_cluster>, null], 
	[null, <contenttweaker:tignalum_rod>, null]
]);

mods.mekanism.GasConversion.register(<minecraft:experience_bottle>, <gas:xpjuice> * 150);
mods.mekanism.chemical.oxidizer.addRecipe(<minecraft:experience_bottle>, <gas:xpjuice> * 150);

scripts.jei.addJEIhint(
	[], [],
	[
		<mekanism:filterupgrade>, <mekanism:machineblock:12>
	], [
		<forge:bucketfilled>.withTag({FluidName: "heavywater", Amount: 1000})
	], [
		<liquid:heavywater>
	]
);