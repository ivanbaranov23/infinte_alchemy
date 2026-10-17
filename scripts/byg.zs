import crafttweaker.item.IItemStack;

recipes.remove(<byg:kasai_chain_plating>);
recipes.addShaped("ia_kasai_chain_plating", <byg:kasai_chain_plating> * 2, [
	[<byg:kasai_ingot>, <quark:chain>, <byg:kasai_ingot>], 
	[<quark:chain>, <byg:kasai_ingot>, <quark:chain>], 
	[<byg:kasai_ingot>, <quark:chain>, <byg:kasai_ingot>]
]);


recipes.addShaped("ia_byg_light_blue_sand", <byg:light_blue_sand> * 8, [
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>], 
	[<minecraft:sand>, <ore:dyeLightBlue>, <minecraft:sand>], 
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>]
]);
recipes.addShaped("ia_byg_pink_sand", <byg:pink_sand> * 8, [
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>], 
	[<minecraft:sand>, <ore:dyePink>, <minecraft:sand>], 
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>]
]);
recipes.addShaped("ia_byg_purple_sand", <byg:purple_sand> * 8, [
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>], 
	[<minecraft:sand>, <ore:dyePurple>, <minecraft:sand>], 
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>]
]);
recipes.addShaped("ia_byg_black_sand", <byg:black_sand> * 8, [
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>], 
	[<minecraft:sand>, <ore:dyeBlack>, <minecraft:sand>], 
	[<minecraft:sand>, <minecraft:sand>, <minecraft:sand>]
]);