
recipes.remove(<mob_grinding_utils:tank>);
recipes.addShaped("ia_mgu_tank", <mob_grinding_utils:tank> * 4, [
	[null, <minecraft:glass>, null], 
	[<minecraft:glass>, <minecraft:experience_bottle>, <minecraft:glass>], 
	[null, <thermalfoundation:material:32>, null]
]);

recipes.remove(<mob_grinding_utils:tank_sink>);
recipes.addShaped("ia_mgu_tank_sink", <mob_grinding_utils:tank_sink>, [
	[null, <openblocks:xp_drain>, null], 
	[<thermalfoundation:material:32>, <minecraft:hopper>, <thermalfoundation:material:32>], 
	[null, <mob_grinding_utils:tank>, null]
]);

recipes.remove(<mob_grinding_utils:absorption_hopper>);
recipes.remove(<openblocks:vacuum_hopper>);
recipes.addShapeless("open_to_mgu", <mob_grinding_utils:absorption_hopper>, [<openblocks:vacuum_hopper>]);
recipes.addShapeless("mgu_to_open", <openblocks:vacuum_hopper>, [<mob_grinding_utils:absorption_hopper>]);

recipes.addShaped("mob_grinding_utils_absorption_hopper", <mob_grinding_utils:absorption_hopper>, [
	[<minecraft:ender_eye>, <roots:runed_obsidian>, <minecraft:ender_eye>], 
	[<minecraft:hopper>, <contenttweaker:singularity_dust>, <minecraft:hopper>], 
	[<minecraft:ender_eye>, <thermalfoundation:material:354>, <minecraft:ender_eye>]
]);

recipes.remove(<openblocks:fan>);
recipes.remove(<mob_grinding_utils:fan>);
recipes.addShaped("open_fan", <openblocks:fan>, [
	[<immersiveengineering:material:1>], 
	[<immersiveengineering:wirecoil:5>], 
	[<projectred-core:resource_item>]
]);
recipes.addShaped("mgu_fan", <mob_grinding_utils:fan>, [
	[<projectred-core:resource_item>, <projectred-core:resource_item>, <projectred-core:resource_item>], 
	[<immersiveengineering:wirecoil:5>, <openblocks:fan>, <contenttweaker:rotor_blades>], 
	[<projectred-core:resource_item>, <extrautils2:machine>, <projectred-core:resource_item>]
]);

recipes.remove(<mob_grinding_utils:saw>);
recipes.addShaped("open_saw", <mob_grinding_utils:saw>, [
	[<extrautils2:spike_diamond>, <thermalfoundation:material:657>, <extrautils2:spike_diamond>], 
	[<mob_grinding_utils:spikes>, <thermalfoundation:material:640>, <mob_grinding_utils:spikes>], 
	[<extrautils2:spike_diamond>, <thermalexpansion:frame:64>, <extrautils2:spike_diamond>]
]);


{
	recipes.remove(<mob_grinding_utils:saw_upgrade>);
	recipes.addShaped("ia_saw_upgrade_sharpness", <mob_grinding_utils:saw_upgrade> * 2, [
		[<moreplates:redstone_alloy_plate>, <thermalfoundation:material:33>, <moreplates:redstone_alloy_plate>], 
		[<thermalfoundation:material:33>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{id: 16, lvl: 1 as short}]}), <thermalfoundation:material:33>], 
		[<moreplates:redstone_alloy_plate>, <thermalfoundation:material:33>, <moreplates:redstone_alloy_plate>]
	]);
	recipes.remove(<mob_grinding_utils:saw_upgrade:1>);
	recipes.addShaped("ia_saw_upgrade_looting", <mob_grinding_utils:saw_upgrade:1> * 2, [
		[<moreplates:redstone_alloy_plate>, <thermalfoundation:material:33>, <moreplates:redstone_alloy_plate>], 
		[<thermalfoundation:material:33>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{id: 21, lvl: 1 as short}]}), <thermalfoundation:material:33>], 
		[<moreplates:redstone_alloy_plate>, <thermalfoundation:material:33>, <moreplates:redstone_alloy_plate>]
	]);
}