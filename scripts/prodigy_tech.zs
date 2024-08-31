#priority 10

import mods.prodigytech.explosionfurnace.recipes as explosionfurnace_recipes;
//explosionfurnace.recipes.addRecipe(IItemStack/IOreDictEntry in, IItemStack out, int ep, IItemStack/IOreDictEntry reagent, int craftPerReagent)

import mods.prodigytech.rotarygrinder;
import mods.prodigytech.solderer;
import mods.prodigytech.atomicreshaper;
//addRecipeMulti(IItemStack in, int primordium, int time, IItemStack[] outputs, @Optional int[] weights)

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;


furnace.remove(<projectred-core:resource_item>);
furnace.addRecipe(<prodigytech:charred_stone>, <minecraft:stone>);



//crafting
recipes.remove(<prodigytech:explosion_furnace>);
recipes.addShaped(
    "ia_explosion_furnace",
    <prodigytech:explosion_furnace>,
    [[<roots:runestone>, <thermalfoundation:storage_alloy:3>, <roots:runestone>],
    [<appliedenergistics2:tiny_tnt>, <extendedcrafting:singularity_custom:100>, <appliedenergistics2:tiny_tnt>],
    [<roots:runestone>, <minecraft:furnace>, <roots:runestone>]]
);


//explosionfurnace_recipes.removeRecipeByOutput(<prodigytech:ferramic_ingot>);
explosionfurnace_recipes.removeAll();
explosionfurnace_recipes.addRecipe(<thermalfoundation:material:132> * 4, <prodigytech:ferramic_ingot> * 4, 360, <contenttweaker:fireclay>, 1);
explosionfurnace_recipes.addRecipe(
	<contenttweaker:ferramic_base> * 8, <prodigytech:ferramic_ingot> * 8, 360, <contenttweaker:fireclay>, 1
);
explosionfurnace_recipes.addRecipe(
	<extendedcrafting:singularity:16>, <extendedcrafting:singularity_custom:4>, 36000, <contenttweaker:fireclay> * 64, 1
);

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
explosionfurnace_recipes.addRecipe(<prodigytech:zorrasteel_raw> * 4, <prodigytech:zorrasteel_ingot> * 4, 360, <prodigytech:aeternus_crystal>, 1);

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
}

{
	mods.prodigytech.explosionfurnace.explosives.add(<minecraft:fire_charge>, 288);
	mods.prodigytech.explosionfurnace.explosives.add(<appliedenergistics2:tiny_tnt>, 750);
	mods.prodigytech.explosionfurnace.explosives.add(<minecraft:tnt>, 1500);
	mods.prodigytech.explosionfurnace.explosives.add(<natura:nether_planks:3>, 288);
}




{//aeroheaters
	recipes.remove(<prodigytech:magmatic_aeroheater>);
	recipes.addShaped("ia_magmatic_aeroheater", 
		<prodigytech:magmatic_aeroheater>, [
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:firebrick_block>, <ore:ingotFerramic>], 
		[<ore:ingotAluminum>, <thermalfoundation:material:324>, <ore:ingotAluminum>]
	]);
	recipes.remove(<prodigytech:solid_fuel_aeroheater>);
	recipes.addShaped("ia_solid_fuel_aeroheater", <prodigytech:solid_fuel_aeroheater>, [
		[<ore:ingotFerramic>, <prodigytech:fuel_pellet_16>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <morefurnaces:furnaceblock>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:magmatic_aeroheater>, <ore:ingotFerramic>]
	]);
	recipes.remove(<prodigytech:energion_aeroheater>);
	recipes.addShaped("ai_energion_aeroheater", <prodigytech:energion_aeroheater>, [
		[<prodigytech:inferno_crystal>, null, <prodigytech:inferno_crystal>], 
		[<prodigytech:inferno_crystal>, <ore:gemEnergion>, <prodigytech:inferno_crystal>], 
		[<ore:gearFerramic>, <prodigytech:solid_fuel_aeroheater>, <ore:gearFerramic>]
	]);
	recipes.remove(<prodigytech:tartaric_aeroheater>);
	recipes.addShaped("ia_tartaric_aeroheater", <prodigytech:tartaric_aeroheater>, [
		[<ore:gearFerramic>, <prodigytech:aeternus_crystal>, <ore:gearFerramic>], 
		[<ore:ingotZorrasteel>, <morefurnaces:furnaceblock:1>, <ore:ingotZorrasteel>], 
		[<ore:ingotZorrasteel>, <prodigytech:energion_aeroheater>, <ore:ingotZorrasteel>]
	]);

	recipes.remove(<prodigytech:capacitor_aeroheater>);
	recipes.addShaped("ia_capacitor_aeroheater", <prodigytech:capacitor_aeroheater>, [
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:ingotFerramic>, <ore:ingotFerramic>]
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

solderer.addRecipe(
	<prodigytech:pattern_circuit_perfected>, 
	<prodigytech:circuit_refined>, 
	<prodigytech:circuit_perfected>, 12
);



{//heat capacitors
	recipes.remove(<prodigytech:heat_capacitor_0:1200>);
	recipes.addShaped("ia_heat_capacitor_0", <prodigytech:heat_capacitor_0:1200>, [
		[null, <ore:ingotFerramic>, null], 
		[<ore:ingotFerramic>, <prodigytech:fuel_pellet_4>, <ore:ingotFerramic>], 
		[<ore:stickIron>, <ore:ingotFerramic>, <ore:stickIron>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<prodigytech:heat_capacitor_0:1200>],
		[<ore:ingotFerramic> * 2, <prodigytech:fuel_pellet_4>, <ore:stickIron>],
		null,
		10, 256
	);

	recipes.remove(<prodigytech:heat_capacitor_1:1200>);
	recipes.addShaped("ai_heat_capacitor_1", <prodigytech:heat_capacitor_1:1200>, [
		[null, <prodigytech:heat_capacitor_0:1200>, null], 
		[<prodigytech:inferno_fuel>, <prodigytech:circuit_crude>, <prodigytech:inferno_fuel>], 
		[null, <prodigytech:heat_capacitor_0:1200>, null]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<prodigytech:heat_capacitor_1:1200>],
		[<prodigytech:heat_capacitor_0:1200>, <prodigytech:inferno_fuel>, <prodigytech:circuit_crude>],
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
	recipes.remove(<prodigytech:capacitor_charger>);
	recipes.addShaped("ia_capacitor_charger", <prodigytech:capacitor_charger>, [
		[<ore:ingotFerramic>, <ore:ingotFerramic>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0:1200>, <ore:ingotFerramic>]
	]);
	recipes.remove(<prodigytech:fuel_processor>);
	recipes.addShaped("ia_fuel_processor", <prodigytech:fuel_processor>, [
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:plateAluminum>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <contenttweaker:firebrick_block>, <ore:ingotFerramic>]
	]);
	recipes.remove(<prodigytech:heat_sawmill>);
	recipes.addShaped("ia_heat_sawmill", <prodigytech:heat_sawmill>, [
		[<ore:gearFerramic>, <ore:gearFerramic>, <ore:gearFerramic>], 
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:plateCarbon>, <ore:ingotFerramic>]
	]);

	recipes.remove(<prodigytech:rotary_grinder>);
	recipes.addShaped("ia_rotary_grinder", <prodigytech:rotary_grinder>, [
		[<ore:ingotFerramic>, <ore:gearFerramic>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, null, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <appliedenergistics2:grindstone>, <ore:ingotFerramic>]
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

	recipes.remove(<prodigytech:blower_furnace>);
	recipes.addShaped("ia_blower_furnace", <prodigytech:blower_furnace>, [
		[<ore:ingotFerramic>, <ore:ingotAluminum>, <ore:ingotFerramic>], 
		[<ore:dustCharcoal>, null, <ore:dustCharcoal>], 
		[<ore:ingotFerramic>, <minecraft:furnace>, <ore:ingotFerramic>]
	]);
	recipes.remove(<prodigytech:magnetic_reassembler>);
	recipes.addShaped("ia_magnetic_reassembler", <prodigytech:magnetic_reassembler>, [
		[<ore:ingotFerramic>, <prodigytech:heat_capacitor_0>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <ore:gearFerramic>, <ore:ingotFerramic>], 
		[<ore:ingotFerramic>, <prodigytech:blower_furnace>, <ore:ingotFerramic>]
	]);
	recipes.remove(<prodigytech:solderer>);
	recipes.addShaped("ai_solderer", <prodigytech:solderer>, [
		[<ore:ingotFerramic>, <ore:stickGold>, <ore:ingotFerramic>], 
		[<ore:gearFerramic>, <prodigytech:circuit_plate>, <ore:gearFerramic>], 
		[<ore:ingotFerramic>, <ore:plateCarbon>, <ore:ingotFerramic>]
	]);
	recipes.remove(<prodigytech:automatic_crystal_cutter>);
	recipes.addShaped("ia_automatic_crystal_cutter", <prodigytech:automatic_crystal_cutter>, [
		[<ore:ingotFerramic>, <ore:gemEnergion>, <ore:ingotFerramic>], 
		[<prodigytech:crystal_cutter>, <ore:gemEnergion>, <prodigytech:crystal_cutter>], 
		[<ore:ingotFerramic>, <contenttweaker:duraluminum_block>, <ore:ingotFerramic>]
	]);

	recipes.remove(<prodigytech:primordialis_reactor>);
	recipes.addShaped("ia_primordialis_reactor", <prodigytech:primordialis_reactor>, [
		[<ore:blockFerramic>, <prodigytech:heat_capacitor_1>, <ore:blockFerramic>], 
		[<contenttweaker:research_plants1>.reuse(), <extendedcrafting:singularity_custom:100>, <contenttweaker:research_sieving>.reuse()], 
		[<ore:blockFerramic>, <thermalexpansion:frame:64>, <ore:blockFerramic>]
	]);
	recipes.remove(<prodigytech:atomic_reshaper>);
	recipes.addShaped("ia_atomic_reshaper", <prodigytech:atomic_reshaper>, [
		[<ore:blockFerramic>, <prodigytech:heat_capacitor_1>, <ore:blockFerramic>], 
		[<prodigytech:primordium>, <extrautils2:suncrystal>, <prodigytech:primordium>], 
		[<ore:blockFerramic>, <thermalexpansion:frame:64>, <ore:blockFerramic>]
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

	//diamond
	rotarygrinder.removeRecipe(<minecraft:diamond>);
	rotarygrinder.addRecipe(<minecraft:diamond>, <mekanism:otherdust>);

	rotarygrinder.removeRecipe(<ore:blockDiamond>);
	rotarygrinder.addRecipe(<ore:blockDiamond>, <mekanism:otherdust> * 9);

	rotarygrinder.removeRecipe(<ore:oreDiamond>);

	//wheat
	rotarygrinder.removeRecipe(<minecraft:wheat>);
	rotarygrinder.addRecipe(<minecraft:wheat>, <natura:materials:2> * 2);

	//missing
	rotarygrinder.addRecipe(<thermalfoundation:material:128>, <thermalfoundation:material:64>);	//copper
	rotarygrinder.addRecipe(<thermalfoundation:material:129>, <thermalfoundation:material:65>);	//tin
	rotarygrinder.addRecipe(<thermalfoundation:material:130>, <thermalfoundation:material:66>);	//silver
	rotarygrinder.addRecipe(<thermalfoundation:material:131>, <thermalfoundation:material:67>);	//lead
	rotarygrinder.addRecipe(<thermalfoundation:material:132>, <thermalfoundation:material:68>);	//alum
	rotarygrinder.addRecipe(<thermalfoundation:material:133>, <thermalfoundation:material:69>);	//nickel
	rotarygrinder.addRecipe(<contenttweaker:zinc_ingot>, <contenttweaker:zinc_dust>);			//zinc
	rotarygrinder.addRecipe(<mekanism:ingot:1>, <mekanism:dust:2>);								//osmium
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
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <contenttweaker:nial_ingot>, 
		2000, 
		<contenttweaker:ferramic_base>
	);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <plustic:alumiteingot>, 
		2000, 
		<contenttweaker:ferramic_base> * 3
	);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:research_heat>, <contenttweaker:research_heat>, <contenttweaker:duraluminum_ingot>, 
		2000, 
		<contenttweaker:ferramic_base> * 7
	);
}


{//heat exchanger
	{//lava
		var rec = RecipeBuilder.newBuilder("lava_heat", "heat_exchanger", 60*20*3);

        rec.addFluidInput(<liquid:lava> * 3000);
		rec.addItemInput(<prodigytech:fuel_pellet_64>);
		rec.addItemInput(<prodigytech:tartaric_stoker> * 16);
		rec.addMekanismHeatInput(500, 499, 1.0/0);

		rec.addFluidOutput(<liquid:lava_residue> * 300);
        

        rec.addEnergyPerTickInput(128);
		rec.addHotAirOutput(500, 400, 550);
        
        rec.build();
	}
	{//lava2
		var rec = RecipeBuilder.newBuilder("lava2_heat", "heat_exchanger", 60*20*5);

        rec.addFluidInput(<liquid:high_heat_lava> * 1000);
		rec.addItemInput(<prodigytech:fuel_pellet_64>);
		rec.addItemInput(<prodigytech:tartaric_stoker> * 16);
		rec.addMekanismHeatInput(1200, 1199, 1.0/0);

		rec.addFluidOutput(<liquid:lava_residue> * 1000);
        

        rec.addEnergyPerTickInput(384);
		rec.addHotAirOutput(1200, 1100, 1250);
        
        rec.build();
	}
	{//lava3
		var rec = RecipeBuilder.newBuilder("lava3_heat", "heat_exchanger", 60*20*7);

        rec.addFluidInput(<liquid:super_heat_lava> * 500);
		rec.addItemInput(<prodigytech:fuel_pellet_64>);
		rec.addItemInput(<prodigytech:tartaric_stoker> * 16);
		rec.addMekanismHeatInput(2000, 1999, 1.0/0);

		rec.addFluidOutput(<liquid:lava_residue> * 3000);
        

        rec.addEnergyPerTickInput(512);
		rec.addHotAirOutput(2000, 1900, 2050);
        
        rec.build();
	}

	{//pyrotheum
		var rec = RecipeBuilder.newBuilder("pyrotheum_heat", "heat_exchanger", 60*20*2);

        rec.addFluidInput(<liquid:pyrotheum> * 2000);
		rec.addItemInput(<prodigytech:fuel_pellet_64>);
		rec.addItemInput(<prodigytech:tartaric_stoker> * 16);
		//rec.addFluidOutput(<liquid:lava_residue> * 300);
        

        rec.addEnergyPerTickInput(256);
		rec.addHotAirOutput(1000, 900, 1050);

        
        rec.build();
	}

	{//cobble
		var rec = RecipeBuilder.newBuilder("cobble", "heat_exchanger", 45*20);

		rec.addItemInput(<ore:cobblestone>, 8);
		rec.addMekanismHeatInput(500, 499, 1.0/0);

		rec.addFluidOutput(<liquid:lava> * 8000);
		rec.addDimensionRequirement([-1]);
        

        rec.addEnergyPerTickInput(128);
		rec.addHotAirOutput(400, 400, 550);
        
        rec.build();
	}
	{//cobble2
		var rec = RecipeBuilder.newBuilder("cobble2", "heat_exchanger", 4*45*20);

		rec.addItemInput(<ore:compressed1xCobblestone>, 8);
		rec.addMekanismHeatInput(800, 799, 1.0/0);

		rec.addFluidOutput(<liquid:lava> * 80000);
		rec.addDimensionRequirement([-1]);
        

        rec.addEnergyPerTickInput(256);
		rec.addHotAirOutput(400, 400, 550);
        
        rec.build();
	}
	{//cobble3
		var rec = RecipeBuilder.newBuilder("cobble3", "heat_exchanger", 4*4*45*20);

		rec.addItemInput(<ore:compressed2xCobblestone>, 8);
		rec.addMekanismHeatInput(1200, 1199, 1.0/0);

		rec.addFluidOutput(<liquid:lava> * 800000);
		rec.addDimensionRequirement([-1]);
        

        rec.addEnergyPerTickInput(512);
		rec.addHotAirOutput(400, 400, 550);
        
        rec.build();
	}
}

{//circuit_plate
	var tpc_circuit_plate = RecipeBuilder.newBuilder("tpc_circuit_plate", "tree_powered_compressor", 120);
	tpc_circuit_plate.addItemInput(<enderio:item_material:48>);
	tpc_circuit_plate.addItemInput(<minecraft:paper> * 4);
	tpc_circuit_plate.addItemInput(<immersiveengineering:wirecoil>);

	tpc_circuit_plate.addItemInput(<ore:treeSapling>, 1);
	tpc_circuit_plate.addItemInput(<minecraft:dye:15>);
	tpc_circuit_plate.addFluidInput(<fluid:water> * 250);

	tpc_circuit_plate.addItemOutput(<prodigytech:circuit_plate> * 2);
	tpc_circuit_plate.build();

	var tpc_circuit_plate2 = RecipeBuilder.newBuilder("tpc_circuit_plate2", "tree_powered_compressor", 120);
	tpc_circuit_plate2.addItemInput(<enderio:item_material:48>);
	tpc_circuit_plate2.addItemInput(<minecraft:paper> * 4);
	tpc_circuit_plate2.addItemInput(<thermalfoundation:material:320>);

	tpc_circuit_plate2.addItemInput(<ore:treeSapling>, 1);
	tpc_circuit_plate2.addItemInput(<minecraft:dye:15>);
	tpc_circuit_plate2.addFluidInput(<fluid:water> * 250);

	tpc_circuit_plate2.addItemOutput(<prodigytech:circuit_plate> * 1);
	tpc_circuit_plate2.build();
}