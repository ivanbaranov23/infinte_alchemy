import crafttweaker.item.IItemStack;

import mods.industrialforegoing.SludgeRefiner;
//SludgeRefiner.add(IItemStack output, int ItemWeight);

import mods.industrialforegoing.ProteinReactor;



recipes.remove(<teslacorelib:machine_case>);
recipes.addShaped("ia_machine_frame4_5", <teslacorelib:machine_case>, [
	[<mekanism:polyethene:2>, <ore:circuitElite>, <mekanism:polyethene:2>], 
	[<ore:plateOsgloglas>, <mekanism:basicblock:8>, <ore:plateOsgloglas>], 
	[<mekanism:polyethene:2>, <ore:gearPigiron>, <mekanism:polyethene:2>]
]);


recipes.remove(<industrialforegoing:dryrubber>);
recipes.addShaped("ia_dry_rubber", <industrialforegoing:dryrubber>, [
	[<industrialforegoing:tinydryrubber>, <industrialforegoing:tinydryrubber>, <industrialforegoing:tinydryrubber>], 
	[<ore:pelletHDPE>, <thermalfoundation:material:832>, <ore:pelletHDPE>], 
	[<industrialforegoing:tinydryrubber>, <mekanism:biofuel>, <industrialforegoing:tinydryrubber>]
]);
furnace.remove(<industrialforegoing:plastic>);
mods.enderio.AlloySmelter.addRecipe(<industrialforegoing:plastic> * 3, 
    [
        <industrialforegoing:dryrubber> * 4,
		<contenttweaker:eliamondin>,
		<twilightforest:ironwood_ingot> * 2
    ]
);

//<ore:slimeball>.remove(<industrialforegoing:pink_slime>);

{//machines
	//plastic
	recipes.remove(<industrialforegoing:tree_fluid_extractor>);
	recipes.addShaped("ia_tree_fluid_extractor", <industrialforegoing:tree_fluid_extractor>, [
		[<ore:plateIronwood>, <thermalexpansion:device:3>, <ore:plateIronwood>], 
		[<ore:ingotZorrasteel>, <teslacorelib:machine_case>, <ore:ingotZorrasteel>], 
		[<ore:plateIronwood>, <contenttweaker:menril_steel_plate>, <ore:plateIronwood>]
	]);
	recipes.remove(<industrialforegoing:latex_processing_unit>);
	recipes.addShaped("ia_latex_processing_unit", <industrialforegoing:latex_processing_unit>, [
		[<ore:ingotZorrasteel>, <ore:circuitAdvanced>, <ore:ingotZorrasteel>], 
		[<ore:stickHDPE>, <teslacorelib:machine_case>, <ore:stickHDPE>], 
		[<ore:ingotZorrasteel>, <ore:circuitAdvanced>, <ore:ingotZorrasteel>]
	]);

	//other
	recipes.remove(<industrialforegoing:fluiddictionary_converter>);
	recipes.addShaped("ia_fluiddictionary_converter", <industrialforegoing:fluiddictionary_converter>, [
		[<contenttweaker:watertight_steel_plate>, <thermalfoundation:material:832>, <contenttweaker:watertight_steel_plate>], 
		[<minecraft:bucket>, <thermalexpansion:frame:64>, <minecraft:bucket>], 
		[<contenttweaker:watertight_steel_plate>, <thermalfoundation:material:832>, <contenttweaker:watertight_steel_plate>]
	]);
	recipes.remove(<industrialforegoing:fluid_crafter>);
	recipes.addShaped("ia_fluid_crafter", <industrialforegoing:fluid_crafter>, [
		[<ore:itemRubber>, <thermalexpansion:augment:433>, <ore:itemRubber>], 
		[<contenttweaker:watertight_steel_gear>, <teslacorelib:machine_case>, <contenttweaker:watertight_steel_gear>], 
		[<ore:itemRubber>, <avaritia:compressed_crafting_table>, <ore:itemRubber>]
	]);
	recipes.remove(<industrialforegoing:lava_fabricator>);
	recipes.addShaped("ia_lava_fabricator", <industrialforegoing:lava_fabricator>, [
		[<ore:itemRubber>, <atum:heart_of_ra>, <ore:itemRubber>], 
		[<xreliquary:mob_ingredient:7>, <teslacorelib:machine_case>, <xreliquary:mob_ingredient:7>], 
		[<ore:itemRubber>, <atum:efreet_heart>, <ore:itemRubber>]
	]);
	recipes.remove(<industrialforegoing:froster>);
	recipes.addShaped("ia_if_froster", <industrialforegoing:froster>, [
		[<industrialforegoing:plastic>, <thermalexpansion:machine:14>, <industrialforegoing:plastic>], 
		[<xreliquary:mob_ingredient:10>, <teslacorelib:machine_case>, <xreliquary:mob_ingredient:10>], 
		[<industrialforegoing:plastic>, <minecraft:packed_ice>, <industrialforegoing:plastic>]
	]);
	recipes.remove(<industrialforegoing:material_stonework_factory>);
	recipes.addShaped("ia_material_stonework_factory", <industrialforegoing:material_stonework_factory>, [
		[<industrialforegoing:pink_slime>, <thermalexpansion:machine:15>, <industrialforegoing:pink_slime>], 
		[<morefurnaces:furnaceblock:2>, <teslacorelib:machine_case>, <enderio:item_dark_steel_pickaxe>], 
		[<industrialforegoing:pink_slime>, <excompressum:compressed_hammer_diamond>, <industrialforegoing:pink_slime>]
	]);

	//animals
	recipes.remove(<industrialforegoing:spores_recreator>);
	recipes.addShaped("ia_spores_recreator", <industrialforegoing:spores_recreator>, [
		[<ore:itemRubber>, <contenttweaker:mushroomite_rod>, <ore:itemRubber>], 
		[<contenttweaker:mushroomite_rod>, <teslacorelib:machine_case>, <contenttweaker:mushroomite_rod>], 
		[<ore:itemRubber>, <contenttweaker:mushroomite_rod>, <ore:itemRubber>]
	]);

	recipes.remove(<industrialforegoing:protein_reactor>);
	recipes.addShaped("ia_protein_reactor", <industrialforegoing:protein_reactor>, [
		[<industrialforegoing:plastic>, <integrateddynamics:squeezer>, <industrialforegoing:plastic>], 
		[<prodigytech:meat_patty>, <teslacorelib:machine_case>, <prodigytech:meat_patty>], 
		[<industrialforegoing:pink_slime>, <moreplates:pig_iron_gear>, <industrialforegoing:pink_slime>]
	]);

	recipes.remove(<industrialforegoing:animal_independence_selector>);
	recipes.addShaped("ia_animal_independence_selector", <industrialforegoing:animal_independence_selector>, [
		[<industrialforegoing:plastic>, <moreplates:pig_iron_gear>, <industrialforegoing:plastic>], 
		[<darkutils:filter:6>, <teslacorelib:machine_case>, <darkutils:filter:6>], 
		[<industrialforegoing:plastic>, <moreplates:pig_iron_gear>, <industrialforegoing:plastic>]
	]);
	recipes.remove(<industrialforegoing:animal_growth_increaser>);
	recipes.addShaped("ia_animal_growth_increaser", <industrialforegoing:animal_growth_increaser>, [
		[<industrialforegoing:plastic>, <mod_lavacow:fissionpotion>, <industrialforegoing:plastic>], 
		[<darkutils:filter:6>, <teslacorelib:machine_case>, <darkutils:filter:6>], 
		[<industrialforegoing:plastic>, <moreplates:pig_iron_gear>, <industrialforegoing:plastic>]
	]);
	recipes.remove(<industrialforegoing:animal_stock_increaser>);
	recipes.addShaped("ia_animal_stock_increaser", <industrialforegoing:animal_stock_increaser>, [
		[<industrialforegoing:plastic>, <farmingforblockheads:feeding_trough>, <industrialforegoing:plastic>], 
		[<industrialforegoing:plastic>, <teslacorelib:machine_case>, <industrialforegoing:plastic>], 
		[<industrialforegoing:plastic>, <moreplates:pig_iron_gear>, <industrialforegoing:plastic>]
	]);

	recipes.remove(<industrialforegoing:animal_resource_harvester>);
	recipes.addShaped("ia_animal_resource_harvester", <industrialforegoing:animal_resource_harvester>, [
		[<ore:itemRubber>, <ore:platePigiron>, <ore:itemRubber>], 
		[<farmingforblockheads:feeding_trough>, <teslacorelib:machine_case>, <engineersdecor:small_milking_machine>], 
		[<ore:itemRubber>, <ore:platePigiron>, <ore:itemRubber>]
	]);
	recipes.remove(<industrialforegoing:animal_byproduct_recolector>);
	recipes.addShaped("ia_animal_byproduct_recolector", <industrialforegoing:animal_byproduct_recolector>, [
		[<contenttweaker:soap>, <ore:foodStock>, <contenttweaker:soap>], 
		[<tconstruct:materials:1>, <teslacorelib:machine_case>, <tconstruct:materials:1>], 
		[<ore:itemRubber>, <immersiveengineering:metal_device0:5>, <ore:itemRubber>]
	]);
	recipes.remove(<industrialforegoing:sewage_composter_solidifier>);
	recipes.addShaped("ia_sewage_composter_solidifier", <industrialforegoing:sewage_composter_solidifier>, [
		[<ore:itemRubber>, <alchemistry:evaporator>, <ore:itemRubber>], 
		[<tconstruct:materials:1>, <teslacorelib:machine_case>, <tconstruct:materials:1>], 
		[<ore:itemRubber>, <actuallyadditions:block_compost>, <ore:itemRubber>]
	]);

	//mobs
	recipes.remove(<industrialforegoing:mob_slaughter_factory>);
	recipes.addShaped("ia_mob_slaughter_factory", <industrialforegoing:mob_slaughter_factory>, [
		[<ore:itemRubber>, <ore:platePigiron>, <ore:itemRubber>], 
		[<betternether:cincinnasite_axe_diamond>.anyDamage().noReturn(), <teslacorelib:machine_case>, <twilightforest:block_and_chain>.anyDamage().noReturn()], 
		[<ore:itemRubber>, <ore:platePigiron>, <ore:itemRubber>]
	]);
	recipes.remove(<industrialforegoing:mob_relocator>);
	recipes.addShaped("ia_mob_crusher", <industrialforegoing:mob_relocator>, [
		[<tconevo:material:1>, <mob_grinding_utils:absorption_hopper>, <tconevo:material:1>], 
		[<mob_grinding_utils:saw>, <teslacorelib:machine_case>, <mob_grinding_utils:saw>], 
		[<tconevo:material:1>, <mob_grinding_utils:absorption_hopper>, <tconevo:material:1>]
	]);

	//second part
	recipes.remove(<industrialforegoing:ore_sieve>);
	recipes.addShaped("ia_fluid_ore_sieve", <industrialforegoing:ore_sieve>, [
		[<ore:slimecrystalPink>, <tconstruct:casting>, <ore:slimecrystalPink>], 
		[<ore:stickMithril>, <ore:itemEndSteelMachineChassi>, <ore:stickMithril>], 
		[<ore:slimecrystalPink>, <ore:gearDark>, <ore:slimecrystalPink>]
	]);

	//plants
	recipes.remove(<industrialforegoing:crop_recolector>);
	recipes.addShaped("ia_plant_gatherer", <industrialforegoing:crop_recolector>, [
		[<ore:plateCrystallinePinkSlime>, <teslacorelib:machine_case>, <ore:plateCrystallinePinkSlime>], 
		[<twilightforest:ironwood_hoe>, <enderio:block_farm_station>, <twilightforest:ironwood_hoe>], 
		[<ore:plateCrystallinePinkSlime>, <teslacorelib:machine_case>, <ore:plateCrystallinePinkSlime>]
	]);
	recipes.remove(<industrialforegoing:crop_enrich_material_injector>);
	recipes.addShaped("ia_crop_enrich_material_injector", <industrialforegoing:crop_enrich_material_injector>, [
		[<industrialforegoing:plastic>, <contenttweaker:fertilizer4>, <industrialforegoing:plastic>], 
		[<contenttweaker:fertilizer4>, <teslacorelib:machine_case>, <contenttweaker:fertilizer4>], 
		[<industrialforegoing:plastic>, <contenttweaker:fertilizer4>, <industrialforegoing:plastic>]
	]);

	recipes.remove(<industrialforegoing:sludge_refiner>);
	recipes.addShaped("ia_sludge_refiner", <industrialforegoing:sludge_refiner>, [
		[<ore:slimeballPink>, <fluiddrawers:tank>, <ore:slimeballPink>], 
		[<mod_lavacow:silky_sludge>, <teslacorelib:machine_case>, <mod_lavacow:silky_sludge>], 
		[<ore:slimeballPink>, <morefurnaces:furnaceblock:1>, <ore:slimeballPink>]
	]);

	recipes.remove(<industrialforegoing:mob_duplicator>);
	recipes.addShaped("ia_mob_duplicator", <industrialforegoing:mob_duplicator>, [
		[<ore:plateCrystallinePinkSlime>, <enderio:block_powered_spawner>, <ore:plateCrystallinePinkSlime>], 
		[<contenttweaker:basic_neuron>, <ore:itemEndSteelMachineChassi>, <contenttweaker:basic_neuron>], 
		[<ore:plateCrystallinePinkSlime>, <enderio:block_powered_spawner>, <ore:plateCrystallinePinkSlime>]
	]);

	recipes.remove(<industrialforegoing:ore_fermenter>);
	recipes.addShaped("ia_ore_fermenter", <industrialforegoing:ore_fermenter>, [
		[<ore:slimecrystalPink>, <actuallyadditions:block_fermenting_barrel>, <ore:slimecrystalPink>], 
		[<contenttweaker:calitunti_ingot>, <ore:itemEndSteelMachineChassi>, <contenttweaker:calitunti_ingot>], 
		[<ore:slimecrystalPink>, <actuallyadditions:block_fermenting_barrel>, <ore:slimecrystalPink>]
	]);

	recipes.remove(<industrialforegoing:ore_washer>);
	recipes.addShaped("ia_if_ore_washer", <industrialforegoing:ore_washer>, [
		[<ore:ingotBloodBronze>, <thermalexpansion:machine:10>, <ore:ingotBloodBronze>], 
		[<mekanism:machineblock2:7>, <ore:itemEndSteelMachineChassi>, <mekanism:machineblock2:7>], 
		[<ore:ingotBloodBronze>, <thermalexpansion:machine:8>, <ore:ingotBloodBronze>]
	]);

	recipes.remove(<industrialforegoing:ore_processor>);//stupid
}

recipes.remove(<industrialforegoing:meat_feeder>);
recipes.addShaped("ia_meat_feeder", <industrialforegoing:meat_feeder>, [
	[<thermalfoundation:material:640>, <industrialforegoing:plastic>, null], 
	[<industrialforegoing:plastic>, <contenttweaker:tank>, <industrialforegoing:plastic>], 
	[null, <industrialforegoing:plastic>, <thermalinnovation:injector>]
]);

{//sludge
	for o in [
		<minecraft:clay_ball>, <minecraft:clay>, <minecraft:dirt>, <minecraft:gravel>, 
		<minecraft:mycelium>, <minecraft:dirt:2>, <minecraft:sand>, <minecraft:sand:1>, 
		<minecraft:soul_sand>] as IItemStack[]
	{
		SludgeRefiner.remove(o);
	}

	SludgeRefiner.add(<minecraft:clay>, 100);
	SludgeRefiner.add(<minecraft:dirt>, 100);
	SludgeRefiner.add(<minecraft:grass>, 100);
	SludgeRefiner.add(<minecraft:mycelium>, 100);
	SludgeRefiner.add(<minecraft:sand>, 100);
	SludgeRefiner.add(<minecraft:sand:1>, 100);
	SludgeRefiner.add(<minecraft:soul_sand>, 100);
	SludgeRefiner.add(<biomesoplenty:white_sand>, 100);
	SludgeRefiner.add(<alchemistry:wet_sand>, 100);
	SludgeRefiner.add(<exnihilocreatio:item_material:3>, 150);

	SludgeRefiner.add(<contenttweaker:bacteria>, 25);
	SludgeRefiner.add(<mod_lavacow:silky_sludge>, 25);
	SludgeRefiner.add(<actuallyadditions:item_worm>, 50);
	SludgeRefiner.add(<projectred-core:resource_item:250>, 10);
	SludgeRefiner.add(<appliedenergistics2:crystal_seed>.withTag({progress: 0}), 50);
	SludgeRefiner.add(<appliedenergistics2:crystal_seed:1200>.withTag({progress: 1200}), 50);

	SludgeRefiner.add(<extrautils2:redorchid>, 5);
	SludgeRefiner.add(<roots:wildwood_sapling>, 5);
	SludgeRefiner.add(<aether_legacy:skyroot_sapling>, 5);

	SludgeRefiner.add(<botania:overgrowthseed>, 1);
}

{//protein
	ProteinReactor.add(<harvestcraft:groundbeefitem>);
	ProteinReactor.add(<harvestcraft:groundchickenitem>);
	ProteinReactor.add(<harvestcraft:groundduckitem>);
	ProteinReactor.add(<harvestcraft:groundfishitem>);
	ProteinReactor.add(<harvestcraft:groundmuttonitem>);
	ProteinReactor.add(<harvestcraft:groundporkitem>);
	ProteinReactor.add(<harvestcraft:groundrabbititem>);
	ProteinReactor.add(<harvestcraft:groundturkeyitem>);
	ProteinReactor.add(<harvestcraft:groundvenisonitem>);
	ProteinReactor.add(<harvestcraft:grubitem>);
	ProteinReactor.add(<primitivemobs:dodo>);
	ProteinReactor.add(<tconstruct:edible>);
	ProteinReactor.add(<twilightforest:raw_venison>);
	ProteinReactor.add(<quark:frog_leg>);
	ProteinReactor.add(<quark:crab_leg>);
	ProteinReactor.add(<erebus:erebus_food>);
	ProteinReactor.add(<erebus:erebus_food:2>);
	ProteinReactor.add(<erebus:erebus_food:4>);
	ProteinReactor.add(<erebus:erebus_food:12>);
	ProteinReactor.add(<mod_lavacow:mimic_claw>);
	ProteinReactor.add(<mod_lavacow:ptera_wing>);
	ProteinReactor.add(<mod_lavacow:ptera_wing:1>);
	ProteinReactor.add(<mod_lavacow:piranha>);
	ProteinReactor.add(<mod_lavacow:cheirolepis>);
	ProteinReactor.add(<mod_lavacow:zombiepiranha_item>);
	ProteinReactor.add(<mysticalworld:venison>);
	ProteinReactor.add(<mysticalworld:raw_squid>);

}

//fertilizer
<ore:dyeBrown>.remove(<industrialforegoing:fertilizer>);
recipes.addShapeless("ia_if_fert_to_brown", <thermalfoundation:dye:3>, [<industrialforegoing:fertilizer>]);

//pink slime
mods.thermalexpansion.Imbuer.addRecipe(<liquid:if.pink_slime> * 1000, <industrialforegoing:pink_slime> * 2, <liquid:purpleslime> * 1000, 8000);
mods.thermalexpansion.Imbuer.addRecipe(<liquid:if.pink_slime> * 1000, <industrialforegoing:pink_slime> * 2, <liquid:blueslime> * 1000, 8000);
scripts.content_machines.addBioAssemblerRecipe(
	[<industrialforegoing:pink_slime> * 4], null,
	[
		<ore:slimecrystal> * 4
	], [
		<liquid:if.pink_slime> * 1000
	], <contenttweaker:flesh_support>,
	5, 10000
);