import scripts.content_machines.addAssemblerRecipe;
import scripts.content_machines.addBioAssemblerRecipe;

recipes.removeByMod("solarflux");

{//photovoltaic
	mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:3>);

	recipes.addShaped("ia_raw_photovoltaic", <contenttweaker:raw_photovoltaic>, [
		[<prodigytech:energion_dust>, <enderio:item_material:38>, <prodigytech:energion_dust>], 
		[<enderio:item_material:38>, <prodigytech:circuit_plate>, <enderio:item_material:38>], 
		[<prodigytech:energion_dust>, <enderio:item_material:38>, <prodigytech:energion_dust>]
	]);
	furnace.addRecipe(<enderio:item_material:3>, <contenttweaker:raw_photovoltaic>);
	mods.enderio.AlloySmelter.addRecipe(
		<enderio:item_material:3>,
		[
			<enderio:item_material:38> * 3,
			<prodigytech:circuit_plate>, 
			<prodigytech:energion_dust> * 2
		],
		25000
	);

	scripts.content_machines.addAdvancedMixerRecipe(
		[<enderio:item_material:38> * 6], [],
		[
			<thermalfoundation:material:768>,
			<enderio:item_material:32>,
			<appliedenergistics2:material:5>
		], [
			<liquid:ferramic> * 144
		],
		10, 10000
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:raw_photovoltaic> * 20],
		[
			<prodigytech:circuit_plate> * 16,
			<enderio:item_material:38> * 24,
			<extrautils2:ingredients:3> * 4,
			<projectred-core:resource_item:105> * 8,
			<thermalfoundation:material:70>
		], null,
		40, 1000
	);
}


{//mirrors
	recipes.addShaped("ia_solar_part1", <solarflux:mirror> * 3, [
		[<minecraft:glass>, <minecraft:glass>, <minecraft:glass>], 
		[<ore:crystalPureNetherQuartz>, <thermalfoundation:material:322>, <ore:crystalPureNetherQuartz>]
	]);
	addAssemblerRecipe(
		[<solarflux:mirror> * 4],
		[
			<minecraft:glass> * 2,
			<ore:crystalPureNetherQuartz>
		], <liquid:silver> * 288,
		5, 100
	);

	recipes.addShaped("ia_solar_part2", <solarflux:photovoltaic_cell_1> * 3, [
		[<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>], 
		[<atum:crystal_glass>, <contenttweaker:angel_plate>, <atum:crystal_glass>], 
		[<ore:itemPowderPhotovoltaic>, <extrautils2:decorativesolid:7>, <ore:itemPowderPhotovoltaic>]
	]);
	addAssemblerRecipe(
		[<solarflux:photovoltaic_cell_1> * 4],
		[
			<solarflux:mirror> * 3,
			<atum:crystal_glass> * 2,
			<ore:itemPowderPhotovoltaic>,
			<extrautils2:decorativesolid:7>
		], <liquid:angel> * 288,
		10, 150
	);

	recipes.addShaped("ia_solar_part3", <solarflux:photovoltaic_cell_2> * 3, [
		[<solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>], 
		[<thermalfoundation:glass:1>, <ore:plateElectrotineAlloy>, <thermalfoundation:glass:1>], 
		[<ore:gemPrismarine>, <ore:foodSoymilk>, <ore:gemPrismarine>]
	]);
	addAssemblerRecipe(
		[<solarflux:photovoltaic_cell_2> * 4],
		[
			<solarflux:photovoltaic_cell_1> * 3,
			<thermalfoundation:glass:1>, 
			<ore:plateElectrotineAlloy>,
			<ore:gemPrismarine>
		], <liquid:soy_milk> * 200,
		20, 200
	);

	recipes.addShaped("ia_solar_part4", <solarflux:photovoltaic_cell_3> * 3, [
		[<solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>], 
		[<ore:blockQuartzGlass>, <contenttweaker:osgloridium_plate>, <ore:blockQuartzGlass>], 
		[<extrautils2:ineffableglass:2>, <extendedcrafting:singularity_custom:3>, <extrautils2:ineffableglass:2>]
	]);
	addAssemblerRecipe(
		[<solarflux:photovoltaic_cell_3> * 4],
		[
			<solarflux:photovoltaic_cell_2> * 3,
			<betternether:quartz_glass>,
			<extrautils2:ineffableglass:2>, 
			<extendedcrafting:singularity_custom:3>
		], <liquid:osgloridium> * 288,
		20, 300
	);

	recipes.addShaped("ia_solar_part5", <solarflux:photovoltaic_cell_4> * 3, [
		[<solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>], 
		[<appliedenergistics2:quartz_glass>, <enderio:item_material:3>, <appliedenergistics2:quartz_glass>], 
		[<contenttweaker:enittin>, <contenttweaker:entangled_particles>, <contenttweaker:enittin>]
	]);
	addAssemblerRecipe(
		[<solarflux:photovoltaic_cell_4> * 4],
		[
			<solarflux:photovoltaic_cell_3> * 3,
			<appliedenergistics2:quartz_glass>, 
			<contenttweaker:enittin>,
			<enderio:item_material:3>, 
			<contenttweaker:entangled_particles>
		], null,
		20, 400
	);

	recipes.addShaped("ia_solar_part6", <solarflux:photovoltaic_cell_5> * 3, [
		[<solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>], 
		[<projectred-core:resource_item:341>, <enderio:item_material:17>, <projectred-core:resource_item:341>], 
		[<enderio:item_material:34>, <enderio:item_capacitor_crystalline>, <enderio:item_material:34>]
	]);
	addAssemblerRecipe(
		[<solarflux:photovoltaic_cell_5> * 4],
		[
			<solarflux:photovoltaic_cell_4> * 3,
			<projectred-core:resource_item:341>, <enderio:item_material:17>,
			<enderio:item_material:34>, <enderio:item_capacitor_crystalline>
		], null,
		20, 400
	);

	addAssemblerRecipe(
		[<solarflux:photovoltaic_cell_6> * 4],
		[
			<solarflux:photovoltaic_cell_5> * 3,
			<extendedcrafting:singularity_custom:22> | <extendedcrafting:singularity_custom:21> | <extendedcrafting:singularity_custom:23>,
			<quantumflux:craftingpiece:2> * 16,
			<contenttweaker:indium_dust> * 4,
			<contenttweaker:solar_silicon_singularity>
		],
		<liquid:nether_star_solution> * 1000,
		40, 1500
	);

	addAssemblerRecipe(
		[<contenttweaker:chitin_mirror> * 4],
		[
			<solarflux:photovoltaic_cell_6> * 3,
			<contenttweaker:chitin> * 64,
			<enderio:block_solar_panel:3> * 8,
			<contenttweaker:laser_mirror> * 16,
			<contenttweaker:perfect_mirror>
		], <liquid:sunnarium> * 750,
		20, 2000
	);

	addBioAssemblerRecipe(
		[<contenttweaker:zirconium_mirror> * 4], null,
		[
			<contenttweaker:chitin_mirror> * 3,
			<contenttweaker:zirconium_lens> * 12,
			<contenttweaker:star_polymer> * 4,
			<contenttweaker:electric_wool2> * 4,
			<contenttweaker:night_glass> * 2,
			<contenttweaker:perfect_mirror_array>
		], [

		], <contenttweaker:laser>,
		20, 1000
	);
}

{//solar
	recipes.addShaped("ia_solar_panel1", <solarflux:solar_panel_1> * 2, [
		[<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>], 
		[<immersiveengineering:wirecoil:5>, <enderio:item_material:3>, <immersiveengineering:wirecoil:5>], 
		[<ore:stickAluminum>, <ore:plankWood>, <ore:stickAluminum>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_1> * 2],
		[
			<solarflux:mirror> * 2,
			<immersiveengineering:wirecoil:5>, 
			<enderio:item_material:3>,
			<ore:stickAluminum>
		], null,
		5, 100
	);

	recipes.addShaped("ia_solar_panel2", <solarflux:solar_panel_2> * 2, [
		[<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>], 
		[<solarflux:solar_panel_1>, <enderio:item_material:3>, <solarflux:solar_panel_1>], 
		[<solarflux:solar_panel_1>, <prodigytech:heat_capacitor_0>, <solarflux:solar_panel_1>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_2> * 3],
		[
			<solarflux:mirror> * 3,
			<solarflux:solar_panel_1> * 6,
			<enderio:item_material:3>,
			<prodigytech:heat_capacitor_0>
		], null,
		5, 150
	);

	recipes.addShaped("ia_solar_panel3", <solarflux:solar_panel_3> * 2, [
		[<solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>], 
		[<solarflux:solar_panel_2>, <extrautils2:suncrystal>, <solarflux:solar_panel_2>], 
		[<solarflux:solar_panel_2>, <extrautils2:machine>, <solarflux:solar_panel_2>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_3> * 3],
		[
			<solarflux:photovoltaic_cell_1> * 3,
			<solarflux:solar_panel_2> * 6,
			<extrautils2:suncrystal>,
			<extrautils2:machine>
		], null,
		10, 200
	);

	recipes.addShaped("ia_solar_panel4", <solarflux:solar_panel_4> * 2, [
		[<solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>], 
		[<solarflux:solar_panel_3>, <thermalfoundation:material:515>, <solarflux:solar_panel_3>], 
		[<solarflux:solar_panel_3>, <thermalexpansion:frame>, <solarflux:solar_panel_3>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_4> * 3],
		[
			<solarflux:photovoltaic_cell_2> * 3,
			<solarflux:solar_panel_3> * 6,
			<thermalfoundation:material:515>,
			<thermalexpansion:frame>
		], null,
		10, 500
	);

	recipes.addShaped("ia_solar_panel5", <solarflux:solar_panel_5> * 2, [
		[<solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>], 
		[<solarflux:solar_panel_4>, <contenttweaker:ra_burner>, <solarflux:solar_panel_4>], 
		[<solarflux:solar_panel_4>, <mekanism:basicblock:8>, <solarflux:solar_panel_4>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_5> * 3],
		[
			<solarflux:photovoltaic_cell_3> * 3,
			<solarflux:solar_panel_4> * 6,
			<contenttweaker:ra_burner>,
			<mekanism:basicblock:8>
		], null,
		20, 1000
	);

	recipes.addShaped("ia_solar_panel6", <solarflux:solar_panel_6> * 2, [
		[<solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>], 
		[<solarflux:solar_panel_5>, <actuallyadditions:item_battery_double>, <solarflux:solar_panel_5>], 
		[<solarflux:solar_panel_5>, <actuallyadditions:block_misc:9>, <solarflux:solar_panel_5>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_6> * 3],
		[
			<solarflux:photovoltaic_cell_4> * 3,
			<solarflux:solar_panel_5> * 6,
			<actuallyadditions:item_battery_double>,
			<actuallyadditions:block_misc:9>
		], null,
		20, 1000
	);

	recipes.addShaped("ia_solar_panel7", <solarflux:solar_panel_7> * 2, [
		[<solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>], 
		[<solarflux:solar_panel_6>, <enderio:block_solar_panel:3>, <solarflux:solar_panel_6>], 
		[<solarflux:solar_panel_6>, <enderio:item_material:1>, <solarflux:solar_panel_6>]
	]);
	addAssemblerRecipe(
		[<solarflux:solar_panel_7> * 3],
		[
			<solarflux:photovoltaic_cell_5> * 3,
			<solarflux:solar_panel_6> * 6,
			<enderio:block_solar_panel:3>,
			<enderio:item_material:1>
		], null,
		20, 2000
	);

	addAssemblerRecipe(
		[<solarflux:solar_panel_8> * 3],
		[
			<solarflux:photovoltaic_cell_6> * 3,
			<solarflux:solar_panel_7> * 6,
			<redstonearsenal:material:224> * 4,
			<contenttweaker:solar_potion_zinc_gear> * 4,
			<actuallyadditions:block_misc:8>
		], null,
		20, 3000
	);

	addBioAssemblerRecipe(
		[<solarflux:custom_solar_panel_chitin> * 3], null,
		[
			<contenttweaker:chitin_mirror> * 3,
			<solarflux:solar_panel_8> * 6,
			<contenttweaker:light_cell> * 2,
			<contenttweaker:goldscarab_sun>,
			<contenttweaker:soul_frame>
		], [], null,
		20, 3000
	);
}



scripts.content_machines.addAdvancedMixerRecipe(
	[], [<liquid:sunnarium> * 200],
	[
		<extrautils2:suncrystal>,
		<contenttweaker:solar_silicon> * 4,
		<contenttweaker:light_ingot>
	], [
		<liquid:sunnarium_base> * 1000,
		<liquid:luminessence> * 150,
		<liquid:refined_glowstone> * 250
	], 20, 10000
);
scripts.content_machines.addAdvancedMixerRecipe(
	[], [<liquid:sunnarium_base> * 150],
	[
		<erebus:materials:12> * 4,
		<twilightforest:torchberries> * 4,
		<biomesoplenty:coral:3> * 4,
		<quark:glowshroom> * 4
	], [
		<liquid:glowstone> * 1000
	], 20, 1000
);