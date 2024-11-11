
recipes.remove(<darkutils:charm_gluttony>);
recipes.addShaped("ia_charm_gluttony", <darkutils:charm_gluttony>, [
	[null, <ore:string>, null], 
	[<ore:string>, null, <ore:string>], 
	[null, <contenttweaker:soy_gear>, null]
]);

recipes.remove(<darkutils:ender_hopper>);
recipes.addShaped("ia_ender_hopper", <darkutils:ender_hopper>, [
	[<enderio:item_material:20>, <contenttweaker:awaken_witherite>, <enderio:item_material:20>], 
	[<roots:runed_obsidian>, <minecraft:hopper>, <roots:runed_obsidian>]
]);

recipes.remove(<darkutils:trap_move>);
recipes.addShaped("ia_trap_move", <darkutils:trap_move> * 24, [
	[<immersiveengineering:conveyor>, <immersiveengineering:conveyor>, <immersiveengineering:conveyor>], 
	[<immersiveengineering:conveyor>, <contenttweaker:awaken_witherite>, <immersiveengineering:conveyor>], 
	[<immersiveengineering:conveyor>, <immersiveengineering:conveyor>, <immersiveengineering:conveyor>]
]);