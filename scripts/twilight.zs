import mods.modularmachinery.RecipeBuilder;


recipes.addShapeless("ia_early_map_focus", <twilightforest:magic_map_focus>, [<contenttweaker:gastight_steel_rod>, <erebus:materials:38>, <ore:dustMana>]);

recipes.remove(<twilightforest:magic_map_empty>);
recipes.addShaped("ia_magic_map_empty", <twilightforest:magic_map_empty>, [
	[<ore:paper>, <mekanism:polyethene:2>, <ore:paper>], 
	[<mekanism:polyethene:2>, <twilightforest:magic_map_focus>, <mekanism:polyethene:2>], 
	[<ore:paper>, <mekanism:polyethene:2>, <ore:paper>]
]);

recipes.remove(<twilightforest:carminite>);
recipes.addShapeless("ia_carminite_uncompress", <twilightforest:carminite> * 9,
    [<twilightforest:block_storage:4>]
);

//knightmetal furnace -> alloy in metalworks
furnace.remove(<twilightforest:knightmetal_ingot>);

//steeleaf
mods.thermalexpansion.Transposer.addFillRecipe(
    <contenttweaker:steeleaf_mush>, 
    <twilightforest:steeleaf_ingot>, <liquid:sulfuricacid> * 250, 
    2000
);
mods.thermalexpansion.Transposer.addFillRecipe(
    <contenttweaker:steeleaf_mush>, 
    <twilightforest:steeleaf_ingot>, <liquid:formic_acid> * 1500, 
    6000
);

//ironwood
recipes.remove(<twilightforest:ironwood_raw>);
scripts.helper.addFluidAlloyerRecipe(
	<twilightforest:ironwood_raw>, 
	<contenttweaker:gold_crystal> * 4, <twilightforest:steeleaf_ingot> * 2, 
	<liquid:tree_oil> * 2000, 
	384, 40
);
scripts.helper.addFluidAlloyerRecipe(
	<twilightforest:ironwood_raw>, 
	<contenttweaker:gold_crystal> * 4, <contenttweaker:steeleaf_mush>, 
	<liquid:tree_oil> * 2000, 
	384, 40
);
scripts.helper.addFluidAlloyerRecipe(
	<twilightforest:ironwood_raw> * 3, 
	<contenttweaker:gold_crystal> * 4, <twilightforest:liveroot>, 
	<liquid:tree_oil> * 2000, 
	384, 40
);


//fiery
recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_iron_boots");
recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_iron_helmet");
recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_iron_chestplate");
recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_iron_leggings");

recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_iron_pickaxe");
recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_iron_sword");
recipes.removeByRecipeName("twilightforest:materials/fiery_conversion/fiery_ingot");
recipes.addShapeless("ia_fiery_ingot", <twilightforest:fiery_ingot> * 2, [<twilightforest:fiery_blood>, <ore:ingotManyullyn>, <ore:ingotOsgloglas>, <tconstruct:ingots:1>]);
scripts.content_machines.addBioAssemblerRecipe(
    [<twilightforest:fiery_ingot> * 5], null, 
    [
        <twilightforest:fiery_blood>,
		<tconstruct:ingots:1>,
		<tconstruct:ingots:2>
    ], [
        <liquid:osgloglas> * 144
    ], <contenttweaker:research_chemistry3>,
    20, 1000
);


//carminite things
recipes.remove(<twilightforest:tower_device:12>);
recipes.addShaped("ia_carminite_engine", <twilightforest:tower_device:12>, [
	[<appliedenergistics2:smooth_sky_stone_block>, <ore:gearRedstoneAlloy>, <appliedenergistics2:smooth_sky_stone_block>], 
	[<ore:gearRedstoneAlloy>, <twilightforest:block_storage:4>, <ore:gearRedstoneAlloy>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <ore:gearRedstoneAlloy>, <appliedenergistics2:smooth_sky_stone_block>]
]);

mods.mekanism.GasConversion.register(<twilightforest:carminite>, <gas:carmin> * 200);
mods.mekanism.chemical.crystallizer.addRecipe(<gas:carmin> * 250, <twilightforest:carminite>);

mods.mekanism.compressor.addRecipe(<thermalfoundation:material:166>, <gas:carmin>, <contenttweaker:carminium_ingot>);
mods.mekanism.compressor.addRecipe(<taiga:tritonite_ingot>, <gas:carmin>, <contenttweaker:carminium_ingot>);
mods.mekanism.compressor.addRecipe(<taiga:violium_ingot>, <gas:carmin>, <contenttweaker:carminium_ingot> * 3);

mods.jei.JEI.hideCategory("jei_uncrafting");