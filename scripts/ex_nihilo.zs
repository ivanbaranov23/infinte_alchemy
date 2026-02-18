import crafttweaker.item.IItemStack;
import mods.exnihilocreatio.Sieve;

import crafttweaker.item.WeightedItemStack;
import mods.modularmachinery.RecipeBuilder;

import mods.exnihilocreatio.Compost;
//Compost.addRecipe(IIngredient, Float chance, String color, IItemStack);

import mods.exnihilocreatio.Hammer;

import scripts.recycler.addRecycle;

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
addRecycle(<excompressum:auto_sieve>, [
	<thermalexpansion:frame:64>, <thermalfoundation:material:160> * 16
]);
recipes.remove(<excompressum:auto_heavy_sieve>);
recipes.addShaped("ia_auto_heavy_sieve", <excompressum:auto_heavy_sieve>, [
	[<contenttweaker:duraluminum_plate>, <contenttweaker:research_sieving>.reuse(), <contenttweaker:duraluminum_plate>], 
	[<excompressum:auto_sieve>, <thermalexpansion:frame>, <excompressum:auto_sieve>], 
	[<contenttweaker:duraluminum_plate>, <excompressum:heavy_sieve>, <contenttweaker:duraluminum_plate>]
]);
addRecycle(<excompressum:auto_heavy_sieve>, [
	<thermalexpansion:frame>, <excompressum:auto_sieve> * 2,
	<contenttweaker:duraluminum_ingot> * 16
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
//Compost.addRecipe(<biomesoplenty:plant_0:11>, 0.1, "269023", <minecraft:dirt>);
//Compost.addRecipe(<biomesoplenty:plant_0:12>, 0.1, "269023", <minecraft:dirt>);
Compost.addRecipe(<mysticalworld:aubergine>, 0.08, "269023", <minecraft:dirt>);
Compost.addRecipe(<actuallyadditions:item_flax_seed>, 0.08, "269023", <minecraft:dirt>);
Compost.addRecipe(<bhc:red_heart>, 0.08, "e00d0d", <minecraft:dirt>);
Compost.addRecipe(<ore:slimeball>, 0.2, "269023", <minecraft:dirt>);
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

for ore in <ore:plant*>{
	Compost.addRecipe(ore, 0.2, "269023", <minecraft:dirt>);
}

/*
//dust fix
Hammer.addRecipe(
	<ore:compressed1xSand>, <excompressum:compressed_block>,
	0, 1.0, 1.0
);
*/
//sawdust fix
Hammer.addRecipe(
	<ore:logWood>, <mekanism:sawdust> * 4,
	0, 1.0, 1.0
);


//witch water mixin
scripts.jei.addJEIhint(
    [], [<liquid:lava>, <liquid:witchwater>],
    [<minecraft:cobblestone>.withDisplayName("In world mixing")],
    [<minecraft:cobblestone>, <minecraft:stone:1>, <minecraft:stone:3>, <minecraft:stone:5>]
);
scripts.jei.addJEIhint(
    [], [<liquid:water>, <liquid:witchwater>],
    [<minecraft:cobblestone>.withDisplayName("In world mixing")],
    [<minecraft:dirt>, <minecraft:dirt:1>, <minecraft:dirt:2>]
);

//doll
recipes.addShaped("ia_doll", <exnihilocreatio:item_material:5>, [
	[<exnihilocreatio:item_material:1>, <extrautils2:ingredients:2>, <exnihilocreatio:item_material:1>], 
	[null, <exnihilocreatio:item_material:1>, null], 
	[<exnihilocreatio:item_material:1>, null, <exnihilocreatio:item_material:1>]
]);
recipes.addShaped("ia_doll2", <exnihilocreatio:item_material:5>, [
	[<exnihilocreatio:item_material:1>, <contenttweaker:creosolon>, <exnihilocreatio:item_material:1>], 
	[null, <exnihilocreatio:item_material:1>, null], 
	[<exnihilocreatio:item_material:1>, null, <exnihilocreatio:item_material:1>]
]);


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
	stringMesh: {
		<minecraft:dirt>: [
			<exnihilocreatio:item_material:4> % 25,
			<exnihilocreatio:item_material:3> % 20,
			<exnihilocreatio:item_seed_sugarcane> % 20,
			<exnihilocreatio:item_seed_cactus> % 20,
			<natura:overworld_seeds> % 15,
			<natura:overworld_seeds:1> % 15,
			<actuallyadditions:item_canola_seed> % 10,
			<actuallyadditions:item_flax_seed> % 10,
			<actuallyadditions:item_rice_seed> % 10
		],
		<minecraft:dirt:1>: [
			<exnihilocreatio:item_pebble> % 50,
			<exnihilocreatio:item_pebble> % 50,
			<exnihilocreatio:item_pebble:1> % 40,
			<exnihilocreatio:item_pebble:1> % 40,
			<exnihilocreatio:item_pebble:2> % 40,
			<exnihilocreatio:item_pebble:2> % 40,
			<exnihilocreatio:item_pebble:3> % 40,
			<exnihilocreatio:item_pebble:3> % 40,
		],
		<minecraft:leaves>: [
			<minecraft:sapling> % 20,
			<minecraft:sapling:1> % 20,
			<minecraft:sapling:2> % 20,
			<minecraft:sapling:3> % 20,
			<minecraft:sapling:4> % 20,
			<minecraft:sapling:5> % 20,
			
			<biomesoplenty:sapling_0> % 5,
			<biomesoplenty:sapling_0:1> % 5,
			<biomesoplenty:sapling_0:3> % 5,
			<biomesoplenty:sapling_0:4> % 5,
			<biomesoplenty:sapling_0:5> % 5,
			<biomesoplenty:sapling_0:6> % 5,
			<biomesoplenty:sapling_0:7> % 5,
			<biomesoplenty:sapling_1:1> % 5,
			<biomesoplenty:sapling_1:2> % 5,
			<biomesoplenty:sapling_1:3> % 5,
			<biomesoplenty:sapling_1:4> % 5,
			<biomesoplenty:sapling_1:6> % 5,
			<biomesoplenty:sapling_2> % 5,
			<biomesoplenty:sapling_2:1> % 5,
			<biomesoplenty:sapling_2:2> % 5,
			<biomesoplenty:sapling_2:3> % 5,
			<biomesoplenty:sapling_2:4> % 5,
			<biomesoplenty:sapling_2:5> % 5,
			<biomesoplenty:sapling_2:6> % 5,
			<biomesoplenty:sapling_2:7> % 5,
			<quark:variant_sapling> % 5,
			<quark:variant_sapling:1> % 5,
			
		],

		<minecraft:gravel>: [
			<minecraft:flint> % 60
		],

		<minecraft:sand>: [
			<appliedenergistics2:material:3> % 20
		],
		<natura:nether_heat_sand>: [
			<minecraft:blaze_powder> % 40,
			<erebus:small_plant:4> % 10,
			<tconstruct:edible:4> % 10
		],
		<minecraft:soul_sand>: [
			<agricraft:agri_nugget:2> % 90,
			<agricraft:agri_nugget:2> % 30,
			<agricraft:agri_nugget:2> % 10,
			<appliedenergistics2:material:2> % 10
		],
		

		<exnihilocreatio:block_granite_crushed>: [
			<exnihilocreatio:item_pebble:1> * 2,
			<exnihilocreatio:item_pebble:1> * 2 % 80,
			<exnihilocreatio:item_pebble:1> * 2 % 75,
			<exnihilocreatio:item_pebble:1> % 75,
			<exnihilocreatio:item_pebble:1> % 70,
			<exnihilocreatio:item_pebble:1> % 65,
			<exnihilocreatio:item_pebble:1> % 60
		],
		<exnihilocreatio:block_diorite_crushed>: [
			<exnihilocreatio:item_pebble:2> * 2,
			<exnihilocreatio:item_pebble:2> * 2 % 80,
			<exnihilocreatio:item_pebble:2> * 2 % 75,
			<exnihilocreatio:item_pebble:2> % 75,
			<exnihilocreatio:item_pebble:2> % 70,
			<exnihilocreatio:item_pebble:2> % 65,
			<exnihilocreatio:item_pebble:2> % 60
		],
		<exnihilocreatio:block_andesite_crushed>: [
			<exnihilocreatio:item_pebble:3> * 2,
			<exnihilocreatio:item_pebble:3> * 2 % 80,
			<exnihilocreatio:item_pebble:3> * 2 % 75,
			<exnihilocreatio:item_pebble:3> % 75,
			<exnihilocreatio:item_pebble:3> % 70,
			<exnihilocreatio:item_pebble:3> % 65,
			<exnihilocreatio:item_pebble:3> % 60
		],

		<contenttweaker:slimy_sand>: [
			<contenttweaker:slime_shard> % 75,
			<contenttweaker:slime_shard> % 50,
			<contenttweaker:slime_shard> % 25,
			<contenttweaker:slime_shard> % 10
		]
	},
	flintMesh: {
		<exnihilocreatio:block_skystone_crushed>: [
			<appliedenergistics2:material:45> % 50,
			<appliedenergistics2:material:45> % 50,
			<appliedenergistics2:material:45> % 50,
			<appliedenergistics2:material:45> % 50,
		],

		<minecraft:sand>: [
			<appliedenergistics2:material:3> % 30,
			<minecraft:dye:3> % 10
		],
		<minecraft:sand:1>: [
			<minecraft:redstone> % 25
		],
		<minecraft:soul_sand>: [
			<minecraft:quartz> % 40,
			<appliedenergistics2:material:2> % 15
		],
		<natura:nether_heat_sand>: [
			<minecraft:blaze_powder> % 60,
			<erebus:small_plant:4> % 30,
			<tconstruct:edible:4> % 20
		],

		<minecraft:gravel>: [
			<exnihilocreatio:item_ore_iron> % 60,
			<exnihilocreatio:item_ore_copper> % 40,
			<exnihilocreatio:item_ore_tin> % 20
		],
		<contenttweaker:ferramic_gravel>: [
			<exnihilocreatio:item_ore_aluminum> % 75,
			<exnihilocreatio:item_ore_aluminum> % 25,
			<exnihilocreatio:item_ore_zinc> % 25
		],
		<contenttweaker:dried_gravel>: [
			<exnihilocreatio:item_ore_nickel> % 50,
			<exnihilocreatio:item_ore_nickel> % 25
		],
		
		<exnihilocreatio:block_granite_crushed>: [
			<exnihilocreatio:item_ore_copper> % 75,
			<exnihilocreatio:item_ore_copper> % 50,
			<exnihilocreatio:item_ore_copper> % 10
		],
		<exnihilocreatio:block_diorite_crushed>: [
			<exnihilocreatio:item_ore_tin> % 75,
			<exnihilocreatio:item_ore_tin> % 50,
			<exnihilocreatio:item_ore_tin> % 10
			
		],
		<exnihilocreatio:block_andesite_crushed>: [
			<exnihilocreatio:item_ore_iron> % 75,
			<exnihilocreatio:item_ore_iron> % 50,
			<exnihilocreatio:item_ore_iron> % 10
		],

		<exnihilocreatio:block_dust>: [
			<minecraft:dye:15> % 20
		],

		<exnihilocreatio:block_netherrack_crushed>: [
			<exnihilocreatio:item_ore_gold> % 20
		],

		<natura:nether_tainted_soil>: [
			<biomesoplenty:dirt:2> % 10,
			<biomesoplenty:dirt:1> % 10,
			<biomesoplenty:dirt> % 10,
			<minecraft:dirt:1> % 10,
			<minecraft:clay_ball> % 10
		],
		<biomesoplenty:dirt:2>: [
			<thermalfoundation:material:772> % 15,
			<agricraft:agri_nugget:2> % 5
		],

		<biomesoplenty:dried_sand>: [
			<exnihilocreatio:item_ore_zinc> % 60,
			<exnihilocreatio:item_ore_zinc> % 20,
			<exnihilocreatio:item_ore_nickel> % 30,
			<contenttweaker:antimony_pieces> % 20
		]
	},
	ironMesh: {
		<contenttweaker:slimy_sand>: [
			<exnihilocreatio:item_ore_gold> % 15,
			<exnihilocreatio:item_ore_silver> % 15,
			<exnihilocreatio:item_ore_lead> % 15,
			<exnihilocreatio:item_ore_osmium> % 15
		],
		<contenttweaker:iron_sand>: [
			<exnihilocreatio:item_ore_gold> % 25,
			<exnihilocreatio:item_ore_silver> % 25,
			<exnihilocreatio:item_ore_lead> % 25,
			<exnihilocreatio:item_ore_osmium> % 25
		],
		<minecraft:sand:1>: [
			<minecraft:redstone> % 35,
			<minecraft:glowstone_dust> % 15
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
		],

		<minecraft:sand>: [
			<exnihilocreatio:item_ore_zinc> % 40
		],
		<minecraft:soul_sand>: [
			<exnihilocreatio:item_ore_lead> % 50
		],
		<natura:nether_heat_sand>: [
			<minecraft:blaze_powder> % 80,
			<erebus:small_plant:4> % 40,
			<tconstruct:edible:4> % 20,
			<tconstruct:slime_sapling:2> % 1
		],

		<exnihilocreatio:block_dust>: [
			<minecraft:dye:15> % 40,
			<appliedenergistics2:material:45> % 20
		],

		<exnihilocreatio:block_netherrack_crushed>: [
			<exnihilocreatio:item_ore_gold> % 35,
			<exnihilocreatio:item_ore_cobalt> % 20,
			<exnihilocreatio:item_ore_ardite> % 20
		],

		<biomesoplenty:dirt:2>: [
			<thermalfoundation:material:772> % 40,
			<agricraft:agri_nugget:2> % 40,
			<agricraft:agri_nugget:2> % 10
		],

		<biomesoplenty:dried_sand>: [
			<contenttweaker:antimony_pieces> % 50
		],
		<biomesoplenty:flesh>: [
			<mod_lavacow:mousse> % 25,
			<minecraft:porkchop> % 2,
			<minecraft:beef> % 2,
			<minecraft:chicken> % 2,
			<minecraft:rabbit> % 2,
			<minecraft:mutton> % 2,
			<harvestcraft:turkeyrawitem> % 2,
			<harvestcraft:venisonrawitem> % 2,
			<harvestcraft:duckrawitem> % 2,
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
		<netherblocks:crying_obsidian>: [
			<exnihilocreatio:item_ore_platinum> % 1,
			<exnihilocreatio:item_ore_iridium> % 1,
			<contenttweaker:uranium_pieces> % 1,
			<exnihilocreatio:item_ore_yellorium> % 1,
			<exnihilocreatio:item_ore_tungsten> % 1,
			<exnihilocreatio:item_ore_titanium> % 1
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
	stringMesh: <exnihilocreatio:item_mesh:1>,
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
		rec.addFluidInput(<liquid:lubricant> * 50);
		
		rec.addItemInput(meshes[mesh]);
		rec.setChance(0.0);

		for item in sievables[mesh][sand]{
			//add large sifter
			rec.addItemOutput(item.stack * 16);
			rec.setChance(item.chance * 1.2);

			//check if ex nihilo mesh
			if (mesh == "stringMesh"){
				Sieve.addStringMeshRecipe(sand, item.stack, item.chance);
			}
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