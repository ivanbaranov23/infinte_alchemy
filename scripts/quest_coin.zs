
recipes.addShapeless("ia_lots_of_iron", <minecraft:iron_block> * 64, [
    <minecraft:iron_ingot>, <contenttweaker:quest_coin>
]);


recipes.addShaped("ia_wandunbreakable_coin", <betterbuilderswands:wandunbreakable:12>, [
	[null, null, <contenttweaker:quest_coin>], 
	[null, <minecraft:stick>, null], 
	[<minecraft:stick>, null, null]
]);

//mek box
recipes.remove(<mekanism:cardboardbox>);
recipes.addShaped("ia_cardbox2", <mekanism:cardboardbox>, [
	[<ore:dustWood>, <contenttweaker:blood_shard2>, <ore:dustWood>],
	[<bloodmagic:component:18>, <actuallyadditions:block_misc:4>, <bloodmagic:component:18>],
	[<ore:dustWood>,<contenttweaker:blood_shard2>, <ore:dustWood>]
]);
recipes.addShaped("ia_cardbox", <mekanism:cardboardbox>, [
	[<ore:dustWood>, <ore:dustWood>, <ore:dustWood>],
	[<contenttweaker:quest_coin>, <actuallyadditions:block_misc:4>, <contenttweaker:quest_coin>],
	[<ore:dustWood>, <ore:dustWood>, <ore:dustWood>]
]);


recipes.addShapeless("ia_creative_mod", <tconstruct:materials:50>, [
    <contenttweaker:research_tinker>.reuse(), <contenttweaker:quest_coin>
]);

//modular hatches
recipes.addShapeless("blocksingularityiteminputbus_coin", <modularmachineryaddons:blocksingularityiteminputbus:6>, [
    <modularmachinery:blockinputbus:1>, <contenttweaker:quest_coin>, <contenttweaker:quest_coin>, <contenttweaker:quest_coin>
]);
recipes.addShapeless("blocksingularityitemoutputbus_coin", <modularmachineryaddons:blocksingularityitemoutputbus:6>, [
    <modularmachinery:blockoutputbus:1>, <contenttweaker:quest_coin>, <contenttweaker:quest_coin>, <contenttweaker:quest_coin>
]);