import mods.extrautils2.Resonator;



{//polished stone
	recipes.remove(<extrautils2:decorativesolid:2>);

	mods.tconstruct.Casting.addBasinRecipe(
		<extrautils2:decorativesolid:2>, 
		<contenttweaker:lapis_stone>, <liquid:stone>, 144, 
		true, 200
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<extrautils2:decorativesolid:2>, 
		<contenttweaker:lapis_stone>, <liquid:stone> * 144, 
		500
	);
}
{//lunar dust
	<ore:dyeMagenta>.remove(<extrautils2:ingredients:3>);
	furnace.addRecipe(<thermalfoundation:dye:13> * 2, <extrautils2:ingredients:3>);
	scripts.content_machines.addFluidAlloyerRecipe(
		<extrautils2:decorativesolid:2> * 4,
		<contenttweaker:lapis_stone> * 2, <extrautils2:ingredients:3>, 
		<liquid:stone> * 500, 
		20, 250
	);
}

//components
//remove m apple and m wood recipes
recipes.remove(<extrautils2:decorativesolidwood:1>);
recipes.remove(<extrautils2:magicapple>);


//sun crystal
recipes.remove(<extrautils2:suncrystal:250>);
recipes.addShaped("ia_sun_crystal1", <extrautils2:suncrystal:250>, [
	[<ore:blockGlassYellow>, <ore:plateGold>, <ore:blockGlassYellow>], 
	[<ore:plateGold>, <contenttweaker:power_core_active>, <ore:plateGold>], 
	[<ore:blockGlassYellow>, <ore:plateGold>, <ore:blockGlassYellow>]
]);
recipes.addShaped("ia_sun_crystal2", <extrautils2:suncrystal:250>, [
	[<ore:blockGlassYellow>, <ore:plateGold>, <ore:blockGlassYellow>], 
	[<ore:plateGold>, <ore:gemCrystalFlux>, <ore:plateGold>], 
	[<ore:blockGlassYellow>, <ore:plateGold>, <ore:blockGlassYellow>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<extrautils2:suncrystal:250>],
	[<contenttweaker:power_core_active>, <ore:plateGold> * 2],
	<liquid:glass> * 1000,
	10, 128
);
mods.thermalexpansion.Transposer.addFillRecipe(
    <extrautils2:suncrystal>, 
    <extrautils2:suncrystal:250>, <liquid:liquid_sunshine> * 4000, 
    10000
);

{//nodes
	recipes.remove(<extrautils2:pipe>);
	recipes.addShaped("ia_xu_pipe", <extrautils2:pipe> * 16, [
		[null, <projectred-transmission:wire>, null], 
		[<projectred-transmission:wire>, <contenttweaker:zinc_rod>, <projectred-transmission:wire>], 
		[null, <projectred-transmission:wire>, null]
	]);

	recipes.remove(<extrautils2:grocket>);
	recipes.addShaped("ia_grocket", <extrautils2:grocket>, [
		[null, <extrautils2:pipe>, null], 
		[<minecraft:stone_slab>, <extrautils2:pipe>, <minecraft:stone_slab>], 
		[<minecraft:stone_slab>, <minecraft:chest>, <minecraft:stone_slab>]
	]);

	recipes.remove(<extrautils2:grocket:2>);
	recipes.addShaped("ia_grocket2", <extrautils2:grocket:2>, [
		[null, <extrautils2:pipe>, null], 
		[<minecraft:stone_slab>, <extrautils2:pipe>, <minecraft:stone_slab>], 
		[<minecraft:stone_slab>, <minecraft:bucket>, <minecraft:stone_slab>]
	]);

	recipes.remove(<extrautils2:grocket:3>);
	recipes.addShapeless("ia_grocket3", <extrautils2:grocket:3>, [
		<extrautils2:grocket>, <contenttweaker:simple_motor>
	]);
	recipes.remove(<extrautils2:grocket:4>);
	recipes.addShapeless("ia_grocket4", <extrautils2:grocket:4>, [
		<extrautils2:grocket:2>, <contenttweaker:simple_motor>
	]);
}

//golden lasso
recipes.remove(<extrautils2:goldenlasso>);
recipes.addShaped("ia_goldenlasso", <extrautils2:goldenlasso>, [
	[<ore:ingotEnchantedMetal>, <ore:string>, <ore:ingotEnchantedMetal>], 
	[<ore:string>, <tconstruct:piggybackpack>, <ore:string>], 
	[<ore:ingotEnchantedMetal>, <ore:string>, <ore:ingotEnchantedMetal>]
]);

//resonator
recipes.remove(<extrautils2:resonator>);
recipes.addShaped("ia_resonator", <extrautils2:resonator>, [
	[null, <contenttweaker:power_core_active>, null], 
	[<projectred-transmission:wire>, <extrautils2:machine>, <projectred-transmission:wire>], 
	[<ore:gemRedstone>, <ore:gearDemonicMetal>, <ore:gemRedstone>]
]);

Resonator.add(<enderio:item_alloy_ingot>, <thermalfoundation:material:160>, 1600);
Resonator.add(<enderio:item_material:32>, <moreplates:osmium_plate>, 1600);
Resonator.add(<projectred-core:resource_item:105>, <moreplates:cobalt_plate>, 1600);
mods.extrautils2.Crusher.add(<minecraft:prismarine_crystals>, <minecraft:prismarine_shard>);


{/////////////////////////////////////machines
	//enchanter
	recipes.addShaped("ia_enchanter", <extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), [
		[<extrautils2:decorativesolid:3>, <extrautils2:suncrystal>, <extrautils2:decorativesolid:3>], 
		[<minecraft:experience_bottle>, <extrautils2:machine>, <minecraft:experience_bottle>], 
		[<extrautils2:decorativesolid:3>, <ore:gearDemonicMetal>, <extrautils2:decorativesolid:3>]
	]);

	//analog crafter
	recipes.remove(<extrautils2:analogcrafter>);
	recipes.addShaped("ia_analog_crafter", <extrautils2:analogcrafter>, [
		[<extrautils2:decorativesolidwood>, <avaritia:compressed_crafting_table>, <extrautils2:decorativesolidwood>], 
		[<extrautils2:decorativesolidwood>, <extrautils2:machine>, <extrautils2:decorativesolidwood>], 
		[<extrautils2:decorativesolidwood>, <ore:blockQuartzBlack>, <extrautils2:decorativesolidwood>]
	]);
	recipes.remove(<extrautils2:crafter>);
	recipes.addShaped("ia_best_crafter", <extrautils2:crafter>, [
		[<prodigytech:zorra_log>, <ore:gearIronwood>, <prodigytech:zorra_log>], 
		[<contenttweaker:basic_neuron>, <avaritia:double_compressed_crafting_table>, <contenttweaker:basic_neuron>], 
		[<prodigytech:zorra_log>, <ore:gearIronwood>, <prodigytech:zorra_log>]
	]);

	//el furnace
	recipes.addShaped("ia_eu_el_furance", <extrautils2:machine>.withTag({Type: "extrautils2:furnace"}), [
		[<extrautils2:decorativesolid:3>, <morefurnaces:furnaceblock>, <extrautils2:decorativesolid:3>], 
		[<contenttweaker:angel_rod>, <extrautils2:machine>, <contenttweaker:angel_rod>], 
		[<extrautils2:decorativesolid:3>, <ore:gearDemonicMetal>, <extrautils2:decorativesolid:3>]
	]);

	

	
	//crusher
	recipes.addShaped("ia_eu_crusher", <extrautils2:machine>.withTag({Type: "extrautils2:crusher"}), [
		[<extrautils2:decorativesolid:3>, <appliedenergistics2:grindstone>, <extrautils2:decorativesolid:3>], 
		[<ore:gearFerramic>, <extrautils2:machine>, <ore:gearFerramic>], 
		[<extrautils2:decorativesolid:3>, <ore:gearDemonicMetal>, <extrautils2:decorativesolid:3>]
	]);
}

{//generators
	recipes.addShaped("ia_generator_survival", <extrautils2:machine>.withTag({Type: "extrautils2:generator_survival"}), [
		[<thermalfoundation:material:322>, <morefurnaces:furnaceblock:1>, <thermalfoundation:material:322>], 
		[<morefurnaces:furnaceblock:1>, <enderio:item_material:66>, <morefurnaces:furnaceblock:1>], 
		[<thermalfoundation:material:322>, <enderio:item_material:18>, <thermalfoundation:material:322>]
	]);
	recipes.addShaped("ia_generator", <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), [
		[<moreplates:energetic_silver_plate>, <morefurnaces:furnaceblock:2>, <moreplates:energetic_silver_plate>], 
		[<morefurnaces:furnaceblock:2>, <enderio:item_material:66>, <morefurnaces:furnaceblock:2>], 
		[<moreplates:energetic_silver_plate>, <enderio:item_material:18>, <moreplates:energetic_silver_plate>]
	]);
	recipes.addShaped("ia_generator_overclock", <extrautils2:machine>.withTag({Type: "extrautils2:generator_overclock"}), [
		[<moreplates:vivid_alloy_plate>, <morefurnaces:furnaceblock:3>, <moreplates:vivid_alloy_plate>], 
		[<morefurnaces:furnaceblock:3>, <enderio:item_material:66>, <morefurnaces:furnaceblock:3>], 
		[<moreplates:vivid_alloy_plate>, <enderio:item_material:18>, <moreplates:vivid_alloy_plate>]
	]);
	recipes.addShaped("ia_generator_culinary", <extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}), [
		[<contenttweaker:soy_plate>, <harvestcraft:cookedtofenisonitem>, <contenttweaker:soy_plate>], 
		[<thermalexpansion:augment:256>, <enderio:item_material:66>, <thermalexpansion:augment:256>], 
		[<contenttweaker:soy_plate>, <enderio:item_material:18>, <contenttweaker:soy_plate>]
	]);

	recipes.addShaped("ia_generator_lava", <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}), [
		[<contenttweaker:hot_plate>, <industrialforegoing:lava_fabricator>, <contenttweaker:hot_plate>], 
		[<betternether:cincinnasite_forged>, <enderio:item_material:66>, <betternether:cincinnasite_forged>], 
		[<contenttweaker:hot_plate>, <enderio:item_material:18>, <contenttweaker:hot_plate>]
	]);
	recipes.addShaped("ia_generator_redstone", <extrautils2:machine>.withTag({Type: "extrautils2:generator_redstone"}), [
		[<contenttweaker:hot_plate>, <extendedcrafting:singularity:3>, <contenttweaker:hot_plate>], 
		[<extrautils2:ingredients:13>, <enderio:item_material:66>, <extrautils2:ingredients:13>], 
		[<contenttweaker:hot_plate>, <enderio:item_material:18>, <contenttweaker:hot_plate>]
	]);
	recipes.addShaped("ia_generator_pink", <extrautils2:machine>.withTag({Type: "extrautils2:generator_pink"}), [
		[<moreplates:crystalline_pink_slime_gear>, <biomesoplenty:sapling_1:1>, <moreplates:crystalline_pink_slime_gear>], 
		[<appliedenergistics2:paint_ball:6>, <enderio:item_material:66>, <appliedenergistics2:paint_ball:6>], 
		[<moreplates:crystalline_pink_slime_gear>, <enderio:item_material:18>, <moreplates:crystalline_pink_slime_gear>]
	]);
	recipes.addShaped("ia_generator_tnt", <extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}), [
		[<contenttweaker:explosion_resistant_plate>, <mekanism:obsidiantnt>, <contenttweaker:explosion_resistant_plate>], 
		[<contenttweaker:creeper_component>, <enderio:item_material:66>, <contenttweaker:creeper_component>], 
		[<contenttweaker:explosion_resistant_plate>, <enderio:item_material:18>, <contenttweaker:explosion_resistant_plate>]
	]);

	recipes.addShaped("ia_generator_enchant", <extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}), [
		[<moreplates:enchanted_plate>, <thermalexpansion:machine:13>, <moreplates:enchanted_plate>], 
		[<minecraft:enchanting_table>, <enderio:item_material:66>, <minecraft:enchanting_table>], 
		[<moreplates:enchanted_plate>, <enderio:item_material:18>, <moreplates:enchanted_plate>]
	]);
	recipes.addShaped("ia_generator_ice", <extrautils2:machine>.withTag({Type: "extrautils2:generator_ice"}), [
		[<minecraft:packed_ice>, <aether_legacy:ice_pendant>, <minecraft:packed_ice>], 
		[<xreliquary:mob_ingredient:10>, <enderio:item_material:66>, <xreliquary:mob_ingredient:10>], 
		[<minecraft:packed_ice>, <enderio:item_material:18>, <minecraft:packed_ice>]
	]);
	recipes.addShaped("ia_generator_dragonsbreath", <extrautils2:machine>.withTag({Type: "extrautils2:generator_dragonsbreath"}), [
		[<moreplates:melodic_alloy_plate>, <contenttweaker:lightning_cell>, <moreplates:melodic_alloy_plate>], 
		[<minecraft:dragon_breath>, <enderio:item_material:66>, <minecraft:dragon_breath>], 
		[<moreplates:melodic_alloy_plate>, <enderio:item_material:18>, <moreplates:melodic_alloy_plate>]
	]);
	recipes.addShaped("ia_generator_potion", <extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"}), [
		[<contenttweaker:potion_zinc_plate>, <industrialforegoing:potion_enervator>, <contenttweaker:potion_zinc_plate>], 
		[<minecraft:brewing_stand>, <enderio:item_material:66>, <minecraft:brewing_stand>], 
		[<contenttweaker:potion_zinc_plate>, <enderio:item_material:18>, <contenttweaker:potion_zinc_plate>]
	]);

	recipes.addShaped("ia_generator_death", <extrautils2:machine>.withTag({Type: "extrautils2:generator_death"}), [
		[<moreplates:soularium_plate>, <quark:diamond_heart>, <moreplates:soularium_plate>], 
		[<enderio:item_material:42>, <enderio:item_material:66>, <enderio:item_material:42>], 
		[<moreplates:soularium_plate>, <enderio:item_material:18>, <moreplates:soularium_plate>]
	]);
	recipes.addShaped("ia_generator_ender", <extrautils2:machine>.withTag({Type: "extrautils2:generator_ender"}), [
		[<thermalfoundation:material:359>, <enderio:item_material:44>, <thermalfoundation:material:359>], 
		[<xreliquary:mob_ingredient:11>, <enderio:item_material:66>, <xreliquary:mob_ingredient:11>], 
		[<thermalfoundation:material:359>, <enderio:item_material:18>, <thermalfoundation:material:359>]
	]);
	recipes.addShaped("ia_generator_slime", <extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), [
		[<moreplates:knightslime_plate>, <actuallyadditions:block_greenhouse_glass>, <moreplates:knightslime_plate>], 
		[<xreliquary:mob_ingredient:4>, <enderio:item_material:66>, <xreliquary:mob_ingredient:4>], 
		[<moreplates:knightslime_plate>, <enderio:item_material:18>, <moreplates:knightslime_plate>]
	]);
	recipes.addShaped("ia_generator_netherstar", <extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}), [
		[<moreplates:evil_infused_iron_plate>, <minecraft:nether_star>, <moreplates:evil_infused_iron_plate>], 
		[<contenttweaker:lightning_cell>, <enderio:item_material:66>, <contenttweaker:lightning_cell>], 
		[<moreplates:evil_infused_iron_plate>, <enderio:item_material:18>, <moreplates:evil_infused_iron_plate>]
	]);
}

{//////////////////////////////mills
	recipes.remove(<extrautils2:passivegenerator:3>);
	recipes.addShaped("ia_water_mill", <extrautils2:passivegenerator:3>, [
		[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>], 
		[<contenttweaker:watertight_steel_rod>, <contenttweaker:rotor_blades>, <contenttweaker:watertight_steel_rod>], 
		[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>]
	]);

	recipes.remove(<extrautils2:passivegenerator:2>);
	recipes.addShaped("ia_lava_mill", <extrautils2:passivegenerator:2>, [
		[<extrautils2:decorativesolid:3>, <contenttweaker:firebrick_block>, <extrautils2:decorativesolid:3>], 
		[<contenttweaker:firebrick_block>, <ore:gearDemonicMetal>, <contenttweaker:firebrick_block>], 
		[<extrautils2:decorativesolid:3>, <contenttweaker:firebrick_block>, <extrautils2:decorativesolid:3>]
	]);

	recipes.remove(<extrautils2:passivegenerator:4>);
	recipes.addShaped("ia_air_mill", <extrautils2:passivegenerator:4>, [
		[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>], 
		[null, <contenttweaker:rotor_blades>, <contenttweaker:angel_gear>], 
		[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>]
	]);

	recipes.remove(<extrautils2:passivegenerator:5>);
	recipes.addShaped("ia_fire_mill", <extrautils2:passivegenerator:5>, [
		[<extrautils2:decorativesolid:3>, null, <extrautils2:decorativesolid:3>], 
		[<extrautils2:decorativesolid:3>, <ore:gearDemonicMetal>, <extrautils2:decorativesolid:3>], 
		[<extrautils2:decorativesolid:3>, <contenttweaker:rotor_blades>, <extrautils2:decorativesolid:3>]
	]);

	recipes.remove(<extrautils2:passivegenerator:8>);
	recipes.addShaped("ia_dragon_mill", <extrautils2:passivegenerator:8>, [
		[<moreplates:draconium_plate>, <harvestcraft:dragonfruititem>, <moreplates:draconium_plate>], 
		[<minecraft:nether_star>, <biomesoplenty:terrestrial_artifact>, <minecraft:nether_star>], 
		[<moreplates:draconium_plate>, <actuallyadditions:block_misc:8>, <moreplates:draconium_plate>]
	]);
}

recipes.remove(<extrautils2:rainbowgenerator>);
recipes.addShaped("ia_rainbowgenerator", <extrautils2:rainbowgenerator>, [
	[null, <extrautils2:rainbowgenerator:2>, null], 
	[<extrautils2:opinium:8>, <enderio:item_material:54>, <extrautils2:opinium:8>], 
	[null, <extrautils2:rainbowgenerator:1>, null]
]);

///////////////////////////////upgrade
recipes.remove(<extrautils2:ingredients:6>);
recipes.addShaped("ia_eu_speed_upgrade1", <extrautils2:ingredients:6>, [
	[null, <ore:stickGold>, null], 
	[<ore:stickGold>, <ore:plateConstantan>, <ore:stickGold>], 
	[null, <ore:xuUpgradeBlank>, null]
]);

recipes.remove(<extrautils2:ingredients:8>);
recipes.addShaped("ia_eu_mining_upgrade", <extrautils2:ingredients:8>, [
	[null, <contenttweaker:zinc_gear>, null], 
	[<extrautils2:grocket:2>, <ore:xuUpgradeBlank> | <extendedcrafting:singularity_custom:1>, <extrautils2:grocket>], 
	[null, <ore:gearNickel>, null]
]);

//other
recipes.remove(<extrautils2:angelblock>);
recipes.addShaped("ia_xu2_angel_block", <extrautils2:angelblock>, [
	[null, <roots:runed_obsidian>, null], 
	[<minecraft:feather>, <contenttweaker:angel_block>, <minecraft:feather>], 
	[null, <roots:runed_obsidian>, null]
]);


//user
recipes.remove(<extrautils2:user>);
recipes.addShaped("ia_eu2_user", <extrautils2:user>, [
	[<moreplates:evil_infused_iron_plate>, <contenttweaker:awaken_uru_gear>, <moreplates:evil_infused_iron_plate>], 
	[<projectred-core:resource_item:401>, <actuallyadditions:block_misc:9>, <projectred-core:resource_item:401>], 
	[<moreplates:evil_infused_iron_plate>, <contenttweaker:gearbox_funky>, <moreplates:evil_infused_iron_plate>]
]);

//deep dark
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:deep_dark_core>, 
    [
		<erebus:materials:38>,
    	<extrautils2:compressedcobblestone:7>,
    	<contenttweaker:blood_frame>
	]
);

recipes.remove(<extrautils2:teleporter:1>);
mods.extendedcrafting.TableCrafting.addShapeless(0, <extrautils2:teleporter:1>, 
	[
		<extendedcrafting:singularity:1>, <extendedcrafting:singularity:17>, <extendedcrafting:singularity:18>, <extendedcrafting:singularity:25>, <extendedcrafting:singularity:20>, <extendedcrafting:singularity:16>, <extendedcrafting:singularity>, 
		<extendedcrafting:singularity:5>, <extendedcrafting:singularity:22>, <extendedcrafting:singularity_custom:5>, <extendedcrafting:singularity:23>, <extendedcrafting:singularity:65>, <extendedcrafting:singularity:64>, <extendedcrafting:singularity:3>, 
		<extendedcrafting:singularity:34>, <extendedcrafting:singularity:35>, <extendedcrafting:singularity:30>, <extendedcrafting:singularity:31>, <extendedcrafting:singularity:33>, <extendedcrafting:singularity:32>, <extendedcrafting:singularity_custom:17>, 
		<extendedcrafting:singularity:29>, <extendedcrafting:singularity_custom:30>, <extendedcrafting:singularity_custom:31>, <contenttweaker:deep_dark_core>, <extendedcrafting:singularity_custom:32>, <extendedcrafting:singularity_custom:33>, <extendedcrafting:singularity_custom:6>, 
		<extendedcrafting:singularity_custom:25>, <extendedcrafting:singularity_custom:26>, <extendedcrafting:singularity_custom:27>, <extendedcrafting:singularity_custom:29>, <extendedcrafting:singularity_custom:34>, <extendedcrafting:singularity_custom:35>, <extendedcrafting:singularity_custom:28>, 
		<extendedcrafting:singularity_custom:36>, <extendedcrafting:singularity:4>, <extendedcrafting:singularity_custom:7>, <extendedcrafting:singularity:7>, <extendedcrafting:singularity:6>, <extendedcrafting:singularity:2>, <extendedcrafting:singularity_custom:37>, 
		<extendedcrafting:singularity_custom:18>, <extendedcrafting:singularity_custom:19>, <extendedcrafting:singularity_custom:20>, <extendedcrafting:singularity_custom:21>, <extendedcrafting:singularity_custom:22>, <extendedcrafting:singularity_custom:23>, <extendedcrafting:singularity_custom:24>
	]
);