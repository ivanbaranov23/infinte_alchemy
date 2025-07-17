import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;

import mods.bloodmagic.AlchemyTable;
//AlchemyTable.addRecipe(IItemStack output, IItemStack[] inputs, int syphon, int ticks, int minTier);

import mods.bloodmagic.TartaricForge;
//TartaricForge.removeRecipe([]);
//TartaricForge.addRecipe(IItemStack output, IItemStack[] inputs, double minSouls, double soulDrain);

import mods.bloodmagic.BloodAltar;
//BloodAltar.addRecipe(IItemStack output, IItemStack input, int minimumTier, int syphon, int consumeRate, int drainRate);

//mods.bloodmagic.AlchemyArray.addRecipe(IItemStack output, IItemStack input, IItemStack catalyst, @Optional string textureLocation);



val any_orbs as IIngredient[] = [
	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}),
	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}),
	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}),

	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}),
	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}) | <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}),
	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"})
];


recipes.addShapeless("soul_posion", <contenttweaker:soul_poison>, [
		<contenttweaker:ophidian_extract>, <contenttweaker:irradiated_compound>, <contenttweaker:seth_godshard>, 
		<mowziesmobs:naga_fang> | <contenttweaker:rare_earth_dust> | <contenttweaker:indium_dust> | <tconevo:metal:32>
]);

recipes.remove(<bloodmagic:soul_snare>);
scripts.content_machines.addAssemblerRecipe(
	[<bloodmagic:soul_snare> * 16, <contenttweaker:reinforced_cell>],
	[
		<contenttweaker:lightning_cell>, <contenttweaker:soul_poison> * 4, 
		<contenttweaker:medical_alloy_coil> * 8, <contenttweaker:glass_fiber> * 16,
		<contenttweaker:soul_codex8>
	],
	null, 20, 256
);




function BloodAltar_addRecipe(output as IItemStack, input as IItemStack, minimumTier as int, syphon as int, consumeRate as int, drainRate as int){
	BloodAltar.addRecipe(output, input, minimumTier, syphon, consumeRate, drainRate);

	if (4 > minimumTier){
		var rec = RecipeBuilder.newBuilder(input.displayName, "blood_altar", 3 * syphon / consumeRate);

		rec.addEnergyPerTickInput(2048);

		rec.addItemOutput(output);
		
		rec.addItemInput(input);

		rec.addFluidInput(<liquid:lifeessence> * (syphon * 2));
		rec.build();
	}
}
{//blood altar subprocessor
	//bloody gearbox
	scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:bloody_gearbox_inactive>], null, 
        [
			<modularmachinery:blockcasing:3>,
			<contenttweaker:gearbox_normal> * 4,
			<contenttweaker:awaken_uru_gear> | <contenttweaker:living_steel_gear> | <contenttweaker:proxii_gear>,
			<contenttweaker:blood_bronze_gear> * 2,
			<bloodmagic:component:12> * 4,
			<bloodmagic:slate:4>
		], 
		[
			<liquid:evil_blood> * 1000
		], 
		<contenttweaker:flesh_support>,
        20, 20
	);
	BloodAltar_addRecipe(<contenttweaker:bloody_gearbox>, <contenttweaker:bloody_gearbox_inactive>, 3, 25000, 20, 20);

	//bloody sheetmetal
	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:bloody_sheetmetal>], null,
		[
			<contenttweaker:flesh_support>,
			<contenttweaker:living_steel_sheetmetal>,
			<contenttweaker:advanced_plating4_2> * 6,

		],
		[
			<liquid:evil_blood> * 1000
		], 
		<contenttweaker:flesh_support>,
        20, 20
	);
}

{
	TartaricForge.addRecipe(<contenttweaker:blood_gem>, [
		<contenttweaker:zorra_steel_gem>,
		<extendedcrafting:singularity_custom:9>,
		<extendedcrafting:singularity:6>,
		<bhc:yellow_heart>
	], 32, 24);
	BloodAltar_addRecipe(<contenttweaker:blood_gem>, <contenttweaker:zorra_steel_gem>, 0, 10000, 250, 10);
}

{//blood altar
	BloodAltar_addRecipe(<tconstruct:edible:3>, <actuallyadditions:item_misc:12>, 0, 500, 50, 50);
	BloodAltar_addRecipe(<erebus:life_blood>, <tconstruct:edible:3>, 0, 1000, 50, 50);

	//orbs
	BloodAltar.removeRecipe(<minecraft:diamond>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), [
		[null, <bloodmagic:component:3>, <bloodmagic:component:3>, <bloodmagic:component:3>, null], 
		[<bloodmagic:component:2>, <bloodmagic:soul_gem>.withTag({souls: 64.0}), <bloodmagic:component:3>, <bloodmagic:soul_gem>.withTag({souls: 64.0}), <bloodmagic:component>], 
		[<bloodmagic:component:2>, <bloodmagic:component:2>, <extendedcrafting:singularity_custom:9>, <bloodmagic:component>, <bloodmagic:component>], 
		[<bloodmagic:component:2>, <bloodmagic:soul_gem>.withTag({souls: 64.0}), <bloodmagic:component:1>, <bloodmagic:soul_gem>.withTag({souls: 64.0}), <bloodmagic:component>], 
		[null, <bloodmagic:component:1>, <bloodmagic:component:1>, <bloodmagic:component:1>, null]
	]);
	//BloodAltar_addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), <contenttweaker:elemental_clay>, 1, 5000, 10, 5);

	BloodAltar.removeRecipe(<minecraft:redstone_block>);
	BloodAltar_addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), <contenttweaker:elemental_clay>, 1, 12500, 30, 15);

	BloodAltar.removeRecipe(<minecraft:gold_block>);
	BloodAltar_addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), <contenttweaker:alchemical_brass_gear>, 2, 30000, 150, 100);

	BloodAltar.removeRecipe(<bloodmagic:blood_shard>);
	BloodAltar_addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}), <contenttweaker:bouncy_matter>, 3, 60000, 60000 / (20 * 15), 100);

	BloodAltar.removeRecipe(<minecraft:nether_star>);
	AlchemyTable.addRecipe(<contenttweaker:chitin_ball>, 
		[
			<contenttweaker:chitin>,
			<contenttweaker:chitin>,
			<minecraft:nether_star>,
			<contenttweaker:bouncy_matter>,
			<contenttweaker:flesh_spurt>,
			<extendedcrafting:singularity_custom:9>
		], 10000, 20, 4
	);
	BloodAltar_addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}), <contenttweaker:chitin_ball>, 4, 100000, 100000 / (20 * 15), 100);

	//slates
	BloodAltar.removeRecipe(<minecraft:stone>);
	BloodAltar_addRecipe(<bloodmagic:slate>, <engineersdecor:rebar_concrete>, 0, 2000, 5, 5);

	BloodAltar.removeRecipe(<bloodmagic:slate>);
	BloodAltar_addRecipe(<bloodmagic:slate:1>, <bloodmagic:slate>, 1, 5000, 25, 5);

	BloodAltar.removeRecipe(<bloodmagic:slate:1>);
	BloodAltar_addRecipe(<bloodmagic:slate:2>, <bloodmagic:slate:1>, 2, 12500, 50, 5);

	BloodAltar.removeRecipe(<bloodmagic:slate:2>);
	BloodAltar_addRecipe(<bloodmagic:slate:3>, <bloodmagic:slate:2>, 3, 30000, 100, 5);

	BloodAltar_addRecipe(<contenttweaker:slate_6>, <bloodmagic:slate:4>, 5, 75000, 500, 5);
	BloodAltar_addRecipe(<contenttweaker:slate_7>, <contenttweaker:slate_6>, 5, 100*1000, 1000, 5);
	BloodAltar_addRecipe(<contenttweaker:slate_8>, <contenttweaker:slate_7>, 5, 200*1000, 3000, 5);
	BloodAltar_addRecipe(<contenttweaker:slate_9>, <contenttweaker:slate_8>, 5, 500*1000, 7500, 5);

	BloodAltar_addRecipe(<contenttweaker:slate_10>, <contenttweaker:slate_9>, 5, 3000*1000, 10000, 5);

	BloodAltar_addRecipe(<contenttweaker:blood_spike>, <contenttweaker:black_bronze_rod>, 2, 2500, 25, 5);

	//altar caps
	recipes.remove(<bloodmagic:decorative_brick>);
	recipes.addShaped("ia_large_bloodstone_tile", <bloodmagic:decorative_brick> * 2, [
		[<bloodmagic:blood_shard>, <bloodmagic:slate:2>, <bloodmagic:blood_shard>], 
		[<bloodmagic:slate:2>, <bloodmagic:demon_extras:10>, <bloodmagic:slate:2>], 
		[<bloodmagic:blood_shard>, <bloodmagic:slate:2>, <bloodmagic:blood_shard>]
	]);
	/*recipes.addShaped("ia_crystal_cluster", <bloodmagic:decorative_brick:2>, [
		[<contenttweaker:slate_6>, <bloodmagic:demon_extras:11>, <contenttweaker:slate_6>], 
		[<bloodmagic:demon_extras:12>, <enderio:item_material:18>, <bloodmagic:demon_extras:13>], 
		[<contenttweaker:slate_6>, <bloodmagic:demon_extras:14>, <contenttweaker:slate_6>]
	]);*/
	mods.extendedcrafting.TableCrafting.addShaped(0, <bloodmagic:decorative_brick:2>, [
		[<contenttweaker:slate_6>, <enderio:item_material:18>, <enderio:item_material:18>, <enderio:item_material:18>, <contenttweaker:slate_6>], 
		[<enderio:item_material:18>, <bloodmagic:slate:4>, <bloodmagic:demon_extras:11>, <bloodmagic:slate:4>, <enderio:item_material:18>], 
		[<enderio:item_material:18>, <bloodmagic:demon_extras:12>, <bloodmagic:decorative_brick>, <bloodmagic:demon_extras:13>, <enderio:item_material:18>], 
		[<enderio:item_material:18>, <bloodmagic:slate:4>, <bloodmagic:demon_extras:14>, <bloodmagic:slate:4>, <enderio:item_material:18>], 
		[<contenttweaker:slate_6>, <enderio:item_material:18>, <enderio:item_material:18>, <enderio:item_material:18>, <contenttweaker:slate_6>]
	]);
}
{//blood shards
	BloodAltar_addRecipe(<contenttweaker:blood_shard1>, <appliedenergistics2:material:11>, 0, 5000, 100, 50);

	recipes.addShapeless("blood_shard21", <contenttweaker:blood_shard1> * 8,[<contenttweaker:blood_shard2>]);
	recipes.addShapeless("blood_shard12", <contenttweaker:blood_shard2>,[
		<contenttweaker:blood_shard1>, <contenttweaker:blood_shard1>, <contenttweaker:blood_shard1>, <contenttweaker:blood_shard1>,
		<contenttweaker:blood_shard1>, <contenttweaker:blood_shard1>, <contenttweaker:blood_shard1>, <contenttweaker:blood_shard1>
	]);
	recipes.addShapeless("blood_shard32", <contenttweaker:blood_shard2> * 8,[<contenttweaker:blood_shard3>]);
	recipes.addShapeless("blood_shard23", <contenttweaker:blood_shard3>,[
		<contenttweaker:blood_shard2>, <contenttweaker:blood_shard2>, <contenttweaker:blood_shard2>, <contenttweaker:blood_shard2>,
		<contenttweaker:blood_shard2>, <contenttweaker:blood_shard2>, <contenttweaker:blood_shard2>, <contenttweaker:blood_shard2>
	]);
	recipes.addShapeless("blood_shard43", <contenttweaker:blood_shard3> * 8,[<contenttweaker:blood_shard4>]);
	recipes.addShapeless("blood_shard34", <contenttweaker:blood_shard4>,[
		<contenttweaker:blood_shard3>, <contenttweaker:blood_shard3>, <contenttweaker:blood_shard3>, <contenttweaker:blood_shard3>,
		<contenttweaker:blood_shard3>, <contenttweaker:blood_shard3>, <contenttweaker:blood_shard3>, <contenttweaker:blood_shard3>
	]);

	mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:lifeessence> * 4000, <contenttweaker:blood_shard1>, 3000);
	mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:lifeessence> * 8000, <contenttweaker:blood_shard2>, 5000, <contenttweaker:blood_shard1> * 6);

	mods.tconstruct.Melting.addRecipe(<liquid:lifeessence> * (4000), <contenttweaker:blood_shard1>);
	mods.tconstruct.Melting.addRecipe(<liquid:lifeessence> * (4000*8), <contenttweaker:blood_shard2>);
	mods.tconstruct.Melting.addRecipe(<liquid:lifeessence> * (4000*8*8), <contenttweaker:blood_shard3>);
	mods.tconstruct.Melting.addRecipe(<liquid:lifeessence> * (4000*8*8*8), <contenttweaker:blood_shard4>);
}
{//inscrib tools
	BloodAltar.removeRecipe(<minecraft:lapis_block>);
	BloodAltar.removeRecipe(<minecraft:magma_cream>);
	BloodAltar.removeRecipe(<minecraft:obsidian>);
	BloodAltar.removeRecipe(<minecraft:ghast_tear>);

	BloodAltar_addRecipe(<bloodmagic:inscription_tool:1>.withTag({uses: 10}), <contenttweaker:advanced_cryotheum>, 3, 16000, 1600, 16);
	BloodAltar_addRecipe(<bloodmagic:inscription_tool:2>.withTag({uses: 10}), <contenttweaker:advanced_pyrotheum>, 3, 16000, 1600, 16);
	BloodAltar_addRecipe(<bloodmagic:inscription_tool:3>.withTag({uses: 10}), <contenttweaker:advanced_petrotheum>, 3, 16000, 1600, 16);
	BloodAltar_addRecipe(<bloodmagic:inscription_tool:4>.withTag({uses: 10}), <contenttweaker:advanced_aerotheum>, 3, 16000, 1600, 16);

	recipes.addShapeless("ia_inscription_manual_1", <bloodmagic:ritual_stone:1>, [<bloodmagic:ritual_stone>, <bloodmagic:inscription_tool:1>.reuse()]);
	recipes.addShapeless("ia_inscription_manual_2", <bloodmagic:ritual_stone:2>, [<bloodmagic:ritual_stone>, <bloodmagic:inscription_tool:2>.reuse()]);
	recipes.addShapeless("ia_inscription_manual_3", <bloodmagic:ritual_stone:3>, [<bloodmagic:ritual_stone>, <bloodmagic:inscription_tool:3>.reuse()]);
	recipes.addShapeless("ia_inscription_manual_4", <bloodmagic:ritual_stone:4>, [<bloodmagic:ritual_stone>, <bloodmagic:inscription_tool:4>.reuse()]);
	
}

function addSoulRecipe(inp as IIngredient, outp as IItemStack, soul as double, corner as IIngredient){
	recipes.addShaped("soul_" ~ outp.displayName, outp.withLore(["Minimum " ~ soul ~ " will in total", "note: you won't get change"]),
		[
			[corner, <bloodmagic:monster_soul>.marked("s1"), corner],
			[<bloodmagic:monster_soul>.marked("s2"), inp, <bloodmagic:monster_soul>.marked("s3")],
			[corner, <bloodmagic:monster_soul>.marked("s4"), corner]
		],
		function(out, ins, cInfo){
			var total as double = 0.0;
			total += ins.s1.tag.souls.asDouble();
			total += ins.s2.tag.souls.asDouble();
			total += ins.s3.tag.souls.asDouble();
			total += ins.s4.tag.souls.asDouble();
			if (total >= soul) return out;
			return null;
		}, null
	);
}
{//ingots
	BloodAltar_addRecipe(<bloodtinker:blood_bronze_ingot>, <contenttweaker:black_bronze_ingot>, 0, 4000, 50, 250);
	BloodAltar_addRecipe(<bloodtinker:blood_bronze_block>, <contenttweaker:black_bronze_block>, 0, 32000, 500, 500);

	BloodAltar_addRecipe(<tconevo:metal:25>, <bloodtinker:blood_bronze_ingot>, 3, 30000, 1000, 5000);
	BloodAltar_addRecipe(<tconevo:metal_block:5>, <bloodtinker:blood_bronze_block>, 3, 30000 * 8, 5000, 10000);

	BloodAltar_addRecipe(<contenttweaker:crystal_metal_ingot>, <tconevo:metal:25>, 5, 200000, 2000, 5000);
	BloodAltar_addRecipe(<contenttweaker:crystal_metal_block>, <tconevo:metal_block:5>, 5, 200000 * 8, 10000, 10000);


	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:soul_reflector_base> * 4],
		[
			<contenttweaker:insulation_fabric> * 4, 
			<contenttweaker:mana_wire> * 12,
			<contenttweaker:soul_poison> * 4,
			<contenttweaker:glass_cloth> * 48
		], null,
		40, 1000
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:soul_reflector_base> * 8],
		[
			<contenttweaker:insulation_fabric> * 8, 
			<contenttweaker:mana_wire> * 16,
			<contenttweaker:soul_poison> * 8,
			<contenttweaker:advanced_plating2_2> * 4
		], null,
		40, 1000
	);
	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:soul_reflector_base> * 20],
		[
			<contenttweaker:insulation_fabric> * 8, 
			<contenttweaker:mana_wire> * 20,
			<contenttweaker:soul_poison> * 8,
			<contenttweaker:perfect_mirror>
		], <liquid:sentient_metal> * 72,
		80, 1000
	);

	addSoulRecipe(<contenttweaker:soul_reflector_base>, <contenttweaker:soul_reflector>, 4.0, null);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:soul_reflector>,
		<contenttweaker:soul_reflector_base>, <liquid:sentient_metal> * 72,
		5000
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<contenttweaker:will_absorbing_ingot> * 8, <contenttweaker:methyst_dirty_dust> * 2], [],
		[<contenttweaker:methyst> * 2, <contenttweaker:soul_reflector>, <contenttweaker:amethyst_ingot> * 6, <mod_lavacow:ectoplasm_ingot> * 16],
		[<liquid:vapor_of_levity> * 1000, <liquid:ignitz_fluid> * 576, <liquid:arkenium> * 576],
		40, 1000
	);
	addSoulRecipe(<contenttweaker:will_absorbing_ingot>, <tconevo:metal:30> * 4, 8.0, <contenttweaker:will_absorbing_ingot>);
	TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <tconevo:material>]);
	TartaricForge.addRecipe(<tconevo:metal:30> * 2, [
		<contenttweaker:will_absorbing_ingot>, <tconevo:material>, <contenttweaker:basic_neuron>, <contenttweaker:enittin>
	], 12.0, 8.0);
}


{//runes
	mods.enderio.AlloySmelter.addRecipe(<contenttweaker:blood_runic_dust>, 
		[<erebus:life_blood> * 4, <contenttweaker:malachite_polycrystal> * 12, <moretcon:dustrunesteel> * 2], 
		10000
	);

	recipes.remove(<bloodmagic:blood_rune:*>);
	recipes.addShaped("ia_blood_rune", <bloodmagic:blood_rune>, [
		[<engineersdecor:rebar_concrete>, <bloodmagic:slate>, <engineersdecor:rebar_concrete>], 
		[<contenttweaker:blood_runic_dust>, any_orbs[0], <contenttweaker:blood_runic_dust>], 
		[<engineersdecor:rebar_concrete>, <bloodmagic:slate>, <engineersdecor:rebar_concrete>]
	]);

	//t1 runes
	TartaricForge.addRecipe(<bloodmagic:blood_rune:1>, [
		<bloodmagic:blood_rune>, <contenttweaker:blood_runic_dust>, <bloodmagic:slate:1>, <mekanism:speedupgrade>
	], 32, 16);
	TartaricForge.addRecipe(<bloodmagic:blood_rune:6>, [
		<bloodmagic:blood_rune>, <contenttweaker:blood_runic_dust>, <bloodmagic:slate:1>, <mekanism:energyupgrade>
	], 32, 16);

	//t2 runes
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:3>, 
		[
			<xreliquary:mob_ingredient:6>,
			<contenttweaker:blood_runic_dust>,
			<contenttweaker:blood_spike>,
			<contenttweaker:blood_bronze_plate>,
			<bloodmagic:slate:2>,
			<bloodmagic:blood_rune>
		], 
		4 * 1000, 200, 3
	);
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:4>, 
		[
			<bhc:red_heart>,
			<contenttweaker:blood_runic_dust>,
			<contenttweaker:blood_spike>,
			<contenttweaker:blood_bronze_plate>,
			<bloodmagic:slate:2>,
			<bloodmagic:blood_rune>
		], 
		4 * 1000, 200, 3
	);

	//t3 rune
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:7>, 
		[
			<contenttweaker:tank2>,
			<contenttweaker:blood_runic_dust>,
			<actuallyadditions:block_giant_chest>,
			<bloodmagic:blood_tank>,
			<bloodmagic:slate:3>,
			<bloodmagic:blood_rune:6>
		], 
		8 * 1000, 200, 4
	);

	//t4 rune
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:5>,
		[
			<bloodmagic:blood_rune>,
			<contenttweaker:blood_runic_dust>,
			<bloodmagic:slate:4>,
			<contenttweaker:blood_bronze_plate>,
			<moreplates:vibrant_alloy_plate>,
			<contenttweaker:elemental_clay>
		],
		16 * 1000, 200, 5
	);
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:8>,
		[
			<bloodmagic:blood_rune>,
			<contenttweaker:blood_runic_dust>,
			<bloodmagic:slate:4>,
			<contenttweaker:blood_bronze_plate>,
			<enderio:item_material:15>,
			<contenttweaker:yrdeen_plate>
		],
		16 * 1000, 200, 5
	);
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:10>,
		[
			<bloodmagic:blood_rune>,
			<contenttweaker:blood_runic_dust>,
			<bloodmagic:slate:4>,
			<contenttweaker:blood_bronze_plate>,
			<enderio:item_material:14>,
			<contenttweaker:electric_manyullyn_block>
		],
		16 * 1000, 200, 5
	);

	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:9>,
		[
			<bloodmagic:blood_rune:1>,
			<contenttweaker:blood_runic_dust>,
			<bloodmagic:slate:4>,
			<tconevo:metal:29>,
			<contenttweaker:proxii_plate>,
			<bloodmagic:component:13>
		],
		16 * 1000, 200, 5
	);

	//runes
	AlchemyTable.addRecipe(
		<bloodmagic:blood_rune:2>, 
		[
			<bloodmagic:blood_rune:8>,
			<bloodmagic:blood_rune:9>,
			<bloodmagic:blood_rune:10>,
			<contenttweaker:slate_8>,
			<contenttweaker:flesh_rod>,
			<contenttweaker:bouncy_matter>
		], 
		10*1000*1000, 400, 6
	);
}
{//tanks
	recipes.remove(<bloodmagic:blood_tank:*>);

	recipes.addShaped("ia_blood_tank_0", <bloodmagic:blood_tank>, [
		[<bloodmagic:slate>, <bloodmagic:decorative_brick>, <bloodmagic:slate>], 
		[<bloodmagic:slate>, null, <bloodmagic:slate>], 
		[<bloodmagic:slate>, <mekanism:machineblock2:11>.withTag({tier: 3}), <bloodmagic:slate>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<bloodmagic:blood_tank> * 2],
		[
			<bloodmagic:slate> * 3, <bloodmagic:decorative_brick>,
			<mekanism:machineblock2:11>.withTag({tier: 3})
		],
		<liquid:bloodbronze> * 36,
		5, 1000
	);

	for i in 1 to 16{
		recipes.addShaped("ia_blood_tank_" ~ i, <bloodmagic:blood_tank>.definition.makeStack(i),
			[
				[<bloodmagic:slate>, <bloodmagic:decorative_brick>, <bloodmagic:slate>],
				[<bloodmagic:blood_tank>.definition.makeStack(i - 1), null, <bloodmagic:blood_tank>.definition.makeStack(i - 1)],
				[<bloodmagic:slate>, <bloodmagic:slate>, <bloodmagic:slate>]
			]
		);
		scripts.content_machines.addAssemblerRecipe(
			[<bloodmagic:blood_tank>.definition.makeStack(i) * 2],
			[
				<bloodmagic:slate> * 3, <bloodmagic:decorative_brick>, 
				<bloodmagic:blood_tank>.definition.makeStack(i - 1) * 3
			],
			<liquid:bloodbronze> * 36,
			10, 1000*i
		);
	}
}

{//tartaric gems
	TartaricForge.removeRecipe([<minecraft:redstone>,<minecraft:gold_ingot>,<ore:blockGlass>.firstItem,<ore:dyeBlue>.firstItem]);
	TartaricForge.addRecipe(<bloodmagic:soul_gem>.withTag({}), [
		<contenttweaker:soul_poison>, <contenttweaker:osgloridium_gear>, <contenttweaker:enittin>, <enderio:item_material:76>
	], 1, 1);

	TartaricForge.removeRecipe([<bloodmagic:soul_gem>,<minecraft:diamond>,<ore:blockRedstone>.firstItem,<ore:blockLapis>.firstItem]);
	TartaricForge.addRecipe(<bloodmagic:soul_gem:1>.withTag({}), [
		<bloodmagic:soul_gem>, <bloodmagic:slate:1>, <contenttweaker:yrdeen_gear>, <contenttweaker:rainbow_crystal_cluster>
	], 64, 32);

	TartaricForge.removeRecipe([<bloodmagic:soul_gem:1>, <minecraft:diamond>, <ore:blockGold>.firstItem, <bloodmagic:slate:2>]);
	TartaricForge.addRecipe(<bloodmagic:soul_gem:2>.withTag({}), [
		<bloodmagic:soul_gem:1>, <bloodmagic:slate:2>, <contenttweaker:electricium>, <bloodmagic:component:18>
	], 256, 128);

	TartaricForge.removeRecipe([<bloodmagic:soul_gem:2>, <bloodmagic:blood_shard>, <bloodmagic:item_demon_crystal>, <bloodmagic:slate:3>]);
	TartaricForge.addRecipe(<bloodmagic:soul_gem:3>.withTag({}), [
		<bloodmagic:soul_gem:2>, <bloodmagic:slate:3>, <contenttweaker:mixed_will_crystal>, <bloodmagic:component:4>
	], 256, 128);
}
{//tartaric reagents
	//i hate blood magic ct functions

	//t1
	//clay
	

	//lava
	TartaricForge.removeRecipe([<minecraft:redstone>, <minecraft:lava_bucket>, <ore:blockCoal>.firstItem, <ore:cobblestone>.firstItem]);
	recipes.addShapeless("ia_bm_clay_fr", <contenttweaker:alchemical_clay_fr>, [<contenttweaker:alchemical_clay>, <minecraft:lingering_potion>.withTag({Potion: "minecraft:long_fire_resistance"})]);
	TartaricForge.addRecipe(<bloodmagic:component:1>, [
		<thermalfoundation:material:1024>, <contenttweaker:alchemical_clay_fr>, <contenttweaker:ra_godshard>, <contenttweaker:tignalum_blast_brick>
	], 32, 8);
	//water
	TartaricForge.removeRecipe([<minecraft:water_bucket>, <minecraft:water_bucket>, <minecraft:sugar>]);
	recipes.addShapeless("ia_bm_clay_wb", <contenttweaker:alchemical_clay_wb>, [<contenttweaker:alchemical_clay>, <minecraft:lingering_potion>.withTag({Potion: "minecraft:long_water_breathing"})]);
	TartaricForge.addRecipe(<bloodmagic:component>, [
		<thermalfoundation:material:1025>, <cookingforblockheads:sink>, <contenttweaker:tefnuts_godshard>, <contenttweaker:bucket_water_seaweed>
	], 32, 8);
	TartaricForge.addRecipe(<bloodmagic:component>, [
		<thermalfoundation:material:1025>, <cookingforblockheads:sink>, <contenttweaker:tefnuts_godshard>, <contenttweaker:alchemical_clay_wb>
	], 32, 8);
	//earth
	TartaricForge.removeRecipe([<minecraft:iron_pickaxe>,<minecraft:iron_axe>,<minecraft:iron_shovel>,<minecraft:gunpowder>]);
	recipes.addShapeless("ia_bm_clay_h", <contenttweaker:alchemical_clay_h>, [<contenttweaker:alchemical_clay>, <minecraft:potion>.withTag({Potion: "cofhcore:haste4"})]);
	<bloodmagic:component:3>.displayName = "Earth Reagent";
	TartaricForge.addRecipe(<bloodmagic:component:3>, [
		<thermalfoundation:material:1027>, <roots:elemental_soil_air>, <contenttweaker:geb_godshard>, <harvestcraft:minerstewitem>
	], 32, 8);
	//air
	TartaricForge.removeRecipe([<minecraft:ghast_tear>,<ore:feather>.firstItem,<ore:feather>.firstItem]);
	recipes.addShapeless("ia_bm_clay_jb", <contenttweaker:alchemical_clay_jb>, [<contenttweaker:alchemical_clay>, <minecraft:potion>.withTag({Potion: "cofhcore:leaping4"})]);
	TartaricForge.addRecipe(<bloodmagic:component:2>, [
		<thermalfoundation:material:1026>, <aether_legacy:skyroot_bucket:3>, <contenttweaker:shu_godshard>, <openblocks:fan>
	], 32, 8);

	//t1.5
	//oil
	TartaricForge.addRecipe(<contenttweaker:reagent_oil>, [
		<immersivepetroleum:stone_decoration>,
		<harvestcraft:oliveoilitem>,
		<thermalfoundation:material:833>,
		<contenttweaker:charcoal_ball>
	], 32, 8);
	//glass
	TartaricForge.addRecipe(<contenttweaker:reagent_glass>, [
		<extendedcrafting:singularity_custom:3>, 
		<contenttweaker:noble_gases_ingot>,
		<contenttweaker:laser_mirror>,
		<thermalfoundation:storage:2>
	], 32, 8);
	//ice
	TartaricForge.removeRecipe([<minecraft:ice>, <minecraft:snowball>, <minecraft:snowball>, <minecraft:redstone>]);
	TartaricForge.addRecipe(<bloodmagic:component:32>, [
		<bloodmagic:component:2>,
		<bloodmagic:component>,
		<aether_legacy:ice_ring>,
		<cookingforblockheads:fridge>
	], 32, 16);

	//t2
	//plant
	TartaricForge.removeRecipe([<ore:treeSapling>.firstItem,<ore:treeSapling>.firstItem,<ore:sugarcane>.firstItem,<minecraft:sugar>]);
	
	TartaricForge.addRecipe(<bloodmagic:component:5> * 4, [
		<atum:fertile_soil>, <contenttweaker:enmaned_biomass>, <contenttweaker:flower_steel_plate>, <betternether:eye_seed>
	], 100, 16);
	TartaricForge.addRecipe(<bloodmagic:component:5>, [
		<atum:fertile_soil>, <contenttweaker:enmaned_biomass>, <contenttweaker:flower_steel_plate>, <botania:flower:*>
	], 100, 64);
	//magnet
	TartaricForge.removeRecipe([<ore:string>.firstItem,<minecraft:gold_ingot>,<minecraft:iron_block>,<minecraft:gold_ingot>]);
	TartaricForge.addRecipe(<bloodmagic:component:12>, [
		<actuallyadditions:block_crystal_empowered:5>, <thermalinnovation:magnet:4>, <contenttweaker:neodymium_gear>, <harvestcraft:pizzaitem>
	], 100, 16);
	//slime
	TartaricForge.removeRecipe([<minecraft:slime>, <minecraft:slime>, <minecraft:leather>, <ore:string>.firstItem]);
	
	TartaricForge.addRecipe(<bloodmagic:component:31>, [
		<contenttweaker:elastic_clay>, <roots:strange_ooze>, <tconstruct:slime:2>, <enderio:item_alloy_endergy_ingot:4>
	], 100, 16);
	//holding
	TartaricForge.removeRecipe([<ore:chestWood>.firstItem, <ore:leather>.firstItem, <ore:string>.firstItem, <ore:string>.firstItem]);
	TartaricForge.addRecipe(<bloodmagic:component:27>, [
		<appliedenergistics2:material:37>, <moreplates:evil_infused_iron_gear>, <ironchest:iron_chest:1>, <actuallyadditions:item_misc:24>
	], 100, 16);

	//binding
	TartaricForge.removeRecipe([<minecraft:glowstone_dust>,<minecraft:redstone>,<minecraft:gold_nugget>,<minecraft:gunpowder>]);
	TartaricForge.addRecipe(<bloodmagic:component:8>, [
		<contenttweaker:alchemical_brass_gear>, 
		<contenttweaker:living_steel_ingot>, 
		<aether_legacy:healing_stone>, 
		<contenttweaker:isis_godshard>
	], 100, 64);
	

	//t3
	//void
	TartaricForge.removeRecipe([<minecraft:bucket>, <ore:string>.firstItem, <ore:string>.firstItem, <minecraft:gunpowder>]);
	TartaricForge.addRecipe(<bloodmagic:component:4>, [
		<actuallyadditions:block_crystal_empowered:3>, 
		<storagedrawers:upgrade_void>, 
		<taiga:iox_block>, 
		<contenttweaker:bucket_obsidian_void>
	], 320, 128);
	{//claw and crabolion
		recipes.addShapeless("ia_bm_clay_st", <contenttweaker:alchemical_clay_st>, [<contenttweaker:alchemical_clay>, <minecraft:lingering_potion>.withTag({Potion: "quark:long_resilience"})]);
	
		TartaricForge.removeRecipe([<minecraft:flint>, <minecraft:flint>, <bloodmagic:cutting_fluid>]);
		TartaricForge.addRecipe(<bloodmagic:component:30>, [
			<mod_lavacow:mimic_claw_cooked>,
			<thermalfoundation:material:264>,
			<enderio:block_holy_fog>,
			<contenttweaker:alchemical_clay_st>
		], 320, 128);

		TartaricForge.addRecipe(<bloodmagic:component:30>, [
			<mod_lavacow:mimic_claw_cooked>,
			<thermalfoundation:material:264>,
			<contenttweaker:crabolion>,
			<contenttweaker:alchemical_clay_st>
		], 320, 32);

		TartaricForge.addRecipe(<contenttweaker:crabolion> * 3, [
			<mod_lavacow:mimic_claw_cooked>,
			<harvestcraft:crabkimbapitem>,
			<bloodmagic:component:30>,
			<contenttweaker:alchemical_clay_st>
		], 64, 8);
	}
	//haste
	TartaricForge.removeRecipe([<minecraft:cookie>, <minecraft:cookie>, <minecraft:sugar>, <ore:stone>.firstItem]);
	TartaricForge.addRecipe(<bloodmagic:component:13>, [
		<contenttweaker:alchemical_clay_h>,
		<contenttweaker:alchemical_clay_h>,
		<minecraft:furnace_minecart>,
		<darkutils:trap_move_hyper>
	], 320, 128);
	//mushroom
	TartaricForge.addRecipe(<contenttweaker:reagent_mushroom>, [
		<contenttweaker:mushroomite_singularity>,
		<deepmoblearning:pristine_matter_mushroom>,
		<quark:glowshroom>,
		<mod_lavacow:chitin>
	], 320, 96);
	//bridge
	TartaricForge.removeRecipe([<minecraft:soul_sand>, <minecraft:soul_sand>, <minecraft:obsidian>, <ore:stone>.firstItem]);
	TartaricForge.addRecipe(<bloodmagic:component:15>, [
		<mcwbridges:stone_brick_bridge>,
		<botania:bifrostperm>,
		<twilightforest:tower_device>,
		<extrautils2:compresseddirt:1>
	], 320, 96);

	//acid
	TartaricForge.addRecipe(<contenttweaker:reagent_acid>, [
		<contenttweaker:acid_resistant_steel_block>, <bloodmagic:component>, <extendedcrafting:singularity_custom:54>, <stygian:endlog>
	], 800, 256);
	//bug
	TartaricForge.addRecipe(<contenttweaker:reagent_bug>, [
		<contenttweaker:bucket_acid_chitin>, <bloodmagic:component:3>, <contenttweaker:bug_hill_exit2>, <contenttweaker:aether_bug>
	], 800, 200);
	TartaricForge.addRecipe(<contenttweaker:reagent_bug>, [
		<contenttweaker:bucket_acid_chitin>, <contenttweaker:centipedium>, <contenttweaker:bug_hill_exit2>, <contenttweaker:aether_bug>
	], 800, 256);

	//transposition
	TartaricForge.removeRecipe([<bloodmagic:teleposer>, <minecraft:obsidian>, <minecraft:diamond>, <minecraft:ender_pearl>]);
	TartaricForge.addRecipe(<bloodmagic:component:18>, [
		<bloodmagic:teleposer>,
		<chesttransporter:chesttransporter_diamond>.withTag({}),
		<enderio:item_material:44>,
		<enderio:item_material:44>
	], 320, 96);
	


	//t4
	//crystal
	TartaricForge.addRecipe(<contenttweaker:reagent_crystal>, [
		<contenttweaker:crystal_metal_ingot>,
		<bloodmagic:demon_crystallizer>,
		<bloodmagic:demon_extras:12>,
		<bloodmagic:demon_crystal:*>
	], 4000, 500);
	TartaricForge.addRecipe(<contenttweaker:reagent_crystal>, [
		<contenttweaker:crystal_metal_ingot>,
		<bloodmagic:demon_crystallizer>,
		<bloodmagic:demon_extras:12>,
		<contenttweaker:mixed_will_crystal>
	], 4000, 500);
	//element
	TartaricForge.removeRecipe([<minecraft:obsidian>, <bloodmagic:sigil_lava>, <bloodmagic:sigil_air>, <bloodmagic:sigil_water>]);
	TartaricForge.addRecipe(<bloodmagic:component:6>, [
		<bloodmagic:component:32>,
		<contenttweaker:reagent_bug>,
		<contenttweaker:reagent_glass>,
		<moreplates:elementium_plate>
	], 4000, 400);
	//t5
	//space
	/*TartaricForge.addRecipe(<contenttweaker:reagent_crystal>, [
		<contenttweaker:crystal_metal_ingot>,
		<thermalfoundation:material:866>,
		<bloodmagic:demon_extras:12>,
		<bloodmagic:demon_crystal:*>
	], 16000, 1000);*/
	
	//, 16000, 1000



	{//wood
		TartaricForge.addRecipe(<contenttweaker:reagent_wood>, [
			<contenttweaker:entwood_dust>,
			<actuallyadditions:block_misc:4>,
			<contenttweaker:duraluminumwood_ingot>,
			<twilightforest:steeleaf_axe>
		], 1200, 32);
		TartaricForge.addRecipe(<contenttweaker:reagent_wood>, [
			<contenttweaker:bucket_tree_oil>,
			<actuallyadditions:block_misc:4>,
			<contenttweaker:duraluminumwood_ingot>,
			<twilightforest:steeleaf_axe>
		], 1200, 128);
	}
	//blood lamp
	TartaricForge.removeRecipe([<ore:glowstone>.firstItem, <minecraft:torch>, <minecraft:redstone>, <minecraft:redstone>]);
	TartaricForge.addRecipe(<bloodmagic:component:11>, [
		<natura:glowshroom_stew>, <torchmaster:feral_flare_lantern>, <mekanism:basicblock:4>, <integrateddynamics:menril_torch>
	], 320, 8);
}
{
	TartaricForge.addRecipe(<contenttweaker:mixed_will_crystal>, [
		<bloodmagic:item_demon_crystal:1>, <bloodmagic:item_demon_crystal:2>, <bloodmagic:item_demon_crystal:3>, <bloodmagic:item_demon_crystal:4>
	], 800, 100);


	mods.enderio.AlloySmelter.addRecipe(<bloodmagic:item_demon_crystal:1>, 
		[<enderio:item_material:18> * 2, <bloodmagic:item_demon_crystal> * 2, <projectred-core:resource_item:202>], 
		500000
	);
	mods.enderio.AlloySmelter.addRecipe(<bloodmagic:item_demon_crystal:2>, 
		[<enderio:item_material:18> * 2, <bloodmagic:item_demon_crystal> * 2, <contenttweaker:delicate_amber>], 
		500000
	);
	mods.enderio.AlloySmelter.addRecipe(<bloodmagic:item_demon_crystal:3>, 
		[<enderio:item_material:18> * 2, <bloodmagic:item_demon_crystal> * 2, <projectred-core:resource_item:200>], 
		500000
	);
	mods.enderio.AlloySmelter.addRecipe(<bloodmagic:item_demon_crystal:4>, 
		[<enderio:item_material:18> * 2, <bloodmagic:item_demon_crystal> * 2, <contenttweaker:delicate_tanzanite>], 
		500000
	);
	
}



{//alchemical table
	
	
	AlchemyTable.addRecipe(<contenttweaker:advanced_pyrotheum>, 
		[
			<thermalfoundation:material:1024>,
			<thermalfoundation:material:1024>,
			<actuallyadditions:block_crystal_empowered>,
			<bloodmagic:component:1>,
			<contenttweaker:bucket_obsidian_residue>,
			<contenttweaker:ra_burner>
		], 1000, 20, 1
	);

	AlchemyTable.addRecipe(<contenttweaker:advanced_cryotheum>, 
		[
			<thermalfoundation:material:1025>,
			<thermalfoundation:material:1025>,
			<actuallyadditions:block_crystal_empowered:1>,
			<bloodmagic:component>,
			<contenttweaker:bucket_water_heavy>,
			<requious:fluid_mixer>
		], 1000, 20, 1
	);

	AlchemyTable.addRecipe(<contenttweaker:advanced_petrotheum>, 
		[
			<thermalfoundation:material:1027>,
			<thermalfoundation:material:1027>,
			<actuallyadditions:block_crystal_empowered:3>,
			<bloodmagic:component:3>,
			<contenttweaker:bucket_cursed_sand>,
			<actuallyadditions:block_canola_press>
		], 1000, 20, 1
	);

	AlchemyTable.addRecipe(<contenttweaker:advanced_aerotheum>, 
		[
			<thermalfoundation:material:1026>,
			<thermalfoundation:material:1026>,
			<actuallyadditions:block_crystal_empowered:5>,
			<bloodmagic:component:2>,
			<contenttweaker:bucket_valk_cloud>,
			<mob_grinding_utils:fan>
		], 1000, 20, 1
	);

	AlchemyTable.addRecipe(<contenttweaker:electricium>, 
		[
			<enderio:block_industrial_insulation>,
			<contenttweaker:enittin_block>,
			<bloodmagic:component:12>,
			<quantumflux:darkstone:1>,
			<contenttweaker:lightning_cell>,
			<contenttweaker:power_tap>
		], 10000, 20, 3
	);


	//toxin
	AlchemyTable.removeRecipe([<minecraft:fish:3>]);
	AlchemyTable.addRecipe(<bloodmagic:component:25>,
		[
			<minecraft:fish:3>,
			<contenttweaker:ophidian_extract>,
			<contenttweaker:basic_neuron>,
			<contenttweaker:brain_slimeball>,
			<contenttweaker:brain_slimeball>
		], 4000, 20, 2
	);
	AlchemyTable.addRecipe(<contenttweaker:poisotheum>,
		[
			<natura:edibles:10>,
			<contenttweaker:soul_poison>,
			<contenttweaker:energized_compound>,
			<mod_lavacow:poisonstinger>,
			<bloodmagic:component:25>,
			<erebus:anti_venom_bottle>
		], 10000, 40, 5
	);

	//explosion
	AlchemyTable.removeRecipe([<minecraft:gunpowder>, <minecraft:gunpowder>, <ore:dustCoal>.firstItem]);
	AlchemyTable.addRecipe(<bloodmagic:cutting_fluid:1>.withTag({}),
		[
			<minecraft:tnt>,
			<minecraft:paper>,
			<prodigytech:inferno_crystal>
		], 4000, 20, 1
	);
}
mods.actuallyadditions.Empowerer.addRecipe(
	<contenttweaker:elemental_clay> * 2, <contenttweaker:alchemical_clay>, 
	<contenttweaker:advanced_pyrotheum>,
	<contenttweaker:advanced_cryotheum>,
	<contenttweaker:advanced_petrotheum>,
	<contenttweaker:advanced_aerotheum>,
	40000, 10
);

{//bouncy matter
	var rec = RecipeBuilder.newBuilder("bouncy_matter", "regen_chamber", 80);

    rec.addEnergyPerTickInput(2048);

    rec.addItemOutput(<contenttweaker:bouncy_matter>);
    
	rec.addItemInput(<bloodmagic:component:31> * 4);
	rec.addItemInput(<minecraft:slime_ball> * 64);
	rec.addItemInput(<tconstruct:edible:1> * 64);
	rec.addItemInput(<tconstruct:edible:2> * 64);
	rec.addItemInput(<tconstruct:edible:4> * 64);
	rec.addItemInput(<tconstruct:edible:3> * 64);
	rec.addItemInput(<actuallyadditions:item_misc:12> * 64);
	rec.addItemInput(<industrialforegoing:pink_slime> * 16);
	rec.addItemInput(<mod_lavacow:silky_sludge> * 16);
	rec.addItemInput(<aether_legacy:swetty_ball> * 16);
	rec.addItemInput(<contenttweaker:gold_slimeball> * 8);
	rec.addItemInput(<contenttweaker:brain_slimeball> * 8);
	rec.addItemInput(<contenttweaker:bug_slimeball> * 8);
	rec.addItemInput(<moreplates:knightslime_gear> * 16);

	rec.addFluidInput(<liquid:polyethylene> * 40000);
	rec.addFluidInput(<liquid:tartaric_gel> * 1000);
	rec.addFluidInput(<liquid:potion>.withTag({Potion: "cofhcore:regeneration4"}) * 16000);

    rec.build();

	mods.enderio.SagMill.addRecipe(
        [<contenttweaker:bouncy_matter_small> * 4, <contenttweaker:bouncy_matter_small> * 2, <contenttweaker:bouncy_matter_small>, <contenttweaker:bouncy_matter_small>], 
        [0.75, 0.75, 0.75, 0.75], 
        <contenttweaker:bouncy_matter>, "MULTIPLY_OUTPUT", 40000
    );
}
scripts.content_machines.addAdvancedMixerRecipe(
	[<contenttweaker:reagent_potion> * 2], [],
	[
		<contenttweaker:reagent_glass>,
		<contenttweaker:solar_potion_zinc_ingot> * 8,
		<harvestcraft:vinegaritem> * 24,
		<bloodmagic:component:4>
	], [
		<liquid:amaranth_juice> * 2000,
		<liquid:enchantium> * 100,
		<liquid:desert_soup> * 500
	], 20, 1000
);
scripts.content_machines.addAdvancedMixerRecipe(
	[<contenttweaker:reagent_potion>], [],
	[
		<contenttweaker:reagent_glass>,
		<contenttweaker:solar_potion_zinc_ingot> * 8,
		<harvestcraft:vinegaritem> * 24,
		<bloodmagic:component:4>
	], [
		<liquid:amaranth_juice> * 2000,
		<liquid:evil_blood> * 400
	], 20, 1000
);




{//machines
	{//soul
		//soul forge
		recipes.remove(<bloodmagic:soul_forge>);
		recipes.addShaped("ia_soul_forge", <bloodmagic:soul_forge>, [
			[<ore:skullSentientEnder>, null, <ore:skullSentientEnder>], 
			[<contenttweaker:bedrockium_alloy_plate>, <contenttweaker:soul_frame>, <contenttweaker:bedrockium_alloy_plate>], 
			[<contenttweaker:yrdeen_plate>, <betternether:cincinnasite_forge>, <contenttweaker:yrdeen_plate>]
		]);

		//will detector
		TartaricForge.removeRecipe([<minecraft:gold_ingot>,<minecraft:redstone>,<ore:blockGlass>.firstItem,<bloodmagic:item_demon_crystal:*>]);
		TartaricForge.addRecipe(<bloodmagic:demon_will_gauge>, [
			<bloodmagic:soul_gem>,
			<enderio:item_material:18>,
			<contenttweaker:glass_cloth>,
			<actuallyadditions:item_misc:18>
		], 400, 50);

		//crucible
		TartaricForge.removeRecipe([<minecraft:cauldron>,<ore:stone>.firstItem,<minecraft:dye:4>,<minecraft:diamond>]);
		TartaricForge.addRecipe(<bloodmagic:demon_crucible>, [
			<bloodmagic:soul_forge>,
			<bloodmagic:soul_gem:1>,
			<thermalexpansion:machine:6>,
			<contenttweaker:advanced_pyrotheum>
		], 500, 100);

		//crystallizer
		TartaricForge.removeRecipe([<bloodmagic:soul_forge>,<ore:stone>.firstItem,<minecraft:dye:4>,<ore:blockGlass>.firstItem]);
		TartaricForge.addRecipe(<bloodmagic:demon_crystallizer>, [
			<bloodmagic:soul_forge>,
			<bloodmagic:soul_gem:1>,
			<bloodmagic:demon_will_gauge>,
			<actuallyadditions:block_crystal_empowered:2>
		], 500, 100);

		//pylon
		TartaricForge.removeRecipe([<minecraft:iron_block>,<minecraft:dye:4>,<ore:stone>.firstItem,<bloodmagic:item_demon_crystal:*>]);
		TartaricForge.addRecipe(<bloodmagic:demon_pylon>, [
			<contenttweaker:soul_frame>,
			<bloodmagic:soul_gem:1>,
			<bloodmagic:demon_will_gauge>,
			<contenttweaker:advanced_aerotheum>
		], 500, 100);


		//will uses
		TartaricForge.addRecipe(<bloodmagic:demon_extras:10>, [
			<taiga:violium_block>,
			<enderio:item_material:14>,
			<bloodmagic:slate:2>,
			<bloodmagic:item_demon_crystal>
		], 500, 200);
	}


	recipes.remove(<bloodmagic:altar>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <bloodmagic:altar>, [
		[<actuallyadditions:block_crystal_empowered>, null, null, null, <actuallyadditions:block_crystal_empowered>], 
		[<ore:blockDemonicMetal>, <contenttweaker:blood_gem>, <contenttweaker:blood_gem>, <contenttweaker:blood_gem>, <ore:blockDemonicMetal>], 
		[<enderio:item_material:44>, <enderio:item_material:44>, <extendedcrafting:singularity_custom:9>, <enderio:item_material:44>, <enderio:item_material:44>], 
		[<contenttweaker:bedrockium_alloy_plate>, <contenttweaker:proxii_gear>, <contenttweaker:lightning_cell>, <contenttweaker:proxii_gear>, <contenttweaker:bedrockium_alloy_plate>], 
		[<actuallyadditions:block_crystal_empowered>, <contenttweaker:bedrockium_alloy_plate>, <contenttweaker:bedrockium_alloy_plate>, <contenttweaker:bedrockium_alloy_plate>, <actuallyadditions:block_crystal_empowered>]
	]);

	recipes.remove(<bloodmagic:alchemy_table>);
	recipes.addShaped("ia_alchemy_table", <bloodmagic:alchemy_table>, [
		[<contenttweaker:blood_bronze_plate>, <contenttweaker:blood_bronze_plate>, <contenttweaker:blood_bronze_plate>], 
		[<contenttweaker:alchemical_brass_gear>, <contenttweaker:blood_frame>, <contenttweaker:alchemical_brass_gear>], 
		[<bloodmagic:blood_rune>, <contenttweaker:tignalum_rod>, <bloodmagic:blood_rune>]
	]);

	recipes.remove(<bloodmagic:teleposer>);
	recipes.addShaped("ia_bloodmagic_teleposer", <bloodmagic:teleposer>, [
		[<moreplates:evil_infused_iron_plate>, <bloodmagic:teleposition_focus>, <moreplates:evil_infused_iron_plate>], 
		[<bloodmagic:slate:3>, <contenttweaker:soul_frame>, <bloodmagic:slate:3>], 
		[<moreplates:evil_infused_iron_plate>, <mekanism:teleportationcore>, <moreplates:evil_infused_iron_plate>]
	]);
}

{//rituals

	val rituals as IIngredient[string] = {
		crystal_split: <enderio:item_material:14>,
		crystal_harvest: <bloodmagic:item_demon_crystal:*>,
		forsaken_soul: <bloodmagic:monster_soul>,

		well_of_suffering: <contenttweaker:blood_shard1>
	};

	for r in rituals{
		recipes.addShapeless("bm_ritual_diviner_" ~ r,
			<bloodmagic:ritual_diviner:1>.withTag({"current_ritual": r}),
			[
				<bloodmagic:ritual_diviner:1>,
				rituals[r].reuse()
			]
		);
	}
}
{//crystal hints
	var w = <bloodmagic:item_demon_crystal>.withDisplayName("Will in a chunk");

	scripts.jei.addJEIhint(
		[
			<bloodmagic:soul_gem>.withTag({souls: 64.0}),
			<bloodmagic:monster_soul>
		], [], [<bloodmagic:demon_crucible>], [w]
	);scripts.jei.addJEIhint(
		[<bloodmagic:item_demon_crystal>], [], [<bloodmagic:demon_crucible>], [w * 50]
	);
	scripts.jei.addJEIhint(
		[w * 100], [], [<bloodmagic:demon_crystallizer>], [<bloodmagic:demon_crystal>]
	);

	//growth
	scripts.jei.addJEIhint(
		[w * 50, <bloodmagic:demon_crystal>], [], [], [<bloodmagic:demon_crystal> * 2]
	);

	scripts.jei.addJEIhint(
		[<bloodmagic:demon_crystal>], [], [
			<minecraft:iron_pickaxe>, 
			<bloodmagic:ritual_diviner:1>.withTag({current_ritual: "crystal_harvest"})
		], [<bloodmagic:item_demon_crystal>]
	);

	scripts.jei.addJEIhint(
		[
			<bloodmagic:soul_gem>.withTag({}),
			<bloodmagic:item_demon_crystal:2>.withDisplayName("Will in a chunk") * 64
		], [], [<bloodmagic:soul_forge>], [
			<bloodmagic:soul_gem>.withTag({souls: 64.0, demonWillType: "destructive"})
		]
	);
}



{//creative -> blood
	var rec = RecipeBuilder.newBuilder("creative_blood", "blood_altar", 10);

    rec.addEnergyPerTickInput(4096);

    
	rec.addItemInput(<bloodmagic:sacrificial_dagger:1>);
	rec.setChance(0.0);
	

	rec.addFluidOutput(<liquid:lifeessence> * 10000);

    rec.build();
}