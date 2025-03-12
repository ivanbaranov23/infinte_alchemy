

recipes.remove(<deepmoblearning:soot_covered_plate>);
mods.enderio.AlloySmelter.addRecipe(<deepmoblearning:soot_covered_plate>, 
    [<moreplates:refined_obsidian_plate> * 4, <contenttweaker:soot> * 12, <contenttweaker:bedrockium_alloy_plate>], 
    8000
);

recipes.remove(<deepmoblearning:polymer_clay>);
mods.mekanism.reaction.addRecipe(
    <contenttweaker:elastic_clay>, <liquid:refined_pheromones> * 100, <gas:polyethylene> * 50, 
    <deepmoblearning:polymer_clay> * 8, <gas:waste_gas> * 10, 50000, 60
);

recipes.remove(<deepmoblearning:data_model_blank>);
recipes.addShaped("ia_data_model_blank", <deepmoblearning:data_model_blank>, [
	[<thermalfoundation:material:328>, <deepmoblearning:soot_covered_plate>, <thermalfoundation:material:328>], 
	[<immersiveengineering:wirecoil:5>, <quantumflux:craftingpiece:5>, <aether_legacy:golden_ring>], 
	[<thermalfoundation:material:328>, <deepmoblearning:soot_covered_plate>, <thermalfoundation:material:328>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<deepmoblearning:data_model_blank>],
	[
		<quantumflux:craftingpiece:5>, 
		<aether_legacy:golden_ring>,
		<deepmoblearning:soot_covered_plate>,
		<thermalfoundation:material:328> * 2
	], null,
	20, 1000
);
{//models
	/*recipes.remove(<deepmoblearning:data_model_zombie>);
	recipes.addShaped("ia_data_model_zombie", <deepmoblearning:data_model_zombie>.withTag({tier: 1, totalKillCount: 6, dataCount: 0}), [
		[null, <xreliquary:mob_ingredient:6>, null], 
		[<xreliquary:mob_ingredient:6>, <deepmoblearning:data_model_blank>, <xreliquary:mob_ingredient:6>], 
		[null, <xreliquary:mob_ingredient:6>, null]
	]);*/
	recipes.remove(<deepmoblearning:data_model_wither>);
	recipes.addShaped("ia_data_model_wither", <deepmoblearning:data_model_wither>, [
		[<contenttweaker:star_polymer>, <contenttweaker:bloodhunter_target_wither>, <contenttweaker:star_polymer>], 
		[<contenttweaker:star_polymer>, <contenttweaker:cursed_star>, <contenttweaker:star_polymer>], 
		[<contenttweaker:star_polymer>, <deepmoblearning:data_model_blank>, <contenttweaker:star_polymer>]
	]);

	recipes.remove(<deepmoblearning:data_model_dragon>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <deepmoblearning:data_model_dragon>, [
		[<extendedcrafting:singularity_custom:31>, <moreplates:draconium_plate>, <deepmoblearning:data_model_blank>, <moreplates:draconium_plate>, <extendedcrafting:singularity_custom:31>], 
		[<moreplates:draconium_plate>, <botania:manaresource:9>, <minecraft:skull:5>, <botania:manaresource:9>, <moreplates:draconium_plate>], 
		[<deepmoblearning:data_model_blank>, <contenttweaker:draco_lizard_egg>, <extendedcrafting:frame>, <contenttweaker:draco_lizard_egg>, <deepmoblearning:data_model_blank>], 
		[<moreplates:draconium_plate>, <botania:manaresource:9>, <extrautils2:passivegenerator:8>, <botania:manaresource:9>, <moreplates:draconium_plate>], 
		[<extendedcrafting:singularity_custom:31>, <moreplates:draconium_plate>, <deepmoblearning:data_model_blank>, <moreplates:draconium_plate>, <extendedcrafting:singularity_custom:31>]
	]);

	
}

recipes.remove(<deepmoblearning:trial_key>);
recipes.addShaped("ia_trial_key", <deepmoblearning:trial_key>, [
	[<extrautils2:suncrystal>, <moreplates:platinum_stick>]
]);

{//blocks
	recipes.remove(<deepmoblearning:trial_keystone>);
	/*recipes.addShaped("ia_trial_keystone", <deepmoblearning:trial_keystone>, [
		[null, <deepmoblearning:trial_key>, null], 
		[<deepmoblearning:soot_covered_plate>, <moreplates:dark_steel_plate>, <deepmoblearning:soot_covered_plate>], 
		[<deepmoblearning:soot_covered_plate>, <deepmoblearning:machine_casing>, <deepmoblearning:soot_covered_plate>]
	]);*/
	recipes.addShaped("ia_trial_keystone", <deepmoblearning:trial_keystone>, [
		[<roots:runed_obsidian>, <deepmoblearning:trial_key>, <roots:runed_obsidian>], 
		[<roots:runed_obsidian>, <thermalexpansion:frame:64>, <roots:runed_obsidian>]
	]);

	recipes.remove(<deepmoblearning:simulation_chamber>);
	recipes.addShaped("ia_simulation_chamber", <deepmoblearning:simulation_chamber>, [
		[<deepmoblearning:soot_covered_plate>, <deepmoblearning:glitch_infused_ingot>, <deepmoblearning:soot_covered_plate>], 
		[<deepmoblearning:glitch_infused_ingot>, <deepmoblearning:machine_casing>, <deepmoblearning:glitch_infused_ingot>], 
		[<deepmoblearning:soot_covered_plate>, <deepmoblearning:glitch_infused_ingot>, <deepmoblearning:soot_covered_plate>]
	]);
	recipes.remove(<deepmoblearning:extraction_chamber>);
	recipes.addShaped("ia_extraction_chamber", <deepmoblearning:extraction_chamber>, [
		[<deepmoblearning:soot_covered_plate>, <deepmoblearning:pristine_matter_zombie>, <deepmoblearning:soot_covered_plate>], 
		[<moreplates:energetic_alloy_plate>, <deepmoblearning:machine_casing>, <moreplates:energetic_alloy_plate>], 
		[<deepmoblearning:soot_covered_plate>, <deepmoblearning:pristine_matter_zombie>, <deepmoblearning:soot_covered_plate>]
	]);
}


scripts.content_machines.addBioAssemblerRecipe(
    [<contenttweaker:blood_matter> * 4], null, 
    [
		<deepmoblearning:living_matter_hellish> * 12,
		<deepmoblearning:living_matter_extraterrestrial> * 12,
		<deepmoblearning:living_matter_atum> * 12,
		<deepmoblearning:living_matter_erebus> * 12,
		<deepmoblearning:living_matter_aether> * 12,
		<deepmoblearning:living_matter_twilight> * 12
	], 
	[
		<liquid:bloodbronze> * 144
	], 
	<contenttweaker:research_magic2>,
    20, 20
);