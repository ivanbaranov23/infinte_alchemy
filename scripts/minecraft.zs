import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;


recipes.remove(<dimensionaledibles:nether_cake>);
recipes.addShaped("ia_nether_cake", <dimensionaledibles:nether_cake>, [
	[<ore:runedObsidian>, <erebus:materials:38>, <ore:runedObsidian>], 
	[<contenttweaker:anubis_godshard>, <actuallyadditions:item_food:8>, <contenttweaker:anubis_godshard>], 
	[<ore:runedObsidian>, <ore:plateEnderium>, <ore:runedObsidian>]
]);
recipes.remove(<exnihilocreatio:block_end_cake>);
recipes.remove(<dimensionaledibles:end_cake>);
recipes.addShaped("ia_end_cake", <dimensionaledibles:end_cake>, [
	[<contenttweaker:delicate_tanzanite>, <ore:pearlEnderEye>, <contenttweaker:delicate_tanzanite>], 
	[<contenttweaker:nuit_godshard>, <ore:foodCarrotcake>, <contenttweaker:nuit_godshard>], 
	[<ore:endstone>, <erebus:materials:38>, <ore:endstone>]
]);


//shrub
furnace.addRecipe(<minecraft:tallgrass>, <ore:treeSapling>);



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

//brewing
recipes.remove(<minecraft:brewing_stand>);
recipes.addShaped("ia_brewing_stand", <minecraft:brewing_stand>, [
	[null, <ore:itemBlazeRod>, null], 
	[null, <contenttweaker:watertight_steel_rod>, null], 
	[<projectred-core:resource_item>, <projectred-core:resource_item>, <projectred-core:resource_item>]
]);

{//enchan table
	recipes.remove(<minecraft:enchanting_table>);
	recipes.addShaped("ia_enchantment_table", <minecraft:enchanting_table>, [
		[null, <moreplates:enchanted_plate>, null], 
		[<contenttweaker:horus_godshard>, <roots:runed_obsidian>, <contenttweaker:horus_godshard>], 
		[<roots:runed_obsidian>, <roots:runed_obsidian>, <roots:runed_obsidian>]
	]);

	recipes.remove(<apotheosis:hellshelf>);
	recipes.addShaped("ia_apo_hellshelf", <apotheosis:hellshelf>, [
		[<minecraft:nether_brick>, <ore:bookshelf>, <minecraft:nether_brick>], 
		[<minecraft:enchanted_book>, <actuallyadditions:item_coffee>.withTag({"1": {Duration: 20, ID: 12, Amplifier: 1}, Counter: 1}), <minecraft:enchanted_book>], 
		[<minecraft:nether_brick>, <ore:bookshelf>, <minecraft:nether_brick>]
	]);
}



//glowstone
recipes.addShapeless("glow_uncompr", <minecraft:glowstone_dust> * 4, [<minecraft:glowstone>]);

//nether
recipes.remove(<betternether:cincinnasite_block>);
recipes.addShaped("ia_cincinnasite_block", <betternether:cincinnasite_block>, [
	[<betternether:cincinnasite>, <betternether:cincinnasite>, <betternether:cincinnasite>], 
	[<betternether:cincinnasite>, <betternether:cincinnasite>, <betternether:cincinnasite>], 
	[<betternether:cincinnasite>, <betternether:cincinnasite>, <betternether:cincinnasite>]
]);
recipes.addShapeless("ia_cincinnasite", <betternether:cincinnasite> * 9, 
	[<betternether:cincinnasite_block>]
);

furnace.remove(<betternether:cincinnasite_forged>);
recipes.addShaped("ia_cincinnasite_forged", <betternether:cincinnasite_forged>, [
	[<roots:infernal_bulb>, <prodigytech:inferno_crystal>, <roots:infernal_bulb>], 
	[<ore:dustPyrotheum>, <betternether:cincinnasite_block>, <ore:dustPyrotheum>], 
	[<roots:infernal_bulb>, <contenttweaker:ptah_godshard>, <roots:infernal_bulb>]
]);

recipes.addShaped("ia_quartz_from_tiny", <minecraft:quartz>, [
	[<agricraft:agri_nugget:2>, <agricraft:agri_nugget:2>, <agricraft:agri_nugget:2>],
	[<agricraft:agri_nugget:2>, <agricraft:agri_nugget:2>, <agricraft:agri_nugget:2>],
	[<agricraft:agri_nugget:2>, <agricraft:agri_nugget:2>, <agricraft:agri_nugget:2>]
]);
mods.roots.Mortar.addRecipe("ia_quartz", <appliedenergistics2:material:3>, [<minecraft:quartz>]);


{//plants
	//grass
	mods.mekanism.infuser.addRecipe("BIO", 20, <minecraft:dirt>, <minecraft:grass>);
	//trees
	mods.chisel.Carving.addGroup("vanillasapling");
	mods.chisel.Carving.addVariation("vanillasapling", <minecraft:sapling>);
	mods.chisel.Carving.addVariation("vanillasapling", <minecraft:sapling:1>);
	mods.chisel.Carving.addVariation("vanillasapling", <minecraft:sapling:2>);
	mods.chisel.Carving.addVariation("vanillasapling", <minecraft:sapling:3>);
	mods.chisel.Carving.addVariation("vanillasapling", <minecraft:sapling:4>);
	mods.chisel.Carving.addVariation("vanillasapling", <minecraft:sapling:5>);
	//mushrooms
	recipes.addShapeless(
		"ia_red_mushroom_dup",
		<minecraft:red_mushroom> * 3,
		[<exnihilocreatio:item_material:3>, <minecraft:red_mushroom>]
	);
	recipes.addShapeless(
		"ia_brown_mushroom_dup",
		<minecraft:brown_mushroom> * 3,
		[<exnihilocreatio:item_material:3>, <minecraft:brown_mushroom>]
	);
	//sugarcane
	recipes.addShapeless(
		"ia_early_sugarcane",
		<minecraft:reeds>,
		[<exnihilocreatio:item_seed_sugarcane>]
	);

	//g apple
	recipes.removeByRecipeName("bhc:god_apple");
	recipes.addShaped("ia_g_apple_alt1", <minecraft:golden_apple:1>, [
		[<minecraft:gold_block>, <extendedcrafting:singularity:5>, <minecraft:gold_block>],
		[<extendedcrafting:singularity:5>, <minecraft:apple>, <extendedcrafting:singularity:5>],
		[<minecraft:gold_block>, <extendedcrafting:singularity:5>, <minecraft:gold_block>]
	]);
	recipes.addShaped("ia_g_apple_alt2", <minecraft:golden_apple:1>, [
		[<minecraft:gold_ingot>, <contenttweaker:vitamins>, <minecraft:gold_ingot>],
		[<contenttweaker:vitamins>, <minecraft:apple>, <contenttweaker:vitamins>],
		[<minecraft:gold_ingot>, <contenttweaker:vitamins>, <minecraft:gold_ingot>]
	]);
}

//bricks
furnace.addRecipe(<minecraft:brick>, <contenttweaker:brick_dust>);

//charcoal to ash
furnace.remove(<bigreactors:ingotgraphite>);
furnace.addRecipe(<prodigytech:ash>, <minecraft:coal:1>);

recipes.remove(<minecraft:experience_bottle>);
mods.mekanism.compressor.addRecipe(
    <minecraft:glass_bottle>, 
    <gas:xpjuice>,
    <minecraft:experience_bottle>
);

//paper
<minecraft:paper>.displayName = "Low Quality Paper";
<minecraft:paper>.addTooltip("can be obtained from bone mealing paperbark log");
recipes.remove(<minecraft:paper>);


{//piston
	recipes.remove(<minecraft:piston>);
	recipes.addShaped("ia_piston1", <minecraft:piston>, [
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
		[<ore:alloyBasic>, <ore:stickIron>, <ore:alloyBasic>], 
		[<ore:stone>, <ore:plateIron>, <ore:stone>]
	]);
	recipes.addShaped("ia_piston2", <minecraft:piston>, [
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
		[<ore:alloyBasic>, <ore:stickBronze>, <ore:alloyBasic>], 
		[<ore:stone>, <ore:plateBronze>, <ore:stone>]
	]);
	recipes.addShaped("ia_piston3", <minecraft:piston> * 2, [
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
		[<ore:alloyBasic>, <ore:stickSteel>, <ore:alloyBasic>], 
		[<ore:stone>, <ore:plateSteel>, <ore:stone>]
	]);
	recipes.addShaped("ia_piston4", <minecraft:piston> * 4, [
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
		[<ore:alloyBasic>, <contenttweaker:duraluminum_rod>, <ore:alloyBasic>], 
		[<ore:stone>, <contenttweaker:duraluminum_plate>, <ore:stone>]
	]);
	recipes.addShaped("ia_piston5", <minecraft:piston> * 8, [
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
		[<ore:alloyBasic>, <contenttweaker:thermal_rod>, <ore:alloyBasic>], 
		[<ore:stone>, <contenttweaker:thermal_plate>, <ore:stone>]
	]);
	recipes.addShaped("ia_piston6", <minecraft:piston> * 12, [
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
		[<ore:alloyBasic>, <contenttweaker:mekanized_steel_rod>, <ore:alloyBasic>], 
		[<ore:stone>, <contenttweaker:mekanized_steel_plate>, <ore:stone>]
	]);
}

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

//mycelium
recipes.remove(<minecraft:mycelium>);

//tnt
recipes.remove(<minecraft:tnt>);
recipes.addShaped("ia_tnt1", <minecraft:tnt>, [
	[<appliedenergistics2:tiny_tnt>, <immersiveengineering:wirecoil:3>, <appliedenergistics2:tiny_tnt>], 
	[<ore:sand>, <ore:gunpowder>, <ore:sand>], 
	[<appliedenergistics2:tiny_tnt>, <ore:gunpowder>, <appliedenergistics2:tiny_tnt>]
]);
recipes.addShaped("ia_tnt2", <minecraft:tnt> * 3, [
	[<appliedenergistics2:tiny_tnt>, <immersiveengineering:wirecoil:3>, <appliedenergistics2:tiny_tnt>], 
	[<ore:sand>, <ore:gunpowder>, <ore:sand>], 
	[<appliedenergistics2:tiny_tnt>, <natura:empty_bowls:3>, <appliedenergistics2:tiny_tnt>]
]);

//beacon
recipes.remove(<minecraft:beacon>);
recipes.addShaped("ia_beacon", <minecraft:beacon>, [
	[<engineersdecor:panzerglass_block>, <atum:radiant_beacon>, <engineersdecor:panzerglass_block>], 
	[<engineersdecor:panzerglass_block>, <minecraft:nether_star>, <engineersdecor:panzerglass_block>], 
	[<taiga:obsidiorite_block>, <actuallyadditions:block_misc:8>, <taiga:obsidiorite_block>]
]);

//scannable
recipes.remove(<scannable:module_blank>);
recipes.addShaped("ia_scannable_module_blank", <scannable:module_blank>, [
	[<ore:plateOsgloglas>, <ore:plateOsgloglas>, <ore:plateOsgloglas>], 
	[<contenttweaker:advanced_circuit_plate>, <ore:circuitUltimate>, <contenttweaker:advanced_circuit_plate>], 
	[<contenttweaker:gold_wire>, <contenttweaker:gold_wire>, <contenttweaker:gold_wire>]
]);
recipes.remove(<scannable:scanner>);
recipes.addShaped("ia_scanner", <scannable:scanner>, [
	[<contenttweaker:electric_manyullyn_rod>, null, <contenttweaker:electric_manyullyn_rod>], 
	[<contenttweaker:mekanized_steel_plate>, <scannable:module_blank>, <contenttweaker:mekanized_steel_plate>], 
	[<moreplates:electrical_steel_plate>, <mekanism:energytablet>, <moreplates:electrical_steel_plate>]
]);