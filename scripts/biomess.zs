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


{//biomess
	val biocrude as ILiquidStack = <liquid:biocrude>;
	val spice as IOreDictEntry  = <ore:listAllspice>;
	val charcoal as IOreDictEntry = <ore:dustCharcoal>;
	val ash as IOreDictEntry = <ore:dustAsh>;
	val nectar as IItemStack = <erebus:materials:19>;
	val bone_meal as IItemStack = <minecraft:dye:15>;
	val slag as IItemStack = <thermalfoundation:material:864>;
	val richSlag as IItemStack = <thermalfoundation:material:865>;

	val biomess as IItemStack[string] = {
		activated_biopower: <contenttweaker:activated_biopower>,
		ashen_biocoal: <contenttweaker:ashen_biocoal>,
		biocoal: <contenttweaker:biocoal>,
		biomix: <contenttweaker:biomix>,
		bioslag: <contenttweaker:bioslag>,
		coaled_bioash: <contenttweaker:coaled_bioash>,
		coaled_biocoal: <contenttweaker:coaled_biocoal>,
		empowered_biospice: <contenttweaker:empowered_biospice>,
		enmaned_biomass: <contenttweaker:enmaned_biomass>,
		enriched_biocoal: <contenttweaker:enriched_biocoal>,
		enriched_bioslag: <contenttweaker:enriched_bioslag>,
		enspiced_spicy_bioblend: <contenttweaker:enspiced_spicy_bioblend>,
		spicy_bioblend: <contenttweaker:spicy_bioblend>,
		spicy_enriched_bioblend: <contenttweaker:spicy_enriched_bioblend>,
		bioash: <contenttweaker:whitened_biomass>,

		biomass: <thermalfoundation:material:816>,
		bioblend: <thermalfoundation:material:818>,
		rich_biomass: <thermalfoundation:material:817>,
		rich_bioblend: <thermalfoundation:material:819>
	};


	Crucible.addRecipe(biocrude * 125, <contenttweaker:biocoal>, 3000);
	Crucible.addRecipe(<liquid:biocrude> * 200, <contenttweaker:ashen_biocoal>, 3000);
	Crucible.addRecipe(biocrude * 125, <mekanism:biofuel>, 3000);

	{//bioslag
		InductionSmelter.addRecipe(
			biomess.bioslag * 2, 
			biomess.rich_bioblend * 3, slag * 2, 1500, 
			biomess.biocoal, 15);
		InductionSmelter.addRecipe(
			biomess.enriched_bioslag * 2, 
			biomess.bioslag * 3, richSlag * 2, 1500, 
			biomess.biocoal, 25);
	}

	{//biospice
		recipes.addShapeless(
			"ia_spicy_bioblend1",
			biomess.spicy_bioblend * 2,
			[biomess.bioblend, biomess.biomass, spice]
		);
		recipes.addShapeless(
			"ia_spicy_bioblend2",
			biomess.spicy_bioblend * 5,
			[biomess.biocoal, biomess.rich_bioblend, spice, spice]
		);
		InductionSmelter.addRecipe(
			biomess.enspiced_spicy_bioblend,
			biomess.spicy_bioblend * 2, <harvestcraft:fivespiceitem> * 3, 3000,
			biomess.bioslag, 10
		);
		Transposer.addFillRecipe(
			biomess.enmaned_biomass,
			biomess.enspiced_spicy_bioblend, <liquid:mana> * 1000,
			4000
		);

		Transposer.addFillRecipe(
			biomess.spicy_enriched_bioblend,
			biomess.spicy_bioblend, <liquid:sap> * 1000,
			1000
		);
		Transposer.addFillRecipe(
			biomess.spicy_enriched_bioblend,
			biomess.spicy_bioblend, <liquid:syrup> * 750,
			1000
		);
		Transposer.addFillRecipe(
			biomess.spicy_enriched_bioblend,
			biomess.spicy_bioblend, <liquid:biocrude> * 200,
			1000
		);

		//empowered_biospice
		Transposer.addFillRecipe(
			biomess.empowered_biospice * 3,
			biomess.spicy_enriched_bioblend * 4, <liquid:refined_biofuel> * 1000,
			4000
		);
		Transposer.addFillRecipe(
			biomess.empowered_biospice * 3,
			biomess.spicy_enriched_bioblend * 4, <liquid:diesel> * 1000,
			5000
		);
		Transposer.addFillRecipe(
			biomess.empowered_biospice,
			biomess.spicy_enriched_bioblend, <liquid:redstone> * 250,
			2000
		);
		mods.actuallyadditions.Empowerer.addRecipe(
			biomess.empowered_biospice * 3, biomess.spicy_enriched_bioblend, 
			<minecraft:redstone>, <minecraft:glowstone_dust>, <projectred-core:resource_item:105>, <thermalfoundation:fertilizer>, 
			1000, 20);
		mods.actuallyadditions.Empowerer.addRecipe(
			biomess.empowered_biospice * 10, <contenttweaker:empowered_shard>, 
			biomess.spicy_enriched_bioblend, biomess.spicy_enriched_bioblend, biomess.spicy_enriched_bioblend, biomess.spicy_enriched_bioblend, 
			1000, 20);
	}

	{//bio coal ash
		recipes.addShapeless(
			"ia_biocoal1",
			biomess.biocoal * 3,
			[biomess.rich_biomass, biomess.bioslag, charcoal, <prodigytech:fuel_pellet_1>, <prodigytech:fuel_pellet_1>, <prodigytech:fuel_pellet_1>]
		);
		recipes.addShapeless(
			"ia_biocoal2",
			biomess.biocoal,
			[biomess.rich_biomass, charcoal, charcoal, <prodigytech:fuel_pellet_1>]
		);
		Transposer.addFillRecipe(
			biomess.biocoal,
			biomess.rich_biomass, <liquid:coal> * 100,
			2000
		);

		recipes.addShapeless(
			"ia_ashen_biocoal1",
			biomess.ashen_biocoal * 2,
			[biomess.rich_biomass, biomess.biocoal, ash, ash, bone_meal]
		);

		recipes.addShapeless(
			"ia_bioash1",
			biomess.bioash * 3,
			[biomess.rich_biomass, biomess.bioslag, ash, ash, bone_meal]
		);
		recipes.addShapeless(
			"ia_bioash2",
			biomess.bioash,
			[biomess.rich_biomass, ash, ash, bone_meal]
		);
		Transposer.addFillRecipe(
			biomess.bioash,
			biomess.rich_biomass, <liquid:ash_solution> * 100,
			2000
		);

		recipes.addShapeless(
			"ia_coaled_bioash1",
			biomess.coaled_bioash * 2,
			[biomess.rich_biomass, biomess.bioash, charcoal, charcoal, <prodigytech:fuel_pellet_1>]
		);

		InductionSmelter.addRecipe(
			biomess.coaled_biocoal,
			biomess.coaled_bioash * 2, biomess.ashen_biocoal * 2, 3000,
			biomess.bioash, 20
		);

		Transposer.addFillRecipe(
			biomess.enriched_biocoal,
			biomess.coaled_biocoal, <liquid:coal> * 400,
			2000
		);
	}
	//biomix
	recipes.addShapeless(
		"ia_biomix",
		biomess.biomix * 2,
		[biomess.enriched_biocoal, biomess.empowered_biospice, biomess.enriched_bioslag, <contenttweaker:plant_sample>, nectar]
	);

	InductionSmelter.addRecipe(
		biomess.activated_biopower,
		biomess.biomix * 3, biomess.enmaned_biomass * 2, 5000,
		biomess.enriched_bioslag, 5
	);
}

{//uses
    //biocoal
    Centrifuge.addRecipe(
        [
            <minecraft:coal> % 75,
            <immersiveengineering:material:17> % 1,
            <contenttweaker:charcoal_ball> % 1
        ], <contenttweaker:biocoal>, <liquid:tar> * 50, 
        2000
    );
    InductionSmelter.addRecipe(
        <minecraft:coal> * 3, 
        <contenttweaker:biocoal>, <minecraft:coal:1>, 
        1500
    );
    InductionSmelter.addRecipe(
        <minecraft:coal> * 5, 
        <contenttweaker:biocoal>, <contenttweaker:cactus_charcoal>, 
        1500
    );
    furnace.setFuel(<contenttweaker:biocoal>, 200 * 8);

    //biocoal ash
    Centrifuge.addRecipe(
        [
            <contenttweaker:biocoal>
        ], <contenttweaker:ashen_biocoal> * 2, <liquid:ash_solution> * 500, 
        2000
    );
    furnace.setFuel(<contenttweaker:ashen_biocoal>, 200 * 8);

    //enriched_biocoal
    
    furnace.setFuel(<contenttweaker:enriched_biocoal>, 200 * 24);
}