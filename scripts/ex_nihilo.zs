import crafttweaker.item.IItemStack;
import mods.exnihilocreatio.Sieve;

import crafttweaker.item.WeightedItemStack;
import mods.modularmachinery.RecipeBuilder;

import mods.exnihilocreatio.Compost;
//Compost.addRecipe(IIngredient, Float chance, String color, IItemStack);

//recipes.remove(<exnihilocreatio:item_material:1>);
recipes.addShapeless("ia_porcelain_clay", <exnihilocreatio:item_material:1> * 8, [<ore:clayBall>, <ore:clayBall>, <ore:clayBall>, <ore:dustNetherQuartz>, <ore:dyeWhite>, <ore:dustAsh>]);
//mesh
recipes.remove(<exnihilocreatio:item_mesh:1>);
recipes.addShaped("ia_string_mesh",
    <exnihilocreatio:item_mesh:1>,
    [[<minecraft:string>, <minecraft:string>, <minecraft:string>],
    [<minecraft:string>, <ore:blockWoolWhite>, <minecraft:string>],
    [<minecraft:string>, <minecraft:string>, <minecraft:string>]]
);

recipes.remove(<exnihilocreatio:item_mesh:2>);
recipes.addShaped("ia_flint_mesh", <exnihilocreatio:item_mesh:2>, [
	[<excompressum:compressed_block:5>, <roots:runic_dust>, <excompressum:compressed_block:5>], 
	[<roots:wildewheet>, <exnihilocreatio:item_mesh:1>, <roots:wildewheet>], 
	[<excompressum:compressed_block:5>, <roots:runic_dust>, <excompressum:compressed_block:5>]
]);
mods.roots.Pyre.addRecipe("flint_mesh", <exnihilocreatio:item_mesh:2>, [
	<exnihilocreatio:item_mesh:1>, <excompressum:compressed_block:5>, <roots:runic_dust>, <roots:wildewheet>, <roots:wildewheet>
]);

recipes.remove(<exnihilocreatio:item_mesh:3>);
recipes.addShaped("ia_iron_mesh", <exnihilocreatio:item_mesh:3>, [
	[<ore:stickSteel>, <contenttweaker:duraluminum_rod>, <ore:stickSteel>], 
	[<ore:stickSteel>, <exnihilocreatio:item_mesh:2>, <ore:stickSteel>], 
	[<ore:stickSteel>, <contenttweaker:duraluminum_rod>, <ore:stickSteel>]
]);

recipes.remove(<exnihilocreatio:item_mesh:4>);
recipes.addShaped("ia_diamond_mesh", <exnihilocreatio:item_mesh:4>, [
	[<contenttweaker:mekanized_steel_rod>, <betternether:cincinnasite_block>, <contenttweaker:mekanized_steel_rod>], 
	[<ore:stickIridium>, <exnihilocreatio:item_mesh:3>, <ore:stickIridium>], 
	[<contenttweaker:mekanized_steel_rod>, <betternether:cincinnasite_block>, <contenttweaker:mekanized_steel_rod>]
]);

recipes.addShaped("ia_uranium_mesh", <contenttweaker:uranium_mesh>, [
	[<quantumflux:craftingpiece:2>, <extendedcrafting:singularity:66>, <quantumflux:craftingpiece:2>], 
	[<extendedcrafting:singularity:32>, <exnihilocreatio:item_mesh:4>, <extendedcrafting:singularity:32>], 
	[<quantumflux:craftingpiece:2>, <extendedcrafting:singularity:66>, <quantumflux:craftingpiece:2>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:weather_chrome_mesh>, [
	[<enderio:item_capacitor_melodic>, <enderio:item_material:18>, <extendedcrafting:singularity:33>, <enderio:item_material:18>, <enderio:item_capacitor_melodic>], 
	[<enderio:item_material:18>, <contenttweaker:uranium_mesh>, <contenttweaker:life>, <contenttweaker:uranium_mesh>, <enderio:item_material:18>], 
	[<extendedcrafting:singularity:33>, <contenttweaker:life>, <extendedcrafting:frame>, <contenttweaker:life>, <extendedcrafting:singularity:33>], 
	[<enderio:item_material:18>, <contenttweaker:uranium_mesh>, <contenttweaker:life>, <contenttweaker:uranium_mesh>, <enderio:item_material:18>], 
	[<enderio:item_capacitor_melodic>, <enderio:item_material:18>, <extendedcrafting:singularity:33>, <enderio:item_material:18>, <enderio:item_capacitor_melodic>]
]);


recipes.remove(<excompressum:auto_sieve>);
recipes.addShaped("ia_auto_sieve", <excompressum:auto_sieve>, [
	[<ore:plateSteel>, <exnihilocreatio:block_sieve>, <ore:plateSteel>], 
	[<ore:paneGlassColorless>, <thermalexpansion:frame:64>, <ore:paneGlassColorless>], 
	[<ore:plateSteel>, <exnihilocreatio:block_sieve>, <ore:plateSteel>]
]);
recipes.remove(<excompressum:auto_heavy_sieve>);
recipes.addShaped("ia_auto_heavy_sieve", <excompressum:auto_heavy_sieve>, [
	[<contenttweaker:duraluminum_plate>, <contenttweaker:research_sieving>.reuse(), <contenttweaker:duraluminum_plate>], 
	[<excompressum:auto_sieve>, <thermalexpansion:frame>, <excompressum:auto_sieve>], 
	[<contenttweaker:duraluminum_plate>, <excompressum:heavy_sieve>, <contenttweaker:duraluminum_plate>]
]);




//
recipes.remove(<excompressum:compressed_block:4>);

//dirt
Compost.addRecipe(<ore:dustWood>, 0.125, "c9a889", <minecraft:dirt>);
Compost.addRecipe(<mysticalworld:silkworm_egg>, 0.05, "735827", <minecraft:dirt>);
Compost.addRecipe(<contenttweaker:primitive_eyes>, 0.167, "aa4342", <minecraft:dirt>);
Compost.addRecipe(<ore:listAllseed>, 0.08, "269023", <minecraft:dirt>);
Compost.addRecipe(<immersiveengineering:seed>, 0.08, "269023", <minecraft:dirt>);
Compost.addRecipe(<actuallyadditions:item_canola_seed>, 0.08, "269023", <minecraft:dirt>);
Compost.addRecipe(<contenttweaker:chewed_meat>, 0.5, "269023", <minecraft:dirt>);
Compost.addRecipe(<biomesoplenty:plant_0:11>, 0.1, "269023", <minecraft:dirt>);
Compost.addRecipe(<biomesoplenty:plant_0:12>, 0.1, "269023", <minecraft:dirt>);

Compost.addRecipe(<roots:wildroot>, 0.1, "735827", <minecraft:dirt>);

Compost.addRecipe(<xreliquary:mob_ingredient:2>, 0.25, "269023", <minecraft:dirt>);
Compost.addRecipe(<xreliquary:mob_ingredient:3>, 0.25, "269023", <minecraft:dirt>);
Compost.addRecipe(<xreliquary:mob_ingredient:4>, 0.25, "269023", <minecraft:dirt>);
Compost.addRecipe(<xreliquary:mob_ingredient:5>, 0.25, "269023", <minecraft:dirt>);
Compost.addRecipe(<xreliquary:mob_ingredient:6>, 0.25, "269023", <minecraft:dirt>);
Compost.addRecipe(<xreliquary:mob_ingredient:12>, 0.25, "269023", <minecraft:dirt>);
Compost.addRecipe(<xreliquary:mob_ingredient:16>, 0.25, "269023", <minecraft:dirt>);

Compost.addRecipe(<mod_lavacow:chitin>, 0.1, "b18a6d", <minecraft:dirt>);
Compost.addRecipe(<mod_lavacow:intestine>, 0.125, "aa4342", <minecraft:dirt>);

Compost.addRecipe(<ore:itemSkull>, 0.5, "269023", <minecraft:dirt>);



//mycelium
Sieve.addFlintMeshRecipe(<minecraft:mycelium>, <exnihilocreatio:item_material:3>, 0.25);
Sieve.addFlintMeshRecipe(<minecraft:mycelium>, <minecraft:brown_mushroom>, 0.05);
Sieve.addFlintMeshRecipe(<minecraft:mycelium>, <minecraft:red_mushroom>, 0.05);
Sieve.addFlintMeshRecipe(<minecraft:mycelium>, <harvestcraft:whitemushroomitem>, 0.03);

Sieve.addIronMeshRecipe(<minecraft:mycelium>, <exnihilocreatio:item_material:3>, 0.35);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <exnihilocreatio:item_material:3>, 0.35);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <minecraft:brown_mushroom>, 0.1);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <minecraft:red_mushroom>, 0.1);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <harvestcraft:whitemushroomitem>, 0.05);

Sieve.addIronMeshRecipe(<minecraft:mycelium>, <erebus:dark_capped_mushroom>, 0.02);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <erebus:sarcastic_czech_mushroom>, 0.02);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <erebus:grandmas_shoes_mushroom>, 0.02);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <erebus:dutch_cap_mushroom>, 0.02);
Sieve.addIronMeshRecipe(<minecraft:mycelium>, <erebus:kaizers_fingers_mushroom>, 0.02);

//strange sand
Sieve.addIronMeshRecipe(<atum:sand>, <contenttweaker:relic_nugget>, 0.05);

Sieve.addIronMeshRecipe(<atum:marl>, <atum:loot_dirty_ring>, 0.05);
Sieve.addIronMeshRecipe(<atum:marl>, <atum:loot_dirty_broach>, 0.05);
Sieve.addIronMeshRecipe(<atum:marl>, <atum:loot_dirty_necklace>, 0.03);
Sieve.addIronMeshRecipe(<atum:marl>, <atum:loot_dirty_scepter>, 0.02);
Sieve.addIronMeshRecipe(<atum:marl>, <atum:loot_dirty_idol>, 0.01);

//mesh, sand type, item, chance
static sievables as WeightedItemStack[][IItemStack][string] = {
	flintMesh: {
		<exnihilocreatio:block_skystone_crushed>: [
			<appliedenergistics2:material:45> % 50,
			<appliedenergistics2:material:45> % 50,
			<appliedenergistics2:material:45> % 50,
			<appliedenergistics2:material:45> % 50,
		]
	},
	ironMesh: {
		<minecraft:gravel>: [
			<exnihilocreatio:item_ore_gold> % 25,
			<exnihilocreatio:item_ore_silver> % 25,
			<exnihilocreatio:item_ore_lead> % 25,
			<exnihilocreatio:item_ore_osmium> % 25
		],
		<minecraft:sand:1>: [
			<minecraft:redstone> % 5,
			<minecraft:glowstone_dust> % 5
		],

		<exnihilocreatio:block_skystone_crushed>: [
			<appliedenergistics2:material:45> % 10,
			<exnihilocreatio:item_ore_nickel> % 40,
			<mysticalagriculture:crafting:5> % 25,
			<appliedenergistics2:material:2> % 60
		],

		<contenttweaker:lapis_gravel>: [
			<enderio:item_material:32> % 10,
			<contenttweaker:dolomite> % 25,
			<appliedenergistics2:material:2> % 30,
			<exnihilocreatio:item_ore_cobalt> % 20
		]
	},
	diamondMesh: {
		<minecraft:grass>: [
			<actuallyadditions:item_worm> % 8,
			<mekanism:biofuel> % 10,
			<minecraft:clay_ball> % 30,
			<minecraft:flint> % 20,
			<exnihilocreatio:item_pebble:1> % 40,
			<exnihilocreatio:item_pebble:2> % 40,
			<exnihilocreatio:item_pebble:3> % 40
		],
		<tconstruct:soil>: [
			<exnihilocreatio:item_ore_platinum> % 20,
			<exnihilocreatio:item_ore_iridium> % 10,
			<contenttweaker:uranium_pieces> % 5,
			<exnihilocreatio:item_ore_yellorium> % 4,
			<exnihilocreatio:item_ore_tungsten> % 10,
			<exnihilocreatio:item_ore_titanium> % 15
		],
		<biomesoplenty:white_sand>: [
			<taiga:dilithium_crystal> % 2,
			<exnihilocreatio:item_ore_aluminum> % 10,
			<appliedenergistics2:material:3> % 30
		],

		<contenttweaker:lapis_gravel>: [
			<enderio:item_material:32> % 20,
			<contenttweaker:dolomite> % 30,
			<appliedenergistics2:material:2> % 30,
			<exnihilocreatio:item_ore_cobalt> % 40,
			<exnihilocreatio:item_ore_mithril> % 5
		],
		<contenttweaker:ambrosium_gravel>: [
			<exnihilocreatio:item_ore_osmium> % 15,
			<minecraft:flint> % 5,
			<contenttweaker:ambrosium_seed> % 1,
			<contenttweaker:ambrosium_dust> % 7
		]
	},
	uraniumMesh: {
		<taiga:basalt_block>: [
			<actuallyadditions:item_dust:2> % 30,
			<exnihilocreatio:item_ore_mithril> % 20,
			<contenttweaker:chrome_pieces> % 20,
			<contenttweaker:neodymium_pieces> % 10
		],
		<stygian:endmagma>: [
			<contenttweaker:palladium_pieces> % 10,
			<exnihilocreatio:item_ore_draconium> % 10,
			<biomesoplenty:crystal_shard> % 10,
			<quark:biotite> % 5
		],
		<biomesoplenty:white_sand>: [
			<taiga:dilithium_crystal> % 10,
			<exnihilocreatio:item_ore_aluminum> % 50,
			<appliedenergistics2:material:3> % 40
		],

		<excompressum:compressed_block:8>: [
			<exnihilocreatio:item_ore_lead>,
			<exnihilocreatio:item_ore_lead>,
			<exnihilocreatio:item_ore_tungsten> % 30,
			<contenttweaker:arkenium_pieces> % 10,
			<darkutils:material> % 5
		],

		<contenttweaker:ambrosium_gravel>: [
			<exnihilocreatio:item_ore_osmium> % 35,
			<contenttweaker:ambrosium_seed> % 3,
			<contenttweaker:ambrosium_dust> % 10
		]
	}
};
static meshes as IItemStack[string] = {
	flintMesh: <exnihilocreatio:item_mesh:2>,
	ironMesh: <exnihilocreatio:item_mesh:3>,
	diamondMesh: <exnihilocreatio:item_mesh:4>,
	uraniumMesh: <contenttweaker:uranium_mesh>
};
static siftables as IItemStack[string] = {
	gravel: <minecraft:gravel>,
	sand: <minecraft:sand>,
	dust: <exnihilocreatio:block_dust>,

	redsand: <minecraft:sand:1>,
	grout: <tconstruct:soil>
};

for mesh in sievables{
	for sand in sievables[mesh]{
		var rec = RecipeBuilder.newBuilder(mesh ~ "_" ~ sand.name, "large_sifter", 20);
		rec.addEnergyPerTickInput(256);

		rec.addItemInput(sand * 16);
		rec.addFluidInput(<liquid:lubricant> * 150);
		
		rec.addItemInput(meshes[mesh]);
		rec.setChance(0.0);

		for item in sievables[mesh][sand]{
			//add large sifter
			rec.addItemOutput(item.stack * 16);
			rec.setChance(item.chance * 1.2);

			//check if ex nihilo mesh
			if (mesh == "flintMesh"){
				Sieve.addFlintMeshRecipe(sand, item.stack, item.chance);
			}
			if (mesh == "ironMesh"){
				Sieve.addIronMeshRecipe(sand, item.stack, item.chance);
			}
			if (mesh == "diamondMesh"){
				Sieve.addDiamondMeshRecipe(sand, item.stack, item.chance);
			}
		}

		rec.build();
	}
}