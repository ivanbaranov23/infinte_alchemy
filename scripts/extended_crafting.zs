import mods.appliedenergistics2.Inscriber;

recipes.remove(<extendedcrafting:frame>);
recipes.addShaped("ia_frame10b", <extendedcrafting:frame>, [
	[<extendedcrafting:material:2>, <prodigytech:heat_capacitor_3>, <extendedcrafting:material:2>], 
	[<enderio:item_capacitor_melodic>, <actuallyadditions:block_misc:8>, <enderio:item_capacitor_melodic>], 
	[<extendedcrafting:material:2>, <contenttweaker:life>, <extendedcrafting:material:2>]
]);

//tables
recipes.remove(<extendedcrafting:table_basic>);
recipes.addShaped("ia_ec_table0", <extendedcrafting:table_basic>, [
	[<extrautils2:crafter>, <extrautils2:crafter>, <extrautils2:crafter>], 
	[<extendedcrafting:material:3>, <appliedenergistics2:crafting_storage_64k>, <extendedcrafting:material:3>], 
	[<extendedcrafting:material:3>, <thermalexpansion:machine:11>, <extendedcrafting:material:3>]
]);

recipes.remove(<extendedcrafting:table_advanced>);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_advanced>, [
	[<extendedcrafting:table_basic>, <extendedcrafting:table_basic>, <extendedcrafting:table_basic>], 
	[<extendedcrafting:material:2>, <extendedcrafting:singularity:5>, <extendedcrafting:material:2>], 
	[<extendedcrafting:material:3>, <ore:blockBlackIron>, <extendedcrafting:material:3>]
]);

recipes.remove(<extendedcrafting:table_elite>);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_elite>, [
	[<extendedcrafting:material:2>, <extendedcrafting:table_advanced>, <extendedcrafting:table_advanced>, <extendedcrafting:table_advanced>, <extendedcrafting:material:2>], 
	[<extendedcrafting:material:2>, <extendedcrafting:singularity:30>, <extendedcrafting:material:10>, <extendedcrafting:singularity:30>, <extendedcrafting:material:2>], 
	[null, <extendedcrafting:material:3>, <extendedcrafting:frame>, <extendedcrafting:material:3>, null], 
	[null, <extendedcrafting:material:3>, <extendedcrafting:material:10>, <extendedcrafting:material:3>, null], 
	[null, <extendedcrafting:material:2>, <extendedcrafting:storage>, <extendedcrafting:material:2>, null]
]);

recipes.remove(<extendedcrafting:table_ultimate>);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_ultimate>, [
	[<extendedcrafting:storage>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:storage>], 
	[<extendedcrafting:storage>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:table_elite>, <extendedcrafting:storage>], 
	[null, <extendedcrafting:material:3>, <extendedcrafting:material:11>, <extendedcrafting:material:11>, <extendedcrafting:material:11>, <extendedcrafting:material:3>, null], 
	[null, <extendedcrafting:material:3>, <moreplates:gaia_spirit_plate>, <extendedcrafting:frame>, <moreplates:gaia_spirit_plate>, <extendedcrafting:material:3>, null], 
	[null, <extendedcrafting:material:3>, <contenttweaker:star_alloy_plate>, <extendedcrafting:frame>, <contenttweaker:star_alloy_plate>, <extendedcrafting:material:3>, null], 
	[null, <extendedcrafting:material:3>, <extendedcrafting:material:11>, <extendedcrafting:material:11>, <extendedcrafting:material:11>, <extendedcrafting:material:3>, null], 
	[null, <extendedcrafting:storage>, <extendedcrafting:storage>, <extendedcrafting:storage>, <extendedcrafting:storage>, <extendedcrafting:storage>, null]
]);

//comb craft
recipes.remove(<extendedcrafting:crafting_core>);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:crafting_core>, [
	[<extendedcrafting:material:16>, <extendedcrafting:material:2>, <extendedcrafting:pedestal>, <extendedcrafting:material:2>, <extendedcrafting:material:16>], 
	[<extendedcrafting:material:2>, <botania:storage:3>, <actuallyadditions:block_empowerer>, <botania:storage:3>, <extendedcrafting:material:2>], 
	[<extendedcrafting:material:10>, <botania:runealtar>, <extendedcrafting:frame>, <botania:runealtar>, <extendedcrafting:material:10>], 
	[<extendedcrafting:material:2>, <botania:storage:3>, <actuallyadditions:block_empowerer>, <botania:storage:3>, <extendedcrafting:material:2>], 
	[<extendedcrafting:material:16>, <extendedcrafting:material:2>, <extendedcrafting:pedestal>, <extendedcrafting:material:2>, <extendedcrafting:material:16>]
]);
recipes.remove(<extendedcrafting:pedestal>);
recipes.addShaped("ia_ec_pedestal", <extendedcrafting:pedestal> * 2, [
	[<extendedcrafting:material:2>, <actuallyadditions:block_display_stand>, <extendedcrafting:material:2>], 
	[<bloodmagic:component:27>, <contenttweaker:compact_empowerer>, <bloodmagic:component:27>], 
	[<extendedcrafting:material:2>, <actuallyadditions:block_display_stand>, <extendedcrafting:material:2>]
]);


//luminessence
mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:fire> * 250, <contenttweaker:fire_cell>, 10000, <contenttweaker:reinforced_cell>);
mods.enderio.Vat.addRecipe(
	<liquid:luminessence> * 50, 1.0, <liquid:fire> * 50, 
	[<enderio:block_holy_fog>], [0.1], 
	[<erebus:materials:12>], [1.0], 
	30000
);
mods.thermalexpansion.Transposer.addFillRecipe(<extendedcrafting:material:7>, <moreplates:refined_glowstone_gear> * 4, <liquid:luminessence> * 1000, 40000);

//components
recipes.remove(<extendedcrafting:material:14>);
Inscriber.addRecipe(<extendedcrafting:material:14>, <extendedcrafting:material:2>, false, <minecraft:nether_star>, <enderio:item_capacitor_crystalline>);

recipes.remove(<extendedcrafting:material:8>);
recipes.addShaped("ia_ec_components1", <extendedcrafting:material:8>, [
	[<extendedcrafting:material:7>, <extendedcrafting:material:14>, <extendedcrafting:material:7>], 
	[<extendedcrafting:material:14>, <extendedcrafting:material:2>, <extendedcrafting:material:14>], 
	[<extendedcrafting:material:7>, <extendedcrafting:material:14>, <extendedcrafting:material:7>]
]);


recipes.remove(<extendedcrafting:material:15>);
Inscriber.addRecipe(<extendedcrafting:material:15>, <extendedcrafting:material:14>, false, <contenttweaker:light_plate>, <contenttweaker:electricium>);

recipes.remove(<extendedcrafting:material:9>);
recipes.addShaped("ia_ec_components2", <extendedcrafting:material:9>, [
	[<extendedcrafting:material:7>, <extendedcrafting:material:15>, <extendedcrafting:material:7>], 
	[<extendedcrafting:material:15>, <extendedcrafting:material:8>, <extendedcrafting:material:15>], 
	[<extendedcrafting:material:7>, <extendedcrafting:material:15>, <extendedcrafting:material:7>]
]);


recipes.remove(<extendedcrafting:material:16>);
Inscriber.addRecipe(<extendedcrafting:material:16>, <extendedcrafting:material:15>, false, <moreplates:manasteel_plate>, <contenttweaker:bloody_circuit>);

recipes.remove(<extendedcrafting:material:10>);
recipes.addShaped("ia_ec_components3", <extendedcrafting:material:10>, [
	[<extendedcrafting:material:7>, <extendedcrafting:material:16>, <extendedcrafting:material:7>], 
	[<extendedcrafting:material:16>, <extendedcrafting:material:9>, <extendedcrafting:material:16>], 
	[<extendedcrafting:material:7>, <extendedcrafting:material:16>, <extendedcrafting:material:7>]
]);


recipes.remove(<extendedcrafting:material:17>);
Inscriber.addRecipe(<extendedcrafting:material:17>, <extendedcrafting:material:16>, false, <moreplates:terrasteel_plate>, <botania:rune:8>);

recipes.remove(<extendedcrafting:material:11>);
recipes.addShaped("ia_ec_components4", <extendedcrafting:material:11>, [
	[<extendedcrafting:material:7>, <extendedcrafting:material:17>, <extendedcrafting:material:7>], 
	[<extendedcrafting:material:17>, <extendedcrafting:material:10>, <extendedcrafting:material:17>], 
	[<extendedcrafting:material:7>, <extendedcrafting:material:17>, <extendedcrafting:material:7>]
]);




//ender crafting
mods.extendedcrafting.EnderCrafting.remove(<extendedcrafting:material:40>);
mods.extendedcrafting.EnderCrafting.addShaped(<extendedcrafting:material:40>, [
	[null, <minecraft:ender_eye>, null], 
	[<minecraft:ender_eye>, <contenttweaker:cursed_star>, <minecraft:ender_eye>], 
	[null, <minecraft:ender_eye>, null]
]);
mods.extendedcrafting.EnderCrafting.addShaped(<extendedcrafting:material:40>, [
	[null, <minecraft:ender_eye>, null], 
	[<minecraft:ender_eye>, <contenttweaker:mana_star>, <minecraft:ender_eye>], 
	[null, <minecraft:ender_eye>, null]
]);