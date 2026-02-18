#priority 10

import mods.prodigytech.explosionfurnace.recipes as explosionfurnace_recipes;
//explosionfurnace.recipes.addRecipe(IItemStack/IOreDictEntry in, IItemStack out, int ep, IItemStack/IOreDictEntry reagent, int craftPerReagent)

import mods.prodigytech.rotarygrinder;
//rotarygrinder.addRecipe(inp, outp)
import mods.prodigytech.solderer;
import mods.prodigytech.magneticreassembler;
import mods.prodigytech.atomicreshaper;
//addRecipeMulti(IItemStack in, int primordium, int time, IItemStack[] outputs, @Optional int[] weights)

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;


import scripts.recycler.addRecycle;


furnace.remove(<projectred-core:resource_item>);
furnace.addRecipe(<prodigytech:charred_stone>, <minecraft:stone>);

//bricks
recipes.remove(<prodigytech:ash_bricks>);
recipes.addShaped("ia_ash_bricks1", <prodigytech:ash_bricks>, [
	[null, <minecraft:brick>, null],
	[<minecraft:brick>, <prodigytech:ash>, <minecraft:brick>],
	[null, <minecraft:brick>, null]
]);
recipes.addShapeless("ia_ash_bricks2", <prodigytech:ash_bricks>, [
	<minecraft:brick_block>, <prodigytech:ash>
]);

//crafting
recipes.remove(<prodigytech:explosion_furnace>);
recipes.addShaped(
    "ia_explosion_furnace",
    <prodigytech:explosion_furnace>,
    [[<roots:runestone>, <thermalfoundation:storage_alloy:3>, <roots:runestone>],
    [<appliedenergistics2:tiny_tnt>, <extendedcrafting:singularity_custom:100>, <appliedenergistics2:tiny_tnt>],
    [<roots:runestone>, <minecraft:furnace>, <roots:runestone>]]
);
addRecycle(<prodigytech:explosion_furnace>, [
	<extendedcrafting:singularity_custom:100>, <minecraft:furnace>, <thermalfoundation:storage_alloy:3>, 
	<appliedenergistics2:tiny_tnt> * 2, <roots:runestone> * 4
]);


//explosionfurnace_recipes.removeRecipeByOutput(<prodigytech:ferramic_ingot>);
explosionfurnace_recipes.removeAll();


recipes.remove(<prodigytech:zorrasteel_raw>);
recipes.addShaped("ia_zorrasteel_raw", <prodigytech:zorrasteel_raw>, [
	[<ore:leafZorra>, <ore:leafZorra>, <ore:leafZorra>], 
	[<ore:leafZorra>, <contenttweaker:electric_manyullyn_base_ingot>, <ore:leafZorra>], 
	[<ore:leafZorra>, <ore:leafZorra>, <ore:leafZorra>]
]);
recipes.addShaped("ia_zorrasteel_raw2", <prodigytech:zorrasteel_raw> * 2, [
	[null, <contenttweaker:zorra_dust>, null], 
	[<contenttweaker:zorra_dust>, <contenttweaker:electric_manyullyn_base_ingot>, <contenttweaker:zorra_dust>], 
	[null, <contenttweaker:zorra_dust>, null]
]);
explosionfurnace_recipes.addRecipe(<prodigytech:zorrasteel_raw> * 4, <prodigytech:zorrasteel_ingot> * 4, 576, <prodigytech:aeternus_crystal>, 1);

{//ferramic
	explosionfurnace_recipes.addRecipe(<thermalfoundation:material:132> * 4, <prodigytech:ferramic_ingot> * 4, 360, <contenttweaker:fireclay>, 1);
	explosionfurnace_recipes.addRecipe(<contenttweaker:zinc_ingot> * 3, <prodigytech:ferramic_ingot> * 3, 360, <contenttweaker:fireclay>, 1);
	explosionfurnace_recipes.addRecipe(
		<contenttweaker:ferramic_base> * 8, <prodigytech:ferramic_ingot> * 8, 360, <contenttweaker:fireclay>, 1
	);
	explosionfurnace_recipes.addRecipe(
		<extendedcrafting:singularity:16>, <extendedcrafting:singularity_custom:4>, 36000, <contenttweaker:fireclay> * 64, 1
	);

	mods.tconstruct.Casting.addTableRecipe(<contenttweaker:ferramic_gravel>, <minecraft:gravel>, <liquid:ferramic>, 16, true);
	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:ferramic_gravel>, 
        <minecraft:gravel>, <liquid:ferramic> * 16, 
        1000
    );
}

{//zorra
	recipes.addShaped("ia_zorra_dust", <contenttweaker:zorra_dust>, [
		[<harvestcraft:mortarandpestleitem>, <prodigytech:zorra_leaf>, <prodigytech:zorra_leaf>], 
		[null, <prodigytech:zorra_leaf>, <prodigytech:zorra_leaf>]
	]);
	mods.roots.Mortar.addRecipe("zorra_dust",
		<contenttweaker:zorra_dust> * 2,
		[
			<prodigytech:zorra_leaf>,
			<prodigytech:zorra_leaf>,
			<prodigytech:zorra_leaf>,
			<prodigytech:zorra_leaf>,
			<prodigytech:zorra_leaf> | <integrateddynamics:crystalized_menril_chunk> | <integrateddynamics:menril_berries> | <ore:rootsBark>
		]
	);
	atomicreshaper.addRecipeMulti(<contenttweaker:zorra_dust>, 8, 30, 
		[
			<thermalfoundation:material:66>,//silver
			<thermalfoundation:material:69>,//nickel
			<taiga:duranite_dust>,
			<contenttweaker:chrome_dust>,
			<thermalfoundation:material:816>//biomass
		], [50, 45, 10, 10, 120]
	);

	explosionfurnace_recipes.addRecipe(
		<quantumflux:craftingpiece:6> * 12, <contenttweaker:zorra_steel_gem> * 8, 6000, <extendedcrafting:singularity_custom:62>, 1
	);
	explosionfurnace_recipes.addRecipe(
		<contenttweaker:wine_diamond> * 16, <contenttweaker:zorra_steel_gem> * 8, 6000, <extendedcrafting:singularity_custom:62>, 1
	);
	

	recipes.remove(<prodigytech:zorra_altar>);
	recipes.addShaped("ia_zorra_altar", <prodigytech:zorra_altar>, [
		[<contenttweaker:zorra_steel_gem>, <minecraft:enchanting_table>, <contenttweaker:zorra_steel_gem>],
		[<contenttweaker:zorra_steel_gem>, <enderio:block_dark_steel_anvil>, <contenttweaker:zorra_steel_gem>]
	]);
	addRecycle(<prodigytech:zorra_altar>, [
		<minecraft:enchanting_table>, <enderio:block_dark_steel_anvil>, <contenttweaker:zorra_steel_gem> * 4
	]);

	<ore:treeLeaves>.remove(<prodigytech:zorra_leaves>);
}

{
	mods.prodigytech.explosionfurnace.explosives.add(<minecraft:fire_charge>, 250);
	mods.prodigytech.explosionfurnace.explosives.add(<contenttweaker:pilkeum>, 360 * 4);
	mods.prodigytech.explosionfurnace.explosives.add(<appliedenergistics2:tiny_tnt>, 750);
	mods.prodigytech.explosionfurnace.explosives.add(<minecraft:tnt>, 3000);
	mods.prodigytech.explosionfurnace.explosives.add(<natura:nether_planks:3>, 250);

	
	mods.prodigytech.explosionfurnace.dampeners.add(<atum:sand>, 360 * 2);
	mods.prodigytech.explosionfurnace.dampeners.add(<minecraft:soul_sand>, 360 * 2);
	mods.prodigytech.explosionfurnace.dampeners.add(<alchemistry:wet_sand>, 360 * 4);
	mods.prodigytech.explosionfurnace.dampeners.add(<contenttweaker:iron_sand>, 360 * 6);
	mods.prodigytech.explosionfurnace.dampeners.add(<biomesoplenty:dried_sand>, 360 * 8);
	mods.prodigytech.explosionfurnace.dampeners.add(<contenttweaker:dried_gravel>, 360 * 8);
	mods.prodigytech.explosionfurnace.dampeners.add(<quark:gravisand>, 360 * 12);

	mods.prodigytech.explosionfurnace.dampeners.add(<thermalfoundation:material:864>, 250);
	mods.prodigytech.explosionfurnace.dampeners.add(<immersiveengineering:material:7>, 250);
	mods.prodigytech.explosionfurnace.dampeners.add(<contenttweaker:bioslag>, 500);
	mods.prodigytech.explosionfurnace.dampeners.add(<thermalfoundation:material:865>, 1000);
	mods.prodigytech.explosionfurnace.dampeners.add(<contenttweaker:enriched_bioslag>, 1500);
	mods.prodigytech.explosionfurnace.dampeners.add(<contenttweaker:gravel_wool>, 1000);

	mods.prodigytech.explosionfurnace.dampeners.add(<mysticalagriculture:crafting>, 250);
	mods.prodigytech.explosionfurnace.dampeners.add(<mysticalagriculture:crafting:1>, 250 * 4);
	mods.prodigytech.explosionfurnace.dampeners.add(<mysticalagriculture:crafting:2>, 250 * 16);
	//mods.prodigytech.explosionfurnace.dampeners.add(<mysticalagriculture:crafting:3>, 250 * 64);
	//mods.prodigytech.explosionfurnace.dampeners.add(<mysticalagriculture:crafting:4>, 250 * 256);
	//mods.prodigytech.explosionfurnace.dampeners.add(<mysticalagradditions:insanium>, 250);
	
}



{//aeroheaters
	recipes.remove(<prodigytech:magmatic_aeroheater>);
	recipes.addShaped("ia_magmatic_aeroheater", 
		<prodigytech:magmatic_aeroheater>, [
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:firebrick_block>, <ore:ingotFerramic>], 
		[<ore:ingotAluminum>, <thermalfoundation:material:324>, <ore:ingotAluminum>]
	]);
	addRecycle(<prodigytech:magmatic_aeroheater>, [
		<contenttweaker:firebrick_block>, 
		<ore:ingotFerramic>.firstItem * 4, <ore:ingotAluminum>.firstItem * 6
	]);

	recipes.remove(<prodigytech:solid_fuel_aeroheater>);
	recipes.addShaped("ia_solid_fuel_aeroheater", <prodigytech:solid_fuel_aeroheater>, [
		[<ore:ingotFerramic>, <prodigytech:fuel_pellet_16>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <morefurnaces:furnaceblock>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:magmatic_aeroheater>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:solid_fuel_aeroheater>, [
		<morefurnaces:furnaceblock>, <prodigytech:magmatic_aeroheater>,
		<ore:ingotFerramic>.firstItem * 6, <prodigytech:fuel_pellet_16>
	]);

	recipes.remove(<prodigytech:energion_aeroheater>);
	recipes.addShaped("ai_energion_aeroheater", <prodigytech:energion_aeroheater>, [
		[<prodigytech:inferno_crystal>, <prodigytech:circuit_crude>, <prodigytech:inferno_crystal>], 
		[<prodigytech:inferno_crystal>, <ore:gemEnergion>, <prodigytech:inferno_crystal>], 
		[<ore:gearFerramic>, <prodigytech:solid_fuel_aeroheater>, <ore:gearFerramic>]
	]);
	addRecycle(<prodigytech:energion_aeroheater>, [
		<prodigytech:solid_fuel_aeroheater>, <prodigytech:circuit_crude>,
		<ore:ingotFerramic>.firstItem * 16, <ore:gemEnergion>.firstItem, <prodigytech:inferno_crystal> * 4
	]);

	recipes.remove(<prodigytech:tartaric_aeroheater>);
	recipes.addShaped("ia_tartaric_aeroheater", <prodigytech:tartaric_aeroheater>, [
		[<prodigytech:zorrasteel_block>, <prodigytech:aeternus_crystal>, <prodigytech:zorrasteel_block>], 
		[<prodigytech:circuit_perfected>, <morefurnaces:furnaceblock:1>, <prodigytech:circuit_perfected>], 
		[<prodigytech:zorrasteel_block>, <prodigytech:energion_aeroheater>, <prodigytech:zorrasteel_block>]
	]);
	addRecycle(<prodigytech:tartaric_aeroheater>, [
		<prodigytech:energion_aeroheater>, <morefurnaces:furnaceblock:1>, <prodigytech:aeternus_crystal>,
		<prodigytech:circuit_perfected> * 2, <prodigytech:zorrasteel_block> * 4
	]);


	recipes.remove(<prodigytech:capacitor_aeroheater>);
	recipes.addShaped("ia_capacitor_aeroheater", <prodigytech:capacitor_aeroheater>, [
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:ingotFerramic>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:capacitor_aeroheater>, [
		<prodigytech:heat_capacitor_0:1200>,
		<ore:ingotFerramic>.firstItem * 7
	]);

}



recipes.addShaped("ia_carbon_plate_charcoal", <prodigytech:carbon_plate>, [
	[<ore:dustCharcoal>, <ore:dustCharcoal>, <ore:dustCharcoal>], 
	[<ore:dustCharcoal>, <ore:dustCharcoal>, <ore:dustCharcoal>], 
	[<ore:dustCharcoal>, <ore:dustCharcoal>, <ore:dustCharcoal>]
]);
rotarygrinder.removeRecipe(<prodigytech:carbon_plate>);
rotarygrinder.addRecipe(<prodigytech:carbon_plate>, <thermalfoundation:material:768> * 8);

recipes.remove(<prodigytech:inferno_fuel>);
recipes.addShapeless("ia_inferno_fuel", <prodigytech:inferno_fuel>, 
	[<prodigytech:enriched_fuel>, <prodigytech:fuel_pellet_1>, <ore:powderBlaze>, <prodigytech:sugar_cube>, <prodigytech:ash>]
);
recipes.remove(<prodigytech:energion_dust>);
//energion in roots mortar
recipes.addShaped("ia_hot_energion", <contenttweaker:hot_energion> * 8, [
	[<prodigytech:energion_dust>, <prodigytech:energion_dust>, <prodigytech:energion_dust>], 
	[<prodigytech:energion_dust>, <prodigytech:heat_capacitor_0>.transformReplace(<prodigytech:heat_capacitor_0:1200>), <prodigytech:energion_dust>], 
	[<prodigytech:energion_dust>, <prodigytech:energion_dust>, <prodigytech:energion_dust>]
]);


//circuits
recipes.remove(<prodigytech:circuit_plate>);

recipes.remove(<prodigytech:pattern_circuit_crude>);
recipes.addShapeless("ia_pattern_circuit_crude", <prodigytech:pattern_circuit_crude>, [<prodigytech:inferno_crystal>, <ore:ingotAluminum>, <prodigytech:circuit_plate>]);

recipes.remove(<prodigytech:pattern_circuit_refined>);
recipes.addShaped("ai_pattern_circuit_refined", <prodigytech:pattern_circuit_refined>, [
	[null, <prodigytech:circuit_plate>, null], 
	[<ore:stickConstantan>, <prodigytech:pattern_circuit_crude>, <ore:stickConstantan>], 
	[null, <prodigytech:circuit_crude>, null]
]);

recipes.remove(<prodigytech:pattern_circuit_perfected>);
recipes.addShaped("ia_pattern_circuit_perfected", <prodigytech:pattern_circuit_perfected>, [
	[<prodigytech:heat_capacitor_0>, <prodigytech:circuit_refined>, <prodigytech:heat_capacitor_0>], 
	[<prodigytech:circuit_refined>, <prodigytech:pattern_circuit_refined>, <prodigytech:circuit_refined>], 
	[<prodigytech:heat_capacitor_0>, <prodigytech:circuit_refined>, <prodigytech:heat_capacitor_0>]
]);

solderer.removeAll();
{//crude
	solderer.addRecipe(<prodigytech:pattern_circuit_crude>,
		<contenttweaker:zinc_ingot> * 8, <prodigytech:circuit_crude>, 12
	);
	solderer.addRecipe(<prodigytech:pattern_circuit_crude>,
		<contenttweaker:zinc_wire> * 4, <prodigytech:circuit_crude>, 12
	);

	solderer.addRecipe(<contenttweaker:research_circuit1>,
		<contenttweaker:bocuit>, <prodigytech:circuit_crude> * 4, 12
	);
}{//refined
	recipes.addShaped("ia_pt_crude_chip1", <contenttweaker:pt_crude_chip>, [
		[<moreplates:hammer>.anyDamage().transformDamage(), <contenttweaker:gold_coil>],
		[null, <contenttweaker:zinc_plate>],
		[null, <prodigytech:circuit_crude>]
	]);
	mods.appliedenergistics2.Inscriber.addRecipe(
		<contenttweaker:pt_crude_chip>, <contenttweaker:zinc_plate>, false, 
		<contenttweaker:gold_coil>, <prodigytech:circuit_crude>
	);

	recipes.addShaped("ia_pt_crude_chip2", <contenttweaker:pt_crude_chip>, [
		[<moreplates:hammer>.anyDamage().transformDamage(), <thermalfoundation:material:25>],
		[null, <contenttweaker:zinc_plate>],
		[null, <prodigytech:circuit_crude>]
	]);
	mods.appliedenergistics2.Inscriber.addRecipe(
		<contenttweaker:pt_crude_chip>, <contenttweaker:zinc_plate>, false, 
		<thermalfoundation:material:25>, <prodigytech:circuit_crude>
	);

	solderer.addRecipe(<prodigytech:pattern_circuit_refined>,
		<contenttweaker:pt_crude_chip>, <prodigytech:circuit_refined>, 24
	);

	solderer.addRecipe(<contenttweaker:research_circuit1>,
		<contenttweaker:pt_crude_chip>, <prodigytech:circuit_refined> * 2, 24
	);
}{//perfected
	recipes.addShaped("ia_pt_refined_chip", <contenttweaker:pt_refined_chip>, [
		[<moreplates:hammer>.anyDamage().transformDamage(), <contenttweaker:gold_coil>],
		[null, <moreplates:diamond_plate>],
		[null, <prodigytech:circuit_refined>]
	]);
	mods.appliedenergistics2.Inscriber.addRecipe(
		<contenttweaker:pt_refined_chip>, <moreplates:diamond_plate>, false, 
		<contenttweaker:gold_coil>, <prodigytech:circuit_refined>
	);

	solderer.addRecipe(<prodigytech:pattern_circuit_perfected>,
		<contenttweaker:pt_refined_chip>, <prodigytech:circuit_perfected>, 36
	);

	solderer.addRecipe(<contenttweaker:research_circuit1>,
		<contenttweaker:pt_refined_chip>, <prodigytech:circuit_perfected> * 2, 36
	);
}




{//heat capacitors
	recipes.remove(<prodigytech:heat_capacitor_0:1200>);
	recipes.addShaped("ia_heat_capacitor_0", <prodigytech:heat_capacitor_0:1200>, [
		[null, <ore:ingotFerramic>, null], 
		[<ore:ingotFerramic>, <prodigytech:fuel_pellet_16>, <ore:ingotFerramic>], 
		[<ore:stickIron>, <ore:ingotFerramic>, <ore:stickIron>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<prodigytech:heat_capacitor_0:1200>],
		[<ore:ingotFerramic> * 2, <prodigytech:fuel_pellet_16>, <ore:stickIron>],
		null,
		10, 256
	);
	mods.thermalexpansion.Transposer.addFillRecipe(<prodigytech:heat_capacitor_0>, <prodigytech:heat_capacitor_0:1200>, <liquid:steam> * 8000, 8000);

	recipes.remove(<prodigytech:heat_capacitor_1:1200>);
	recipes.addShaped("ai_heat_capacitor_1", <prodigytech:heat_capacitor_1:1200>, [
		[null, <prodigytech:heat_capacitor_0:1200>, null], 
		[<contenttweaker:hot_energion>, <prodigytech:circuit_crude>, <contenttweaker:hot_energion>], 
		[null, <prodigytech:heat_capacitor_0:1200>, null]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<prodigytech:heat_capacitor_1:1200>],
		[<prodigytech:heat_capacitor_0:1200>, <contenttweaker:hot_energion>, <prodigytech:circuit_crude>],
		<liquid:ferramic> * 288,
		10, 256
	);

	recipes.remove(<prodigytech:heat_capacitor_2:1200>);
	recipes.addShaped("ai_heat_capacitor_2", <prodigytech:heat_capacitor_2:1200>, [
		[null, <prodigytech:heat_capacitor_1:1200>, null], 
		[<prodigytech:circuit_refined>, <xreliquary:mob_ingredient:7>, <prodigytech:circuit_refined>], 
		[null, <prodigytech:heat_capacitor_1:1200>, null]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<prodigytech:heat_capacitor_2:1200>],
		[<prodigytech:heat_capacitor_1:1200>, <prodigytech:circuit_refined>, <xreliquary:mob_ingredient:7>],
		<liquid:ferramic> * 576,
		10, 512
	);

	recipes.remove(<prodigytech:heat_capacitor_3:1200>);
	scripts.content_machines.addAssemblerRecipe(
		[<prodigytech:heat_capacitor_3:1200>],
		[
			<prodigytech:heat_capacitor_2:1200>, 
			<prodigytech:circuit_perfected> * 4, 
			<contenttweaker:hot_gear>, 
			<prodigytech:zorrasteel_ingot> * 4
		],
		<liquid:ferramic> * (144*8),
		10, 512
	);
}

{//machines
	recipes.remove(<prodigytech:incinerator>);
	recipes.addShaped("ia_incinerator", <prodigytech:incinerator>, [
		[<ore:ingotFerramic>, <ore:dustAsh>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:dustAsh>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:firebrick_block>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:incinerator>, [
		<contenttweaker:firebrick_block>, <ore:ingotFerramic>.firstItem * 6
	]);

	recipes.remove(<prodigytech:capacitor_charger>);
	recipes.addShaped("ia_capacitor_charger", <prodigytech:capacitor_charger>, [
		[<ore:ingotFerramic>, <ore:ingotFerramic>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0:1200>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:capacitor_charger>, [
		<prodigytech:heat_capacitor_0:1200>, <ore:ingotFerramic>.firstItem * 7
	]);
	
	recipes.remove(<prodigytech:fuel_processor>);
	recipes.addShaped("ia_fuel_processor", <prodigytech:fuel_processor>, [
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:plateAluminum>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:firebrick_block>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:fuel_processor>, [
		<contenttweaker:firebrick_block>, <ore:ingotFerramic>.firstItem * 6, <ore:ingotAluminum>.firstItem * 4
	]);

	recipes.remove(<prodigytech:heat_sawmill>);
	recipes.addShaped("ia_heat_sawmill", <prodigytech:heat_sawmill>, [
		[<ore:gearFerramic>, <ore:gearFerramic>, <ore:gearFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:simple_motor>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:plateCarbon>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:heat_sawmill>, [
		<ore:ingotFerramic>.firstItem * 28, <ore:plateCarbon>.firstItem, <contenttweaker:simple_motor>
	]);

	recipes.remove(<prodigytech:rotary_grinder>);
	recipes.addShaped("ia_rotary_grinder", <prodigytech:rotary_grinder>, [
		[<ore:ingotFerramic>, <ore:gearFerramic>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:simple_motor>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <appliedenergistics2:grindstone>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:rotary_grinder>, [
		<appliedenergistics2:grindstone>, <ore:ingotFerramic>.firstItem * 14, <contenttweaker:simple_motor>
	]);

	recipes.remove(<prodigytech:ore_refinery>);
	recipes.addShaped("ia_ore_refinery1", <prodigytech:ore_refinery>, [
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <extendedcrafting:singularity_custom:1>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:rotary_grinder>, <ore:ingotFerramic>]
	]);
	recipes.addShaped("ia_ore_refinery2", <prodigytech:ore_refinery>, [
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:circuit_crude>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:rotary_grinder>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:ore_refinery>, [
		<prodigytech:rotary_grinder>, <ore:ingotFerramic>.firstItem * 6, <prodigytech:heat_capacitor_0:1200>
	]);

	recipes.remove(<prodigytech:blower_furnace>);
	recipes.addShaped("ia_blower_furnace", <prodigytech:blower_furnace>, [
		[<ore:ingotFerramic>, <ore:ingotAluminum>, <ore:ingotFerramic>], 
		[<ore:dustCharcoal>, null, <ore:dustCharcoal>], 
		[<ore:ingotFerramic>, <minecraft:furnace>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:blower_furnace>, [
		<minecraft:furnace>, <ore:ingotFerramic>.firstItem * 4, <ore:ingotAluminum>.firstItem
	]);

	recipes.remove(<prodigytech:magnetic_reassembler>);
	recipes.addShaped("ia_magnetic_reassembler", <prodigytech:magnetic_reassembler>, [
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:gearFerramic>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:blower_furnace>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:magnetic_reassembler>, [
		<prodigytech:blower_furnace>, <ore:ingotFerramic>.firstItem * 14, <prodigytech:heat_capacitor_0:1200>
	]);

	recipes.remove(<prodigytech:solderer>);
	recipes.addShaped("ai_solderer", <prodigytech:solderer>, [
		[<ore:ingotFerramic>, <ore:stickGold>, <ore:ingotFerramic>], 
		[<ore:gearFerramic>, <prodigytech:circuit_plate>, <ore:gearFerramic>], 
		[<ore:ingotFerramic>, <ore:plateCarbon>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:solderer>, [
		<prodigytech:circuit_plate>, <ore:ingotFerramic>.firstItem * 20, 
		<ore:ingotGold>.firstItem * 3, <ore:plateCarbon>.firstItem
	]);

	recipes.remove(<prodigytech:automatic_crystal_cutter>);
	recipes.addShaped("ia_automatic_crystal_cutter", <prodigytech:automatic_crystal_cutter>, [
		[<ore:ingotFerramic>, <ore:gemEnergion>, <ore:ingotFerramic>], 
		[<prodigytech:crystal_cutter>, <prodigytech:circuit_crude>, <prodigytech:crystal_cutter>], 
		[<ore:ingotFerramic>, <contenttweaker:duraluminum_block>, <ore:ingotFerramic>]
	]);
	addRecycle(<prodigytech:automatic_crystal_cutter>, [
		<prodigytech:crystal_cutter>, <ore:ingotFerramic>.firstItem * 4, <ore:gemEnergion>.firstItem, <prodigytech:circuit_crude>,
		<contenttweaker:duraluminum_block>, 
	]);


	recipes.remove(<prodigytech:primordialis_reactor>);
	recipes.addShaped("ia_primordialis_reactor", <prodigytech:primordialis_reactor>, [
		[<ore:blockFerramic>, <prodigytech:heat_capacitor_1>, <ore:blockFerramic>], 
		[<contenttweaker:research_plants1>.reuse(), <extendedcrafting:singularity_custom:100>, <contenttweaker:research_sieving>.reuse()], 
		[<ore:blockFerramic>, <thermalexpansion:frame:64>, <ore:blockFerramic>]
	]);
	addRecycle(<prodigytech:primordialis_reactor>, [
		<thermalexpansion:frame:64>, <ore:blockFerramic>.firstItem * 4, <prodigytech:heat_capacitor_1:1200>,
		<extendedcrafting:singularity_custom:100>
	]);

	recipes.remove(<prodigytech:atomic_reshaper>);
	recipes.addShaped("ia_atomic_reshaper", <prodigytech:atomic_reshaper>, [
		[<ore:blockFerramic>, <prodigytech:heat_capacitor_1>, <ore:blockFerramic>], 
		[<prodigytech:primordium>, <extrautils2:suncrystal>, <prodigytech:primordium>], 
		[<ore:blockFerramic>, <thermalexpansion:frame:64>, <ore:blockFerramic>]
	]);
	addRecycle(<prodigytech:atomic_reshaper>, [
		<thermalexpansion:frame:64>, <ore:blockFerramic>.firstItem * 4, <prodigytech:heat_capacitor_1:1200>,
		<extrautils2:suncrystal:250>
	]);

}

{//grinder fix
	//quartz
	rotarygrinder.removeRecipe(<minecraft:quartz>);
	rotarygrinder.removeRecipe(<ore:blockQuartz>);
	rotarygrinder.removeRecipe(<minecraft:quartz_stairs>);
	rotarygrinder.removeRecipe(<minecraft:stone_slab:7>);
	rotarygrinder.removeRecipe(<ore:oreQuartz>);

	rotarygrinder.addRecipe(<minecraft:quartz>, <appliedenergistics2:material:3>);

	rotarygrinder.addRecipe(<appliedenergistics2:material>, <appliedenergistics2:material:2>);

	//iron
	rotarygrinder.removeRecipe(<minecraft:iron_ingot>);
	rotarygrinder.addRecipe(<minecraft:iron_ingot>, <thermalfoundation:material>);

	rotarygrinder.removeRecipe(<ore:blockIron>);
	rotarygrinder.addRecipe(<ore:blockIron>, <thermalfoundation:material> * 9);

	rotarygrinder.removeRecipe(<ore:oreIron>);

	//gold
	rotarygrinder.removeRecipe(<minecraft:gold_ingot>);
	rotarygrinder.addRecipe(<minecraft:gold_ingot>, <thermalfoundation:material:1>);

	rotarygrinder.removeRecipe(<ore:blockGold>);
	rotarygrinder.addRecipe(<ore:blockGold>, <thermalfoundation:material:1> * 9);

	rotarygrinder.removeRecipe(<ore:oreGold>);

	//coal
	rotarygrinder.removeRecipe(<minecraft:coal>);
	rotarygrinder.addRecipe(<minecraft:coal>, <thermalfoundation:material:768>);

	rotarygrinder.removeRecipe(<ore:blockCoal>);
	rotarygrinder.addRecipe(<ore:blockCoal>, <thermalfoundation:material:768> * 9);

	rotarygrinder.removeRecipe(<prodigytech:carbon_plate>);
	rotarygrinder.addRecipe(<prodigytech:carbon_plate>, <thermalfoundation:material:768> * 8);

	rotarygrinder.removeRecipe(<ore:oreCoal>);

	rotarygrinder.addRecipe(<minecraft:coal:1>, <thermalfoundation:material:769>);

	//diamond
	rotarygrinder.removeRecipe(<minecraft:diamond>);
	rotarygrinder.addRecipe(<minecraft:diamond>, <mekanism:otherdust>);

	rotarygrinder.removeRecipe(<ore:blockDiamond>);
	rotarygrinder.addRecipe(<ore:blockDiamond>, <mekanism:otherdust> * 9);

	rotarygrinder.removeRecipe(<ore:oreDiamond>);

	//wheat
	rotarygrinder.removeRecipe(<minecraft:wheat>);
	rotarygrinder.addRecipe(<minecraft:wheat>, <natura:materials:2> * 2);

	//meat
	rotarygrinder.addRecipe(<harvestcraft:turkeyrawitem>, <prodigytech:meat_ground>);
	rotarygrinder.addRecipe(<harvestcraft:venisonrawitem>, <prodigytech:meat_ground>);
	rotarygrinder.addRecipe(<harvestcraft:duckrawitem>, <prodigytech:meat_ground>);

	//missing
	rotarygrinder.addRecipe(<thermalfoundation:material:128>, <thermalfoundation:material:64>);	//copper
	rotarygrinder.addRecipe(<thermalfoundation:material:129>, <thermalfoundation:material:65>);	//tin
	rotarygrinder.addRecipe(<thermalfoundation:material:130>, <thermalfoundation:material:66>);	//silver
	rotarygrinder.addRecipe(<thermalfoundation:material:131>, <thermalfoundation:material:67>);	//lead
	rotarygrinder.addRecipe(<thermalfoundation:material:132>, <thermalfoundation:material:68>);	//alum
	rotarygrinder.addRecipe(<thermalfoundation:material:133>, <thermalfoundation:material:69>);	//nickel
	rotarygrinder.addRecipe(<contenttweaker:zinc_ingot>, <contenttweaker:zinc_dust>);			//zinc
	rotarygrinder.addRecipe(<mekanism:ingot:1>, <mekanism:dust:2>);								//osmium

	rotarygrinder.addRecipe(<thermalfoundation:material:163>, <thermalfoundation:material:99>); //bronze
	rotarygrinder.addRecipe(<thermalfoundation:material:164>, <thermalfoundation:material:100>);//constantan
	rotarygrinder.addRecipe(<thermalfoundation:material:162>, <thermalfoundation:material:98>); //invar
	rotarygrinder.addRecipe(<contenttweaker:nial_ingot>, <contenttweaker:nial_dust>);			//nial

	rotarygrinder.addRecipe(<tconstruct:ingots>, <exnihilocreatio:item_ore_cobalt:2>);	 		//cobalt
	rotarygrinder.addRecipe(<tconstruct:ingots:1>, <exnihilocreatio:item_ore_ardite:2>);		//ardite
	rotarygrinder.addRecipe(<tconstruct:ingots:2>, <contenttweaker:manyullyn_dust>);			//manyullyn

	rotarygrinder.addRecipe(<thermalfoundation:material:161>, <thermalfoundation:material:97>); //electrum
	rotarygrinder.addRecipe(<contenttweaker:lesmium_ingot>, <contenttweaker:lesmium_dust>);     //lesmium
	rotarygrinder.addRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:96>); //steel
	rotarygrinder.addRecipe(<contenttweaker:duraluminum_ingot>, <contenttweaker:duraluminum_dust>); //duraluminum
	rotarygrinder.addRecipe(<contenttweaker:watertight_steel_ingot>, <contenttweaker:watertight_steel_dust>); //watertight_steel
}
{//m reass
	magneticreassembler.addRecipe(<enderio:item_material:32>, <minecraft:dye:4>);

	furnace.remove(<actuallyadditions:item_misc:5>);
	magneticreassembler.addRecipe(<actuallyadditions:item_dust:7>, <actuallyadditions:item_misc:5>);
}

{//atomic reshaper
	{//ore gen main

	}
	{//ore gen sub
		//karmesine
		atomicreshaper.addRecipeMulti(<exnihilocreatio:block_andesite_crushed>, 10, 40, 
			[<minecraft:stone:5>, <taiga:karmesine_ore>], [7, 1]
		);
		//ovium
		atomicreshaper.addRecipeMulti(<exnihilocreatio:block_diorite_crushed>, 10, 40, 
			[<minecraft:stone:3>, <taiga:ovium_ore>], [7, 1]
		);
		//jauxum
		atomicreshaper.addRecipeMulti(<exnihilocreatio:block_granite_crushed>, 10, 40, 
			[<minecraft:stone:1>, <taiga:jauxum_ore>], [7, 1]
		);
	}
	{//rich clay
		recipes.addShaped("ia_rich_clay1", <contenttweaker:rich_clay> * 4, [
			[null, <minecraft:clay_ball>, null], 
			[<minecraft:clay_ball>, <contenttweaker:nial_dust>, <minecraft:clay_ball>], 
			[null, <minecraft:clay_ball>, null]
		]);
		recipes.addShaped("ia_rich_clay2", <contenttweaker:rich_clay> * 8, [
			[null, <contenttweaker:fireclay>, null], 
			[<contenttweaker:fireclay>, <contenttweaker:nial_dust>, <contenttweaker:fireclay>], 
			[null, <contenttweaker:fireclay>, null]
		]);
		recipes.addShaped("ia_rich_clay3", <contenttweaker:rich_clay> * 8, [
			[null, <contenttweaker:kaolin_clay>, null], 
			[<contenttweaker:kaolin_clay>, <contenttweaker:nial_dust>, <contenttweaker:kaolin_clay>], 
			[null, <contenttweaker:kaolin_clay>, null]
		]);

		atomicreshaper.addRecipeMulti(<contenttweaker:rich_clay>, 10, 40,
			[
				<minecraft:clay_ball>, 
				<contenttweaker:kaolin_clay>, <contenttweaker:dolomite>
			], [
				10, 
				7, 5
			]
		);
	}
	//gravel
	atomicreshaper.addRecipeMulti(<minecraft:gravel>, 10, 40, 
		[
			<atum:limestone_gravel>, <contenttweaker:lapis_gravel>, <exnihilocreatio:block_skystone_crushed>, 
			<exnihilocreatio:block_andesite_crushed>, <exnihilocreatio:block_granite_crushed>, <exnihilocreatio:block_diorite_crushed>,
			<exnihilocreatio:block_netherrack_crushed>, <exnihilocreatio:block_endstone_crushed>
		], [
			10, 5, 5,
			20, 20, 20,
			10, 5
		]
	);

	//geode
	atomicreshaper.addRecipeMulti(<thermalfoundation:geode>, 100, 40, 
		[
			<minecraft:diamond>, <minecraft:dye:4>, <minecraft:emerald>,
			<minecraft:quartz>, <minecraft:prismarine_shard>, <actuallyadditions:item_misc:5>,
			<astralsorcery:itemcraftingcomponent>, <erebus:materials:1>,
			<biomesoplenty:gem:1>, <biomesoplenty:gem:3>, <biomesoplenty:gem:7>, <biomesoplenty:gem:2>, <biomesoplenty:gem:5>, <biomesoplenty:gem:6>, <biomesoplenty:gem:4>,
			<aether_legacy:ambrosium_shard>, <aether_legacy:zanite_gemstone>, <moretcon:gemgarstone>, <moretcon:gemelectarite>,
			<quark:biotite>, <moretcon:gemigniglomerate>, <taiga:dilithium_crystal>, <taiga:tiberium_crystal>,
			<thermalfoundation:material:893>, <thermalfoundation:material:894>, <thermalfoundation:material:895>,
			<contenttweaker:flolit>, <erebus:materials:11>, <contenttweaker:fluospar>
		], [
			10, 90, 25,
			150, 50, 70,
			10, 60,
			30, 30, 30, 30, 30, 30, 30,
			25, 25, 20, 10,
			15, 4, 20, 20,
			10, 10, 10,
			40, 40, 15
		]
	);
}


scripts.jei.addJEIhint(
    [<minecraft:dirt>.withDisplayName("Any Item")], [], 
    [<prodigytech:incinerator>], 
    [<prodigytech:ash>]
);

mods.bloodmagic.TartaricForge.addRecipe(<prodigytech:tartaric_stoker> * 12, [
	<contenttweaker:gravel_wool>,
	<prodigytech:ash>,
	<prodigytech:zorra_leaf>,
	<contenttweaker:alchemical_clay_fr>
], 100, 8);

{//ferramic_base
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <thermalfoundation:material:132>, 
		2000, 
		<contenttweaker:ferramic_base>
	);
	{
		var rec = RecipeBuilder.newBuilder("preheated_al1", "high_oven", 20);
		rec.addEnergyPerTickInput(100);
		rec.addItemOutput(<contenttweaker:ferramic_base>);

		rec.addItemInput(<contenttweaker:research_heat>).setChance(0.0);
		rec.addItemInput( <thermalfoundation:material:132>);
		
		rec.build();
	}
	
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <contenttweaker:nial_ingot>, 
		2000, 
		<contenttweaker:ferramic_base>
	);
	{
		var rec = RecipeBuilder.newBuilder("preheated_al2", "high_oven", 20);
		rec.addEnergyPerTickInput(100);
		rec.addItemOutput(<contenttweaker:ferramic_base>);

		rec.addItemInput(<contenttweaker:research_heat>).setChance(0.0);
		rec.addItemInput( <contenttweaker:nial_ingot>);
		
		rec.build();
	}
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <tconstruct:ingots:6>, 
		2000, 
		<contenttweaker:ferramic_base> * 3
	);
	{
		var rec = RecipeBuilder.newBuilder("preheated_al3", "high_oven", 20);
		rec.addEnergyPerTickInput(100);
		rec.addItemOutput(<contenttweaker:ferramic_base> * 3);

		rec.addItemInput(<contenttweaker:research_heat>).setChance(0.0);
		rec.addItemInput(<tconstruct:ingots:6>);
		
		rec.build();
	}
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <contenttweaker:duraluminum_ingot>, 
		2000, 
		<contenttweaker:ferramic_base> * 7
	);
	{
		var rec = RecipeBuilder.newBuilder("preheated_al4", "high_oven", 20);
		rec.addEnergyPerTickInput(100);
		rec.addItemOutput(<contenttweaker:ferramic_base> * 7);

		rec.addItemInput(<contenttweaker:research_heat>).setChance(0.0);
		rec.addItemInput( <contenttweaker:duraluminum_ingot>);
		
		rec.build();
	}


}


{//circuit_plate
	var tpc_circuit_plate = RecipeBuilder.newBuilder("tpc_circuit_plate", "tree_powered_compressor", 120);
	tpc_circuit_plate.addItemInput(<enderio:item_material:48>);
	tpc_circuit_plate.addItemInput(<minecraft:paper> * 4);
	tpc_circuit_plate.addItemInput(<immersiveengineering:wirecoil>);

	tpc_circuit_plate.addItemInput(<ore:treeSapling> * 1);
	tpc_circuit_plate.addItemInput(<ore:fertilizer> * 1);
	tpc_circuit_plate.addFluidInput(<fluid:water> * 250);

	tpc_circuit_plate.addItemOutput(<prodigytech:circuit_plate> * 2);
	tpc_circuit_plate.build();
	
	var tpc_circuit_pure = RecipeBuilder.newBuilder("tpc_circuit_pure", "tree_powered_compressor", 120);
	tpc_circuit_pure.addItemInput(<enderio:item_material:48>);
	tpc_circuit_pure.addItemInput(<minecraft:paper> * 4);
	tpc_circuit_pure.addItemInput(<immersiveengineering:wirecoil>);

	tpc_circuit_pure.addItemInput(<ore:treeSapling> * 1);
	tpc_circuit_pure.addItemInput(<ore:fertilizer> * 1);
	tpc_circuit_pure.addFluidInput(<fluid:pure_water> * 250);

	tpc_circuit_pure.addItemOutput(<prodigytech:circuit_plate> * 3);
	tpc_circuit_pure.build();
	
	var tpc_circuit_fert = RecipeBuilder.newBuilder("tpc_circuit_fert", "tree_powered_compressor", 120);
	tpc_circuit_fert.addItemInput(<enderio:item_material:48>);
	tpc_circuit_fert.addItemInput(<minecraft:paper> * 4);
	tpc_circuit_fert.addItemInput(<immersiveengineering:wirecoil>);

	tpc_circuit_fert.addItemInput(<ore:treeSapling> * 1);
	tpc_circuit_fert.addFluidInput(<liquid:fertilizer> * 250);

	tpc_circuit_fert.addItemOutput(<prodigytech:circuit_plate> * 6);
	tpc_circuit_fert.build();

	var tpc_circuit_plate2 = RecipeBuilder.newBuilder("tpc_circuit_plate2", "tree_powered_compressor", 120);
	tpc_circuit_plate2.addItemInput(<enderio:item_material:48>);
	tpc_circuit_plate2.addItemInput(<minecraft:paper> * 4);
	tpc_circuit_plate2.addItemInput(<thermalfoundation:material:320>);

	tpc_circuit_plate2.addItemInput(<ore:treeSapling> * 1);
	tpc_circuit_plate2.addItemInput(<ore:fertilizer> * 1);
	tpc_circuit_plate2.addFluidInput(<fluid:water> * 250);

	tpc_circuit_plate2.addItemOutput(<prodigytech:circuit_plate> * 1);
	tpc_circuit_plate2.build();
}