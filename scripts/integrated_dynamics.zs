

recipes.remove(<integrateddynamics:squeezer>);
recipes.addShaped("ia_squeezer", <integrateddynamics:squeezer>, [
	[<thermalfoundation:material:128>, <minecraft:iron_block>, <thermalfoundation:material:128>],
	[<ore:slimeball>, null, <ore:slimeball>],
	[<ore:logWood>, <minecraft:iron_ingot>, <ore:logWood>]
]);

mods.prodigytech.magneticreassembler.addRecipe(<minecraft:chorus_fruit_popped>, <integrateddynamics:crystalized_chorus_chunk>);



recipes.remove(<integrateddynamics:variable>);
recipes.addShaped("ia_id_variable", <integrateddynamics:variable> * 16, [
	[<integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:crystalized_menril_chunk>], 
	[<integrateddynamics:crystalized_menril_chunk>, <contenttweaker:menril_steel_plate>, <integrateddynamics:crystalized_menril_chunk>], 
	[<integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:crystalized_menril_chunk>]
]);

recipes.remove(<integrateddynamics:cable>);
recipes.addShaped("ia_id_cable", <integrateddynamics:cable> * 3, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<contenttweaker:menril_steel_wire>, <integrateddynamics:crystalized_menril_chunk>, <contenttweaker:menril_steel_wire>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]
]);
recipes.remove(<integratedtunnels:part_interface_item_item>);
recipes.addShaped("ia_id_interface_item", <integratedtunnels:part_interface_item_item>, [
	[<integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:cable>, <integrateddynamics:crystalized_menril_chunk>], 
	[<contenttweaker:menril_steel_ingot>, <appliedenergistics2:interface>, <contenttweaker:menril_steel_ingot>], 
	[<integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:cable>, <integrateddynamics:crystalized_menril_chunk>]
]);

recipes.remove(<integratedtunnels:part_interface_fluid_item>);
recipes.addShaped("ia_id_interface_fluid", <integratedtunnels:part_interface_fluid_item>, [
	[<integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:cable>, <integrateddynamics:crystalized_menril_chunk>], 
	[<contenttweaker:menril_steel_ingot>, <appliedenergistics2:fluid_interface>, <contenttweaker:menril_steel_ingot>], 
	[<integrateddynamics:crystalized_menril_chunk>, <integrateddynamics:cable>, <integrateddynamics:crystalized_menril_chunk>]
]);