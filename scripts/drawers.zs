
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
recipes.addShaped("ia_drawer_upgrade_template", <storagedrawers:upgrade_template>, [
	[<ore:stickWood>, <ore:stickInvar>, <ore:stickWood>], 
	[<ore:dustElectrotine>, <ore:drawerBasic>, <ore:dustElectrotine>], 
	[<ore:stickWood>, <ore:stickInvar>, <ore:stickWood>]
]);
recipes.remove(<storagedrawers:upgrade_void>);
recipes.addShaped("ia_drawer_upgrade_void", <storagedrawers:upgrade_void>, [
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