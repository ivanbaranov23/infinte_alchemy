
recipes.remove(<openblocks:xp_bottler>);
recipes.addShaped("ia_xp_bottler", <openblocks:xp_bottler>, [
	[<contenttweaker:zinc_plate>, <minecraft:glass_bottle>, <contenttweaker:zinc_plate>], 
	[<immersiveengineering:metal_device1:6>, <extrautils2:machine>, <immersiveengineering:metal_device1:6>], 
	[<contenttweaker:zinc_plate>, <immersiveengineering:material:9>, <contenttweaker:zinc_plate>]
]);

scripts.jei.addJEIhint(
    [<minecraft:glass_bottle>],
    [<liquid:xpjuice>],
    [<openblocks:xp_bottler>],
    [<minecraft:experience_bottle>]
);

recipes.remove(<openblocks:xp_drain>);
recipes.addShaped("ia_xp_drain", <openblocks:xp_drain>, [
	[<minecraft:iron_bars>, <immersiveengineering:material:8>, <minecraft:iron_bars>], 
	[<minecraft:iron_bars>, <mob_grinding_utils:xp_tap>, <minecraft:iron_bars>], 
	[<minecraft:iron_bars>, <immersiveengineering:material:8>, <minecraft:iron_bars>]
]);

scripts.jei.addJEIhint(
    [<minecraft:skull:2>.withDisplayName("Player")],
    [],
    [<mob_grinding_utils:tank_sink>, <openblocks:xp_drain>],
    [],
    [<liquid:xpjuice>]
);