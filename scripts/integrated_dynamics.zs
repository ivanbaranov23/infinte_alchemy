import mods.integrateddynamics.Squeezer;

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

recipes.remove(<integrateddynamics:logic_programmer>);
recipes.addShaped("ia_id_logic_programmer", <integrateddynamics:logic_programmer>, [
	[<contenttweaker:menril_steel_plate>, <integrateddynamics:variable>, <contenttweaker:menril_steel_plate>], 
	[<integrateddynamics:cable>, <botania:craftinghalo>, <integrateddynamics:cable>], 
	[<contenttweaker:menril_steel_plate>, <integrateddynamics:variable>, <contenttweaker:menril_steel_plate>]
]);

recipes.remove(<integratednbt:nbt_extractor>);
recipes.addShaped("ia_id_nbt_extractor", <integratednbt:nbt_extractor>, [
	[<contenttweaker:menril_steel_ingot>, <integrateddynamics:crystalized_menril_block>, <contenttweaker:menril_steel_ingot>], 
	[<contenttweaker:menril_steel_ingot>, <thermalexpansion:frame>, <contenttweaker:menril_steel_ingot>], 
	[<contenttweaker:menril_steel_ingot>, <integrateddynamics:crystalized_menril_block>, <contenttweaker:menril_steel_ingot>]
]);


{//variable transformer
	recipes.remove(<integrateddynamics:variable_transformer>);
	recipes.addShaped("ia_id_variable_transformer", <integrateddynamics:variable_transformer> * 2, [
		[null, <integrateddynamics:variable>, null], 
		[<opencomputers:material:8>, <minecraft:piston>, <opencomputers:material:8>], 
		[null, <integrateddynamics:variable>, null]
	]);
	recipes.remove(<integrateddynamics:variable_transformer:1>);
	recipes.addShaped("ia_id_variable_transformer_1", <integrateddynamics:variable_transformer:1> * 2, [
		[null, <integrateddynamics:variable>, null], 
		[<opencomputers:material:8>, <minecraft:sticky_piston>, <opencomputers:material:8>], 
		[null, <integrateddynamics:variable>, null]
	]);
}

{//readers
	recipes.remove(<integrateddynamics:part_block_reader_item>);
	recipes.addShapeless("ia_id_part_block_reader_item", <integrateddynamics:part_block_reader_item>, [
		<integrateddynamics:variable_transformer:1>, <extrautils2:scanner>
	]);

	
	recipes.remove(<integrateddynamics:part_entity_reader_item>);
	recipes.addShapeless("ia_id_part_entity_reader_item", <integrateddynamics:part_entity_reader_item>, [
		<integrateddynamics:variable_transformer:1>, <contenttweaker:life>
	]);

}

recipes.remove(<integrateddynamics:logic_director>);
recipes.addShaped("ia_id_logic_director", <integrateddynamics:logic_director> * 2, [
	[<integrateddynamics:crystalized_chorus_chunk>, <contenttweaker:menril_steel_plate>, <integrateddynamics:crystalized_chorus_chunk>], 
	[<integrateddynamics:variable_transformer>, <opencomputers:material:9>, <integrateddynamics:variable_transformer:1>], 
	[<integrateddynamics:crystalized_chorus_chunk>, <contenttweaker:menril_steel_plate>, <integrateddynamics:crystalized_chorus_chunk>]
]);