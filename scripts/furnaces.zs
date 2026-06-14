
//furnace
recipes.remove(<minecraft:furnace>);
recipes.addShaped("furnace", <minecraft:furnace>,
    [
		[<roots:runestone>, <roots:runestone>, <roots:runestone>],
    	[<roots:runestone>, <minecraft:glass>, <roots:runestone>],
    	[<roots:runestone>, <contenttweaker:firebrick_block>, <roots:runestone>]
	]
);
recipes.addShaped("furnace2", <minecraft:furnace> * 2, [
	[<roots:runestone>, <thermalfoundation:material:163>, <roots:runestone>],
    [<thermalfoundation:material:163>, <minecraft:glass>, <thermalfoundation:material:163>],
    [<roots:runestone>, <contenttweaker:firebrick_block>, <roots:runestone>]
]);

{//furnaces
	recipes.removeByMod("morefurnaces");
	recipes.addShaped("ia_copper_furnace", <morefurnaces:furnaceblock:5>, [
		[null, <ore:plateCopper>, null], 
		[<ore:stickCopper>, <minecraft:furnace>, <ore:stickCopper>], 
		[null, <ore:plateCopper>, null]
	]);
	recipes.addShaped("ia_iron_furnace", <morefurnaces:furnaceblock>, [
		[null, <ore:plateIron>, null], 
		[<ore:stickIron>, <morefurnaces:furnaceblock:5>, <ore:stickIron>], 
		[null, <ore:plateIron>, null]
	]);
	recipes.addShaped("ia_silver_furnace", <morefurnaces:furnaceblock:6>, [
		[null, <ore:plateSilver>, null], 
		[<ore:stickSilver>, <morefurnaces:furnaceblock>, <ore:stickSilver>], 
		[null, <ore:plateSilver>, null]
	]);
	recipes.addShaped("ia_gold_furnace", <morefurnaces:furnaceblock:1>, [
		[null, <ore:plateGold>, null], 
		[<ore:stickGold>, <morefurnaces:furnaceblock:6>, <ore:stickGold>], 
		[null, <ore:plateGold>, null]
	]);
	recipes.addShaped("ia_diamond_furnace", <morefurnaces:furnaceblock:2>, [
		[null, <ore:plateDiamond>, null], 
		[<ore:gearDiamond>, <morefurnaces:furnaceblock:1>, <ore:gearDiamond>], 
		[null, <ore:plateDiamond>, null]
	]);
	recipes.addShaped("ia_obsidian_furnace", <morefurnaces:furnaceblock:3>, [
		[<ore:runedObsidian>, <ore:obsidian>, <ore:runedObsidian>], 
		[<morefurnaces:furnaceblock:2>, <ore:gearRefinedObsidian>, <morefurnaces:furnaceblock:2>], 
		[<ore:runedObsidian>, <ore:obsidian>, <ore:runedObsidian>]
	]);

	recipes.remove(<betternether:cincinnasite_forge>);
	recipes.addShaped("ia_cincinnasite_forge", <betternether:cincinnasite_forge>, [
		[<minecraft:nether_brick>, <ore:blockCincinnasite>, <minecraft:nether_brick>], 
		[<ore:blockCincinnasite>, <morefurnaces:furnaceblock:3>, <ore:blockCincinnasite>], 
		[<minecraft:nether_brick>, <ore:blockCincinnasite>, <minecraft:nether_brick>]
	]);
}

recipes.remove(<betternether:netherrack_furnace>);
recipes.remove(<natura:netherrack_furnace>);
recipes.remove(<morefurnaces:furnaceblock:4>);
recipes.addShaped("nether_furnace", <morefurnaces:furnaceblock:4>, [
	[<minecraft:netherrack>, <minecraft:netherrack>, <minecraft:netherrack>],
    [<minecraft:netherrack>, <minecraft:furnace>, <minecraft:netherrack>],
    [<minecraft:netherrack>, <contenttweaker:firebrick_block>, <minecraft:netherrack>]
]);

recipes.remove(<erebus:umber_furnace>);
recipes.addShaped("umber_furnace", <erebus:umber_furnace>, [
	[<erebus:umberstone:1>, <erebus:umberstone:1>, <erebus:umberstone:1>],
    [<erebus:umberstone:1>, <minecraft:furnace>, <erebus:umberstone:1>],
    [<erebus:umberstone:1>, <contenttweaker:firebrick_block>, <erebus:umberstone:1>]
]);

recipes.remove(<atum:limestone_furnace>);
recipes.addShaped("limestone_furnace", <atum:limestone_furnace>, [
	[<atum:limestone_cracked>, <atum:limestone_cracked>, <atum:limestone_cracked>],
    [<atum:limestone_cracked>, <minecraft:furnace>, <atum:limestone_cracked>],
    [<atum:limestone_cracked>, <contenttweaker:firebrick_block>, <atum:limestone_cracked>]
]);