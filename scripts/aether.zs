import mods.aether_legacy.Freezer;
import mods.aether_legacy.Enchanter;



//portal
recipes.addShaped("ia_aether_dust", <aether_legacy:aether_dirt>, [
	[<contenttweaker:angel_dust>, <contenttweaker:angel_dust>, <contenttweaker:angel_dust>], 
	[<contenttweaker:angel_dust>, <atum:fertile_soil>, <contenttweaker:angel_dust>], 
	[<contenttweaker:angel_dust>, <contenttweaker:angel_dust>, <contenttweaker:angel_dust>]
]);

//rings
recipes.remove(<aether_legacy:zanite_ring>);
recipes.addShaped("ia_zanite_ring", <aether_legacy:zanite_ring>, [
	[<ore:gemZanite>, <ore:plateManyullyn>, <ore:gemZanite>], 
	[<ore:plateManyullyn>, <ore:ring>, <ore:plateManyullyn>], 
	[<ore:gemZanite>, <ore:plateManyullyn>, <ore:gemZanite>]
]);

recipes.remove(<aether_legacy:iron_ring>);
recipes.addShaped("ia_iron_ring", <aether_legacy:iron_ring>, [
	[<ore:gemAmbrosium>, <actuallyadditions:block_crystal_empowered:5>, <ore:gemAmbrosium>], 
	[<actuallyadditions:block_crystal_empowered:5>, <aether_legacy:zanite_ring>, <actuallyadditions:block_crystal_empowered:5>], 
	[<ore:gemAmbrosium>, <actuallyadditions:block_crystal_empowered:5>, <ore:gemAmbrosium>]
]);
recipes.remove(<aether_legacy:golden_ring>);
recipes.addShaped("ia_golden_ring", <aether_legacy:golden_ring>, [
	[<ore:gemAmbrosium>, <contenttweaker:egoold_block>, <ore:gemAmbrosium>], 
	[<contenttweaker:egoold_block>, <aether_legacy:zanite_ring>, <contenttweaker:egoold_block>], 
	[<ore:gemAmbrosium>, <contenttweaker:egoold_block>, <ore:gemAmbrosium>]
]);


//pendant
recipes.remove(<aether_legacy:zanite_pendant>);
recipes.addShaped("ia_zanite_pendant", <aether_legacy:zanite_pendant>, [
	[<ore:wireAluminum>, <ore:wireAluminum>, <ore:wireAluminum>], 
	[<ore:wireAluminum>, <ore:necklace>, <ore:wireAluminum>], 
	[<ore:gemZanite>, <ore:gemZanite>, <ore:gemZanite>]
]);

recipes.remove(<aether_legacy:iron_pendant>);
recipes.addShaped("ia_iron_pendant", <aether_legacy:iron_pendant>, [
	[<ore:wireSteel>, <ore:wireSteel>, <ore:wireSteel>], 
	[<ore:wireSteel>, <aether_legacy:zanite_pendant>, <ore:wireSteel>], 
	[null, <actuallyadditions:block_crystal_empowered:5>, null]
]);
recipes.remove(<aether_legacy:golden_pendant>);
recipes.addShaped("ia_golden_pendant", <aether_legacy:golden_pendant>, [
	[<ore:wireElectrum>, <ore:wireElectrum>, <ore:wireElectrum>], 
	[<ore:wireElectrum>, <aether_legacy:zanite_pendant>, <ore:wireElectrum>], 
	[null, <contenttweaker:egoold_block>, null]
]);

//machines
recipes.remove(<aether_legacy:freezer>);
recipes.addShaped("ia_aether_freezer", <aether_legacy:freezer>, [
	[<aether_legacy:icestone>, <actuallyadditions:block_crystal_empowered:1>, <aether_legacy:icestone>], 
	[<aether_legacy:zanite_ring>, <thermalexpansion:machine:14>, <aether_legacy:zanite_ring>], 
	[<aether_legacy:skyroot_plank>, <quantumflux:craftingpiece:2>, <aether_legacy:skyroot_plank>]
]);
recipes.remove(<aether_legacy:enchanter>);
recipes.addShaped("ia_aether_enchanter", <aether_legacy:enchanter>, [
	[<aether_legacy:ice_ring>, <aether_legacy:ice_ring>, <aether_legacy:ice_ring>], 
	[<ore:plateEnchantedMetal>, <contenttweaker:rainbow_crystal_cluster>, <ore:plateEnchantedMetal>], 
	[<contenttweaker:tungsten_block>, <thermalexpansion:machine:13>, <contenttweaker:tungsten_block>]
]);

recipes.addShaped("ia_valkyrie_cape", <aether_legacy:valkyrie_cape>, [
	[null, <ore:ingotValkyrie>, null], 
	[<ore:ingotValkyrie>, <xreliquary:mob_ingredient:15>, <ore:ingotValkyrie>], 
	[<tconstruct:materials:15>, <ore:ingotValkyrie>, <tconstruct:materials:15>]
]);


{//freezers
	Freezer.registerFreezable(<biomesoplenty:crystal_shard>, <contenttweaker:ice_shard>, 200);
	Freezer.registerFreezable(<contenttweaker:ice_dust>, <contenttweaker:ice_shard>, 200);
	Freezer.registerFreezable(<minecraft:lapis_block>, <contenttweaker:ice_shard>, 400);
	Freezer.registerFreezable(<minecraft:lapis_ore>, <netherendingores:ore_other_1:10>, 400);
}
//<aether_legacy:ice_ring> 2500

//<aether_legacy:icestone> 500


{//ALTAR
	
	//ambrosium 500
	//angel nugget 250

	Enchanter.registerEnchanterFuel(<contenttweaker:corrupted_ambrosium>, 10000);

	scripts.jei.addJEIhint(
		[
			<aether_legacy:ambrosium_shard>.withLore(["500 ticks/25 seconds"]),
			<contenttweaker:corrupted_ambrosium>.withLore(["10000 ticks/500 seconds"])
		], [], 
		[<aether_legacy:enchanter>.withDisplayName("Fuel time")], 
		[]
    );
	Enchanter.registerEnchantment(<contenttweaker:ambrosium_dust>, <aether_legacy:ambrosium_shard>, 100);
	
	//Enchanter.registerEnchantment(<contenttweaker:ambrosium_seed>, <aether_legacy:ambrosium_shard>, 100);
}





{//ambrosium
	Enchanter.registerEnchantment(<minecraft:gravel>, <contenttweaker:ambrosium_gravel>, 100);
	Enchanter.registerEnchantment(<exnihilocreatio:block_skystone_crushed>, <contenttweaker:ambrosium_gravel>, 80);
	Enchanter.registerEnchantment(<contenttweaker:lapis_gravel>, <contenttweaker:ambrosium_gravel>, 50);
	
	scripts.jei.addJEIhint(
		[
			<minecraft:gravel>.withLore(["100 ticks"]),
			<exnihilocreatio:block_skystone_crushed>.withLore(["80 ticks"]),
			<contenttweaker:lapis_gravel>.withLore(["50 ticks"])
		], [], 
		[<aether_legacy:enchanter>.withDisplayName("Recipe time")], 
		[<contenttweaker:ambrosium_gravel>]
    );

	//1 amb -> 5-10 gravel
	//gravel ->   in ex_nihilo.zs

	mods.enderio.SagMill.addRecipe([<contenttweaker:ambrosium_seed>, <contenttweaker:ambrosium_seed>, <contenttweaker:ambrosium_dust>], [0.75, 0.5, 0.1], <contenttweaker:ambrosium_thing>, "MULTIPLY_OUTPUT");
	
	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:ambrosium_balls>, <contenttweaker:zinc_dust>, 
        <liquid:ambrosium_slury_clean> * 1000, 
        2000
    );

	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:ambrosium_crystal_seed>, <contenttweaker:ambrosium_seed> * 4, 
        <liquid:ambrosium_slury_clean> * 4000, 
        250000
    );
	Enchanter.registerEnchantment(<contenttweaker:ambrosium_crystal_seed>, <contenttweaker:ambrosium_crystal>, 5000);//20*250
	mods.enderio.SagMill.addRecipe([
			<aether_legacy:ambrosium_shard> * 16, 
			<aether_legacy:ambrosium_shard> * 8, 
			<contenttweaker:ambrosium_dust>
		], 
		[0.75, 0.5, 0.8], 
		<contenttweaker:ambrosium_crystal>, 
		"MULTIPLY_OUTPUT", 20000
	);

	//corrupted ambrosium
	mods.mekanism.compressor.addRecipe(<contenttweaker:ambrosium_dust>, <gas:evil_nitrate>, <contenttweaker:corrupted_ambrosium>);
	recipes.addShaped("ia_corrupted_ambrosium1", <contenttweaker:corrupted_ambrosium> * 6, [
		[null, <contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <minecraft:nether_star>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, null]
	]);
	recipes.addShaped("ia_corrupted_ambrosium2", <contenttweaker:corrupted_ambrosium> * 8, [
		[<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <contenttweaker:nether_star_dust>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>]
	]);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:corrupted_ambrosium>, 
		<contenttweaker:ambrosium_dust>, <contenttweaker:evil_desert_dust> * 48, 
		25000
	);


	//gambrosium
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 1500, <liquid:hf> * 1500, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<betternether:lucis_spore>
	], 3000);
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 750, <liquid:acetic_acid> * 750, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<betternether:lucis_spore>
	], 3000);

	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 500, <liquid:hf> * 500, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<contenttweaker:mushroomite_ingot>
	], 3000);
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 250, <liquid:acetic_acid> * 250, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<contenttweaker:mushroomite_ingot>
	], 3000);



	mods.thermalexpansion.Refinery.addRecipePotion(<liquid:ambrosium_slury_clean> * 100, <liquid:ambrosium_slury> * 100, 10000);
	mods.immersivepetroleum.Distillation.addRecipe(
		[<liquid:ambrosium_slury_clean> * 100], 
		[<contenttweaker:ambrosium_thing>], 
		<liquid:ambrosium_slury> * 100, 
		4000, 20, 
		[0.01]
	);

	/*recipes.addShapeless("ia_gambrosium", <contenttweaker:gambrosium_dust> * 2, [
		<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, 
		<contenttweaker:energized_compound>, 
		<taiga:jauxum_dust>, <taiga:jauxum_dust>, 
		<actuallyadditions:item_crystal_empowered:1>, 
		<thermalfoundation:material:895>, <thermalfoundation:material:895>,

	]);*/

	mods.immersiveengineering.Mixer.addRecipe(<liquid:gambrosium> * 500, <liquid:jauxum_fluid> * 500, [
		<contenttweaker:ambrosium_balls>, 
		<actuallyadditions:item_crystal_empowered:1>, 
		<contenttweaker:energized_compound>
	], 5000);
	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:gambrosium_dust>, <thermalfoundation:material:895>, 
        <liquid:gambrosium> * 250, 
        2000
    );
	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:gambrosium_boule>, [
			<contenttweaker:ambrosium_crystal_seed>, 
			<projectred-core:resource_item:300> * 4, 
			<contenttweaker:gambrosium_dust> * 64
		], 25000000
	);
	scripts.helper.addSawRecipeWByproduct(<contenttweaker:gambrosium_boule>, <contenttweaker:gambrosium_wafer> * 8, <contenttweaker:gambrosium_dust>, 75);
}
/*{//ambrosium
	Enchanter.registerEnchantment(<minecraft:gravel>, <contenttweaker:ambrosium_gravel>, 100);
	Enchanter.registerEnchantment(<exnihilocreatio:block_skystone_crushed>, <contenttweaker:ambrosium_gravel>, 80);
	Enchanter.registerEnchantment(<contenttweaker:lapis_gravel>, <contenttweaker:ambrosium_gravel>, 50);
	
	scripts.jei.addJEIhint(
		[
			<minecraft:gravel>.withLore(["100 ticks"]),
			<exnihilocreatio:block_skystone_crushed>.withLore(["80 ticks"]),
			<contenttweaker:lapis_gravel>.withLore(["50 ticks"])
		], [], 
		[<aether_legacy:enchanter>.withDisplayName("Recipe time")], 
		[<contenttweaker:ambrosium_gravel>]
    );

	//1 amb -> 5-10 gravel
	//gravel ->   in ex_nihilo.zs

	mods.enderio.SagMill.addRecipe([<contenttweaker:ambrosium_seed>, <contenttweaker:ambrosium_seed>, <contenttweaker:ambrosium_dust>], [0.75, 0.5, 0.1], <contenttweaker:ambrosium_thing>, "MULTIPLY_OUTPUT");
	
	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:ambrosium_balls>, <contenttweaker:zinc_dust>, 
        <liquid:ambrosium_slury_clean> * 1000, 
        12000
    );

	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:ambrosium_crystal_seed>, <contenttweaker:ambrosium_seed> * 4, 
        <liquid:ambrosium_slury_clean> * 4000, 
        250000
    );
	Enchanter.registerEnchantment(<contenttweaker:ambrosium_crystal_seed>, <contenttweaker:ambrosium_crystal>, 5000);//20*250
	mods.enderio.SagMill.addRecipe([
			<aether_legacy:ambrosium_shard> * 16, 
			<aether_legacy:ambrosium_shard> * 8, 
			<contenttweaker:ambrosium_dust>
		], 
		[0.75, 0.5, 0.8], 
		<contenttweaker:ambrosium_crystal>, 
		"MULTIPLY_OUTPUT", 200000
	);

	//corrupted ambrosium
	mods.mekanism.compressor.addRecipe(<contenttweaker:ambrosium_dust>, <gas:evil_nitrate>, <contenttweaker:corrupted_ambrosium>);
	recipes.addShaped("ia_corrupted_ambrosium1", <contenttweaker:corrupted_ambrosium> * 6, [
		[null, <contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <minecraft:nether_star>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, null]
	]);
	recipes.addShaped("ia_corrupted_ambrosium2", <contenttweaker:corrupted_ambrosium> * 8, [
		[<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <contenttweaker:nether_star_dust>, <contenttweaker:ambrosium_dust>], 
		[<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>]
	]);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:corrupted_ambrosium>, 
		<contenttweaker:ambrosium_dust>, <contenttweaker:evil_desert_dust> * 64, 
		250000
	);


	//gambrosium
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 1500, <liquid:hf> * 1500, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<betternether:lucis_spore>
	], 3000);
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 750, <liquid:acetic_acid> * 750, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<betternether:lucis_spore>
	], 3000);

	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 500, <liquid:hf> * 500, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<contenttweaker:mushroomite_ingot>
	], 3000);
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 250, <liquid:acetic_acid> * 250, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:quartz_glass>, 
		<thermalfoundation:material:1028>, 
		<contenttweaker:mushroomite_ingot>
	], 3000);



	mods.thermalexpansion.Refinery.addRecipePotion(<liquid:ambrosium_slury_clean> * 100, <liquid:ambrosium_slury> * 100, 10000);
	mods.immersivepetroleum.Distillation.addRecipe(
		[<liquid:ambrosium_slury_clean> * 100], 
		[<contenttweaker:ambrosium_thing>], 
		<liquid:ambrosium_slury> * 100, 
		4000, 20, 
		[0.01]
	);
	/*
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 1000, <liquid:hf> * 300, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:material:1>, 
		<thermalfoundation:material:1028>, 
		<betternether:lucis_spore>
	], 3000);
	mods.immersiveengineering.Mixer.addRecipe(<liquid:ambrosium_slury> * 500, <liquid:hf> * 400, [
		<contenttweaker:ambrosium_dust>, 
		<appliedenergistics2:material:1>, 
		<thermalfoundation:material:1028>, 
		<contenttweaker:mushroomite_ingot>
	], 3000);

	mods.thermalexpansion.Refinery.addRecipePotion(<liquid:ambrosium_slury_clean> * 100, <liquid:ambrosium_slury> * 100, 10000);
	mods.immersivepetroleum.Distillation.addRecipe(
		[<liquid:ambrosium_slury_clean> * 100], 
		[<contenttweaker:ambrosium_thing>], 
		<liquid:ambrosium_slury> * 100, 
		4000, 20, 
		[0.01]
	);

	recipes.addShapeless("ia_gambrosium", <contenttweaker:gambrosium_dust> * 2, [
		<contenttweaker:ambrosium_dust>, <contenttweaker:ambrosium_dust>, 
		<contenttweaker:energized_compound>, 
		<taiga:jauxum_dust>, <taiga:jauxum_dust>, 
		<actuallyadditions:item_crystal_empowered:1>, 
		<thermalfoundation:material:895>, <thermalfoundation:material:895>,

	]);
	

	mods.immersiveengineering.Mixer.addRecipe(<liquid:gambrosium> * 1000, <liquid:jauxum_fluid> * 250, [
		<contenttweaker:ambrosium_balls>, 
		<actuallyadditions:item_crystal_empowered:1>, 
		<contenttweaker:energized_compound>
	], 5000);
	mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:gambrosium_dust>, <thermalfoundation:material:895>, 
        <liquid:gambrosium> * 250, 
        2000
    );
	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:gambrosium_boule>, [
			<contenttweaker:ambrosium_crystal_seed>, 
			<projectred-core:resource_item:300> * 4, 
			<contenttweaker:gambrosium_dust> * 64
		], 25000000
	);
	scripts.helper.addSawRecipeWByproduct(<contenttweaker:gambrosium_boule>, <contenttweaker:gambrosium_wafer> * 8, <contenttweaker:gambrosium_dust>, 75);
}*/
//zanite
recipes.addShaped("ia_zanite_coral", <contenttweaker:zanite_coral>, [
    [<aether_legacy:zanite_gemstone>, <contenttweaker:life>, <aether_legacy:zanite_gemstone>], 
    [<aether_legacy:zanite_gemstone>, <contenttweaker:coral_dust>, <aether_legacy:zanite_gemstone>], 
    [<aether_legacy:zanite_gemstone>, <contenttweaker:life>, <aether_legacy:zanite_gemstone>]
]);