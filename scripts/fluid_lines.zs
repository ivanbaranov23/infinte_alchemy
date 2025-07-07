import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.modularmachinery.RecipeBuilder;

import mods.thermalexpansion.Transposer;
//Transposer.addFillRecipe(IItemStack output, IItemStack input, ILiquidStack fluid, int energy);

import mods.thermalexpansion.Crucible;
//Crucible.addRecipe(ILiquidStack output, IItemStack input, int energy);

import mods.thermalexpansion.Refinery;
//Refinery.addRecipe(output, outputItem, input, energy);

import mods.immersivepetroleum.Distillation;
//Distillation.addRecipe(ILiquidStack[] fluidOutputs, IItemStack[] itemOutputs, ILiquidStack fluidInput, int energy, int time, float[] chance)

import mods.immersiveengineering.Mixer as IEMixer;
import mods.thermalexpansion.Imbuer as TEImbuer; 
//.removeRecipe(IItemStack input, ILiquidStack secondInput);

import mods.enderio.Vat;
//mods.enderio.Vat.addRecipe(ILiquidStack output, ILiquidStack input, IIngredient[] slot1Solids, float[] slot1Mults, IIngredient[] slot2Solids, float[] slot2Mults, @Optional int energyCost);
//addRecipe(
//	ILiquidStack output, 
//	float inMult, ILiquidStack input, I
//	Ingredient[] slot1Solids, float[] slot1Mults, 
//	IIngredient[] slot2Solids, float[] slot2Mults, @Optional int energyCost)

import mods.industrialforegoing.FluidDictionary;



//oil
FluidDictionary.add("oil", "crude_oil", 1.0);
FluidDictionary.add("crude_oil", "oil", 1.0);
{//oil
	Crucible.addRecipe(<liquid:tar> * 500, <thermalfoundation:material:833>, 3000);

	//oil recs
	Crucible.addRecipe(<liquid:oil> * 4000, <contenttweaker:reagent_oil>, 5000);
	mods.thermalexpansion.Centrifuge.addRecipe([], <contenttweaker:reagent_oil>, <liquid:crude_oil> * 4000, 5000);

	{//tar
		mods.immersiveengineering.Refinery.addRecipe(<liquid:oil> * 24, <liquid:tar> * 8, <liquid:coal> * 8, 400);
		scripts.content_machines.addFluidMixerRecipe(
			<liquid:enriched_tar> * 250, 
			<liquid:tar> * 1000, <liquid:muddy_sludge> * 1000, <contenttweaker:supersalt>, 
			40, 500
		);
	}

	Distillation.addRecipe(
		[<liquid:diesel> * 50, <liquid:kerosene> * 75, <liquid:gasoline> * 25, <liquid:refined_oil> * 50], 
		[<thermalfoundation:material:833>], 
		<liquid:crude_oil> * 150, 3 * 20 * 128, 3 * 20, 
		[0.25]
	);

	Refinery.addRecipe(<liquid:butene> * 100, null, <liquid:kerosene> * 200, 5000);

	{//skyroot oil
		scripts.helper.addFluidMixerRecipe(
			<liquid:skyroot> * 250, 
			<liquid:crude_oil> * 50, <liquid:nitric_acid> * 50, <aether_legacy:aether_log>, 
			128, 60
		);
		scripts.content_machines.addAdvancedMixerRecipe(
			[],
			[<liquid:lubricant> * 2000], [
				<ore:dustWood> * 2,
				<contenttweaker:soot> |	<minecraft:redstone> | <appliedenergistics2:material:3> | <enderio:item_material:32> | <projectred-core:resource_item:105>
			], [
				<liquid:skyroot> * 250,
				<liquid:tar> * 100
			], 10, 1000
		);
		Distillation.addRecipe(
			[<liquid:kerosene> * 150, <liquid:ethylbenzene> * 20, <liquid:lubricant> * 30],
			[],
			<liquid:skyroot> * 200, 3*20*128, 3*20,
			[]
		);
	}

	//coal
	Distillation.addRecipe(
		[<liquid:refined_oil> * 40, <liquid:naphthalene> * 10, <liquid:tar> * 40],
		[],
		<liquid:coal> * 100, 20 * 250, 20,
		[]
	);
	//naphtha
	Distillation.addRecipe(
		[<liquid:naphthalene> * 50, <liquid:refined_fuel> * 50],
		[<thermalfoundation:material:771>],
		<liquid:refined_oil> * 100, 20 * 250, 20,
		[0.5]
	);
	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:filter_empty>,
			<thermalfoundation:material:771> % 40,
			<contenttweaker:bioslag> % 30,
			<thermalfoundation:material:833> % 10
		], <liquid:naphthalene> * 800,
		<liquid:refined_oil> * 1000, <contenttweaker:filter_charcoal>,
		<exnihilocreatio:item_mesh:4>, 
		20, 400
	);
}
{//fish oil
	mods.immersiveengineering.Squeezer.addRecipe(<prodigytech:meat_ground>, <liquid:fish_oil> * 500, <ore:listAllfishraw> * 4, 3000);
	scripts.jei.addJEIhint(
		[<ore:listAllfishraw>], [],
		[<immersiveengineering:metal_multiblock:7>],
		[], [<liquid:fish_oil>]
	);

	Distillation.addRecipe(
		[<liquid:biodiesel> * 40, <liquid:lubricant> * 5], 
		[], 
		<liquid:fish_oil> * 100, 20 * 128, 20, 
		[]
	);
}


Distillation.addRecipe(
	[<liquid:pure_water> * 40], 
	[<actuallyadditions:item_dust:7>, <exnihilocreatio:item_material:3>], 
	<liquid:witchwater> * 100, 3 * 20 * 128, 3 * 20, 
	[0.07, 0.04]
);

{//lavas
	Distillation.addRecipe(
		[<liquid:obsidian> * 60, <liquid:iron> * 12, <liquid:gold> * 4, <liquid:lava_residue> * 2], 
		[<chisel:basalt2:7>, <deepmoblearning:soot_covered_redstone>], 
		<liquid:lava> * 100, 1200, 50, 
		[0.07, 0.03]
	);

	//nitronite
	scripts.content_machines.addFluidMixerRecipe(
		<liquid:nitronite_fluid> * 600, 
		<liquid:osram_fluid> * 100, <liquid:magma_fluid> * 600, null, 
		20, 500
	);

	{//heat lava
		scripts.content_machines.addAdvancedMixerRecipe(
			[], [<liquid:high_heat_lava> * 400, <liquid:lava_residue> * 100],
			[
				<thermalexpansion:florb>.withTag({Fluid: "napalm"}) * 4,
				<contenttweaker:hot_ingot> | <thermalexpansion:florb:1>.withTag({Fluid: "blazing_blood"}), <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>
			], [
				<liquid:lava> * 2000,
				<liquid:pyrotheum> * 1000, 
				<liquid:empoweredoil> * 1000,
				<liquid:andesite_magma> * 1000
			], 20, 2000
		);
		scripts.content_machines.addAdvancedMixerRecipe(
			[], [<liquid:high_heat_lava> * 500, <liquid:lava_residue> * 100],
			[
				<thermalexpansion:florb>.withTag({Fluid: "napalm"}) * 4,
				<contenttweaker:hot_ingot> | <thermalexpansion:florb:1>.withTag({Fluid: "blazing_blood"}), <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>
			], [
				<liquid:lava> * 2000,
				<liquid:pyrotheum> * 1000, 
				<liquid:empoweredoil> * 1000,
				<liquid:nitronite_fluid> * 250
			], 20, 2000
		);
		scripts.content_machines.addAdvancedMixerRecipe(
			[], [<liquid:high_heat_lava> * 450, <liquid:lava_residue> * 100],
			[
				<thermalexpansion:florb>.withTag({Fluid: "napalm"}) * 4,
				<contenttweaker:hot_ingot> | <thermalexpansion:florb:1>.withTag({Fluid: "blazing_blood"}), <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>
			], [
				<liquid:lava> * 2000,
				<liquid:pyrotheum> * 1000, 
				<liquid:empoweredoil> * 1000,
				<liquid:fierymetal> * 288
			], 20, 2000
		);
	}
	/*
	scripts.content_machines.addAdvancedMixerRecipe(
		[<prodigytech:heat_capacitor_1:1200>], 
		[<liquid:high_heat_lava> * 100, <liquid:lava_residue> * 100], 
		[<contenttweaker:hot_ingot>, <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>], 
		[<liquid:lava> * 1000, <liquid:pyrotheum> * 1000, <liquid:fire_water> * 1000, <liquid:magma_fluid> * 1000], 
		20, 2048
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<prodigytech:heat_capacitor_2:1200>], 
		[<liquid:high_heat_lava> * 500, <liquid:lava_residue> * 100], 
		[<contenttweaker:hot_ingot>, <bloodmagic:component:1>, <prodigytech:heat_capacitor_2>], 
		[<liquid:lava> * 1000, <liquid:pyrotheum> * 1000, <liquid:fire_water> * 1000, <liquid:magma_fluid> * 1000], 
		20, 2048
	);*/

	//super lava
	scripts.content_machines.addAdvancedMixerRecipe(
		[<prodigytech:heat_capacitor_3:1200>], 
		[<liquid:super_heat_lava> * 1000, <liquid:lava_residue> * 1000], 
		[<extendedcrafting:singularity_custom:13>, <botania:rune:1>, <prodigytech:heat_capacitor_3>], 
		[<liquid:high_heat_lava> * 1000, <liquid:fire> * 1000, <liquid:nitronite_fluid> * 1000], 
		40, 1024
	);


	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<exnihilocreatio:item_ore_osmium> % 50,
			<exnihilocreatio:item_ore_titanium> % 30,
			<exnihilocreatio:item_ore_iridium> % 20,
			<minecraft:glowstone_dust> % 20
		], <liquid:meteorite_fluid> * 50,
		<liquid:lava_residue> * 500, <thermalfoundation:material:1025>,
		<contenttweaker:uranium_mesh>,
		20, 400
	);
}
{//bloods

	{//evil blood
		scripts.content_machines.addAdvancedMixerRecipe(
			[],
			[<liquid:evil_blood> * 400],
			[<extrautils2:ingredients:10>, <twilightforest:fiery_blood>, <contenttweaker:blood_runic_dust>],
			[
				<liquid:blood> * 2000,
				<liquid:if.protein> * 500,
				<liquid:rot> * 1000,
				<liquid:worm_blood> * 250
			],
			20, 2000
		);
		scripts.content_machines.addAdvancedMixerRecipe(
			[],
			[<liquid:evil_blood> * 400],
			[<extrautils2:ingredients:10>, <twilightforest:fiery_blood>, <contenttweaker:blood_runic_dust>],
			[
				<liquid:blood> * 2000,
				<liquid:if.protein> * 500,
				<liquid:rot> * 1000,
				<liquid:ender_blood> * 250
			],
			20, 2000
		);
		scripts.content_machines.addAdvancedMixerRecipe(
			[],
			[<liquid:evil_blood> * 400],
			[<extrautils2:ingredients:10>, <twilightforest:fiery_blood>, <contenttweaker:blood_runic_dust>],
			[
				<liquid:blood> * 2000,
				<liquid:if.protein> * 500,
				<liquid:rot> * 1000,
				<liquid:fiery_essence> * 250
			],
			20, 2000
		);
		scripts.content_machines.addAdvancedMixerRecipe(
			[],
			[<liquid:evil_blood> * 400],
			[<extrautils2:ingredients:10>, <twilightforest:fiery_blood>, <contenttweaker:blood_runic_dust>],
			[
				<liquid:blood> * 2000,
				<liquid:if.protein> * 500,
				<liquid:rot> * 1000,
				<liquid:pilkon_blood> * 250
			],
			20, 2000
		);
	}
}

//water -> pure water
Distillation.addRecipe(
	[<liquid:pure_water> * 300, <liquid:sludge> * 10], 
	[<mekanism:dirtydust:5>], 
	<liquid:water> * 400, 3 * 20 * 16, 3 * 20, 
	[0.001]
);
Refinery.addRecipe(<liquid:pure_water> * 3000, <mekanism:dirtydust:5> % 1, <liquid:water> * 3000, 5000);

{//ultarpure water and ion beads
	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:ion_beads_spent>], <liquid:ultrapure_water> * 400,
		[
			<contenttweaker:ion_beads>,
			<contenttweaker:advanced_cryotheum>
		], [
			<liquid:hot_spring_water> * 1000,
			<liquid:dense_steam> * 500
		], <contenttweaker:uv_lamp>,
		20, 1000
	);

	recipes.addShaped("ia_ion_beads", <contenttweaker:ion_beads>, [
		[<enderio:item_alloy_endergy_ball:1>, <contenttweaker:electricium>, <enderio:item_alloy_endergy_ball:1>],
		[<extendedcrafting:singularity:3>, <contenttweaker:electricium>, <extendedcrafting:singularity_custom:28>],
		[<enderio:item_alloy_endergy_ball:1>, <contenttweaker:electricium>, <enderio:item_alloy_endergy_ball:1>]
	]);
	mods.thermalexpansion.Infuser.addRecipe(<contenttweaker:ion_beads>, <contenttweaker:ion_beads_spent>, 25000);
}

{//water -> sea water

	Transposer.addExtractRecipe(<liquid:sea_water> * 2000, <minecraft:sea_lantern>, 3000, <biomesoplenty:gem:6> % 10);

	Distillation.addRecipe(
		[<liquid:pure_water> * 75, <liquid:seaweed_rich_water> * 15], 
		[<mekanism:salt>, <mekores:mekanismore:3>, <projectred-core:resource_item:105>, <minecraft:prismarine_shard>], 
		<liquid:sea_water> * 100, 1200, 30, 
		[0.1, 0.001, 0.14, 0.003]
	);


	scripts.content_machines.addFluidMixerRecipe(
		<liquid:ocean_water> * 1250, 
		<liquid:seaweed_rich_water> * 1000, <liquid:methane> * 150, <ore:listAllfishfresh> * 3, 
		80, 1000
	);
	{
		//var a as IItemStack[];
		var b as float[] = [];
		for f in <ore:listAllfishfresh>.items{
			//a += f;
			b += 0.1;
		}

		Distillation.addRecipe(
			[<liquid:methane> * 10, <liquid:seaweed_rich_water> * 15], 
			<ore:listAllfishfresh>.items, 
			<liquid:ocean_water> * 125, 1200, 30, 
			b
		);
	}
	
}

//heavy water -> water
Distillation.addRecipe(
	[<liquid:water> * 300], 
	[<mekanism:dirtydust:6>], 
	<liquid:heavywater> * 400, 20 * 40, 20, 
	[0.005]
);
Refinery.addRecipe(<liquid:water> * 3000, <mekanism:dirtydust:6> % 1, <liquid:heavywater> * 3000, 8000);


//pure water -> seaweed water
TEImbuer.addRecipe(<liquid:seaweed_rich_water> * 1000, <harvestcraft:seaweeditem> * 4, <liquid:pure_water> * 1000, 4800);
//pure water -> potion
TEImbuer.addRecipe(<liquid:potion>.withTag({Potion: "minecraft:awkward"}) * 1000, <minecraft:nether_wart>, <liquid:pure_water> * 1000, 2400);

//seaweed water -> fertilizer
TEImbuer.addRecipe(<liquid:fertilizer> * (250), <thermalfoundation:fertilizer>, <liquid:pure_water> * 1000, 4800);
TEImbuer.addRecipe(<liquid:fertilizer> * (250 + 250), <thermalfoundation:fertilizer:1>, <liquid:pure_water> * 1000, 4800);
TEImbuer.addRecipe(<liquid:fertilizer> * (250 + 500), <thermalfoundation:fertilizer:2>, <liquid:pure_water> * 1000, 4800);

TEImbuer.addRecipe(<liquid:fertilizer> * (400), <thermalfoundation:fertilizer>, <liquid:seaweed_rich_water> * 1000, 3000);
TEImbuer.addRecipe(<liquid:fertilizer> * (400 + 400), <thermalfoundation:fertilizer:1>, <liquid:seaweed_rich_water> * 1000, 3000);
TEImbuer.addRecipe(<liquid:fertilizer> * (400 + 800), <thermalfoundation:fertilizer:2>, <liquid:seaweed_rich_water> * 1000, 3000);


//witch water alt recipes
TEImbuer.addRecipe(<liquid:witchwater> * (1000), <exnihilocreatio:item_material:3>, <liquid:water> * 1000, 4000);
TEImbuer.addRecipe(<liquid:witchwater> * (1500), <exnihilocreatio:item_material:3>, <liquid:pure_water> * 1000, 4000);
TEImbuer.addRecipe(<liquid:witchwater> * (2000), <exnihilocreatio:item_material:3>, <liquid:seaweed_rich_water> * 1000, 4000);

//sugar water
Refinery.addRecipe(<liquid:sugary_solution> * 750, <minecraft:sugar> % 10, <liquid:honey> * 1000, 2000);
TEImbuer.addRecipe(<liquid:sugary_solution> * (500), <minecraft:sugar>, <liquid:water> * 500, 3000);
TEImbuer.addRecipe(<liquid:sugary_solution> * (500), <minecraft:sugar>, <liquid:pure_water> * 500, 1000);

//cleaning fluid
scripts.helper.addFluidMixerRecipe(<liquid:sterile_water> * 500,
    <liquid:pure_water> * 500,
    <liquid:steam> * 1000,
    <contenttweaker:soap>, 
    128, 80
);
TEImbuer.addRecipe(<liquid:sterile_water> * (500), <contenttweaker:soap>, <liquid:pure_water> * 1000, 8000);


{//holy water
	
	Vat.addRecipe(
		<liquid:holy_water> * 1000, 1.0, <liquid:pure_water> * 1000, 
		[<aether_legacy:holystone>], [1.0], 
		[<contenttweaker:holy_thing>], [1.0], 
		5000
	);

	//glowing water
	recipes.addShaped("ia_glowing_water", <xreliquary:glowing_water> * 3, [
		[<minecraft:glass_pane>, <fluid:water> * 1000, <minecraft:glass_pane>], 
		[<minecraft:glass_pane>, <contenttweaker:holy_thing>, <minecraft:glass_pane>], 
		[null, <minecraft:glass_pane>, null]
	]);

	mods.roots.Fey.addRecipe("holy_water2",
		<forge:bucketfilled>.withTag({FluidName: "holy_water2", Amount: 1000}),
		[
			<minecraft:bucket>,
			<forge:bucketfilled>.withTag({FluidName: "holy_water", Amount: 1000}),
			<thermalfoundation:material:66>,
			<thermalfoundation:material:66>,
			<xreliquary:glowing_water>
		]
	);
	Vat.addRecipe(
		<liquid:holy_water2> * 1000, 1.0, <liquid:holy_water> * 1000, 
		[<thermalfoundation:material:66>], [1.0], 
		[<xreliquary:glowing_water>], [1.0], 
		5000
	);
}


{//corn sieving
	scripts.helper.addFluidMixerRecipe(<liquid:nectar_solution> * 2000, 
		<liquid:pure_water> * 1000, <liquid:honey> * 500, <roots:moonglow_seed>, 
		64, 6*20
	);

	scripts.helper.addFluidMixerRecipe(<liquid:corn_solution> * 500, 
		<liquid:pure_water> * 1000, <liquid:witchwater> * 300, <harvestcraft:cornmealitem>, 
		64, 20*20
	);
	scripts.helper.addFluidMixerRecipe(<liquid:corn_solution> * 1000, 
		<liquid:nectar_solution> * 1000, <liquid:witchwater> * 300, <harvestcraft:cornmealitem>, 
		64, 2*20
	);

	Distillation.addRecipe(
		[<liquid:malachite_solution> * 45, <liquid:witchwater> * 25], 
		[<harvestcraft:cornseeditem>, <exnihilocreatio:item_ore_yellorium>, <exnihilocreatio:item_ore_zinc>, <exnihilocreatio:item_ore_nickel>], 
		<liquid:corn_solution> * 150, 1200, 20, 
		[0.01, 0.01, 0.05, 0.12]
	);

	scripts.helper.addFluidMixerRecipe(<liquid:rich_corn_solution> * 1000, 
		<liquid:corn_solution> * 1000, <liquid:ore_make> * 250, <harvestcraft:mushroomketchupitem>, 
		256, 10*20
	);

	Distillation.addRecipe(
		[<liquid:malachite_solution> * 75, <liquid:witchwater> * 45], 
		[<exnihilocreatio:item_ore_iridium>, <exnihilocreatio:item_ore_yellorium>, <exnihilocreatio:item_ore_zinc>, <exnihilocreatio:item_ore_nickel>], 
		<liquid:rich_corn_solution> * 150, 1200, 60, 
		[0.01, 0.05, 0.15, 0.22]
	);
}

//meat dup
TEImbuer.addRecipe(<liquid:meat> * (2000), <prodigytech:meat_patty>, <liquid:meat> * 1000, 3000);

{//bop fluids
	//quicksand
	Vat.addRecipe(
		<liquid:sand> * 1000, 2.0, <liquid:ash_solution> * 1000, 
		[<biomesoplenty:gem:3>], [1.0], 
		[<atum:fertile_soil_pile>], [1.0], 
		5000
	);
	//hot spring
	Vat.addRecipe(
		<liquid:hot_spring_water> * 1000, 2.5, <liquid:sterile_water> * 1000, 
		[<aether_legacy:healing_stone>], [1.0], 
		[<contenttweaker:isis_godshard>], [1.0], 
		5000
	);
	//poison
	Vat.addRecipe(
		<liquid:poison> * 1000, 1.5, <liquid:witchwater> * 1000, 
		[<natura:edibles>], [1.0], 
		[<minecraft:poisonous_potato>], [1.0], 
		5000
	);
}
{//poisons
	Vat.addRecipe(
		<liquid:insecticide> * 1000, 0.8, <liquid:poison> * 1000, 
		[<erebus:materials:28>], [1.0], 
		[<erebus:materials:23>, <biomesoplenty:plant_0:4>, <natura:edibles:10>, <mowziesmobs:naga_fang>], [1.0, 0.8, 0.75, 2.0], 
		5000
	);
	Vat.addRecipe(
		<liquid:insecticide> * 1000, 1.5, <liquid:anti_venom> * 1000, 
		[<erebus:materials:28>], [1.0], 
		[<erebus:materials:23>, <biomesoplenty:plant_0:4>, <natura:edibles:10>, <mowziesmobs:naga_fang>], [1.0, 0.8, 0.75, 2.0], 
		5000
	);
	Vat.addRecipe(
		<liquid:insecticide> * 1000, 0.5, <liquid:formic_acid> * 1000, 
		[<erebus:materials:28>], [1.0], 
		[<erebus:materials:23>, <biomesoplenty:plant_0:4>, <natura:edibles:10>, <mowziesmobs:naga_fang>], [1.0, 0.8, 0.75, 2.0], 
		5000
	);
}
{//endacid
	Vat.addRecipe(
    	<liquid:endacid> * 2000, 3.0, <liquid:endacid> * 1000, 
		[<stygian:endlog>], [1.0], 
		[<contenttweaker:delicate_tanzanite>], [1.0], 
		100000
	);
	scripts.content_machines.addBioAssemblerRecipe(
        [], <liquid:endacid> * 1500, 
        [
            <stygian:endplanks> * 2,
			<contenttweaker:gem_tanzanite_dust> * 2,
			<contenttweaker:ender_bacteria>,
			<roots:pereskia> * 4
        ], [
			<liquid:formic_acid> * 1000,
            <liquid:biotite> * 500
        ], <contenttweaker:research_chemistry3>,
        40, 1000
    );
}


{//emp steam
	TEImbuer.addRecipe(<liquid:empowered_steam> * 500, <contenttweaker:rainbow_crystal_cluster>, <liquid:steam> * 4000, 20000);


	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:filter_empty> % 90,
			<contenttweaker:empowered_shard> % 50
		], null,
		<liquid:empowered_steam> * 500, <contenttweaker:filter_charcoal>,
		<exnihilocreatio:item_mesh:4>,
		20, 250
	);
	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:filter_empty>,
			<contenttweaker:empowered_shard> % 60
		], null,
		<liquid:empowered_steam> * 500, <contenttweaker:filter_solar>,
		<exnihilocreatio:item_mesh:4>,
		20, 250
	);
	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:empowered_shard> % 75
		], null,
		<liquid:empowered_steam> * 500, (<contenttweaker:ice_shard> | <minecraft:diamond> | <minecraft:emerald> | <mysticalworld:amethyst_gem>) * 4,
		<contenttweaker:weather_chrome_mesh>,
		20, 250
	);

	Distillation.addRecipe(
		[<liquid:pure_water> * 100, <liquid:dense_steam> * 200, <liquid:steam> * 100], 
		[], 
		<liquid:steam> * 1000, 20 * 1000, 20, 
		[]
	);
	
	mods.immersiveengineering.Mixer.addRecipe(
        <liquid:empowered_steam> * 2000, <liquid:dense_steam> * 2000, 
        [<contenttweaker:rainbow_crystal_cluster>, <contenttweaker:empowered_shard>, <contenttweaker:fluospar_dust>, <contenttweaker:sky_grain>], 
        20000
    );
    mods.immersiveengineering.Mixer.addRecipe(
        <liquid:empowered_steam> * 4000, <liquid:dense_steam> * 4000, 
        [<contenttweaker:rainbow_crystal_cluster>, <contenttweaker:empowered_shard>, <contenttweaker:fluospar_dust>, <contenttweaker:corrupted_ambrosium>], 
        20000
    );
	mods.immersiveengineering.Mixer.addRecipe(
        <liquid:empowered_steam> * 2000, <liquid:dense_steam> * 2000, 
        [<contenttweaker:rainbow_crystal_cluster>, <contenttweaker:empowered_shard>, <contenttweaker:ancient_dust>, <contenttweaker:sky_grain>], 
        20000
    );
    mods.immersiveengineering.Mixer.addRecipe(
        <liquid:empowered_steam> * 4000, <liquid:dense_steam> * 4000, 
        [<contenttweaker:rainbow_crystal_cluster>, <contenttweaker:empowered_shard>, <contenttweaker:ancient_dust>, <contenttweaker:corrupted_ambrosium>], 
        20000
    );
}

{//radioactive waste
	Crucible.addRecipe(<liquid:radioactive_waste> * 1000, <contenttweaker:irradiated_compound>, 20000);

	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:uranium_pieces> % 20,
			<exnihilocreatio:item_ore_yellorium> % 20,
			<exnihilocreatio:item_ore_lead> % 40
		], <liquid:prometheum_fluid> * 500,
		<liquid:radioactive_waste> * 1000, <contenttweaker:ore_catalyst> * 2,
		<contenttweaker:uranium_mesh>,
		20, 1000
	);
	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<mekores:mekanismore:3> % 20,
			<mekores:mekanismore:8> % 20
		], <liquid:prometheum_fluid> * 200,
		<liquid:radioactive_waste> * 1000, null,
		<contenttweaker:research_chemistry1>,
		20, 1000
	);
}


{//ore waste
	//1
	Vat.addRecipe(
		<liquid:ore_waste_ref1> * 1000, 1.0, <liquid:ore_waste> * 1000, 
		[<tconstruct:edible:4>], [1.0], 
		[<contenttweaker:ore_catalyst>], [1.0], 
		5000
	);
	Distillation.addRecipe(
		[<liquid:iron> * 50, <liquid:copper> * 30, <liquid:tin> * 20, <liquid:nickel> * 30, <liquid:zinc> * 25, <liquid:aluminum> * 35, <liquid:ore_waste1> * 100], 
		[<contenttweaker:soot>, <thermalfoundation:material:768>, <mekanism:salt>, <thermalfoundation:material:771>], 
		<liquid:ore_waste_ref1> * 400, 20 * 128, 20, 
		[0.1, 0.1, 0.1, 0.1]
	);
	//2
	Vat.addRecipe(
		<liquid:ore_waste_ref2> * 1000, 1.0, <liquid:ore_waste1> * 1000, 
		[<contenttweaker:gem_amber_dust>, <contenttweaker:gem_tanzanite_dust>], [1.0, 1.0], 
		[<contenttweaker:ore_catalyst> * 2], [1.0], 
		5000
	);
	Distillation.addRecipe(
		[<liquid:gold> * 50, <liquid:silver> * 35, <liquid:lead> * 30, <liquid:osmium> * 35, <liquid:cobalt> * 25, <liquid:ardite> * 15, <liquid:ore_waste2> * 100], 
		[<contenttweaker:soot>, <enderio:item_material:32>, <appliedenergistics2:material:3>, <actuallyadditions:item_dust:7>], 
		<liquid:ore_waste_ref2> * 400, 20 * 256, 20, 
		[0.3, 0.1, 0.1, 0.1]
	);
	//3
	Vat.addRecipe(
		<liquid:ore_waste_ref3> * 1000, 1.0, <liquid:ore_waste2> * 1000, 
		[<actuallyadditions:item_misc:24>, <actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal_empowered:1>], [0.5, 1.0, 1.0], 
		[<contenttweaker:ore_catalyst> * 4], [1.0], 
		5000
	);
	Distillation.addRecipe(
		[<liquid:platinum> * 50, <liquid:iridium> * 35, <liquid:uranium> * 25, <liquid:yellorium> * 25, <liquid:titanium> * 30, <liquid:tungsten> * 25, <liquid:ore_waste3> * 100], 
		[<contenttweaker:soot>, <taiga:meteorite_dust>, <taiga:dilithium_dust>], 
		<liquid:ore_waste_ref3> * 400, 20 * 1024, 20, 
		[0.5, 0.3, 0.4]
	);
	//4
	//<contenttweaker:bedrockium_small_chunk>
}

{//sludge alt ways
	Refinery.addRecipe(<liquid:sludge> * 100, <contenttweaker:soot> % 10, <liquid:ore_waste> * 300, 2000);

	scripts.content_machines.addFluidMixerRecipe(
		<liquid:muddy_sludge> * 500, 
		<liquid:sky_stone> * 288, <liquid:blueslime> * 144, <biomesoplenty:mudball>, 
		20, 250
	);
	mods.immersiveengineering.Refinery.addRecipe(<liquid:sludge> * 8, <liquid:muddy_sludge> * 2, <liquid:sterile_water> * 2, 400);

	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<contenttweaker:filter_empty>,
			<appliedenergistics2:material:45> % 30,
			<mekores:mekanismore:298> % 20,
			<draconicevolution:draconium_dust> % 3,
			<contenttweaker:sky_grain> % 5
		], <liquid:sludge> * 100,
		<liquid:muddy_sludge> * 200, <contenttweaker:filter_charcoal>,
		<exnihilocreatio:item_mesh:4>,
		20, 250
	);


}


{//cold fluid
	scripts.content_machines.addAdvancedMixerRecipe(
		[],
		[<liquid:cold_liquid> * 500],
		[
			<contenttweaker:advanced_cryotheum>,
			<mod_lavacow:shattered_ice> * 8,
			<twilightforest:arctic_fur>,
			<contenttweaker:ice_shard> //todo freezer item
		], [
			<liquid:cryotheum> * 2000,
			<liquid:cold_nitrogen> * 1000
		], 20, 1000
	);
}



{//fuels
	{//enriched diesel	
		scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:diesel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
		);
		scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:biodiesel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
		);
		scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:refined_biofuel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
		);
		scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:refined_fuel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
		);

		scripts.content_machines.addAdvancedMixerRecipe(
			[<prodigytech:inferno_fuel>],
			[<liquid:enriched_diesel1> * 2000],
			[<prodigytech:inferno_crystal>],
			[<liquid:diesel> * 200, <liquid:biodiesel> * 200, <liquid:refined_biofuel> * 200,<liquid:refined_fuel> * 200],
			20, 128
		);
	}


	scripts.helper.addFluidMixerRecipe(
		<liquid:nuit_fuel> * 2000,
		<liquid:enriched_diesel1> * 500, <liquid:ethylbenzene> * 500, <contenttweaker:nuit_godshard>,
		128, 80
	);
}

{//filters
	recipes.addShaped("ia_filter_empty", <contenttweaker:filter_empty> * 3, [
		[<contenttweaker:watertight_steel_rod>, <exnihilocreatio:item_mesh:3>, <contenttweaker:watertight_steel_rod>], 
		[<thermalfoundation:material:832>, <exnihilocreatio:item_mesh:3>, <thermalfoundation:material:832>], 
		[<contenttweaker:watertight_steel_rod>, <exnihilocreatio:item_mesh:3>, <contenttweaker:watertight_steel_rod>]
	]);


	recipes.addShapeless("ia_filter_charcoal1", <contenttweaker:filter_charcoal>, [
		<contenttweaker:filter_empty>, 
		<thermalfoundation:material:769>, <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
		<thermalfoundation:material:769>, <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
		<thermalfoundation:material:769>, <thermalfoundation:material:769>
	]);
	recipes.addShapeless("ia_filter_charcoal2", <contenttweaker:filter_charcoal>, [
		<contenttweaker:filter_empty>, 
		<thermalfoundation:material:769>, <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
		<contenttweaker:soot>, <prodigytech:ash>
	]);

	recipes.addShapeless("ia_filter_solar", <contenttweaker:filter_solar>, [
		<contenttweaker:filter_empty>, 
		<projectred-core:resource_item:341>, <projectred-core:resource_item:341>, <projectred-core:resource_item:341>, 
		<quantumflux:graphitedust> | <contenttweaker:solar_potion_zinc_ingot> | <contenttweaker:ambrosium_thing>
	]);
}

//air lines
function addAirCollectionRecipe(outp as ILiquidStack, cryo as int, cloudin as int, cloudout as int, time_sec as int, energy as int, dim as int){
	var rec = RecipeBuilder.newBuilder("aircollecting"~dim, "air_collector", time_sec * 20);
    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

	rec.addFluidOutput(outp);
    rec.addFluidOutput(<liquid:cloud_seed> * cloudout);

	rec.addFluidInput(<liquid:cryotheum> * cryo);
	rec.addFluidInput(<liquid:cloud_seed_concentrated> * cloudin);
	rec.addItemInput(<contenttweaker:shu_godshard>);

    rec.addDimensionRequirement([dim]);
    
    rec.build();
}
{//air lines
	//ow
	addAirCollectionRecipe(
		<liquid:ow_air> * 1000, 200, 1000, 1000,
		1, 512, 0
	);
	Distillation.addRecipe(
		[<liquid:nitrogen> * 300, <liquid:liquidoxygen> * 60, <liquid:noble_gases> * 40], 
		[], 
		<liquid:ow_air> * 400, 3 * 20 * 16, 3 * 20, 
		[]
	);
	{//erebus
		addAirCollectionRecipe(
			<liquid:erebus_air> * 1000, 200, 1000, 1000,
			1, 512, 66
		);
		Distillation.addRecipe(
			[<liquid:liquidoxygen> * 160, <liquid:methane> * 100, <liquid:pheromones> * 100, <liquid:bugs> * 10], 
			[<erebus:materials:28>, <erebus:erebus_food>], 
			<liquid:erebus_air> * 400, 3 * 20 * 64, 3 * 20, 
			[0.1, 0.01]
		);
	}	
	{//atum
		addAirCollectionRecipe(
			<liquid:atum_air> * 1000, 200, 1000, 1000,
			1, 1024, 17
		);
		Distillation.addRecipe(
			[<liquid:liquidoxygen> * 60, <liquid:sand> * 60, <liquid:noble_gases> * 50, <liquid:air_gold> * 30], 
			[<atum:sand>, <contenttweaker:desert_pollen>], 
			<liquid:atum_air> * 200, 2 * 20 * 32, 2 * 20, 
			[0.15, 0.05]
		);
		
	}
	{//nether
		addAirCollectionRecipe(
			<liquid:nether_air> * 1000, 1200, 1000, 990,
			1, 1024, -1
		);
		Distillation.addRecipe(
			[<liquid:liquidsulfurdioxide> * 100, <liquid:lava_residue> * 40, <liquid:poison> * 20, <liquid:glowstone> * 20], 
			[<natura:clouds:3> * 2, <natura:clouds:2>, <taiga:tiberium_crystal>, <enderio:block_holy_fog>], 
			<liquid:nether_air> * 200, 1200, 50, 
			[0.2, 0.1, 0.025, 0.1]
		);
	}
	addAirCollectionRecipe(
		<liquid:twilight_air> * 1000, 600, 1000, 900,
		1, 2048, 7
	);
	{//aether	
		addAirCollectionRecipe(
			<liquid:aether_air> * 1000, 800, 2000, 1600,
			1, 4096, 4
		);
		Distillation.addRecipe(
			[<liquid:noble_gases> * 120, <liquid:holy_water> * 20, <liquid:skyroot> * 30, <liquid:mana> * 10], 
			[<contenttweaker:aether_bug>, <contenttweaker:ambrosium_dust>], 
			<liquid:aether_air> * 200, 3 * 20 * 64, 3 * 20, 
			[0.05, 0.03]
		);
	}
	{//end	
		addAirCollectionRecipe(
			<liquid:end_air> * 1000, 500, 4000, 3000,
			2, 5120, 1
		);
		Distillation.addRecipe(
			[<liquid:ender> * 120, <liquid:liquidchorus> * 30, <liquid:mana> * 20, <liquid:dragon_spit> * 5], 
			[<enderio:item_material:28>], 
			<liquid:end_air> * 200, 3 * 20 * 64, 3 * 20, 
			[0.04]
		);
	}
	{//deepdark

	}
}

