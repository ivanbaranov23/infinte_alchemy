import mods.appliedenergistics2.Inscriber;

import crafttweaker.item.IItemStack;


recipes.remove(<appliedenergistics2:quartz_glass>);
mods.enderio.AlloySmelter.addRecipe(<appliedenergistics2:quartz_glass> * 4, 
        [<betternether:quartz_glass> * 4,
        <appliedenergistics2:material:1> * 3,
        <thermalfoundation:coin:70> * 2]
);
recipes.remove(<appliedenergistics2:quartz_vibrant_glass>);
mods.enderio.AlloySmelter.addRecipe(<appliedenergistics2:quartz_vibrant_glass>, 
        [<appliedenergistics2:quartz_glass> * 2,
        <erebus:materials:12> * 3,
        <thermalfoundation:coin:102> * 2]
);

{//chips
	recipes.remove(<appliedenergistics2:material:43>);
	recipes.remove(<appliedenergistics2:material:44>);

	recipes.addShaped("ia_ae2_chip_core1", <contenttweaker:ae2_chip_core>, [
		[null, <moreplates:electrical_steel_plate>, null], 
		[<contenttweaker:fluix_steel_wire>, <appliedenergistics2:material:24>, <contenttweaker:fluix_steel_wire>], 
		[null, <moreplates:electrical_steel_plate>, null]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:ae2_chip_core> * 2], [
			<appliedenergistics2:material:24>,
			<moreplates:electrical_steel_plate>,
			<contenttweaker:fluix_steel_wire> * 2
		], null,
		10, 256
	);

	<ore:AE2processor1>.addItems([<appliedenergistics2:material:22>, <contenttweaker:fluid_processor>, <contenttweaker:gas_processor>]);
	<ore:AE2processor2>.addItems([<contenttweaker:fiery_processor>, <contenttweaker:enderium_processor>, <contenttweaker:osgloridium_processor>]);
	<ore:AE2processor3>.addItems([<contenttweaker:cursed_processor>, <contenttweaker:potion_processor>, <contenttweaker:palladium_processor>]);

	<appliedenergistics2:material:43>.displayName = "Formation Chip";
	recipes.addShaped("ae2_formation_chip1", <appliedenergistics2:material:43>, [
		[null, <ore:AE2processor1>, null], 
		[<thermalfoundation:glass_alloy:6>, <contenttweaker:ae2_chip_core>, <thermalfoundation:glass_alloy:6>], 
		[null, <ore:AE2processor1>, null]
	]);
	recipes.addShaped("ae2_formation_chip2", <appliedenergistics2:material:43> * 3, [
		[null, <ore:AE2processor2>, null], 
		[<thermalfoundation:glass_alloy:6>, <contenttweaker:ae2_chip_core>, <thermalfoundation:glass_alloy:6>], 
		[null, <ore:AE2processor2>, null]
	]);
	recipes.addShaped("ae2_formation_chip3", <appliedenergistics2:material:43> * 9, [
		[null, <ore:AE2processor3>, null], 
		[<thermalfoundation:glass_alloy:6>, <contenttweaker:ae2_chip_core>, <thermalfoundation:glass_alloy:6>], 
		[null, <ore:AE2processor3>, null]
	]);


	<appliedenergistics2:material:44>.displayName = "Annihilation Chip";
	recipes.addShaped("ae2_destruction_chip1", <appliedenergistics2:material:44>, [
		[null, <ore:AE2processor1>, null], 
		[<thermalfoundation:glass_alloy:5>, <contenttweaker:ae2_chip_core>, <thermalfoundation:glass_alloy:5>], 
		[null, <ore:AE2processor1>, null]
	]);
	recipes.addShaped("ae2_destruction_chip2", <appliedenergistics2:material:44> * 3, [
		[null, <ore:AE2processor2>, null], 
		[<thermalfoundation:glass_alloy:5>, <contenttweaker:ae2_chip_core>, <thermalfoundation:glass_alloy:5>], 
		[null, <ore:AE2processor2>, null]
	]);
	recipes.addShaped("ae2_destruction_chip3", <appliedenergistics2:material:44> * 9, [
		[null, <ore:AE2processor3>, null], 
		[<thermalfoundation:glass_alloy:5>, <contenttweaker:ae2_chip_core>, <thermalfoundation:glass_alloy:5>], 
		[null, <ore:AE2processor3>, null]
	]);

}

{//circuits and processors
	//Inscriber.removeRecipe(output);
	//Inscriber.addRecipe(IItemStack output, IItemStack input, boolean inscribe, @Optional IItemStack topInput, @Optional IItemStack bottomInput);

	//presses
	Inscriber.removeRecipe(<appliedenergistics2:material:13>);
	Inscriber.addRecipe(<appliedenergistics2:material:13>, <thermalfoundation:storage_alloy>, true, <appliedenergistics2:material:13>);
    Inscriber.removeRecipe(<appliedenergistics2:material:14>);
	Inscriber.addRecipe(<appliedenergistics2:material:14>, <thermalfoundation:storage_alloy>, true, <appliedenergistics2:material:14>);
    Inscriber.removeRecipe(<appliedenergistics2:material:15>);
	Inscriber.addRecipe(<appliedenergistics2:material:15>, <thermalfoundation:storage_alloy>, true, <appliedenergistics2:material:15>);
    Inscriber.removeRecipe(<appliedenergistics2:material:19>);
	Inscriber.addRecipe(<appliedenergistics2:material:19>, <thermalfoundation:storage_alloy>, true, <appliedenergistics2:material:19>);
    
	Inscriber.addRecipe(<contenttweaker:press_fluid>, <thermalfoundation:storage_alloy>, true, <contenttweaker:press_fluid>);
    Inscriber.addRecipe(<contenttweaker:press_gas>, <thermalfoundation:storage_alloy>, true, <contenttweaker:press_gas>);


	scripts.helper.addSawRecipe(<appliedenergistics2:material:13>, <thermalfoundation:material:96> * 4);
	scripts.helper.addSawRecipe(<appliedenergistics2:material:14>, <thermalfoundation:material:96> * 4);
	scripts.helper.addSawRecipe(<appliedenergistics2:material:15>, <thermalfoundation:material:96> * 4);
	scripts.helper.addSawRecipe(<appliedenergistics2:material:19>, <thermalfoundation:material:96> * 4);
	scripts.helper.addSawRecipe(<contenttweaker:press_fluid>, <thermalfoundation:material:96> * 4);
	scripts.helper.addSawRecipe(<contenttweaker:press_gas>, <thermalfoundation:material:96> * 4);


	//inlay
	Inscriber.addRecipe(<contenttweaker:redstone_inlay> * 4, <moreplates:red_alloy_plate>, false, <immersiveengineering:wirecoil:5>, <immersiveengineering:wirecoil:5>);
	//Inscriber.addRecipe(<contenttweaker:neuron_inlay>, <contenttweaker:basic_neuron>, false, <contenttweaker:redstone_inlay>, <contenttweaker:redstone_inlay>);
	recipes.addShaped("ia_neuron_inlay", <contenttweaker:neuron_inlay>, [
		[<immersiveengineering:wirecoil:5>, <contenttweaker:redstone_inlay>, <immersiveengineering:wirecoil:5>],
		[<contenttweaker:redstone_inlay>, <contenttweaker:basic_neuron>, <contenttweaker:redstone_inlay>],
		[<immersiveengineering:wirecoil:5>, <contenttweaker:redstone_inlay>, <immersiveengineering:wirecoil:5>]
	]);
	
	//Inscriber.addRecipe(<contenttweaker:neuron2_inlay>, <contenttweaker:neuron>, false, <contenttweaker:neuron_inlay>, <contenttweaker:neuron_inlay>);
	recipes.addShaped("ia_neuron_inlay2", <contenttweaker:neuron2_inlay>, [
		[<moreplates:redstone_alloy_plate>, <contenttweaker:neuron_inlay>, <moreplates:redstone_alloy_plate>],
		[<contenttweaker:neuron_inlay>, <contenttweaker:neuron>, <contenttweaker:neuron_inlay>],
		[<moreplates:redstone_alloy_plate>, <contenttweaker:neuron_inlay>, <moreplates:redstone_alloy_plate>]
	]);


	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:redstone_inlay> * 4],
		[<immersiveengineering:wirecoil:5>, <projectred-core:resource_item:103> * 2],
		null,
		10, 64
	);

	//silicon
	Inscriber.addRecipe(<appliedenergistics2:material:20> * 16, <projectred-core:resource_item:301>, true, <appliedenergistics2:material:19>);
	scripts.content_machines.addBioAssemblerRecipe(
		[<projectred-core:resource_item:301> * 12], null,
		[
			<projectred-core:resource_item:300>
		], [
			<liquid:lubricant> * 1000
		], <contenttweaker:pressure_cutter>,
		20, 10000
	);


	Inscriber.removeRecipe(<appliedenergistics2:material:60>);

	{//calcul	
		//certus
		//Inscriber.removeRecipe();
		Inscriber.removeRecipe(<appliedenergistics2:material:23>);
		Inscriber.addRecipe(<appliedenergistics2:material:23>, <contenttweaker:redstone_inlay>, false, <appliedenergistics2:material:16>, <appliedenergistics2:material:20>);

		//gambrosium
		Inscriber.addRecipe(<contenttweaker:gambrosium_circuit> * 4, <contenttweaker:gambrosium_wafer>, true, <appliedenergistics2:material:13>);
		Inscriber.addRecipe(<contenttweaker:gambrosium_processor>, <contenttweaker:neuron_inlay>, false, <contenttweaker:gambrosium_circuit>, <appliedenergistics2:material:23>);
		scripts.content_machines.addBioAssemblerRecipe(
			[<contenttweaker:gambrosium_wafer> * 12], null,
			[
				<contenttweaker:gambrosium_boule>
			], [
				<liquid:lubricant> * 1000
			], <contenttweaker:pressure_cutter>,
			20, 10000
		);

		//layered
		scripts.content_machines.addBioAssemblerRecipe(
			[<contenttweaker:layered_boule>], null,
			[
				<contenttweaker:gambrosium_boule> * 2,
				<projectred-core:resource_item:320> * 12,
				<projectred-core:resource_item:341> * 12,
				<projectred-core:resource_item:342> * 12,
				<contenttweaker:indium_dust> * 5,
				<extendedcrafting:material:7>
			], [
				<liquid:desert_soup> * 1000,
				<liquid:crystal_fluid2> * 1000
			], <contenttweaker:zirconium_lens>,
			200, 10000
		);
		scripts.content_machines.addBioAssemblerRecipe(
			[<contenttweaker:layered_wafer> * 8], null,
			[
				<contenttweaker:layered_boule>
			], [
				<liquid:lubricant> * 1000
			], <contenttweaker:pressure_cutter>,
			20, 10000
		);
		Inscriber.addRecipe(<contenttweaker:layered_circuit> * 4, <contenttweaker:layered_wafer>, true, <appliedenergistics2:material:13>);
		Inscriber.addRecipe(<contenttweaker:layered_processor>, <contenttweaker:neuron2_inlay>, false, <contenttweaker:layered_circuit>, <contenttweaker:gambrosium_processor>);
	}

	//diamond
	Inscriber.removeRecipe(<appliedenergistics2:material:17>);
	Inscriber.removeRecipe(<appliedenergistics2:material:24>);

	Inscriber.addRecipe(<appliedenergistics2:material:17>, <moreplates:diamond_plate>, true, <appliedenergistics2:material:14>);
	Inscriber.addRecipe(<appliedenergistics2:material:17>, <actuallyadditions:item_crystal:2>, true, <appliedenergistics2:material:14>);

	Inscriber.addRecipe(<appliedenergistics2:material:24>, <contenttweaker:redstone_inlay>, false, <appliedenergistics2:material:17>, <appliedenergistics2:material:20>);
	
	{//item
		//gold
		Inscriber.removeRecipe(<appliedenergistics2:material:18>);
		Inscriber.removeRecipe(<appliedenergistics2:material:22>);

		Inscriber.addRecipe(<appliedenergistics2:material:18>, <thermalfoundation:material:33>, true, <appliedenergistics2:material:15>);
		Inscriber.addRecipe(<appliedenergistics2:material:18>, <contenttweaker:goold>, true, <appliedenergistics2:material:15>);

		Inscriber.addRecipe(<appliedenergistics2:material:22>, <contenttweaker:redstone_inlay>, false, <appliedenergistics2:material:18>, <appliedenergistics2:material:20>);

		//fiery
		Inscriber.addRecipe(<contenttweaker:fiery_circuit>, <moreplates:fiery_plate>, true, <appliedenergistics2:material:15>);
		Inscriber.addRecipe(<contenttweaker:fiery_processor>, <contenttweaker:redstone_inlay>, false, <contenttweaker:fiery_circuit>, <appliedenergistics2:material:22>);


		//cursed
		Inscriber.addRecipe(<contenttweaker:cursed_circuit>, <contenttweaker:cursed_gold_plate>, true, <appliedenergistics2:material:15>);
		Inscriber.addRecipe(<contenttweaker:cursed_processor>, <contenttweaker:neuron_inlay>, false, <contenttweaker:cursed_circuit>, <contenttweaker:fiery_processor>);
		//living
		Inscriber.addRecipe(<contenttweaker:living_circuit>, <contenttweaker:living_steel_plate>, true, <appliedenergistics2:material:15>);
		Inscriber.addRecipe(<contenttweaker:living_processor>, <contenttweaker:neuron2_inlay>, false, <contenttweaker:living_circuit>, <contenttweaker:cursed_processor>);
		

	}


	{//fluid
		Inscriber.addRecipe(<contenttweaker:fluid_circuit>, <contenttweaker:watertight_steel_plate>, true, <contenttweaker:press_fluid>);
		Inscriber.addRecipe(<contenttweaker:fluid_circuit>, <actuallyadditions:item_crystal:1>, true, <contenttweaker:press_fluid>);
		Inscriber.addRecipe(<contenttweaker:fluid_processor>, <contenttweaker:redstone_inlay>, false, <contenttweaker:fluid_circuit>, <appliedenergistics2:material:20>);
		//enderium
		Inscriber.addRecipe(<contenttweaker:enderium_circuit>, <thermalfoundation:material:359>, true, <contenttweaker:press_fluid>);
		Inscriber.addRecipe(<contenttweaker:enderium_processor>, <contenttweaker:redstone_inlay>, false, <contenttweaker:enderium_circuit>, <contenttweaker:fluid_processor>);
		//potion
		Inscriber.addRecipe(<contenttweaker:potion_circuit>, <contenttweaker:solar_potion_zinc_plate>, true, <contenttweaker:press_fluid>);
		Inscriber.addRecipe(<contenttweaker:potion_processor>, <contenttweaker:neuron_inlay>, false, <contenttweaker:potion_circuit>, <contenttweaker:enderium_processor>);
	}


	{//gas
		Inscriber.addRecipe(<contenttweaker:gas_circuit>, <moreplates:osgloglas_plate>, true, <contenttweaker:press_gas>);
		Inscriber.addRecipe(<contenttweaker:gas_processor>, <contenttweaker:redstone_inlay>, false, <contenttweaker:gas_circuit>, <appliedenergistics2:material:20>);
		//osgloridium
		Inscriber.addRecipe(<contenttweaker:osgloridium_circuit>, <contenttweaker:osgloridium_plate>, true, <contenttweaker:press_gas>);
		Inscriber.addRecipe(<contenttweaker:osgloridium_processor>, <contenttweaker:redstone_inlay>, false, <contenttweaker:osgloridium_circuit>, <contenttweaker:gas_processor>);
		//palladium
		Inscriber.addRecipe(<contenttweaker:palladium_circuit>, <contenttweaker:palladium_plate>, true, <contenttweaker:press_gas>);
		Inscriber.addRecipe(<contenttweaker:palladium_processor>, <contenttweaker:neuron_inlay>, false, <contenttweaker:palladium_circuit>, <contenttweaker:osgloridium_processor>);
	}	
}



{//machines
	recipes.remove(<appliedenergistics2:inscriber>);
	recipes.addShaped("ia_inscriber1", <appliedenergistics2:inscriber>, [
		[<appliedenergistics2:smooth_sky_stone_block>, <contenttweaker:fluix_steel_plate>, <appliedenergistics2:smooth_sky_stone_block>], 
		[<thermalfoundation:material:513>, <thermalexpansion:frame>, <thermalfoundation:material:513>], 
		[<appliedenergistics2:smooth_sky_stone_block>, <contenttweaker:fluix_steel_plate>, <appliedenergistics2:smooth_sky_stone_block>]
	]);
	recipes.remove(<ae2stuff:inscriber>);
	recipes.addShaped("ia_inscriber2", <ae2stuff:inscriber>, [
		[<appliedenergistics2:material:22>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:material:22>], 
		[<contenttweaker:fluix_steel_gear>, <appliedenergistics2:inscriber>, <contenttweaker:fluix_steel_gear>], 
		[<appliedenergistics2:material:22>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:material:22>]
	]);

	recipes.remove(<appliedenergistics2:quartz_growth_accelerator>);
	recipes.addShaped("ia_quartz_growth_accelerator", <appliedenergistics2:quartz_growth_accelerator>, [
		[<appliedenergistics2:smooth_sky_stone_block>, <contenttweaker:fluix_steel_rod>, <appliedenergistics2:smooth_sky_stone_block>], 
		[<appliedenergistics2:quartz_glass>, <thermalexpansion:frame>, <appliedenergistics2:quartz_glass>], 
		[<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:material:24>, <appliedenergistics2:smooth_sky_stone_block>]
	]);

	recipes.remove(<appliedenergistics2:smooth_sky_stone_chest>);
	recipes.addShaped("ia_smooth_sky_stone_chest", <appliedenergistics2:smooth_sky_stone_chest> * 2, [
		[<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:material:6>, <appliedenergistics2:smooth_sky_stone_block>], 
		[<ironchest:iron_chest:2>, <appliedenergistics2:sky_stone_chest>, <ironchest:iron_chest:2>], 
		[<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:material:6>, <appliedenergistics2:smooth_sky_stone_block>]
	]);
	recipes.remove(<appliedenergistics2:drive>);
	recipes.addShaped("ia_drive", <appliedenergistics2:drive>, [
		[<contenttweaker:singularity_dust>, <appliedenergistics2:quartz_vibrant_glass>, <contenttweaker:singularity_dust>], 
		[<appliedenergistics2:smooth_sky_stone_chest>, <mekanism:basicblock:8>, <appliedenergistics2:smooth_sky_stone_chest>], 
		[<appliedenergistics2:interface>, <contenttweaker:fluix_steel_gear>, <appliedenergistics2:interface>]
	]);

	recipes.remove(<appliedenergistics2:condenser>);
	recipes.addShaped("ia_matter_condenser", <appliedenergistics2:condenser>, [
		[<contenttweaker:mekanized_steel_block>, <thermalexpansion:machine:5>, <contenttweaker:mekanized_steel_block>], 
		[<appliedenergistics2:material:44>, <thermalexpansion:machine:5>, <appliedenergistics2:material:44>], 
		[<contenttweaker:mekanized_steel_block>, <appliedenergistics2:material:35>, <contenttweaker:mekanized_steel_block>]
	]);
}

{//me parts
	recipes.remove(<appliedenergistics2:part:140>);
	recipes.addShaped("ia_quartz_fiber", <appliedenergistics2:part:140> * 6, [
		[<ore:crystalPureNetherQuartz>, <ore:crystalPureNetherQuartz>, <ore:crystalPureNetherQuartz>], 
		[<ore:itemSilicon>, <appliedenergistics2:material:45>, <ore:itemSilicon>], 
		[<ore:crystalPureNetherQuartz>, <ore:crystalPureNetherQuartz>, <ore:crystalPureNetherQuartz>]
	]);
	recipes.remove(<appliedenergistics2:part:16>);
	recipes.addShaped("ia_fluix_cable", <appliedenergistics2:part:16> * 6, [
		[<atum:crystal_purple_stained_glass>, <contenttweaker:fluix_steel_wire>, <atum:crystal_purple_stained_glass>], 
		[<appliedenergistics2:part:140>, <appliedenergistics2:part:140>, <appliedenergistics2:part:140>], 
		[<atum:crystal_purple_stained_glass>, <contenttweaker:fluix_steel_wire>, <atum:crystal_purple_stained_glass>]
	]);

	{//interfaces
		recipes.remove(<appliedenergistics2:interface>);
		recipes.addShaped("ia_ae2_interface1", <appliedenergistics2:interface> * 2, [
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:43>, <ore:plateElectricalSteel>], 
			[<appliedenergistics2:material:22>, <thermalexpansion:frame>, <appliedenergistics2:material:22>], 
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:44>, <ore:plateElectricalSteel>]
		]);
		recipes.addShaped("ia_ae2_interface2", <appliedenergistics2:interface> * 4, [
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:43>, <ore:plateElectricalSteel>], 
			[<contenttweaker:fiery_processor>, <thermalexpansion:frame>, <contenttweaker:fiery_processor>], 
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:44>, <ore:plateElectricalSteel>]
		]);
		recipes.addShaped("ia_ae2_interface3", <appliedenergistics2:interface> * 8, [
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:43>, <ore:plateElectricalSteel>], 
			[<contenttweaker:cursed_processor>, <thermalexpansion:frame>, <contenttweaker:cursed_processor>], 
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:44>, <ore:plateElectricalSteel>]
		]);
		recipes.addShaped("ia_ae2_interface4", <appliedenergistics2:interface> * 16, [
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:43>, <ore:plateElectricalSteel>], 
			[<contenttweaker:living_processor>, <thermalexpansion:frame>, <contenttweaker:living_processor>], 
			[<ore:plateElectricalSteel>, <appliedenergistics2:material:44>, <ore:plateElectricalSteel>]
		]);

		recipes.remove(<appliedenergistics2:fluid_interface>);
		recipes.addShaped("ia_ae2_fluid_interface1", <appliedenergistics2:fluid_interface> * 2, [
			[<contenttweaker:watertight_steel_plate>, <appliedenergistics2:material:43>, <contenttweaker:watertight_steel_plate>], 
			[<contenttweaker:fluid_processor>, <thermalexpansion:frame>, <contenttweaker:fluid_processor>], 
			[<contenttweaker:watertight_steel_plate>, <appliedenergistics2:material:44>, <contenttweaker:watertight_steel_plate>]
		]);
		recipes.addShaped("ia_ae2_fluid_interface2", <appliedenergistics2:fluid_interface> * 4, [
			[<contenttweaker:watertight_steel_plate>, <appliedenergistics2:material:43>, <contenttweaker:watertight_steel_plate>], 
			[<contenttweaker:enderium_processor>, <thermalexpansion:frame>, <contenttweaker:enderium_processor>], 
			[<contenttweaker:watertight_steel_plate>, <appliedenergistics2:material:44>, <contenttweaker:watertight_steel_plate>]
		]);
		recipes.addShaped("ia_ae2_fluid_interface3", <appliedenergistics2:fluid_interface> * 8, [
			[<contenttweaker:watertight_steel_plate>, <appliedenergistics2:material:43>, <contenttweaker:watertight_steel_plate>], 
			[<contenttweaker:potion_processor>, <thermalexpansion:frame>, <contenttweaker:potion_processor>], 
			[<contenttweaker:watertight_steel_plate>, <appliedenergistics2:material:44>, <contenttweaker:watertight_steel_plate>]
		]);

		recipes.remove(<aeadditions:gas_interface>);
		recipes.addShaped("ia_ae2_gas_interface1", <aeadditions:gas_interface> * 2, [
			[<moreplates:osgloglas_plate>, <appliedenergistics2:material:43>, <moreplates:osgloglas_plate>], 
			[<contenttweaker:gas_processor>, <thermalexpansion:frame>, <contenttweaker:gas_processor>], 
			[<moreplates:osgloglas_plate>, <appliedenergistics2:material:44>, <moreplates:osgloglas_plate>]
		]);
		recipes.addShaped("ia_ae2_gas_interface2", <aeadditions:gas_interface> * 4, [
			[<moreplates:osgloglas_plate>, <appliedenergistics2:material:43>, <moreplates:osgloglas_plate>], 
			[<contenttweaker:osgloridium_processor>, <thermalexpansion:frame>, <contenttweaker:osgloridium_processor>], 
			[<moreplates:osgloglas_plate>, <appliedenergistics2:material:44>, <moreplates:osgloglas_plate>]
		]);
		recipes.addShaped("ia_ae2_gas_interface3", <aeadditions:gas_interface> * 8, [
			[<moreplates:osgloglas_plate>, <appliedenergistics2:material:43>, <moreplates:osgloglas_plate>], 
			[<contenttweaker:palladium_processor>, <thermalexpansion:frame>, <contenttweaker:palladium_processor>], 
			[<moreplates:osgloglas_plate>, <appliedenergistics2:material:44>, <moreplates:osgloglas_plate>]
		]);
	}

	recipes.remove(<appliedenergistics2:energy_acceptor>);
	recipes.addShaped("ia_ae2_energy_acceptor", <appliedenergistics2:energy_acceptor>, [
		[<moreplates:electrical_steel_plate>, <appliedenergistics2:material:24>, <moreplates:electrical_steel_plate>], 
		[<appliedenergistics2:material:24>, <thermalexpansion:frame>, <appliedenergistics2:material:24>], 
		[<moreplates:electrical_steel_plate>, <appliedenergistics2:material:24>, <moreplates:electrical_steel_plate>]
	]);
}



{//storage comp
	var comp as IItemStack[][] = [
		[//item
			<appliedenergistics2:material:35>,
			<appliedenergistics2:material:36>,
			<appliedenergistics2:material:37>,
			<appliedenergistics2:material:38>,
			<aeadditions:storage.component>,
			<aeadditions:storage.component:1>,
			<aeadditions:storage.component:2>,
			<aeadditions:storage.component:3>
		], [//fluid
			<appliedenergistics2:material:54>,
			<appliedenergistics2:material:55>,
			<appliedenergistics2:material:56>,
			<appliedenergistics2:material:57>,
			<aeadditions:storage.component:4>,
			<aeadditions:storage.component:5>,
			<aeadditions:storage.component:6>
		], [//gas
			<aeadditions:storage.component:7>,
			<aeadditions:storage.component:8>,
			<aeadditions:storage.component:9>,
			<aeadditions:storage.component:10>,
			<aeadditions:storage.component:11>,
			<aeadditions:storage.component:12>,
			<aeadditions:storage.component:13>
		]
	];
	var corner_item as IItemStack[] = [
		<immersiveengineering:wirecoil>,
		<immersiveengineering:wirecoil:1>,
		<immersiveengineering:wirecoil:2>,
		<contenttweaker:tungsten_coil>,
		<contenttweaker:conductive_alloy_coil>,
		<contenttweaker:conductive_alloy_coil>,
		<contenttweaker:conductive_alloy_coil>,
		<contenttweaker:conductive_alloy_coil>
	];
	var top_item as IItemStack[] = [
		<appliedenergistics2:material:23>,
		<appliedenergistics2:material:23>,
		<appliedenergistics2:material:23>,
		<contenttweaker:gambrosium_processor>,
		<contenttweaker:gambrosium_processor>,
		<contenttweaker:layered_processor>,
		<contenttweaker:layered_processor>,
		<contenttweaker:layered_processor>
	];
	var center_item as IItemStack[][] = [
		[//item
			<appliedenergistics2:material:22>,
			<contenttweaker:fiery_processor>,
			<contenttweaker:cursed_processor>,
			<contenttweaker:cursed_processor>,
			<contenttweaker:living_processor>,
			<contenttweaker:living_processor>,
			<contenttweaker:living_processor>,
			<contenttweaker:living_processor>
		], [//fluid
			<contenttweaker:fluid_processor>,
			<contenttweaker:enderium_processor>,
			<contenttweaker:potion_processor>,
			<contenttweaker:potion_processor>,
			<contenttweaker:elementium_processor>,
			<contenttweaker:elementium_processor>,
			<contenttweaker:elementium_processor>,
			<contenttweaker:elementium_processor>
		], [//gas
			<contenttweaker:gas_processor>,
			<contenttweaker:osgloridium_processor>,
			<contenttweaker:palladium_processor>,
			<contenttweaker:palladium_processor>,
			<contenttweaker:palladium_processor>,
			<contenttweaker:palladium_processor>,
			<contenttweaker:palladium_processor>
		]
	];

	for type, arr_comp in comp{
		print("[IA][AE2] Doing type " ~ type);
		
		for comp_id, c in arr_comp{
			recipes.remove(c);
			if (comp_id == 0){
				recipes.addShaped("ia_ae2comp_" ~ type ~ "_" ~ comp_id, c, [
					[<ore:crystalCertusQuartz>, <ore:crystalPureFluix>, <ore:crystalCertusQuartz>],
					[<immersiveengineering:wirecoil>, center_item[type][0], <immersiveengineering:wirecoil>],
					[<ore:crystalCertusQuartz>, <ore:crystalPureFluix>, <ore:crystalCertusQuartz>]
				]);
			}
			else
			{
				recipes.addShaped("ia_ae2comp_" ~ type ~ "_" ~ comp_id, c, [
					[corner_item[comp_id - 1], 			top_item[comp_id - 1], 				corner_item[comp_id - 1]],
					[arr_comp[comp_id - 1], 			center_item[type][comp_id - 1], 	arr_comp[comp_id - 1]],
					[corner_item[comp_id - 1], 			arr_comp[comp_id - 1], 		corner_item[comp_id - 1]]
				]);
			}


		}

	}
}

scripts.jei.addJEIhint(
    [<minecraft:iron_ingot>], [], 
    [<appliedenergistics2:certus_quartz_cutting_knife>], 
    [<appliedenergistics2:material:21>]
);