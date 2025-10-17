
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

mods.chisel.Carving.addGroup("forged_cincinnasite");
mods.chisel.Carving.addVariation("forged_cincinnasite", <betternether:cincinnasite_forged>);
mods.chisel.Carving.addVariation("forged_cincinnasite", <betternether:cincinnasite_pillar>);
mods.chisel.Carving.addVariation("forged_cincinnasite", <betternether:cincinnasite_tile_large>);
mods.chisel.Carving.addVariation("forged_cincinnasite", <betternether:cincinnasite_tile_small>);
mods.chisel.Carving.addVariation("forged_cincinnasite", <betternether:cincinnasite_carved>);



mods.chisel.Carving.addGroup("bone");
mods.chisel.Carving.addVariation("bone", <minecraft:bone_block>);
mods.chisel.Carving.addVariation("bone", <betternether:bone_block>);
mods.chisel.Carving.addVariation("bone", <betternether:bone_tile>);
