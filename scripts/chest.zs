import scripts.recycler.addRecycle;


recipes.remove(<extrautils2:minichest>);
recipes.addShapeless("ia_minichest", <extrautils2:minichest> * 8, [<ore:chestWood>]);

{//ironchests
	recipes.removeByMod("ironchest");
	recipes.addShaped("ia_copper_chest", <ironchest:iron_chest:3>, [
		[<extrautils2:minichest>, <ore:plateCopper>, <extrautils2:minichest>], 
		[<ore:stickCopper>, <ore:chestWood>, <ore:stickCopper>], 
		[<extrautils2:minichest>, <ore:plateCopper>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_iron_chest", <ironchest:iron_chest>, [
		[<extrautils2:minichest>, <ore:plateIron>, <extrautils2:minichest>], 
		[<ore:stickIron>, <ironchest:iron_chest:3>, <ore:stickIron>], 
		[<extrautils2:minichest>, <ore:plateIron>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_silver_chest", <ironchest:iron_chest:4>, [
		[<extrautils2:minichest>, <ore:plateSilver>, <extrautils2:minichest>], 
		[<ore:stickSilver>, <ironchest:iron_chest>, <ore:stickSilver>], 
		[<extrautils2:minichest>, <ore:plateSilver>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_gold_chest", <ironchest:iron_chest:1>, [
		[<extrautils2:minichest>, <ore:plateGold>, <extrautils2:minichest>], 
		[<ore:stickGold>, <ironchest:iron_chest:4>, <ore:stickGold>], 
		[<extrautils2:minichest>, <ore:plateGold>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_diamond_chest", <ironchest:iron_chest:2>, [
		[<extrautils2:minichest>, <ore:gearDiamond>, <extrautils2:minichest>], 
		[<ore:plateDiamond>, <ironchest:iron_chest:1>, <ore:plateDiamond>], 
		[<extrautils2:minichest>, <ore:gearDiamond>, <extrautils2:minichest>]
	]);

	recipes.addShaped("ia_obsidian_chest", <ironchest:iron_chest:6>, [
		[<ore:runedObsidian>, <ore:runedObsidian>, <ore:runedObsidian>], 
		[<ore:runedObsidian>, <ironchest:iron_chest:2>, <ore:runedObsidian>], 
		[<ore:runedObsidian>, <ore:runedObsidian>, <ore:runedObsidian>]
	]);
	recipes.addShaped("ia_crystal_chest", <ironchest:iron_chest:5>, [
		[<integratedterminals:menril_glass>, <integratedterminals:menril_glass>, <integratedterminals:menril_glass>], 
		[<integratedterminals:menril_glass>, <ironchest:iron_chest:2>, <integratedterminals:menril_glass>], 
		[<integratedterminals:menril_glass>, <integratedterminals:menril_glass>, <integratedterminals:menril_glass>]
	]);

	
}
{//ironchest upgrades
	recipes.addShaped("ia_wood_copper_chest_upgrade", <ironchest:wood_copper_chest_upgrade>, [
		[<extrautils2:minichest>, <ore:plateCopper>, <extrautils2:minichest>], 
		[<ore:stickCopper>, <ore:plankWood>, <ore:stickCopper>], 
		[<extrautils2:minichest>, <ore:plateCopper>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_wood_iron_chest_upgrade", <ironchest:wood_iron_chest_upgrade>, [
		[<extrautils2:minichest>, <ore:plateIron>, <extrautils2:minichest>], 
		[<ore:stickIron>, <ironchest:wood_copper_chest_upgrade>, <ore:stickIron>], 
		[<extrautils2:minichest>, <ore:plateIron>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_copper_iron_chest_upgrade", <ironchest:copper_iron_chest_upgrade>, [
		[<extrautils2:minichest>, <ore:plateIron>, <extrautils2:minichest>], 
		[<ore:stickIron>, <ore:ingotCopper>, <ore:stickIron>], 
		[<extrautils2:minichest>, <ore:plateIron>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_copper_silver_chest_upgrade", <ironchest:copper_silver_chest_upgrade>, [
		[<extrautils2:minichest>, <ore:plateSilver>, <extrautils2:minichest>], 
		[<ore:stickSilver>, <ironchest:copper_iron_chest_upgrade>, <ore:stickSilver>], 
		[<extrautils2:minichest>, <ore:plateSilver>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_silver_gold_chest_upgrade", <ironchest:silver_gold_chest_upgrade>, [
		[<extrautils2:minichest>, <ore:plateGold>, <extrautils2:minichest>], 
		[<ore:stickGold>, <ore:ingotSilver>, <ore:stickGold>], 
		[<extrautils2:minichest>, <ore:plateGold>, <extrautils2:minichest>]
	]);
	recipes.addShaped("ia_gold_diamond_chest_upgrade", <ironchest:gold_diamond_chest_upgrade>, [
		[<extrautils2:minichest>, <ore:gearDiamond>, <extrautils2:minichest>], 
		[<ore:plateDiamond>, <ore:ingotGold>, <ore:plateDiamond>], 
		[<extrautils2:minichest>, <ore:gearDiamond>, <extrautils2:minichest>]
	]);
}

{//colossal chests
    //recipes.removeByMod("colossalchests");

    recipes.remove(<colossalchests:chest_wall:*>);

    recipes.addShaped("cc_wood", <colossalchests:chest_wall> * 4, [
        [<minecraft:chest>], 
        [<actuallyadditions:block_misc:4>], 
        [<minecraft:chest>]
    ]);
	addRecycle(<colossalchests:chest_wall> * 4, [<actuallyadditions:block_misc:4>, <minecraft:chest> * 2]);

    recipes.addShaped("cc_copper", <colossalchests:chest_wall:1> * 4, [
        [<ironchest:iron_chest:3>], 
        [<actuallyadditions:block_misc:4>], 
        [<ironchest:iron_chest:3>]
    ]);
	addRecycle(<colossalchests:chest_wall:1> * 4, [<actuallyadditions:block_misc:4>, <ironchest:iron_chest:3> * 2]);

    recipes.addShaped("cc_iron", <colossalchests:chest_wall:2> * 4, [
        [<ironchest:iron_chest>], 
        [<actuallyadditions:block_misc:4>], 
        [<ironchest:iron_chest>]
    ]);
	addRecycle(<colossalchests:chest_wall:2> * 4, [<actuallyadditions:block_misc:4>, <ironchest:iron_chest> * 2]);

    recipes.addShaped("cc_silver", <colossalchests:chest_wall:3> * 4, [
        [<ironchest:iron_chest:4>], 
        [<actuallyadditions:block_misc:4>], 
        [<ironchest:iron_chest:4>]
    ]);
	addRecycle(<colossalchests:chest_wall:3> * 4, [<actuallyadditions:block_misc:4>, <ironchest:iron_chest:4> * 2]);

    recipes.addShaped("cc_gold", <colossalchests:chest_wall:4> * 4, [
        [<ironchest:iron_chest:1>], 
        [<actuallyadditions:block_misc:4>], 
        [<ironchest:iron_chest:1>]
    ]);
	addRecycle(<colossalchests:chest_wall:4> * 4, [<actuallyadditions:block_misc:4>, <ironchest:iron_chest:1> * 2]);

    recipes.addShaped("cc_diamond", <colossalchests:chest_wall:5> * 4, [
        [<ironchest:iron_chest:2>], 
        [<actuallyadditions:block_misc:4>], 
        [<ironchest:iron_chest:2>]
    ]);
	addRecycle(<colossalchests:chest_wall:5> * 4, [<actuallyadditions:block_misc:4>, <ironchest:iron_chest:2> * 2]);
    

	recipes.remove(<colossalchests:colossal_chest:*>);
	for i in 0 to 7{
		recipes.addShaped("colossal_chest_controller_" ~ i, <colossalchests:colossal_chest>.definition.makeStack(i), [
			[<actuallyadditions:block_misc:4>, <storagedrawers:controller>, <actuallyadditions:block_misc:4>], 
			[<actuallyadditions:block_giant_chest>, <colossalchests:chest_wall>.definition.makeStack(i), <actuallyadditions:block_giant_chest>], 
			[<actuallyadditions:block_misc:4>, <storagedrawers:controller>, <actuallyadditions:block_misc:4>]
		]);
		addRecycle(<colossalchests:colossal_chest>.definition.makeStack(i), [
			<colossalchests:chest_wall>.definition.makeStack(i),
			<storagedrawers:controller> * 2,
			<actuallyadditions:block_misc:4> * 4,
			<actuallyadditions:block_giant_chest> * 2
		]);
	}
}