
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