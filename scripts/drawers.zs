
recipes.remove(<storagedrawers:controller>);
recipes.addShaped("ia_drawer_controller", <storagedrawers:controller>, [
	[<ore:blockSkyStone>, <immersiveengineering:connector:12>, <ore:blockSkyStone>], 
	[<immersiveengineering:wirecoil:5>, <ore:drawerBasic>, <immersiveengineering:wirecoil:5>], 
	[<ore:blockSkyStone>, <extendedcrafting:singularity_custom:2>, <ore:blockSkyStone>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<storagedrawers:controller>],
	[
		<ore:drawerBasic>,
		<immersiveengineering:connector:12>,
		<immersiveengineering:wirecoil:5>,
		<appliedenergistics2:sky_stone_block> * 2
	],
	null,
	10, 64
);

recipes.remove(<storagedrawers:compdrawers>);
recipes.addShaped("ia_compdrawers", <storagedrawers:compdrawers>, [
	[<ore:blockSkyStone>, <minecraft:piston>, <ore:blockSkyStone>], 
	[<immersiveengineering:wirecoil:5>, <ironchest:iron_chest:3>, <immersiveengineering:wirecoil:5>], 
	[<ore:blockSkyStone>, <minecraft:piston>, <ore:blockSkyStone>]
]);
recipes.remove(<storagedrawers:controllerslave>);
recipes.addShapeless("ia_controllerslave", <storagedrawers:controllerslave> * 4,
	[<storagedrawers:controller>]
);

recipes.remove(<storagedrawers:upgrade_template>);
recipes.addShaped("ia_drawer_upgrade_template", <storagedrawers:upgrade_template> * 2, [
	[<ore:stickWood>, <ore:stickInvar>, <ore:stickWood>], 
	[<ore:dustElectrotine>, <ore:drawerBasic>, <ore:dustElectrotine>], 
	[<ore:stickWood>, <ore:stickInvar>, <ore:stickWood>]
]);
recipes.addShaped("ia_drawer_upgrade_template2", <storagedrawers:upgrade_template> * 4, [
	[<immersiveengineering:material>, <ore:stickInvar>, <immersiveengineering:material>], 
	[<ore:dustElectrotine>, <ore:drawerBasic>, <ore:dustElectrotine>], 
	[<immersiveengineering:material>, <ore:stickInvar>, <immersiveengineering:material>]
]);
recipes.addShaped("ia_drawer_upgrade_template3", <storagedrawers:upgrade_template> * 16, [
	[<enderio:item_material:8>, <ore:stickInvar>, <enderio:item_material:8>], 
	[<ore:dustElectrotine>, <ore:drawerBasic>, <ore:dustElectrotine>], 
	[<enderio:item_material:8>, <ore:stickInvar>, <enderio:item_material:8>]
]);


recipes.remove(<storagedrawers:upgrade_void>);
recipes.addShaped("ia_drawer_upgrade_void", <storagedrawers:upgrade_void> * 2, [
	[<roots:runed_obsidian>, <ore:dustObsidian>, <roots:runed_obsidian>], 
	[<ore:dustObsidian>, <storagedrawers:upgrade_template>, <ore:dustObsidian>], 
	[<roots:runed_obsidian>, <ore:dustObsidian>, <roots:runed_obsidian>]
]);


recipes.remove(<fluiddrawers:tank>);
recipes.addShaped("ia_fluid_drawer", <fluiddrawers:tank> * 4, [
	[<contenttweaker:watertight_steel_plate>, <ore:blockGlassColorless>, <contenttweaker:watertight_steel_plate>], 
	[<ore:blockGlassColorless>, <minecraft:bucket>, <ore:blockGlassColorless>], 
	[<contenttweaker:watertight_steel_plate>, <ore:blockGlassColorless>, <contenttweaker:watertight_steel_plate>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<fluiddrawers:tank> * 4],
	[
		<minecraft:bucket>
	],
	<liquid:watertight_steel> * 576,
	10, 64
);

{//upgrades
	recipes.remove(<storagedrawers:upgrade_storage:1>);
	recipes.addShaped("upgrade_storage1", <storagedrawers:upgrade_storage:1> * 2, [
		[<thermalfoundation:material:32>, <immersiveengineering:material>, <thermalfoundation:material:32>], 
		[<immersiveengineering:material>, <storagedrawers:upgrade_template>, <immersiveengineering:material>], 
		[<thermalfoundation:material:32>, <ironchest:iron_chest:3>, <thermalfoundation:material:32>]
	]);
	recipes.addShaped("upgrade_storage1b", <storagedrawers:upgrade_storage:1> * 4, [
		[<thermalfoundation:material:32>, <immersiveengineering:material>, <thermalfoundation:material:32>], 
		[<immersiveengineering:material>, <storagedrawers:upgrade_template>, <immersiveengineering:material>], 
		[<thermalfoundation:material:32>, <ironchest:iron_chest>,<thermalfoundation:material:32>]
	]);

	recipes.remove(<storagedrawers:upgrade_storage:2>);
	recipes.addShaped("upgrade_storage2", <storagedrawers:upgrade_storage:2> * 2, [
		[<thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>, <immersiveengineering:material>, <thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>], 
		[<immersiveengineering:material>, <storagedrawers:upgrade_template>, <immersiveengineering:material>], 
		[<thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>, <ironchest:iron_chest:4>, <thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>]
	]);
	recipes.addShaped("upgrade_storage2b", <storagedrawers:upgrade_storage:2> * 4, [
		[<thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>, <immersiveengineering:material>, <thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>], 
		[<immersiveengineering:material>, <storagedrawers:upgrade_template>, <immersiveengineering:material>], 
		[<thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>, <ironchest:iron_chest:1>, <thermalfoundation:material:33> | <thermalfoundation:material:353> | <contenttweaker:goold>]
	]);

	recipes.remove(<storagedrawers:upgrade_storage:3>);
	recipes.addShaped("upgrade_storage3", <storagedrawers:upgrade_storage:3> * 4, [
		[<moreplates:diamond_plate> | <thermalfoundation:material:359> | <moreplates:electrotine_alloy_plate>, <immersiveengineering:material>, <moreplates:diamond_plate> | <thermalfoundation:material:359> | <moreplates:electrotine_alloy_plate>], 
		[<immersiveengineering:material>, <storagedrawers:upgrade_template>, <immersiveengineering:material>], 
		[<moreplates:diamond_plate> | <thermalfoundation:material:359> | <moreplates:electrotine_alloy_plate>, <ironchest:iron_chest:2>, <moreplates:diamond_plate> | <thermalfoundation:material:359> | <moreplates:electrotine_alloy_plate>]
	]);

	recipes.remove(<storagedrawers:upgrade_storage:4>);
	recipes.addShaped("upgrade_storage4", <storagedrawers:upgrade_storage:4> * 4, [
		[<moreplates:emerald_plate> | <moreplates:osgloglas_plate> | <tconevo:metal:18>, <immersiveengineering:material>, <moreplates:emerald_plate> | <moreplates:osgloglas_plate> | <tconevo:metal:18>], 
		[<immersiveengineering:material>, <storagedrawers:upgrade_template>, <immersiveengineering:material>], 
		[<moreplates:emerald_plate> | <moreplates:osgloglas_plate> | <tconevo:metal:18>, <ironchest:iron_chest:2>, <moreplates:emerald_plate> | <moreplates:osgloglas_plate> | <tconevo:metal:18>]
	]);
}

recipes.addShaped("drawer_key", <storagedrawers:drawer_key>, [
	[<thermalfoundation:material:163>, <thermalfoundation:material:355>], 
	[null, <thermalfoundation:material:355>], 
	[null, <storagedrawers:upgrade_template>]
]);