import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.thermalexpansion.InductionSmelter;
//InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

import mods.thermalexpansion.Transposer;
//Transposer.addFillRecipe(IItemStack output, IItemStack input, ILiquidStack fluid, int energy);

import mods.thermalexpansion.Crucible;
//Crucible.addRecipe(ILiquidStack output, IItemStack input, int energy);

import mods.thermalexpansion.Refinery;
//Refinery.addRecipe(output, outputItem, input, energy);

import mods.thermalexpansion.Pulverizer;
//Pulverizer.addRecipe(dust, ingot, 2000, byprod, chance);
import mods.thermalexpansion.Sawmill;
//Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);


import mods.thermalexpansion.Infuser;
//Infuser.addRecipe(IItemStack output, IItemStack input, int energy);

import mods.thermalexpansion.Centrifuge;
//Centrifuge.addRecipe(WeightedItemStack[] outputs, IItemStack input, ILiquidStack fluid, int energy);


//frames


//tank
val tank = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Level: 0 as byte});
recipes.remove(tank);
recipes.addShaped("ia_te_tank", tank, [
	[<ore:plateCopper>, <ore:blockGlassColorless>, <ore:plateCopper>], 
	[<ore:blockGlassColorless>, <minecraft:bucket>, <ore:blockGlassColorless>], 
	[<ore:plateCopper>, <contenttweaker:watertight_steel_gear>, <ore:plateCopper>]
]);
val reservoir = <thermalexpansion:reservoir>.withTag({});
recipes.removeByRecipeName("thermalexpansion:reservoir");
recipes.addShaped("ia_te_reservoir", reservoir, [
	[<ore:stickCopper>, <contenttweaker:watertight_steel_ingot>, <ore:stickCopper>], 
	[<ore:blockGlassColorless>, <minecraft:bucket>, <ore:blockGlassColorless>], 
	[<ore:stickCopper>, <minecraft:bucket>, <ore:stickCopper>]
]);





recipes.remove(<thermalfoundation:material:640>);
recipes.addShaped("ia_tool_casing", <thermalfoundation:material:640>, [
	[<immersiveengineering:wirecoil:5>, <ore:gearLumium>, <immersiveengineering:wirecoil:5>], 
	[<ore:gearInvar>, <contenttweaker:mekanical_core>, <ore:gearConstantan>], 
	[<contenttweaker:electric_manyullyn_rod>, <thermalfoundation:material:513>, <contenttweaker:electric_manyullyn_rod>]
]);

{//dusts
	recipes.remove(<thermalfoundation:material:1025>);
	recipes.addShaped("ia_cryotheum", <thermalfoundation:material:1025>, [
		[<ore:dustBlizz>, <ore:dustBlizz>], 
		[<ore:dustElectrotine>, <ore:snowball>]
	]);
	recipes.remove(<thermalfoundation:material:1027>);
	recipes.addShaped("ia_petrotheum", <thermalfoundation:material:1027>, [
		[<ore:dustBasalz>, <ore:dustBasalz>], 
		[<thermalfoundation:fertilizer>, <ore:dustObsidian>]
	]);
	recipes.remove(<thermalfoundation:material:1026>);
	recipes.addShaped("ia_aerotheum", <thermalfoundation:material:1026>, [
		[<ore:dustBlitz>, <ore:dustBlitz>], 
		[<ore:dustGlowstone>, <ore:dustSaltpeter>]
	]);
	recipes.addShaped("ia_mana_dust", <thermalfoundation:material:1028>, [
		[<thermalfoundation:fertilizer:2>, <ore:dustPyrotheum>, <thermalfoundation:fertilizer:2>], 
		[<ore:dustAerotheum>, <minecraft:experience_bottle>, <ore:dustPetrotheum>], 
		[<thermalfoundation:fertilizer:2>, <ore:dustCryotheum>, <thermalfoundation:fertilizer:2>]
	]);
	mods.thermalexpansion.Crucible.addRecipe(<liquid:mana> * 50, <thermalfoundation:material:1028>, 10000);
}
{//machines tier1
	val te_extracter = <thermalexpansion:device:3>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[]});
	recipes.remove(te_extracter);
	recipes.addShaped("ia_te_extracter", te_extracter, [
		[<contenttweaker:watertight_steel_plate>, <extendedcrafting:singularity_custom:1>, <contenttweaker:watertight_steel_plate>], 
		[<mob_grinding_utils:xp_tap>, <thermalexpansion:frame:64>, <mob_grinding_utils:xp_tap>], 
		[<contenttweaker:watertight_steel_plate>, <ore:gearInvar>, <contenttweaker:watertight_steel_plate>]
	]);

	val te_water_pump = <thermalexpansion:device>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [0, 1, 0, 0, 0, 0] as byte[] as byte[]});
	recipes.remove(te_water_pump);
	recipes.addShaped("ia_te_water_pump", te_water_pump, [
		[null, <immersiveengineering:metal_device1:6>, null], 
		[<extrautils2:grocket:2>, <thermalexpansion:frame:64>, <extrautils2:grocket:2>], 
		[<contenttweaker:watertight_steel_plate>, <roots:unending_bowl>, <contenttweaker:watertight_steel_plate>]
	]);

	var te_lex = <thermalexpansion:device:7>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [2, 1, 1, 1, 1, 1] as byte[] as byte[]});
	recipes.remove(te_lex);
	recipes.addShaped("ia_te_lex", te_lex, [
		[null, <thermalfoundation:tome_lexicon>, null], 
		[<thermalfoundation:material:323>, <thermalexpansion:frame:64>, <thermalfoundation:material:323>], 
		[<thermalfoundation:material:515>, <mysticalworld:pearl>, <thermalfoundation:material:515>]
	]);


	var te_thermal_med = <thermalexpansion:device:2>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [0, 1, 1, 1, 1, 1] as byte[] as byte[]});
	recipes.remove(te_thermal_med);
	recipes.addShaped("ia_te_thermal_med", te_thermal_med, [
		[<thermalexpansion:augment:128>, <thermalexpansion:augment:128>, <thermalexpansion:augment:128>], 
		[<contenttweaker:ice_shard>, <thermalexpansion:frame>, <contenttweaker:ice_shard>], 
		[<contenttweaker:electric_manyullyn_gear>, <thermalfoundation:material:512>, <contenttweaker:electric_manyullyn_gear>]
	]);
}
{//machines tier2
	val te_crusher = <thermalexpansion:machine:1>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_crusher);
	recipes.addShaped("ia_te_crusher", te_crusher, [
		[<contenttweaker:compound_metal2>, <thermalfoundation:material:656>, <contenttweaker:compound_metal2>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_furnace = <thermalexpansion:machine>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_furnace);
	recipes.addShaped("ia_te_furnace", te_furnace, [
		[<thermalfoundation:material:357>, <morefurnaces:furnaceblock:6>, <thermalfoundation:material:357>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_compactor = <thermalexpansion:machine:5>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_compactor);
	recipes.addShaped("ia_te_compactor", te_compactor, [
		[<thermalfoundation:material:323>, <contenttweaker:duraluminum_block>, <thermalfoundation:material:323>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_sawmill = <thermalexpansion:machine:2>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_sawmill);
	recipes.addShaped("ia_te_sawmill", te_sawmill, [
		[<contenttweaker:lesmium_plate>, <thermalfoundation:material:657>, <contenttweaker:lesmium_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_alloyer = <thermalexpansion:machine:3>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_alloyer);
	recipes.addShaped("ia_te_alloyer", te_alloyer, [
		[<thermalfoundation:material:357>, <tconstruct:smeltery_controller>, <thermalfoundation:material:357>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_infuser = <thermalexpansion:machine:9>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_infuser);
	recipes.addShaped("ia_te_infuser1", te_infuser, [
		[<contenttweaker:electric_manyullyn_base_block>, <immersiveengineering:metal_device1:8>, <contenttweaker:electric_manyullyn_base_block>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);
	recipes.addShaped("ia_te_infuser2", te_infuser, [
		[<contenttweaker:electric_manyullyn_plate>, <immersiveengineering:metal_device1:8>, <contenttweaker:electric_manyullyn_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_cobblegen = <thermalexpansion:machine:15>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_cobblegen);
	recipes.addShaped("ia_te_cobblegen", te_cobblegen, [
		[<contenttweaker:thermal_plate>, <ore:xuUpgradeMining>, <contenttweaker:thermal_plate>], 
		[<extrautils2:compressedcobblestone:1>, <thermalexpansion:frame>, <extrautils2:compressedcobblestone:1>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_ice_machine = <thermalexpansion:machine:14>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_ice_machine);
	recipes.addShaped("ia_te_ice_machine", te_ice_machine, [
		[<contenttweaker:thermal_plate>, <cookingforblockheads:fridge>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_enchanter = <thermalexpansion:machine:13>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_enchanter);
	recipes.addShaped("ia_te_enchanter", te_enchanter, [
		[<contenttweaker:thermal_plate>, <minecraft:enchanting_table>, <contenttweaker:thermal_plate>], 
		[<minecraft:experience_bottle>, <thermalexpansion:frame>, <minecraft:experience_bottle>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_crafter = <thermalexpansion:machine:11>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_crafter);
	recipes.addShaped("ia_te_crafter", te_crafter, [
		[<contenttweaker:thermal_plate>, <avaritia:compressed_crafting_table>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);

	val te_centrifuge = <thermalexpansion:machine:10>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_centrifuge);
	recipes.addShaped("ia_te_centrifuge", te_centrifuge, [
		[<contenttweaker:thermal_plate>, <contenttweaker:rotor_blades>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:513>, <contenttweaker:thermal_plate>]
	]);
}

val te_phyto_insulator = <thermalexpansion:machine:4>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
recipes.remove(te_phyto_insulator);
mods.extendedcrafting.TableCrafting.addShaped(0, te_phyto_insulator, [
	[<contenttweaker:flower_steel_plate>, <contenttweaker:flower_steel_rod>, <extendedcrafting:singularity:4>, <contenttweaker:flower_steel_rod>, <contenttweaker:flower_steel_plate>], 
	[<mysticalworld:amethyst_hoe>, <contenttweaker:fertilizer6>, <contenttweaker:life>, <contenttweaker:fertilizer6>, <mysticalworld:amethyst_hoe>], 
	[<erebus:jade_hoe>, <contenttweaker:robot_arm>, <actuallyadditions:block_misc:8>, <contenttweaker:robot_arm>, <erebus:jade_hoe>], 
	[<twilightforest:ironwood_hoe>, <contenttweaker:fertilizer6>, <contenttweaker:life>, <contenttweaker:fertilizer6>, <twilightforest:ironwood_hoe>], 
	[<contenttweaker:flower_steel_plate>, <contenttweaker:flower_steel_rod>, <extrautils2:compresseddirt:2>, <contenttweaker:flower_steel_rod>, <contenttweaker:flower_steel_plate>]
]);

{//fluid machines
	val te_transposer = <thermalexpansion:machine:8>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [3, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_transposer);
	recipes.addShaped("ia_te_transposer", te_transposer, [
		[<contenttweaker:thermal_plate>, <extrautils2:grocket:2>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:512>, <contenttweaker:thermal_plate>]
	]);

	val te_magma = <thermalexpansion:machine:6>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_magma);
	recipes.addShaped("ia_te_magma", te_magma, [
		[<contenttweaker:thermal_plate>, <immersiveengineering:stone_decoration:1>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:512>, <contenttweaker:thermal_plate>]
	]);

	val te_still = <thermalexpansion:machine:7>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 2, 3, 3, 3, 3] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_still);
	recipes.addShaped("ia_te_still", te_still, [
		[<contenttweaker:thermal_plate>, <alchemistry:evaporator>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:512>, <contenttweaker:thermal_plate>]
	]);

	val te_alchemical = <thermalexpansion:machine:12>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte});
	recipes.remove(te_alchemical);
	recipes.addShaped("ia_te_alchemical", te_alchemical, [
		[<contenttweaker:thermal_plate>, <minecraft:brewing_stand>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:duraluminum_gear>, <thermalexpansion:frame>, <contenttweaker:duraluminum_gear>], 
		[<contenttweaker:thermal_plate>, <thermalfoundation:material:512>, <contenttweaker:thermal_plate>]
	]);
}

{//kits
	recipes.remove(<thermalfoundation:upgrade>);
	recipes.addShaped("ia_te_kit1", <thermalfoundation:upgrade>, [
		[null, <ore:plateElectricalSteel>, null], 
		[<ore:plateElectricalSteel>, <ore:gearInvar>, <ore:plateElectricalSteel>], 
		[<contenttweaker:thermal_dust>, <ore:plateElectricalSteel>, <contenttweaker:thermal_dust>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:upgrade> * 2],
		[<ore:gearInvar>, <ore:plateElectricalSteel> * 2],
		<liquid:thermal> * 144,
		20, 128
	);

	recipes.remove(<thermalfoundation:upgrade:1>);
	recipes.addShaped("ia_te_kit2", <thermalfoundation:upgrade:1>, [
		[null, <immersiveengineering:metal_decoration0:1>, null], 
		[<thermalfoundation:storage_alloy:1>, <ore:gearLumium>, <thermalfoundation:storage_alloy:1>], 
		[<contenttweaker:thermal_dust>, <contenttweaker:electric_manyullyn_rod>, <contenttweaker:thermal_dust>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:upgrade:1> * 2],
		[<immersiveengineering:metal_decoration0:1>, <ore:gearLumium>, <thermalfoundation:storage_alloy:1>, <contenttweaker:electric_manyullyn_rod>],
		<liquid:thermal> * 144,
		20, 128
	);


	recipes.remove(<thermalfoundation:upgrade:2>);
	recipes.addShaped("ia_te_kit3", <thermalfoundation:upgrade:2>, [
		[null, <redstonearsenal:material:224>, null], 
		[<ore:blockSignalum>, <contenttweaker:mekanical_core>, <ore:blockSignalum>], 
		[<contenttweaker:thermal_dust>, <contenttweaker:ra_burner>, <contenttweaker:thermal_dust>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:upgrade:2> * 2],
		[<redstonearsenal:material:224>, <ore:blockSignalum>, <contenttweaker:mekanical_core>, <contenttweaker:ra_burner>],
		<liquid:thermal> * 144,
		20, 128
	);

	recipes.remove(<thermalfoundation:upgrade:3>);
	recipes.addShaped("ia_te_kit4", <thermalfoundation:upgrade:3>, [
		[<ore:gearEnderium>, <actuallyadditions:item_misc:7>, <ore:gearEnderium>], 
		[<ore:gearEnderium>, <contenttweaker:ecoppra_block>, <ore:gearEnderium>], 
		[<contenttweaker:thermal_dust>, <contenttweaker:gearbox_funky>, <contenttweaker:thermal_dust>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<thermalfoundation:upgrade:3> * 2],
		[<ore:gearEnderium> * 2, <contenttweaker:ecoppra_block>, <actuallyadditions:item_misc:7>, <contenttweaker:gearbox_funky>],
		<liquid:thermal> * 144,
		20, 128
	);
}

{//augments
	recipes.remove(<thermalexpansion:augment:128>);
	Transposer.addFillRecipe(<thermalexpansion:augment:128>, <thermalfoundation:material:515>, <liquid:speed_potion> * 2000, 25000);

	recipes.remove(<thermalexpansion:augment:129>);
	Transposer.addFillRecipe(<thermalexpansion:augment:129>, <thermalfoundation:material:515>, <liquid:haste_potion> * 2000, 15000);

	recipes.remove(<thermalexpansion:augment:337>);
	recipes.addShaped("ia_gearworking_die", <thermalexpansion:augment:337>, [
		[<ore:gearElectricalSteel>, <contenttweaker:gear_mold>, <ore:gearElectricalSteel>], 
		[<ore:gearSignalum>, <thermalfoundation:material:515>, <ore:gearSignalum>], 
		[<minecraft:piston>, <minecraft:piston>, <minecraft:piston>]
	]);
	recipes.remove(<thermalexpansion:augment:336>);
	recipes.addShaped("ia_te_coin_press", <thermalexpansion:augment:336>, [
		[<atum:golden_date>, <atum:coin_gold>, <atum:golden_date>], 
		[<atum:coin_gold>, <thermalfoundation:material:515>, <atum:coin_gold>], 
		[<atum:golden_date>, <atum:coin_gold>, <atum:golden_date>]
	]);

	recipes.remove(<thermalexpansion:augment:497>);
	recipes.addShaped("ia_clastic_deposition", <thermalexpansion:augment:497>, [
		[null, <thermalfoundation:material:515>, null], 
		[<contenttweaker:mushroomite_plate>, <extendedcrafting:singularity_custom:2>, <contenttweaker:mushroomite_plate>], 
		[null, <contenttweaker:electric_manyullyn_gear>, null]
	]);
	recipes.addShaped("ia_clastic_deposition2", <thermalexpansion:augment:497> * 2, [
		[<contenttweaker:research_cobblegen>.reuse(), <thermalfoundation:material:515>, null], 
		[<contenttweaker:mushroomite_plate>, <extendedcrafting:singularity_custom:2>, <contenttweaker:mushroomite_plate>], 
		[null, <contenttweaker:electric_manyullyn_gear>, null]
	]);

	recipes.remove(<thermalexpansion:augment:432>);
	recipes.addShaped("ia_pattern_validation", <thermalexpansion:augment:432>, [
		[null, <avaritia:compressed_crafting_table>, null], 
		[<ore:plateBronze>, <thermalfoundation:material:515>, <ore:plateBronze>], 
		[null, <ore:plateConstantan>, null]
	]);
	recipes.remove(<thermalexpansion:augment:433>);
	recipes.addShaped("ia_fluidic_fabrication", <thermalexpansion:augment:433>, [
		[<contenttweaker:watertight_steel_dust>, <avaritia:compressed_crafting_table>, <contenttweaker:watertight_steel_dust>], 
		[<contenttweaker:watertight_steel_dust>, <thermalfoundation:material:515>, <contenttweaker:watertight_steel_dust>], 
		[null, <thermalfoundation:material:512>, null]
	]);

	recipes.remove(<thermalexpansion:augment:369>);
	recipes.addShaped("ia_te_alchemical_retort", <thermalexpansion:augment:369>, [
		[null, <thermalfoundation:material:515>, null], 
		[<contenttweaker:thermal_plate>, <minecraft:brewing_stand>, <contenttweaker:thermal_plate>], 
		[null, <thermalfoundation:material:515>, null]
	]);

	recipes.remove(<thermalexpansion:augment:401>);
	recipes.addShaped("ia_te_repair", <thermalexpansion:augment:401>, [
		[<immersiveengineering:wirecoil:5>, <thermalfoundation:material:327>, <immersiveengineering:wirecoil:5>], 
		[<thermalfoundation:material:327>, <openblocks:auto_anvil>, <thermalfoundation:material:327>], 
		[<immersiveengineering:wirecoil:5>, <thermalfoundation:material:327>, <immersiveengineering:wirecoil:5>]
	]);

	recipes.remove(<thermalexpansion:augment:303>);
	recipes.addShaped("ia_te_slag_aug", <thermalexpansion:augment:303>, [
		[<ore:crystalSlagRich>, <contenttweaker:enriched_bioslag>, <ore:crystalSlagRich>], 
		[<contenttweaker:enriched_bioslag>, <thermalfoundation:material:515>, <contenttweaker:enriched_bioslag>], 
		[<ore:crystalSlagRich>, <contenttweaker:enriched_bioslag>, <ore:crystalSlagRich>]
	]);
	recipes.remove(<thermalexpansion:augment:273>);
	recipes.addShaped("ia_te_gem_aug", <thermalexpansion:augment:273>, [
		[<aether_legacy:zanite_gemstone>, <thermalfoundation:material:327>, <aether_legacy:zanite_gemstone>], 
		[<thermalfoundation:material:327>, <thermalfoundation:material:1027>, <thermalfoundation:material:327>], 
		[<aether_legacy:zanite_gemstone>, <thermalfoundation:material:327>, <aether_legacy:zanite_gemstone>]
	]);

	recipes.remove(<thermalexpansion:augment:720>);
	recipes.addShaped("ia_te_gem_power1", <thermalexpansion:augment:720>, [
		[null, <ore:plateEmerald>, null], 
		[<ore:platePlatinum>, <thermalfoundation:material:515>, <ore:platePlatinum>], 
		[null, <ore:plateEmerald>, null]
	]);
	recipes.addShaped("ia_te_gem_power2", <thermalexpansion:augment:720>, [
		[<ore:coinPlatinum>, <ore:plateEmerald>, <ore:coinPlatinum>], 
		[<ore:coinPlatinum>, <thermalfoundation:material:515>, <ore:coinPlatinum>], 
		[<ore:coinPlatinum>, <ore:plateEmerald>, <ore:coinPlatinum>]
	]);

	
	recipes.remove(<thermalexpansion:augment:256>);
	recipes.addShaped("ia_te_food_aug", <thermalexpansion:augment:256>, [
		[<prodigytech:meat_patty>, <thermalfoundation:material:322>, <prodigytech:meat_patty>], 
		[<thermalfoundation:material:322>, <prodigytech:food_enricher>, <thermalfoundation:material:322>], 
		[<prodigytech:meat_patty>, <thermalfoundation:material:322>, <prodigytech:meat_patty>]
	]);


	recipes.remove(<thermalexpansion:augment:448>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:augment:448>, [
		[<contenttweaker:bedrockium_alloy_plate>, <thermalfoundation:material:512>, <contenttweaker:acid_resistant_steel_gear>, <thermalfoundation:material:512>, <contenttweaker:bedrockium_alloy_plate>], 
		[<thermalfoundation:material:512>, <contenttweaker:nether_star_dust>, <extendedcrafting:singularity_custom:28>, <contenttweaker:nether_star_dust>, <thermalfoundation:material:512>], 
		[<contenttweaker:acid_resistant_steel_gear>, <extendedcrafting:singularity:4>, <thermalexpansion:machine:12>, <extendedcrafting:singularity:3>, <contenttweaker:acid_resistant_steel_gear>], 
		[<thermalfoundation:material:512>, <contenttweaker:nether_star_dust>, <contenttweaker:mana_dust_singularity>, <contenttweaker:nether_star_dust>, <thermalfoundation:material:512>], 
		[<contenttweaker:bedrockium_alloy_plate>, <thermalfoundation:material:512>, <contenttweaker:acid_resistant_steel_gear>, <thermalfoundation:material:512>, <contenttweaker:bedrockium_alloy_plate>]
	]);
}

{//dynamos
	val steam_dynamo = <thermalexpansion:dynamo>.withTag({RSControl: 0 as byte, Facing: 1 as byte, Energy: 0, Level: 0 as byte});
	recipes.remove(steam_dynamo);
	recipes.addShaped("ia_steam_dynamo", steam_dynamo, [
		[null, <ore:gearRedstoneAlloy>, null], 
		[<contenttweaker:firebrick_block>, <thermalexpansion:frame>, <contenttweaker:firebrick_block>], 
		[<contenttweaker:electric_manyullyn_plate>, <thermalfoundation:material:514>, <contenttweaker:electric_manyullyn_plate>]
	]);
	val magma_dynamo = <thermalexpansion:dynamo:1>.withTag({RSControl: 0 as byte, Facing: 1 as byte, Energy: 0, Level: 0 as byte});
	recipes.remove(magma_dynamo);
	recipes.addShaped("ia_magma_dynamo", magma_dynamo, [
		[null, <ore:gearRedstoneAlloy>, null], 
		[<contenttweaker:thermal_plate>, <thermalexpansion:frame>, <contenttweaker:thermal_plate>], 
		[<contenttweaker:electric_manyullyn_plate>, <thermalfoundation:material:514>, <contenttweaker:electric_manyullyn_plate>]
	]);
	val l_fuel_dynamo = <thermalexpansion:dynamo:2>.withTag({RSControl: 0 as byte, Facing: 1 as byte, Energy: 0, Level: 0 as byte});
	recipes.remove(l_fuel_dynamo);
	recipes.addShaped("ia_l_fuel_dynamo", l_fuel_dynamo, [
		[null, <ore:gearRedstoneAlloy>, null], 
		[<immersiveengineering:stone_decoration>, <thermalexpansion:frame>, <immersiveengineering:stone_decoration>], 
		[<contenttweaker:electric_manyullyn_plate>, <thermalfoundation:material:514>, <contenttweaker:electric_manyullyn_plate>]
	]);
	val reaction_dynamo = <thermalexpansion:dynamo:3>.withTag({RSControl: 0 as byte, Facing: 1 as byte, Energy: 0, Level: 0 as byte});
	recipes.remove(reaction_dynamo);
	recipes.addShaped("ia_reaction_dynamo", reaction_dynamo, [
		[null, <ore:gearRedstoneAlloy>, null], 
		[<ore:dustMana>, <thermalexpansion:frame>, <ore:dustMana>], 
		[<contenttweaker:electric_manyullyn_plate>, <thermalfoundation:material:514>, <contenttweaker:electric_manyullyn_plate>]
	]);
	val en_dynamo = <thermalexpansion:dynamo:4>.withTag({RSControl: 0 as byte, Facing: 1 as byte, Energy: 0, Level: 0 as byte});
	recipes.remove(en_dynamo);
	recipes.addShaped("ia_en_dynamo", en_dynamo, [
		[null, <ore:gearRedstoneAlloy>, null], 
		[<thermalfoundation:material:514>, <thermalexpansion:frame>, <thermalfoundation:material:514>], 
		[<contenttweaker:electric_manyullyn_plate>, <thermalfoundation:material:514>, <contenttweaker:electric_manyullyn_plate>]
	]);
	val numismatic_dynamo = <thermalexpansion:dynamo:5>.withTag({RSControl: 0 as byte, Facing: 1 as byte, Energy: 0, Level: 0 as byte});
	recipes.remove(numismatic_dynamo);
	recipes.addShaped("ia_numismatic_dynamo", numismatic_dynamo, [
		[null, <ore:gearRedstoneAlloy>, null], 
		[<ore:gearPlatinum>, <thermalexpansion:frame>, <ore:gearPlatinum>], 
		[<contenttweaker:electric_manyullyn_plate>, <thermalfoundation:material:514>, <contenttweaker:electric_manyullyn_plate>]
	]);
}

{//tools
	
	

	recipes.remove(<thermalexpansion:satchel:100>);
	recipes.addShaped("ia_te_void_satchel", <thermalexpansion:satchel:100>, [
		[null, <contenttweaker:gravel_wool>, null], 
		[<contenttweaker:gravel_wool>, <thermalexpansion:satchel>, <contenttweaker:gravel_wool>], 
		[null, <fluid:lava> * 1000, null]
	]);
}

//slag
<thermalfoundation:material:864>.addTooltip("Can be obtained from flint and pereskia bulb.");
InductionSmelter.addRecipe(<thermalfoundation:material:864> * 4, <minecraft:flint> * 3, <roots:pereskia_bulb>, 1500, <thermalfoundation:material:864>, 50);


Transposer.addFillRecipe(<thermalfoundation:material:865>, <thermalfoundation:material:864>, <liquid:dirt> * 576, 10000);
mods.tconstruct.Casting.addTableRecipe(
	<thermalfoundation:material:865>, <thermalfoundation:material:864>, 
	<liquid:dirt>, 576, true, 20*20
);
Transposer.addFillRecipe(<thermalfoundation:material:865>, <immersiveengineering:material:7>, <liquid:dirt> * 576, 10000);
mods.tconstruct.Casting.addTableRecipe(
	<thermalfoundation:material:865>, <immersiveengineering:material:7>, 
	<liquid:dirt>, 576, true, 20*20
);




//caramel
Refinery.addRecipe(<liquid:syrup> * 750, <thermalfoundation:material:816> % 50, <liquid:sap> * 500, 1500);

Transposer.addFillRecipe(<harvestcraft:caramelitem>, <minecraft:sugar> * 2, <liquid:syrup> * 500, 500);
Transposer.addFillRecipe(<harvestcraft:caramelitem> * 2, <erebus:materials:19>, <liquid:syrup> * 500, 500);

//chocolate
Pulverizer.addRecipe(<harvestcraft:cocoapowderitem>, <minecraft:dye:3>, 1000, <harvestcraft:cocoapowderitem>, 20);
scripts.helper.addFluidMixerRecipe(<liquid:chocolate> * 500,
	<liquid:milk> * 1000,
	<liquid:beetle_juice> * 125,
	<harvestcraft:cocoapowderitem> * 4, 
	64, 80
);
Transposer.addFillRecipe(<actuallyadditions:item_food:9>, <minecraft:sugar>, <liquid:chocolate> * 250, 1000);
Transposer.addFillRecipe(<actuallyadditions:item_food:9> * 2, <prodigytech:sugar_cube>, <liquid:chocolate> * 250, 1000);

InductionSmelter.addRecipe(
	<harvestcraft:chocolatebaritem> * 3,
	<actuallyadditions:item_food:9> * 3, <harvestcraft:butteritem>, 1000
);
<harvestcraft:chocolatebaritem>.addTooltip("Made with a secret ingredient");




//mithril glass
recipes.addShaped("ia_mithril_glass", <thermalfoundation:glass:8>, [
	[<thermalfoundation:coin:72>, <thermalfoundation:glass:3>, <thermalfoundation:coin:72>], 
	[<atum:crystal_glass>, <extrautils2:ineffableglass:2>, <atum:crystal_glass>], 
	[<thermalfoundation:coin:72>, <thermalfoundation:glass:3>, <thermalfoundation:coin:72>]
]);



//centifuges
Centrifuge.addRecipe([<thermalfoundation:material:66> % 75, <contenttweaker:soot> % 5], <mekanism:dirtydust:5>, null, 2000);
Centrifuge.addRecipe([<minecraft:redstone> % 75, <contenttweaker:soot> % 25], <deepmoblearning:soot_covered_redstone>, null, 2000);
//Centrifuge.addRecipe([<thermalfoundation:material:66> % 75], <mekanism:dirtydust:5>, null, 2000);
Centrifuge.addRecipe([<thermalfoundation:material:768> % 50, <enderio:item_material:20> % 10, <thermalfoundation:material:770> % 30], <contenttweaker:soot>, null, 2000);

Centrifuge.removeRecipe(<thermalfoundation:material:1024>);
Centrifuge.removeRecipe(<thermalfoundation:material:1025>);
Centrifuge.removeRecipe(<thermalfoundation:material:1026>);
Centrifuge.removeRecipe(<thermalfoundation:material:1027>);

//melting
Crucible.addRecipe(<liquid:clay> * 144, <minecraft:clay_ball>, 2000);
Crucible.addRecipe(<liquid:clay> * 576, <minecraft:clay>, 5000);

Crucible.addRecipe(<liquid:dirt> * 144, <minecraft:dirt>, 1500);
Crucible.addRecipe(<liquid:dirt> * 1296, <extrautils2:compresseddirt>, 5000);

//sawing
Sawmill.addRecipe(<thermalfoundation:material:816>, <harvestcraft:grainbaititem> * 6, 2000);
Sawmill.addRecipe(<thermalfoundation:material:816>, <harvestcraft:veggiebaititem> * 6, 2000);
Sawmill.addRecipe(<thermalfoundation:material:816>, <harvestcraft:fruitbaititem> * 6, 2000);


{//arboreal hints
	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<minecraft:sapling> | <minecraft:sapling:5>,
			<natura:overworld_sapling> | <natura:overworld_sapling2:3> | <biomesoplenty:sapling_1:1> | <biomesoplenty:sapling_1:2> | <biomesoplenty:sapling_1:6>
		], [
			<forge:bucketfilled>.withTag({FluidName: "sap", Amount: 1000})
		], [
			<liquid:sap>
		]
	);
	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<minecraft:sapling:2> | <minecraft:sapling:1> | <minecraft:sapling:3> | <minecraft:sapling:4>,
			<natura:overworld_sapling:3> | <natura:overworld_sapling:1> | <natura:overworld_sapling2:2> | <natura:overworld_sapling2:1> | <natura:overworld_sapling2>
		], [
			<forge:bucketfilled>.withTag({FluidName: "resin", Amount: 1000})
		], [
			<liquid:resin>
		]
	);
	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<biomesoplenty:sapling_2> | <biomesoplenty:sapling_2:5> | <biomesoplenty:sapling_2:6> | <biomesoplenty:sapling_2:7>,
			<biomesoplenty:sapling_0:3> | <biomesoplenty:sapling_0:6> | <biomesoplenty:sapling_0:4> | <biomesoplenty:sapling_2:3> | <biomesoplenty:sapling_2:4>
		], [
			<forge:bucketfilled>.withTag({FluidName: "resin", Amount: 1000})
		], [
			<liquid:resin>
		]
	);

	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<natura:nether_sapling> | <natura:nether_sapling:1> | <natura:nether_sapling:2>
		], [
			<minecraft:lava_bucket>
		], [
			<liquid:lava>
		]
	);
	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<integrateddynamics:menril_sapling>
		], [
			<forge:bucketfilled>.withTag({FluidName: "menrilresin", Amount: 1000})
		], [
			<liquid:menrilresin>
		]
	);

	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<natura:overworld_sapling:2>
		], [
			<forge:bucketfilled>.withTag({FluidName: "amaranth_juice", Amount: 1000})
		], [
			<liquid:amaranth_juice>
		]
	);

	scripts.jei.addJEIhint(
		[], [],
		[
			<thermalexpansion:device:3>,
			<tconstruct:slime_sapling>
		], [
			<forge:bucketfilled>.withTag({FluidName: "blueslime", Amount: 1000})
		], [
			<liquid:blueslime>
		]
	);




	scripts.jei.addJEIhint(
		[
			<ore:dustWood>,
			<thermalfoundation:fertilizer> * 2,
			<thermalfoundation:fertilizer:1> * 3,
			<thermalfoundation:fertilizer:2> * 4,
			<minecraft:dye:15> * 2,
			<actuallyadditions:item_fertilizer> * 4
		], [],
		[], [
			<thermalexpansion:device:3>
		]
	);
	scripts.jei.addJEIhint(
		[
			<industrialforegoing:fertilizer> * 3,
			<atum:fertile_soil_pile> * 3,
			<botania:fertilizer> * 5,
			<alchemistry:fertilizer> * 12,
			<mysticalagriculture:fertilized_essence> * 50,
			<botania:overgrowthseed> * 100
		], [],
		[], [
			<thermalexpansion:device:3>
		]
	);
	scripts.jei.addJEIhint(
		[
			<contenttweaker:fertilizer1> * 2,
			<contenttweaker:fertilizer2> * 4,
			<contenttweaker:fertilizer3> * 6,
			<contenttweaker:fertilizer4> * 10,
			<contenttweaker:fertilizer5> * 25,
			<contenttweaker:fertilizer6> * 50
		], [],
		[], [
			<thermalexpansion:device:3>
		]
	);
	scripts.jei.addJEIhint(
		[
			<contenttweaker:fertilizer7> * 100
		], [],
		[], [
			<thermalexpansion:device:3>
		]
	);
}