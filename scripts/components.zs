import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeBuilder;
import mods.immersiveengineering.Blueprint;
import mods.mekanism.infuser;


{//IE
	//antimony
	mods.immersiveengineering.AlloySmelter.addRecipe(
		<contenttweaker:solder> * 6, 
		<thermalfoundation:material:129> * 2,
		<alchemistry:ingot:51>,
		200
	);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:solder> * 8, 
		<thermalfoundation:material:129> * 2,
		<alchemistry:ingot:51>,
		2000
	);


}

mods.immersiveengineering.BottlingMachine.addRecipe(<projectred-core:resource_item>, <contenttweaker:electric_stone_dust>, <liquid:concrete> * 250);
mods.thermalexpansion.Transposer.addFillRecipe(<projectred-core:resource_item>, <contenttweaker:electric_stone_dust>, <liquid:concrete> * 200, 3000);

mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:power_core_active>, <contenttweaker:power_core_inactive>, <liquid:napalm> * 750, 10000);

{//xu2
	recipes.addShaped("ia_resonating_plate", <contenttweaker:resonating_plate>, [
		[null, <extrautils2:powertransmitter>, null],
		[<extrautils2:powertransmitter>, <moreplates:enchanted_plate>, <extrautils2:powertransmitter>],
		[null, <extrautils2:powertransmitter>, null]
	]);
	mods.thermalexpansion.Enchanter.addRecipe(
		<contenttweaker:resonating_plate>,
		<moreplates:enchanted_plate>, <extrautils2:powertransmitter> * 2,
		40000, 2000, false
	);
}

{//thermal
	//sanded
	mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:sanded_rod>, <contenttweaker:thermal_rod>, <liquid:khnumite> * 125, 10000);
	
	//gold coil
	recipes.remove(<thermalfoundation:material:513>);
	recipes.addShaped("ia_reception_coil", <thermalfoundation:material:513>, [
		[<immersiveengineering:material:8>, <immersiveengineering:wirecoil:5>, <ore:gearGold>], 
		[<immersiveengineering:wirecoil:5>, <contenttweaker:thermal_rod>, <immersiveengineering:wirecoil:5>], 
		[<ore:gearGold>, <immersiveengineering:wirecoil:5>, <immersiveengineering:material:8>]
	]);
	recipes.addShaped("ia_reception_coil2", <thermalfoundation:material:513> * 3, [
		[<immersiveengineering:material:8>, <immersiveengineering:wirecoil:5>, <ore:gearGold>], 
		[<immersiveengineering:wirecoil:5>, <contenttweaker:sanded_rod>, <immersiveengineering:wirecoil:5>], 
		[<ore:gearGold>, <immersiveengineering:wirecoil:5>, <immersiveengineering:material:8>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:material:513> * 4], 
		[<immersiveengineering:wirecoil:5> * 2, <thermalfoundation:material:25>, <contenttweaker:sanded_rod>, <immersiveengineering:material:8>],
		null,
		10, 128
	);

	//silver coil
	recipes.remove(<thermalfoundation:material:514>);
	recipes.addShaped("ia_transmission_coil", <thermalfoundation:material:514>, [
		[<immersiveengineering:material:8>, <immersiveengineering:wirecoil:5>, <ore:gearSilver>], 
		[<immersiveengineering:wirecoil:5>, <contenttweaker:thermal_rod>, <immersiveengineering:wirecoil:5>], 
		[<ore:gearSilver>, <immersiveengineering:wirecoil:5>, <immersiveengineering:material:8>]
	]);
	recipes.addShaped("ia_transmission_coil2", <thermalfoundation:material:514> * 3, [
		[<immersiveengineering:material:8>, <immersiveengineering:wirecoil:5>, <ore:gearSilver>], 
		[<immersiveengineering:wirecoil:5>, <contenttweaker:sanded_rod>, <immersiveengineering:wirecoil:5>], 
		[<ore:gearSilver>, <immersiveengineering:wirecoil:5>, <immersiveengineering:material:8>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:material:514> * 4], 
		[<immersiveengineering:wirecoil:5> * 2, <thermalfoundation:material:258>, <contenttweaker:sanded_rod>, <immersiveengineering:material:8>],
		null,
		10, 128
	);

	//electrum coil
	recipes.remove(<thermalfoundation:material:515>);
	recipes.addShaped("ia_conductance_coil", <thermalfoundation:material:515> * 2, [
		[<ore:gearElectrum>, <thermalfoundation:material:514>, <immersiveengineering:material:9>], 
		[<thermalfoundation:material:513>, <immersiveengineering:metal_decoration0:3>, <thermalfoundation:material:514>], 
		[<immersiveengineering:material:9>, <thermalfoundation:material:513>, <ore:gearElectrum>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:material:515> * 4], 
		[<immersiveengineering:material:9>, <thermalfoundation:material:513>, <thermalfoundation:material:514>, <thermalfoundation:material:289>, <immersiveengineering:metal_decoration0:3>],
		<liquid:thermal> * 144,
		10, 256
	);

	
	recipes.remove(<thermalfoundation:material:512>);
	recipes.addShaped("ia_redstone_servo", <thermalfoundation:material:512>, [
		[<immersiveengineering:wirecoil:5>, <immersiveengineering:metal_device1:6>, <immersiveengineering:wirecoil:5>], 
		[<immersiveengineering:material:8>, <contenttweaker:research_fluids>.reuse(), <immersiveengineering:material:8>], 
		[<immersiveengineering:wirecoil:5>, <immersiveengineering:metal_device1:6>, <immersiveengineering:wirecoil:5>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:material:512>], 
		[<immersiveengineering:material:8>, <immersiveengineering:metal_device1:6>, <immersiveengineering:wirecoil:5> * 2],
		<liquid:watertight_steel> * 144,
		10, 128
	);

	recipes.remove(<thermalfoundation:material:657>);
	recipes.addShaped("ia_saw_blade", <thermalfoundation:material:657>, [
		[<contenttweaker:wear_resistant_alloy_plate>, <contenttweaker:duraluminum_plate>, null], 
		[<contenttweaker:duraluminum_plate>, <immersiveengineering:material:9>, <contenttweaker:duraluminum_plate>], 
		[null, <contenttweaker:duraluminum_plate>, <contenttweaker:wear_resistant_alloy_plate>]
	]);
	recipes.remove(<thermalfoundation:material:656>);
	recipes.addShaped("ia_drill_head", <thermalfoundation:material:656>, [
		[<contenttweaker:duraluminum_plate>, <contenttweaker:wear_resistant_alloy_plate>, null], 
		[<immersiveengineering:material:9>, <contenttweaker:duraluminum_plate>, <contenttweaker:duraluminum_plate>], 
		[<contenttweaker:duraluminum_plate>, <contenttweaker:wear_resistant_alloy_plate>, null]
	]);


	recipes.addShaped("ia_ra_burner", <contenttweaker:ra_burner>, [
		[null, <atum:heart_of_ra>, null], 
		[<contenttweaker:mekanized_steel_rod>, <contenttweaker:cacti_foci>, <contenttweaker:mekanized_steel_rod>], 
		[<thermalfoundation:material:1024>, <extrautils2:machine>, <thermalfoundation:material:1024>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:ra_burner> * 2], 
		[<extrautils2:machine>, <atum:heart_of_ra>, <contenttweaker:cacti_foci>, <contenttweaker:mekanized_steel_rod>],
		<liquid:pyrotheum> * 500,
		10, 128
	);
}

{//mekanism
	recipes.addShaped("ia_mekanical_core1", <contenttweaker:mekanical_core>, [
		[<ore:gearSignalum>, <ore:dustMana>], 
		[<thermalfoundation:material:515>, <contenttweaker:mekanized_steel_plate>], 
		[<thermalfoundation:material:515>, <ore:gearSignalum>]
	]);
	recipes.addShaped("ia_mekanical_core2", <contenttweaker:mekanical_core> * 2, [
		[<ore:gearSignalum>, <ore:dustMana>], 
		[<thermalfoundation:material:515>, <contenttweaker:meka_umbran>], 
		[<thermalfoundation:material:515>, <ore:gearSignalum>]
	]);
	recipes.addShaped("ia_mekanical_core4", <contenttweaker:mekanical_core> * 4, [
		[<ore:gearSignalum>, <contenttweaker:mana_wire>], 
		[<thermalfoundation:material:515>, <contenttweaker:meka_umbran>], 
		[<thermalfoundation:material:515>, <ore:gearSignalum>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:mekanical_core> * 6],
		[
			<thermalfoundation:material:515>,
			<ore:gearSignalum> * 2,
			<contenttweaker:meka_umbran>,
			<contenttweaker:mana_wire>
		], <liquid:mekanized_steel> * 576, 
		20, 256
	);

	mods.mekanism.compressor.addRecipe(<contenttweaker:tank>, <gas:hydrogen>, <contenttweaker:tank_hydrogen>);
	mods.mekanism.compressor.addRecipe(<contenttweaker:tank>, <gas:oxygen>, <contenttweaker:tank_oxygen>);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:tank_knallgas>, 
		<contenttweaker:tank_oxygen>,
		<contenttweaker:tank_hydrogen>,
		12000
	);
	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:tank_knallgas> * 2, 
        [
            <contenttweaker:tank_oxygen>,
		<contenttweaker:tank_hydrogen>
        ], 32000
    );

	
	recipes.addShaped("ia_impact_spreader", <contenttweaker:impact_spreader>, [
		[null, <netherite:netheriteingot>, null], 
		[<contenttweaker:eliamondin>, <thermalfoundation:material:512>, <contenttweaker:eliamondin>], 
		[<mekanism:reinforcedalloy>, <contenttweaker:resonating_plate>, <mekanism:reinforcedalloy>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:impact_spreader> * 2],
		[
			<netherite:netheriteingot>,
			<contenttweaker:eliamondin>, <thermalfoundation:material:512>,
			<mekanism:reinforcedalloy>, <contenttweaker:resonating_plate>
		], null, 
		20, 256
	);

	{//igniter	
		recipes.addShaped("ia_igniter", <contenttweaker:igniter>, [
			[<natura:flint_and_blaze>, null, <contenttweaker:tank_oxygen>], 
			[null, <contenttweaker:carminium_ingot>, <contenttweaker:tank_oxygen>], 
			[<contenttweaker:tank_knallgas>, <contenttweaker:osmiridium_support>, <contenttweaker:ra_burner>]
		]);
		/*recipes.addShaped("ia_igniter2", <contenttweaker:igniter> * 2, [
			[<natura:flint_and_blaze>, null, <contenttweaker:tank_oxygen>], 
			[null, <contenttweaker:carminium_ingot>, <contenttweaker:tank_oxygen>], 
			[<alchemistry:compound:36>, <contenttweaker:osmiridium_support>, <contenttweaker:ra_burner>]
		]);*/
		scripts.content_machines.addAssemblerRecipe(
			[<contenttweaker:igniter> * 4],
			[
				<natura:flint_and_blaze>, <contenttweaker:osmiridium_support>, <contenttweaker:ra_burner>,
				<contenttweaker:carminium_ingot>, <alchemistry:compound:36> | <contenttweaker:tank_knallgas>
			], null, 
			20, 256
		);
	}

	{//circuits <opencomputers:material:7>
		infuser.removeRecipe(<mekanism:controlcircuit>);
		infuser.addRecipe("REDSTONE", 40, <appliedenergistics2:material:24>, <mekanism:controlcircuit>);
		

		recipes.remove(<mekanism:controlcircuit:1>);
		recipes.addShaped("ia_mek_circuit1", <mekanism:controlcircuit:1>, [
			[<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>], 
			[<ore:ingotRedstoneAlloy>, <opencomputers:material:8>, <ore:ingotRedstoneAlloy>], 
			[<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>]
		]);
		recipes.remove(<mekanism:controlcircuit:2>);
		recipes.addShaped("ia_mek_circuit2", <mekanism:controlcircuit:2>, [
			[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>], 
			[<prodigytech:energion_dust>, <opencomputers:material:9>, <prodigytech:energion_dust>], 
			[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>]
		]);
		recipes.remove(<mekanism:controlcircuit:3>);
		recipes.addShaped("ia_mek_circuit3", <mekanism:controlcircuit:3>, [
			[<ore:alloyUltimate>, <ore:circuitElite>, <ore:alloyUltimate>], 
			[<ore:slimecrystalPink>, <contenttweaker:advanced_circuit_plate>, <ore:slimecrystalPink>], 
			[<ore:alloyUltimate>, <ore:circuitElite>, <ore:alloyUltimate>]
		]);

		recipes.addShaped("ia_cheesy_circuit", <contenttweaker:cheesy_circuit>, [
			[<contenttweaker:cheesy_capacitor>, <contenttweaker:cheesy_capacitor>, <contenttweaker:cheesy_capacitor>],
			[<contenttweaker:cheesy_capacitor>, <mekanism:controlcircuit:3>, <contenttweaker:cheesy_capacitor>],
			[<contenttweaker:cheesy_capacitor>, <contenttweaker:cheesy_capacitor>, <contenttweaker:cheesy_capacitor>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<contenttweaker:cheesy_circuit>],
			[<mekanism:controlcircuit:3>, <contenttweaker:cheesy_capacitor> * 4],
			<liquid:cheese> * 1000,
			10, 128
		);
	}
}
{//AA
	{//filters
		recipes.addShaped("ia_filter_empty", <contenttweaker:filter_empty> * 3, [
			[<contenttweaker:watertight_steel_rod>, <exnihilocreatio:item_mesh:3>, <contenttweaker:watertight_steel_rod>], 
			[<thermalfoundation:material:832>, <exnihilocreatio:item_mesh:3>, <thermalfoundation:material:832>], 
			[<contenttweaker:watertight_steel_rod>, <exnihilocreatio:item_mesh:3>, <contenttweaker:watertight_steel_rod>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<contenttweaker:filter_empty>],
			[<exnihilocreatio:item_mesh:3>, <thermalfoundation:material:832>], <liquid:watertight_steel> * 288,
			20, 1000
		);


		recipes.addShapeless("ia_filter_charcoal1", <contenttweaker:filter_charcoal>, [
			<contenttweaker:filter_empty>, 
			<contenttweaker:activated_carbon>, <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
			<thermalfoundation:material:769>, <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
			<thermalfoundation:material:769>, <thermalfoundation:material:769>
		]);
		recipes.addShapeless("ia_filter_charcoal2", <contenttweaker:filter_charcoal>, [
			<contenttweaker:filter_empty>, 
			<contenttweaker:activated_carbon>, <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
			<contenttweaker:soot>, <prodigytech:ash>
		]);

		recipes.addShapeless("ia_filter_solar", <contenttweaker:filter_solar>, [
			<contenttweaker:filter_empty>, 
			<projectred-core:resource_item:341>, <projectred-core:resource_item:341>, <projectred-core:resource_item:341>, 
			<quantumflux:graphitedust> | <contenttweaker:solar_potion_zinc_ingot> | <contenttweaker:ambrosium_thing>
		]);
	}

}


{//aa coils
	recipes.addShapeless("ia_coil_core1_1", <contenttweaker:coil_core1> * 1, [<contenttweaker:black_bronze_rod>, <contenttweaker:tunril_rod>, <moreplates:lumium_stick>, <thermalfoundation:material:515>, <immersiveengineering:wirecoil:2>, <contenttweaker:platinum_wire>]);
	recipes.addShapeless("ia_coil_core1_2", <contenttweaker:coil_core1> * 2, [<contenttweaker:black_bronze_rod>, <contenttweaker:tunril_rod>, <moreplates:lumium_stick>, <thermalfoundation:material:515>, <immersiveengineering:wirecoil:2>, <contenttweaker:platinum_wire>, <contenttweaker:insulation_strand>]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:coil_core1> * 3], [
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
	recipes.addShaped("ia_aa_coil1", <actuallyadditions:item_misc:7>, [
		[null, <actuallyadditions:item_crystal:5>, <prodigytech:heat_capacitor_1>], 
		[<actuallyadditions:item_crystal:5>, <contenttweaker:coil_core2>, <actuallyadditions:item_crystal:5>], 
		[<prodigytech:heat_capacitor_1>, <actuallyadditions:item_crystal:5>, null]
	]);
	recipes.addShaped("ia_aa_coil1gall", <actuallyadditions:item_misc:7> * 2, [
		[<contenttweaker:gallium_sheet>, <actuallyadditions:item_crystal:5>, <prodigytech:heat_capacitor_1>], 
		[<actuallyadditions:item_crystal:5>, <contenttweaker:coil_core2>, <actuallyadditions:item_crystal:5>], 
		[<prodigytech:heat_capacitor_1>, <actuallyadditions:item_crystal:5>, <contenttweaker:gallium_sheet>]
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
	recipes.addShaped("ia_aa_coil21", <actuallyadditions:item_misc:8> * 2, [
		[<contenttweaker:cheesy_capacitor>, <contenttweaker:egoold>, <contenttweaker:titanium_gear>], 
		[<contenttweaker:egoold>, <actuallyadditions:item_misc:7>, <contenttweaker:egoold>], 
		[<contenttweaker:titanium_gear>, <contenttweaker:egoold>, <contenttweaker:cheesy_capacitor>]
	]);
	<actuallyadditions:item_misc:8>.displayName = "Advanced Laser Coil";
	scripts.content_machines.addAssemblerRecipe(
		[<actuallyadditions:item_misc:8> * 3],
		[
			<actuallyadditions:item_misc:7>,
			<contenttweaker:cheesy_capacitor> * 2,
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
	recipes.addShapeless("ia_laser_mirror2", <contenttweaker:laser_mirror>, [
		<solarflux:photovoltaic_cell_1>, <contenttweaker:osmiridium_support>, <contenttweaker:tunril_plate>,
		<contenttweaker:elastic_clay>, <contenttweaker:wine_diamond>
	]);
}
{//coils
	recipes.remove(<projectred-core:resource_item:400>);
	recipes.addShaped("ia_pr_copper_coil", <projectred-core:resource_item:400>, [
		[<ore:blockEezo>, <contenttweaker:coppra>, <contenttweaker:coppra>], 
		[<contenttweaker:coppra>, <contenttweaker:osgloridium_rod>, <contenttweaker:coppra>], 
		[<contenttweaker:coppra>, <contenttweaker:coppra>, <ore:blockEezo>]
	]);
	recipes.addShaped("ia_pr_copper_coil2", <projectred-core:resource_item:400>, [
		[<contenttweaker:rubeezo_ingot>, <contenttweaker:coppra>, <contenttweaker:coppra>], 
		[<contenttweaker:coppra>, <contenttweaker:osgloridium_rod>, <contenttweaker:coppra>], 
		[<contenttweaker:coppra>, <contenttweaker:coppra>, <contenttweaker:rubeezo_ingot>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:400> * 2],
		[
			<contenttweaker:osgloridium_rod>,
			<contenttweaker:coppra> * 4,
			<contenttweaker:rubeezo_ingot>
		], null,
		20, 1000
	);

	<projectred-core:resource_item:401>.displayName = "Tin Coil";
	recipes.remove(<projectred-core:resource_item:401>);
	recipes.addShaped("ia_pr_tin_coil", <projectred-core:resource_item:401>, [
		[<ore:blockEezo>, <contenttweaker:nittin>, <contenttweaker:nittin>], 
		[<contenttweaker:nittin>, <contenttweaker:osgloridium_rod>, <contenttweaker:nittin>], 
		[<contenttweaker:nittin>, <contenttweaker:nittin>, <ore:blockEezo>]
	]);
	recipes.addShaped("ia_pr_tin_coil2", <projectred-core:resource_item:401>, [
		[<contenttweaker:rubeezo_ingot>, <contenttweaker:nittin>, <contenttweaker:nittin>], 
		[<contenttweaker:nittin>, <contenttweaker:osgloridium_rod>, <contenttweaker:nittin>], 
		[<contenttweaker:nittin>, <contenttweaker:nittin>, <contenttweaker:rubeezo_ingot>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:401> * 2],
		[
			<contenttweaker:osgloridium_rod>,
			<contenttweaker:nittin> * 4,
			<contenttweaker:rubeezo_ingot>
		], null,
		20, 1000
	);

	recipes.remove(<projectred-core:resource_item:402>);
	recipes.addShaped("ia_pr_gold_coil", <projectred-core:resource_item:402>, [
		[<ore:blockEezo>, <contenttweaker:goold>, <contenttweaker:goold>], 
		[<contenttweaker:goold>, <contenttweaker:osgloridium_rod>, <contenttweaker:goold>], 
		[<contenttweaker:goold>, <contenttweaker:goold>, <ore:blockEezo>]
	]);
	recipes.addShaped("ia_pr_gold_coil2", <projectred-core:resource_item:402>, [
		[<contenttweaker:rubeezo_ingot>, <contenttweaker:goold>, <contenttweaker:goold>], 
		[<contenttweaker:goold>, <contenttweaker:osgloridium_rod>, <contenttweaker:goold>], 
		[<contenttweaker:goold>, <contenttweaker:goold>, <contenttweaker:rubeezo_ingot>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:402> * 2],
		[
			<contenttweaker:osgloridium_rod>,
			<contenttweaker:goold> * 4,
			<contenttweaker:rubeezo_ingot>
		], null,
		20, 1000
	);

	

	mods.actuallyadditions.Empowerer.addRecipe(
		<projectred-expansion:infused_ender_pearl> * 2, <appliedenergistics2:material:9>, 
		<mysticalworld:pearl>, <contenttweaker:bouncy_matter_small>, <enderio:item_material:75>, <contenttweaker:mana_focus>, 
		10000, 20, [143.0 / 255.0, 41.0 / 255.0, 133.0 / 255.0]
	);
}

{//circuit like
	{//immersive
		//cacti
		
		furnace.setFuel(<contenttweaker:cactus_charcoal>, 200 * 16);
		recipes.addShaped("cacti_foci", <contenttweaker:cacti_foci>, [
			[<minecraft:stained_glass:13>, <contenttweaker:cactus_charcoal>, <minecraft:stained_glass:13>],
			[<contenttweaker:cactus_charcoal>, <immersiveengineering:stone_decoration:8>, <contenttweaker:cactus_charcoal>],
			[<minecraft:stained_glass:13>, <contenttweaker:cactus_charcoal>, <minecraft:stained_glass:13>]
		]);
		mods.mekanism.infuser.addRecipe("FUNGI", 80, <contenttweaker:cacti_foci>, <contenttweaker:fungi_cacti_foci>);

		//fishy
		recipes.addShaped("fishy_capacitor", <contenttweaker:fishy_capacitor> * 3, [
			[<immersiveengineering:material:26>, <ore:listAllfishraw>, <ore:listAllfishraw>], 
			[<ore:listAllfishraw>, <enderio:item_capacitor_grainy>, <ore:listAllfishraw>], 
			[<ore:listAllfishraw>, <ore:listAllfishraw>, <immersiveengineering:material:26>]
		]);
		recipes.addShaped("fishy_capacitor2", <contenttweaker:fishy_capacitor> * 6, [
			[<immersiveengineering:material:26>, <ore:listAllfishraw>, <contenttweaker:activated_green_fish>], 
			[<ore:listAllfishraw>, <enderio:item_capacitor_grainy>, <ore:listAllfishraw>], 
			[<contenttweaker:activated_green_fish>, <ore:listAllfishraw>, <immersiveengineering:material:26>]
		]);
		mods.mekanism.infuser.addRecipe("CHEESE", 160, <contenttweaker:fishy_capacitor> * 2, <contenttweaker:cheesy_capacitor>);
		
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
			recipes.addShapeless("ia_vac_tube", <immersiveengineering:material:26>, [
				<contenttweaker:glass_hull>, 
				<ore:wireCopper>, <contenttweaker:zinc_wire>, <ore:wireAluminum>, 
				<ore:stickCopper>
			]);

			
			scripts.content_machines.addAssemblerRecipe(
				[<immersiveengineering:material:26> * 4],
				[<contenttweaker:glass_hull> * 4, <ore:wireCopper>, <contenttweaker:zinc_wire>, <ore:wireAluminum>],
				null,
				10, 128
			);
			
		}

		//circuit
		scripts.content_machines.addAssemblerRecipe(
			[<immersiveengineering:material:27> * 2],
			[<immersiveengineering:stone_decoration:8>, <immersiveengineering:material:26> * 2],
			<liquid:copper> * 288,
			10, 128
		);
		recipes.addShapeless("ia_exotic_circuit_bp", <immersiveengineering:blueprint>.withTag({blueprint: "exotic_circuit"}), [<contenttweaker:research_circuit1>]);
		mods.immersiveengineering.Blueprint.addRecipe("exotic_circuit", 
			<immersiveengineering:material:27> * 3, 
			[
				<contenttweaker:cacti_foci>, <contenttweaker:diode1>,
				<contenttweaker:fishy_capacitor>, <contenttweaker:fishy_capacitor>
			]
		);
	}

	{//tubes
		recipes.addShaped("ia_tube_processor1", <contenttweaker:tube_processor>, [
			[<immersiveengineering:material:26>, <immersiveengineering:material:26>, <immersiveengineering:material:26>], 
			[<immersiveengineering:material:26>, <immersiveengineering:material:26>, <immersiveengineering:material:26>], 
			[<immersiveengineering:wirecoil>, <appliedenergistics2:material:23>, <immersiveengineering:wirecoil>]
		]);
		recipes.addShaped("ia_tube_processor2", <contenttweaker:tube_processor> * 2, [
			[<immersiveengineering:material:26>, <immersiveengineering:material:26>, <immersiveengineering:material:26>], 
			[<immersiveengineering:material:26>, <immersiveengineering:material:26>, <immersiveengineering:material:26>], 
			[<immersiveengineering:wirecoil>, <prodigytech:circuit_crude> | <immersiveengineering:material:27>, <immersiveengineering:wirecoil>]
		]);
		
		recipes.addShaped("ia_tube_computer1", <contenttweaker:tube_computer>, [
			[<contenttweaker:tube_processor>, <mekanism:controlcircuit:1>, <contenttweaker:tube_processor>], 
			[<contenttweaker:tube_processor>, <mekanism:controlcircuit:1>, <contenttweaker:tube_processor>], 
			[<contenttweaker:mekanized_steel_plate>, <moreplates:electrotine_alloy_plate>, <contenttweaker:mekanized_steel_plate>]
		]);
		recipes.addShaped("ia_tube_computer2", <contenttweaker:tube_computer> * 2, [
			[<contenttweaker:tube_processor>, <mekanism:controlcircuit:1>, <contenttweaker:tube_processor>], 
			[<contenttweaker:tube_processor>, <mekanism:controlcircuit:1>, <contenttweaker:tube_processor>], 
			[<contenttweaker:mekanized_steel_plate>, <contenttweaker:emolachite>, <contenttweaker:mekanized_steel_plate>]
		]);
	}	

	
	{//quantum circuit
		recipes.remove(<quantumflux:craftingpiece:5>);
		recipes.addShaped("ia_advanced_circuit2", <quantumflux:craftingpiece:5>, [
			[<ore:circuitUltimate>, <opencomputers:material:9>, <ore:circuitUltimate>], 
			[<contenttweaker:fluxed_processor>, <contenttweaker:tube_computer>, <contenttweaker:fluxed_processor>], 
			[<ore:circuitUltimate>, <opencomputers:material:9>, <ore:circuitUltimate>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<quantumflux:craftingpiece:5> * 4],
			[
				<opencomputers:material:9> * 2,
				<contenttweaker:fluxed_processor> * 2, 
				<contenttweaker:tube_computer>,
				<ore:circuitUltimate> * 4,
				<contenttweaker:bug_chip>
			],
			<liquid:electric_manyullyn> * 576,
			20, 1600
		);
		mods.thermalexpansion.InductionSmelter.addRecipe(
			<contenttweaker:bug_chip>, 
			<quantumflux:craftingpiece:5>, <contenttweaker:centipedium> * 12, 25000
		);

		recipes.addShaped("ia_advanced_circuit", <quantumflux:craftingpiece:5> * 2, [
			[<contenttweaker:cheesy_circuit>, <opencomputers:material:9>, <contenttweaker:cheesy_circuit>], 
			[<contenttweaker:fluxed_processor>, <contenttweaker:tube_computer>, <contenttweaker:fluxed_processor>], 
			[<contenttweaker:cheesy_circuit>, <opencomputers:material:9>, <contenttweaker:cheesy_circuit>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<quantumflux:craftingpiece:5> * 6],
			[
				<opencomputers:material:9> * 2,
				<contenttweaker:fluxed_processor> * 2, 
				<contenttweaker:tube_computer>,
				<contenttweaker:cheesy_circuit> * 4,
				<contenttweaker:bug_chip>
			],
			<liquid:electric_manyullyn> * 576,
			20, 1600
		);
	}

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
	recipes.addShaped("ia_wired_wooden_board2", <contenttweaker:wired_wooden_board> * 3, [
		[null, <contenttweaker:fluix_steel_wire>, null], 
		[<contenttweaker:gold_wire>, <contenttweaker:soggy_wooden_board>, <contenttweaker:zinc_wire>], 
		[null, <contenttweaker:emolachite>, null]
	]);

	recipes.addShaped("ia_advanced_circuit_plate_base", <contenttweaker:advanced_circuit_plate_base> * 2, [
		[null, <prodigytech:circuit_plate>, null], 
		[<appliedenergistics2:material:23>, <contenttweaker:wired_wooden_board>, <appliedenergistics2:material:23>], 
		[<ore:itemRubber>, <contenttweaker:flolit_sheet>, <ore:itemRubber>]
	]);
	recipes.addShaped("ia_advanced_circuit_plate_base2", <contenttweaker:advanced_circuit_plate_base> * 4, [
		[<appliedenergistics2:material:23>, <prodigytech:circuit_plate>, <appliedenergistics2:material:23>], 
		[<contenttweaker:fungi_cacti_foci>, <contenttweaker:wired_wooden_board>, <contenttweaker:fungi_cacti_foci>], 
		[<ore:itemRubber>, <contenttweaker:flolit_sheet>, <ore:itemRubber>]
	]);
	
	mods.mekanism.compressor.addRecipe(
		<contenttweaker:advanced_circuit_plate_base>,
		<gas:sulfuricacid>, 
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
{//diode
	recipes.addShaped("diode1", <contenttweaker:diode1> * 2, [
		[<contenttweaker:glowcrystal>, <contenttweaker:glass_hull>], 
		[<contenttweaker:zinc_rod>, <contenttweaker:zinc_rod>]
	]);

	recipes.addShaped("diode2", <contenttweaker:diode2>, [
		[null, <moretcon:gemelectarite>, null], 
		[<contenttweaker:diode1>, <moretcon:gemelectarite>, <contenttweaker:diode1>], 
		[<projectred-core:resource_item:402>, <contenttweaker:diode1>, <projectred-core:resource_item:402>]
	]);
	recipes.addShaped("diode21", <contenttweaker:diode2> * 2, [
		[null, <moretcon:gemelectarite>, null], 
		[<contenttweaker:diode1>, <moretcon:gemelectarite>, <contenttweaker:diode1>], 
		[<projectred-core:resource_item:402>, <contenttweaker:cheesy_capacitor>, <projectred-core:resource_item:402>]
	]);

	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:tar_light>,
		<twilightforest:torchberries> * 16, <liquid:enriched_tar> * 1000,
		25000
	);
}
{//boule
	//silicon
	recipes.remove(<projectred-core:resource_item:250>);
    recipes.addShapeless("ia_sandy_coal1", <projectred-core:resource_item:250>, [<contenttweaker:charcoal_ball>, <extrautils2:decorativesolid:4>, <extrautils2:decorativesolid:4>, <contenttweaker:crystal_coal>]);
    recipes.addShapeless("ia_sandy_coal2", <projectred-core:resource_item:250> * 3, [<contenttweaker:charcoal_ball>, <extrautils2:decorativesolid:4>, <extrautils2:decorativesolid:4>, <contenttweaker:crystal_coal>, <contenttweaker:sandworm_chitin>]);

	recipes.addShapeless("ia_prepared_silicon", <contenttweaker:prepared_silicon>, [
		<projectred-core:resource_item:250>, <contenttweaker:solar_silicon>, 
		<contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>,
		<contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>
	]);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:prepared_silicon> * 2], [],
		[
			<projectred-core:resource_item:250>, <contenttweaker:solar_silicon>, 
			<contenttweaker:aluminum_silicon> * 8
		], [],
		20, 10000
	);
	mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:prepared_silicon> * 4, [
		<projectred-core:resource_item:250>, <contenttweaker:solar_silicon>, 
		<contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>, <contenttweaker:aluminum_silicon>
	], 1000, 20, 1);


    furnace.remove(<projectred-core:resource_item:300>);
    mods.enderio.AlloySmelter.addRecipe(<projectred-core:resource_item:300>, 
        [<contenttweaker:prepared_silicon> * 6, <contenttweaker:gallium_dust>, <contenttweaker:arsenic_dust>], 
        150000
    );

    recipes.remove(<projectred-core:resource_item:301>);
    scripts.helper.addSawRecipe(<projectred-core:resource_item:300>, <projectred-core:resource_item:301> * 8);


	//gambrosium
	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:gambrosium_boule>, [
			<contenttweaker:ambrosium_crystal_seed>, 
			<projectred-core:resource_item:300> * 4, 
			<contenttweaker:gambrosium_dust> * 64
		], 25000000
	);
	scripts.helper.addSawRecipeWByproduct(<contenttweaker:gambrosium_boule>, <contenttweaker:gambrosium_wafer> * 8, <contenttweaker:gambrosium_dust>, 75);


	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:elf_boule>, [
			<contenttweaker:gambrosium_boule> * 4,
			<botania:rune:9> * 3,
			<botania:manaresource:7> * 32
		], 250000000
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
{//burner
	
	recipes.addShaped("ia_crucible", <contenttweaker:crucible>, [
		[<contenttweaker:high_heat_glass>, <exnihilocreatio:block_crucible:1>, <contenttweaker:high_heat_glass>], 
		[<contenttweaker:tungsten_plate>, <enderio:block_tank:1>, <contenttweaker:tungsten_plate>], 
		[<contenttweaker:chrome_block>, <contenttweaker:igniter>, <contenttweaker:chrome_block>]
	]);
}


{//quantum flux
	



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
			<liquid:bound_metal> * 576
		], <contenttweaker:sewing_unit>,
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
{//motor
	recipes.addShaped("ia_simple_motor", <contenttweaker:simple_motor> * 2, [
		[null, <exnihilocreatio:block_axle_stone>, null], 
		[<ore:gearWood>, <minecraft:piston>, <minecraft:piston>], 
		[<ore:gearWood>, <minecraft:piston>, <minecraft:piston>]
	]);
	Blueprint.addRecipe("components", 
			<contenttweaker:simple_motor> * 3, 
			[
				<exnihilocreatio:block_axle_stone>,
				<minecraft:piston>, <minecraft:piston>, <immersiveengineering:material>,
				<ore:gearWood>, <ore:gearWood>
			]
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:simple_motor> * 12],
		[
			<exnihilocreatio:block_axle_stone> * 3,
			<minecraft:piston> * 6,
			<immersiveengineering:material> * 4
		],
		<liquid:knightslime> * 144, 20, 32
	);


	recipes.remove(<projectred-core:resource_item:410>);
	recipes.addShaped("ia_pr_motor", <projectred-core:resource_item:410>, [
		[<contenttweaker:simple_motor>, <contenttweaker:simple_motor>, <contenttweaker:simple_motor>], 
		[<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}), <contenttweaker:mekanical_core>, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"})], 
		[<projectred-core:resource_item:401>, <contenttweaker:tignalum_gear>, <projectred-core:resource_item:400>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:410> * 2],
		[
			<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}) * 2, <contenttweaker:mekanical_core>,
			<projectred-core:resource_item:401>, <contenttweaker:tignalum_gear>, <projectred-core:resource_item:400>, 
			<contenttweaker:simple_motor> * 4
		],
		<liquid:mekanized_steel> * 144, 20, 256
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
				<contenttweaker:blood_gem>, <contenttweaker:living_processor>, <contenttweaker:blood_gem>, 
				<contenttweaker:chitin>, <enderio:item_capacitor_crystalline>, <contenttweaker:chitin>
			], 50000
		);
	}
	{//capacitor base
		recipes.addShaped("ia_capacitor_base", <contenttweaker:capacitor_base>, [
			[<ore:stickIridium>, <contenttweaker:batio>, <ore:stickIridium>], 
			[<enderio:item_capacitor_grainy>, <actuallyadditions:item_misc:7>, <enderio:item_capacitor_grainy>]
		]);
	}
	{//capacitors
		recipes.remove(<enderio:item_capacitor_grainy>);
		recipes.addShaped("ia_cheap_capacitor", <enderio:item_capacitor_grainy>, [
			[null, <ore:ingotHOPGraphite>, null], 
			[<ore:dustBedrock>, <ore:ingotHOPGraphite>, <ore:dustBedrock>], 
			[<ore:stickSteel>, null, <ore:stickSteel>]
		]);
		recipes.addShaped("ia_cheap_capacitor2", <enderio:item_capacitor_grainy> * 4, [
			[null, <ore:ingotHOPGraphite>, null], 
			[<ore:dustBedrock>, <ore:ingotHOPGraphite>, <ore:dustBedrock>], 
			[<ore:stickSteel>, <alchemistry:ingot:73>, <ore:stickSteel>]
		]);
		mods.immersiveengineering.Blueprint.addRecipe("exotic_circuit", 
			<enderio:item_capacitor_grainy>, 
			[
				<enderio:item_material:20>, <enderio:item_material:20>,
				<immersiveengineering:material:19>,//<thermalfoundation:material:288>
				<immersiveengineering:material:2>//, <immersiveengineering:material:2>
			]
		);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_grainy> * 8],
			[
				<ore:dustBedrock> * 3,
				<ore:ingotHOPGraphite> * 2,
				<alchemistry:ingot:73>
			], <fluid:steel> * 576, 10, 256
		);

		recipes.remove(<enderio:item_basic_capacitor>);
		recipes.addShaped("ia_eio_capacitor_1l", <enderio:item_basic_capacitor>, [
			[<ore:ingotEezo>, <contenttweaker:ecoppra>, <ore:ingotEezo>], 
			[<contenttweaker:ecoppra>, <contenttweaker:ecoppra>, <contenttweaker:ecoppra>], 
			[<ore:ingotEezo>, <contenttweaker:capacitor_base>, <ore:ingotEezo>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_basic_capacitor> * 2],
			[
				<contenttweaker:ecoppra> * 3,
				<ore:stickIridium>,
				<ore:ingotEezo> * 3, <contenttweaker:batio>,
				<actuallyadditions:item_misc:7>, <enderio:item_capacitor_grainy> * 3
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
			[<contenttweaker:enittin>, <contenttweaker:enittin>, <contenttweaker:enittin>], 
			[<ore:ingotEezo>, <contenttweaker:capacitor_base>, <ore:ingotEezo>]
		]);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_silver> * 2],
			[
				<contenttweaker:enittin> * 3,
				<ore:stickIridium>,
				<ore:ingotEezo> * 3, <contenttweaker:batio>,
				<actuallyadditions:item_misc:7>, <enderio:item_capacitor_grainy> * 3
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
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_melodic> * 2],
			[
				<enderio:item_capacitor_crystalline> * 3,
				<contenttweaker:potion_processor> * 2,
				<moreplates:melodic_alloy_gear> * 2,
				<moreplates:end_steel_plate> * 2,
				<contenttweaker:lightning_cell>
			],
			<liquid:crystalline_alloy> * 144, 20, 1024
		);


		recipes.remove(<enderio:item_capacitor_stellar>);
		scripts.content_machines.addAssemblerRecipe(
			[<enderio:item_capacitor_stellar> * 6],
			[
				<enderio:item_capacitor_melodic> * 4,
				<contenttweaker:plasma_gen> * 4,
				<contenttweaker:terragem> * 4,
				<moreplates:stellar_alloy_plate> * 2,
				<mekanism:basicblock2:3>.withTag({tier: 3}),
				<contenttweaker:atomic_clock> * 6
			],
			<liquid:mirion2> * (144 * 8), 20, 1024
		);


		
		scripts.content_machines.addAssemblerRecipe(
			[<ometweaks:kikeridan_capacitor> * 6],
			[
				<enderio:item_capacitor_stellar> * 4,
				<minecraft:beacon> * 16,
				<contenttweaker:evil_core> * 6,
				<contenttweaker:kikeridan_gear> * 8,
				<extendedcrafting:singularity_custom:75> * 3,
				
			],
			<liquid:dark_matter> * (144 * 8), 20, 1024
		);


		{
			recipes.addShaped("ia_cake_capacitor", <ometweaks:cake_capacitor>, [
				[<contenttweaker:cheesy_capacitor>, <minecraft:cake>, <contenttweaker:cheesy_capacitor>],
				[<actuallyadditions:item_food:8>, <enderio:item_basic_capacitor> | <enderio:item_capacitor_silver>, <harvestcraft:cherrycheesecakeitem>],
				[<contenttweaker:cheesy_capacitor>, <harvestcraft:redvelvetcakeitem>, <contenttweaker:cheesy_capacitor>]
			]);
			mods.enderio.SliceNSplice.addRecipe(<ometweaks:crab_capacitor>, 
				[
					<contenttweaker:crabolion>, <harvestcraft:crabrawitem>, <contenttweaker:crabolion>, 
					<contenttweaker:cool_sulfur>, <enderio:item_capacitor_melodic>, <contenttweaker:cool_sulfur>
				], 1000000
			);
		}
	}
	//enderman
	mods.enderio.SliceNSplice.removeRecipe(<enderio:block_enderman_skull:2>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:block_enderman_skull:2>, 
		[
			<contenttweaker:wear_resistant_alloy_rod>, <enderio:block_enderman_skull>, <contenttweaker:wear_resistant_alloy_rod>, 
			<contenttweaker:watertight_steel_rod>, <cookingforblockheads:sink>, <contenttweaker:watertight_steel_rod>
		], 100000
	);
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:43>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:43>, 
		[
			<contenttweaker:fluxed_rod>, <enderio:block_enderman_skull:2>, <contenttweaker:fluxed_rod>, 
			<contenttweaker:osgloridium_rod>, <quantumflux:craftingpiece:5>, <contenttweaker:osgloridium_rod>
		], 300000, 0
	);
	//creeper
	mods.enderio.SliceNSplice.addRecipe(<contenttweaker:creeper_component>, 
		[
			<contenttweaker:electric_manyullyn_rod>, <minecraft:skull:4>, <contenttweaker:electric_manyullyn_rod>,
			<contenttweaker:thermal_rod>, <contenttweaker:tank_knallgas>, <contenttweaker:thermal_rod>
		], 300000, 0
	);

	//zombie
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:41>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:41>, 
		[
			<moreplates:soularium_plate>, <minecraft:skull:2>, <moreplates:soularium_plate>, 
			<projectred-core:resource_item:20>, <enderio:item_capacitor_silver> | <enderio:item_basic_capacitor>, <projectred-core:resource_item:20>
		], 200000, 0
	);
	//skeleton
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:45>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:45>, 
		[
			<moreplates:soularium_plate>, <minecraft:skull:0>, <moreplates:soularium_plate>, 
			<projectred-core:resource_item:21>, <enderio:item_capacitor_silver> | <enderio:item_basic_capacitor>, <projectred-core:resource_item:21>
		], 200000, 0
	);
	//guardian
	mods.enderio.SliceNSplice.removeRecipe(<enderio:item_material:56>);
	mods.enderio.SliceNSplice.addRecipe(<enderio:item_material:56>,
		[
			<quark:elder_sea_lantern>, <exnihilocreatio:item_doll:3>, <quark:elder_sea_lantern>,
			<enderio:item_alloy_endergy_ingot:6>, <contenttweaker:guarding_crystal>, <enderio:item_alloy_endergy_ingot:6>
		], 200000, 0
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

	mods.enderio.SagMill.addRecipe(
		[<contenttweaker:capacitor_dust>, <contenttweaker:capacitor_dust>], [0.95, 0.15], <enderio:item_basic_capacitor>, "MULTIPLY_OUTPUT", 20000
	);
	mods.enderio.SagMill.addRecipe(
		[<contenttweaker:capacitor_dust>, <contenttweaker:capacitor_dust>], [0.95, 0.15], <enderio:item_capacitor_silver>, "MULTIPLY_OUTPUT", 20000
	);
}

{//electrostatic wool
	scripts.helper.addFluidAlloyerRecipe(
		<contenttweaker:electric_wool> * 4, 
		<mekanism:otherdust> * 6, <immersiveengineering:material:22> * 4, <liquid:cloud_seed_concentrated> * 1000, 
		512, 20
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:electric_wool2_base> * 2], [],
		[
			<contenttweaker:gravel_wool> * 16,
			<contenttweaker:rare_earth_dust> * 6,
			<contenttweaker:nickel_oxide> * 8,
			<contenttweaker:conductive_alloy_wire> * 3
		], [
			<liquid:electrical_steel> * (144 * 12),
			<liquid:biotite> * 1000,
			<liquid:chloroauric_acid> * 1000
		],
		40, 1000
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:electric_wool2_base> * 6], [],
		[
			<contenttweaker:gravel_wool> * 16,
			<contenttweaker:rarer_earth_dust>,
			<contenttweaker:nickel_oxide> * 8,
			<contenttweaker:conductive_alloy_wire> * 3
		], [
			<liquid:electrical_steel> * (144 * 12),
			<liquid:biotite> * 1000,
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
	

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:ev_coil>],
		[
			<contenttweaker:electromagnet_core>,
			<projectred-core:resource_item:342> * 6,
			<contenttweaker:electric_wool> * 4,
			<contenttweaker:arkenium_plate>,
			<mekanismgenerators:generator:9> * 3
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


scripts.content_machines.addAssemblerRecipe(
    [<contenttweaker:slate_steel_coil>, <contenttweaker:imperomite_catalyst_dust> * 2],
    [
        <contenttweaker:ev_coil>,
        <contenttweaker:slate_steel_wire> * 16,
        <moreplates:ironwood_plate> * 4,
        <extendedcrafting:material:3>,
        <contenttweaker:osmiridium_support> * 4,
        <contenttweaker:imperomite_catalyst> * 2
    ], <liquid:tignalum> * 576, 40, 10000
);
/*recipes.addShaped("ia_conductive_alloy_coil", <contenttweaker:conductive_alloy_coil>, [
	[<contenttweaker:conductive_alloy_wire>, <contenttweaker:tungsten_coil>, <contenttweaker:conductive_alloy_wire>], 
	[<immersiveengineering:wirecoil:2>, <botania:manaresource:3>, <immersiveengineering:wirecoil:2>], 
	[<contenttweaker:conductive_alloy_wire>, <contenttweaker:tungsten_coil>, <contenttweaker:conductive_alloy_wire>]
]);*/


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
			<immersiveengineering:material:26> * 24,
			<contenttweaker:noble_gases_ingot> * 12,
			<quantumflux:craftingpiece:2> * 6,
			<contenttweaker:lens_out>
		], <liquid:mercury> * 1000, 20, 1000
	);
}

{//plants
	recipes.addShaped("ia_plant_unit", <contenttweaker:plant_unit>, [
		[<contenttweaker:robot_arm>, null, <contenttweaker:robot_arm>], 
		[<engineersdecor:small_tree_cutter>, <twilightforest:uberous_soil>, <actuallyadditions:block_farmer>], 
		[<contenttweaker:plant_sample>, <bonsaitrees:bonsaipot:1>, <contenttweaker:plant_sample>]
	]);
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
	recipes.addShaped("ia_lens_out", <contenttweaker:lens_out>, [
		[<contenttweaker:glass_fiber>, <extrautils2:ineffableglass:2>, <contenttweaker:glass_fiber>], 
		[<thermalfoundation:material:321>, <contenttweaker:delicate_topaz>, <thermalfoundation:material:321>], 
		[<contenttweaker:glass_fiber>, <extrautils2:ineffableglass:2>, <contenttweaker:glass_fiber>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:lens_out> * 2],
		[
			<contenttweaker:delicate_topaz>,
			<tconstruct:clear_glass> * 8,
			<contenttweaker:glass_fiber> * 2,
			<extrautils2:ineffableglass:2>
		],
		<liquid:tin> * 576,
		20, 512
	);

	recipes.addShaped("ia_lens_in", <contenttweaker:lens_in>, [
		[<contenttweaker:glass_fiber>, <extrautils2:ineffableglass:2>, <contenttweaker:glass_fiber>], 
		[<thermalfoundation:material:321>, <contenttweaker:delicate_amber>, <thermalfoundation:material:321>], 
		[<contenttweaker:glass_fiber>, <extrautils2:ineffableglass:2>, <contenttweaker:glass_fiber>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:lens_in> * 2],
		[
			<contenttweaker:delicate_amber>,
			<tconstruct:clear_glass> * 8,
			<contenttweaker:glass_fiber> * 2,
			<extrautils2:ineffableglass:2>
		],
		<liquid:tin> * 576,
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
			<quantumflux:craftingpiece:5>,
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

	mods.mekanism.reaction.addRecipe(
        <projectred-core:resource_item:301> * 32, <liquid:redstone> * 2000, <gas:evil_nitrate> * 50, 
        <projectred-core:resource_item:320> * 32, <gas:waste_gas> * 50, 50000, 60
    );
	mods.mekanism.reaction.addRecipe(
        <projectred-core:resource_item:301> * 32, <liquid:glowstone> * 2000, <gas:evil_nitrate> * 50, 
        <projectred-core:resource_item:341> * 32, <gas:waste_gas> * 50, 50000, 60
    );
	mods.mekanism.reaction.addRecipe(
        <projectred-core:resource_item:301> * 32, <liquid:electrotine> * 2000, <gas:evil_nitrate> * 50, 
        <projectred-core:resource_item:342> * 32, <gas:waste_gas> * 50, 50000, 60
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

    rec.addEnergyPerTickInput(320000);

	for out in outp{
	    rec.addItemOutput(out);
	}
    rec.addItemInput(<contenttweaker:reinforced_cell>);
	
	for i in inp{
		rec.addItemInput(i);
	}

	//rec.addMekanismLaserInput(25000000 as double);
    
    rec.build();
}
{//solidlightning
	var rec = RecipeBuilder.newBuilder("solidlightning", "energy_infuser", 40);

    rec.addEnergyPerTickInput(320000);

	rec.addItemOutput(<moretcon:solidlightning>);
	
    rec.addItemInput(<moretcon:blockelectarite>);

    rec.build();
}
{//element cell
	addElementCellRecipe([<contenttweaker:lightning_cell>], [<contenttweaker:electric_manyullyn_dust> * 64, <moretcon:solidlightning>]);

	addElementCellRecipe([<contenttweaker:fire_cell>], [<contenttweaker:advanced_pyrotheum> * 8, <extendedcrafting:singularity_custom:100>]);

	addElementCellRecipe([<contenttweaker:light_cell>], [
		<contenttweaker:light_ingot> * 8, 
		<enderio:block_holy_fog> * 32, 
		<erebus:materials:12> * 32
	]);

	addElementCellRecipe([<contenttweaker:slime_cell>], [
		<contenttweaker:bouncy_matter_small> * 16,
		<tconevo:material:1> * 256,
		<contenttweaker:imperomite_catalyst> * 3
	]);
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
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:diode3> * 2],
	[
		<contenttweaker:fluxed_invar_plate>,
		<enderio:item_material:56> * 8,
		<contenttweaker:flesh_rod> * 4,
		<contenttweaker:living_processor> * 2,
		<contenttweaker:muscle> * 16
	],
	<liquid:sunnarium> * 1000, 80, 100000
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
			<botania:manaresource:22> * 3,
			<contenttweaker:advanced_circuit_plate> * 4,
			<contenttweaker:conductive_alloy_coil> * 2
		], 50000
	);

	mods.botania.RuneAltar.addRecipe(<contenttweaker:very_advanced_circuit>,
		[
			<contenttweaker:very_advanced_circuit_base>, <contenttweaker:cursed_processor>, 
			<enderio:item_material:44>, <contenttweaker:delicate_amber>, <bloodmagic:component:31>,
			<botania:rune:8>
		], 5000
	);

	mods.mekanism.infuser.addRecipe("MANA", 30, <contenttweaker:very_advanced_circuit>, <contenttweaker:very_advanced_mana_circuit>);

	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:engraved_mana_circuit>], null, [
			<contenttweaker:very_advanced_mana_circuit>,
			<quantumflux:craftingpiece:2> * 16,
			<enderio:item_capacitor_melodic>
		], [
			<liquid:bound_metal> * 1152,
			<liquid:circuit> * 1000
		], <contenttweaker:laser>,
		100, 1000000
	);

	<ore:elfPayCheck1>.add(<contenttweaker:big_burger1>);
	<ore:elfPayCheck2>.add(<harvestcraft:rainbowcurryitem>);
	<ore:elfPayCheck2>.add(<harvestcraft:epicbaconitem>);
	<ore:elfPayCheck3>.add(<contenttweaker:big_burger2>);

	mods.botania.ElvenTrade.addRecipe([<contenttweaker:elf_mana_circuit>], [
		<contenttweaker:engraved_mana_circuit>,
		<contenttweaker:elf_wafer>, <contenttweaker:elf_wafer>, 
		<contenttweaker:bloody_circuit>,
		<ore:elfPayCheck1>
	]);
	mods.botania.ElvenTrade.addRecipe([<contenttweaker:elf_mana_circuit> * 3], [
		<contenttweaker:engraved_mana_circuit>,
		<contenttweaker:elf_wafer>, <contenttweaker:elf_wafer>, 
		<contenttweaker:bloody_circuit>,
		<ore:elfPayCheck2>
	]);
	mods.botania.ElvenTrade.addRecipe([<contenttweaker:elf_mana_circuit> * 16], [
		<contenttweaker:engraved_mana_circuit>,
		<contenttweaker:elf_wafer>, <contenttweaker:elf_wafer>, 
		<contenttweaker:bloody_circuit>,
		<ore:elfPayCheck3>
	]);


}
{//mana chip
	mods.extendedcrafting.CombinationCrafting.addRecipe(
        <contenttweaker:rune_mana_chip>, 10000000 * 200, 10000000, <contenttweaker:rune_lightning>, 
        [
            <contenttweaker:slime_cell>,
			<contenttweaker:bloody_circuit>,
			<contenttweaker:diode3>,
			<botania:manaresource:1>,
			<botania:manaresource:1>,
			<contenttweaker:tablet_good>,
			<botania:rune:8>,
			<botania:rune:8>
        ]
    );
}

mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:mana_pipe>, [
	[<contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>], 
	[<contenttweaker:mana_conductor>, <contenttweaker:mana_conductor>, <contenttweaker:plasma_gen>, <contenttweaker:mana_conductor>, <contenttweaker:mana_conductor>], 
	[<botania:pump>, <botania:pump>, <contenttweaker:soul_frame>, <botania:pump>, <botania:pump>], 
	[<contenttweaker:mana_conductor>, <contenttweaker:mana_conductor>, <contenttweaker:plasma_gen>, <contenttweaker:mana_conductor>, <contenttweaker:mana_conductor>], 
	[<contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>, <contenttweaker:mana_resistor>]
]);


{//signal
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:pulse_generator>, 
		<contenttweaker:iron_heart>, <projectred-core:resource_item:402>, 
		<liquid:pulsating_iron> * (144 * 8), 
		40, 128
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
	

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:rocket_engine>], 
		[
			<contenttweaker:explosion_device_full> * 8,
			<contenttweaker:tank_oxygen> * 24,
			<contenttweaker:cooling_system> * 2,
			<contenttweaker:tank2> * 4,
			<alchemistry:ingot:42> * 24,
			<simplyjetpacks:metaitemmods:23> * 2
		],
		<liquid:tignalum> * (144 * 8), 20, 1024 
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
	[<contenttweaker:secure_switch> * 4], 
	[
		<minecraft:lever> * 4,
		<contenttweaker:advanced_plating1_4>,
		<contenttweaker:explosion_resistant_plate>,
		<contenttweaker:advanced_plating2_2>,
		<contenttweaker:acid_resistant_steel_plate>
	],
	<liquid:tignalum> * (144 * 2), 20, 1024 
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
			<simplyjetpacks:metaitemmods:11> * 4,
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
			<extendedcrafting:storage:2> * 4,
			<contenttweaker:tablet_evil> * 3,
			<contenttweaker:secure_switch>
		], [
			<liquid:evil_blood> * 1000
		], null,
        80, 10000
    );
	<contenttweaker:cursed_wither>.addTooltip("Laser-Super-Wither-Death Machine");
	<contenttweaker:cursed_wither>.addTooltip("Thankfully deactivated");
	<contenttweaker:cursed_wither>.addTooltip("Do not activate in dimensions you don't want evaporated.");

	mods.enderio.SagMill.addRecipe(
        [<contenttweaker:cursed_star>, <minecraft:nether_star>, <contenttweaker:nether_star_dust>, <contenttweaker:cursed_gold_pieces> * 4], 
        [0.8, 0.2, 0.05, 0.55], 
        <contenttweaker:cursed_star>, "CHANCE_ONLY", 500000
    );
}

mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:evil_core>, [
	[null, null, <taiga:astrium_ingot>, <taiga:astrium_block>, <taiga:astrium_ingot>, null, null], 
	[null, <taiga:astrium_ingot>, <contenttweaker:diode2>, <extrautils2:simpledecorative:2>, <contenttweaker:diode2>, <taiga:astrium_ingot>, null], 
	[<contenttweaker:slate_10>, <contenttweaker:slate_steel_coil>, <contenttweaker:compact_empowerer>, <contenttweaker:cursed_star>, <contenttweaker:compact_empowerer>, <contenttweaker:slate_steel_coil>, <contenttweaker:slate_10>], 
	[null, <contenttweaker:diode2>, <contenttweaker:compact_empowerer>, <extrautils2:simpledecorative:2>, <contenttweaker:compact_empowerer>, <contenttweaker:diode2>, null], 
	[null, null, <taiga:astrium_ingot>, <extrautils2:simpledecorative:2>, <taiga:astrium_ingot>, null, null], 
	[null, <contenttweaker:slate_10>, <contenttweaker:slate_steel_coil>, <contenttweaker:diode2>, <contenttweaker:slate_steel_coil>, <contenttweaker:slate_10>, null], 
	[null, null, null, <taiga:astrium_block>, null, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:evil_core> * 2, [
	[null, null, <taiga:astrium_ingot>, <taiga:astrium_block>, <taiga:astrium_ingot>, null, null], 
	[null, <taiga:astrium_ingot>, <contenttweaker:fear>, <extrautils2:simpledecorative:2>, <contenttweaker:fear>, <taiga:astrium_ingot>, null], 
	[<contenttweaker:slate_10>, <contenttweaker:slate_steel_coil>, <contenttweaker:compact_empowerer>, <contenttweaker:cursed_star>, <contenttweaker:compact_empowerer>, <contenttweaker:slate_steel_coil>, <contenttweaker:slate_10>], 
	[null, <contenttweaker:fear>, <contenttweaker:compact_empowerer>, <extrautils2:simpledecorative:2>, <contenttweaker:compact_empowerer>, <contenttweaker:fear>, null], 
	[null, null, <taiga:astrium_ingot>, <extrautils2:simpledecorative:2>, <taiga:astrium_ingot>, null, null], 
	[null, <contenttweaker:slate_10>, <contenttweaker:slate_steel_coil>, <contenttweaker:fear>, <contenttweaker:slate_steel_coil>, <contenttweaker:slate_10>, null], 
	[null, null, null, <taiga:astrium_block>, null, null, null]
]);

scripts.content_machines.addAssemblerRecipe(
    [<contenttweaker:plasma_gen>], 
    [
        <contenttweaker:laser> * 4,
		<immersiveengineering:metal_device1:8> * 32,
		<contenttweaker:ev_coil> * 16,
		<contenttweaker:electricium> * 4,
		<prodigytech:heat_capacitor_3> * 3,
		<mekanismgenerators:reactor:1> * 4
    ], <liquid:super_heat_lava> * 1000,
    20, 10000
);

scripts.content_machines.addAssemblerRecipe(
    [<contenttweaker:cutting>], 
    [
        <extrautils2:lawsword> * 4,
		<contenttweaker:pure_cincinnasite> * 32,
		<contenttweaker:vibralcum_gear> * 16,
		<contenttweaker:rune_mana_chip> * 4,
		<contenttweaker:robot_brain> * 16
    ], <liquid:tignalum> * 1440,
    20, 10000
);