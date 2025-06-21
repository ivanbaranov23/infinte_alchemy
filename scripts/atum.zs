import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.thermalexpansion.InductionSmelter;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;



recipes.remove(<atum:scarab>);
recipes.addShaped("ia_scarab", <atum:scarab>, [
	[<ore:stickGold>, <thermalfoundation:material:816>, <ore:stickGold>], 
	[<erebus:materials:2>, <erebus:materials:38>, <erebus:materials:2>], 
	[<ore:stickGold>, <ore:blockJade>, <ore:stickGold>]
]);



val relics as IItemStack[string][string] = {
    ring: {
        dirty:      <atum:loot_dirty_ring>,
        silver:     <atum:loot_silver_ring>,
        gold:       <atum:loot_gold_ring>,
        sapphire:   <atum:loot_sapphire_ring>,
        ruby:       <atum:loot_ruby_ring>,
        emerald:    <atum:loot_emerald_ring>,
        diamond:    <atum:loot_diamond_ring>
    },
    broach: {
        dirty:      <atum:loot_dirty_broach>,
        silver:     <atum:loot_silver_broach>,
        gold:       <atum:loot_gold_broach>,
        sapphire:   <atum:loot_sapphire_broach>,
        ruby:       <atum:loot_ruby_broach>,
        emerald:    <atum:loot_emerald_broach>,
        diamond:    <atum:loot_diamond_broach>
    },
    necklace: {
        dirty:      <atum:loot_dirty_necklace>,
        silver:     <atum:loot_silver_necklace>,
        gold:       <atum:loot_gold_necklace>,
        sapphire:   <atum:loot_sapphire_necklace>,
        ruby:       <atum:loot_ruby_necklace>,
        emerald:    <atum:loot_emerald_necklace>,
        diamond:    <atum:loot_diamond_necklace>
    },
    scepter: {
        dirty:      <atum:loot_dirty_scepter>,
        silver:     <atum:loot_silver_scepter>,
        gold:       <atum:loot_gold_scepter>,
        sapphire:   <atum:loot_sapphire_scepter>,
        ruby:       <atum:loot_ruby_scepter>,
        emerald:    <atum:loot_emerald_scepter>,
        diamond:    <atum:loot_diamond_scepter>
    },
    idol: {
        dirty:      <atum:loot_dirty_idol>,
        silver:     <atum:loot_silver_idol>,
        gold:       <atum:loot_gold_idol>,
        sapphire:   <atum:loot_sapphire_idol>,
        ruby:       <atum:loot_ruby_idol>,
        emerald:    <atum:loot_emerald_idol>,
        diamond:    <atum:loot_diamond_idol>
    }
};

val nugget_number as int[string] = {
    ring: 1,
    broach: 2,
    necklace: 4,
    scepter: 7,
    idol: 12
};
val chance as int[string] = {
    ring: 1,
    broach: 1,
    necklace: 3,
    scepter: 5,
    idol: 10
};

val relic_nugget as IItemStack = <contenttweaker:relic_nugget>;
val silver_nugget as IItemStack = <thermalfoundation:material:194>;
val gold_nugget as IItemStack = <minecraft:gold_nugget>;

val ruby as IItemStack = <biomesoplenty:gem:1>;
val sapphire as IItemStack = <biomesoplenty:gem:6>;
val diamond as IItemStack = <minecraft:diamond>;
val emerald as IItemStack = <minecraft:emerald>;

val ore_materials as string[] = [
    "sapphire",
    "ruby",
    "emerald",
    "diamond"
];
//relic uses
for relic in relics{
    print("[IA] adding uses for atum " + relic);

    //simple
    scripts.helper.addSimpleCrushingRecipe(relics[relic].dirty, relic_nugget * nugget_number[relic]);
    scripts.helper.addSimpleCrushingRecipe(relics[relic].silver, silver_nugget * nugget_number[relic]);
    scripts.helper.addSimpleCrushingRecipe(relics[relic].gold, gold_nugget * nugget_number[relic]);

    //gem
    scripts.helper.addSimpleCrushingRecipeWByproduct(relics[relic].ruby, relic_nugget * nugget_number[relic], ruby, chance[relic]);
    scripts.helper.addSimpleCrushingRecipeWByproduct(relics[relic].sapphire, relic_nugget * nugget_number[relic], sapphire, chance[relic]);
    scripts.helper.addSimpleCrushingRecipeWByproduct(relics[relic].emerald, relic_nugget * nugget_number[relic], emerald, chance[relic]);
    scripts.helper.addSimpleCrushingRecipeWByproduct(relics[relic].diamond, relic_nugget * nugget_number[relic], diamond, chance[relic]);
}
for mat in ore_materials{
    <ore:ring>.add(relics.ring[mat]);
    <ore:broach>.add(relics.broach[mat]);
    <ore:necklace>.add(relics.necklace[mat]);
    <ore:scepter>.add(relics.scepter[mat]);
    <ore:idol>.add(relics.idol[mat]);
}


recipes.addShaped("ia_atum_coin1", <atum:coin_gold> * 1, [
	[null, <ore:coinGold>, null], 
	[<ore:coinGold>, <ore:coinGold>, <ore:coinGold>], 
	[null, <ore:coinGold>, null]
]);
recipes.addShaped("ia_atum_coin2", <atum:coin_gold> * 8, [
	[null, <ore:coinGold>, null], 
	[<ore:coinGold>, <ore:coinLumium>, <ore:coinGold>], 
	[null, <ore:coinGold>, null]
]);


//gear and godshards
val gear as IItemStack[][string] = {
    atum: [
        <atum:eyes_of_atum>,
        <atum:body_of_atum>,
        <atum:legs_of_atum>,
        <atum:feet_of_atum>,
        <atum:atums_will>,
        <atum:atums_protection>,
        <atum:atums_bounty>,
        <atum:atums_homecoming>
    ],
    ra: [
        <atum:halo_of_ra>,
        <atum:body_of_ra>,
        <atum:legs_of_ra>,
        <atum:feet_of_ra>,
        <atum:ras_fury>
    ],
    ptah: [
        <atum:ptahs_decadence>,
        <atum:ptahs_undoing>
    ],
    geb: [
        <atum:gebs_toil>,
        <atum:gebs_grounding>,
        <atum:gebs_might>
    ],
    tefnuts: [
        <atum:tefnuts_rain>,
        <atum:tefnuts_call>,
        <atum:tefnuts_blessing>
    ],
    shu: [
        <atum:shus_breath>,
        <atum:shus_exile>,
        <atum:shus_swiftness>
    ],
    horus: [
        <atum:horuss_soaring>,
        <atum:horuss_ascension>
    ],
    seth: [
        <atum:seths_sting>,
        <atum:seths_venom>
    ],
    isis: [
        <atum:isis_healing>
    ],
    montu: [
        <atum:montus_blast>,
        <atum:montus_strike>
    ],
    anubis: [
        <atum:anubiss_mercy>,
        <atum:anubiss_wrath>
    ],
    nuit: [
        <atum:nuits_vanishing>,
        <atum:nuits_duality>,
        <atum:nuits_ire>,
        <atum:nuits_quarter>
    ],
    anput: [
        <atum:anputs_hunger>
    ]
};
val godshards as IItemStack[string] = {
    atum: <contenttweaker:atum_godshard>,
    ra: <contenttweaker:ra_godshard>,
    ptah: <contenttweaker:ptah_godshard>,
    geb: <contenttweaker:geb_godshard>,
    tefnuts: <contenttweaker:tefnuts_godshard>,
    shu: <contenttweaker:shu_godshard>,
    horus: <contenttweaker:horus_godshard>,
    seth: <contenttweaker:seth_godshard>,
    isis: <contenttweaker:isis_godshard>,
    montu: <contenttweaker:montu_godshard>,
    anubis: <contenttweaker:anubis_godshard>,
    nuit: <contenttweaker:nuit_godshard>,
    anput: <contenttweaker:anput_godshard>
};

for god in godshards{
    <ore:godshard>.add(godshards[god]);

    for g in gear[god]{
        recipes.addShapeless("ia_" + g.name + "_to_shards",
            godshards[god] * 5,
            [g]
        );
    }

    mods.enderio.AlloySmelter.addRecipe(godshards[god] * 16, 
        [
            godshards[god],
            <contenttweaker:treasure_block>,
            <contenttweaker:atum_godshardium_ore>
        ], 20000
    );
}

recipes.addShaped("ia_treasure_block", <contenttweaker:treasure_block>, [
	[<atum:coin_gold>, <ore:godshard>, <atum:sand>], 
	[<ore:godshard>, <contenttweaker:relic_ingot>, <ore:godshard>], 
	[<atum:sand>, <ore:godshard>, <atum:coin_gold>]
]);



//heart of ra
recipes.addShaped("ia_heart_of_ra", <atum:heart_of_ra>, [
	[<ore:plateGold>, <contenttweaker:ra_godshard>, <ore:plateGold>], 
	[<contenttweaker:ra_godshard>, <contenttweaker:ra_godshard>, <contenttweaker:ra_godshard>], 
	[<ore:plateGold>, <contenttweaker:ra_godshard>, <ore:plateGold>]
]);
recipes.remove(<atum:radiant_beacon>);
recipes.addShaped("ia_radiant_beacon", <atum:radiant_beacon>, [
	[<atum:crystal_glass>, <atum:crystal_glass>, <atum:crystal_glass>], 
	[<contenttweaker:singularity_dust>, <atum:heart_of_ra>, <contenttweaker:singularity_dust>], 
	[<atum:limestone_brick_large>, <contenttweaker:relic_block>, <atum:limestone_brick_large>]
]);

//soil
scripts.helper.addPlantStationRecipe(
    <atum:fertile_soil_pile>,
    [
        <atum:fertile_soil_pile> * 9
    ],
    [
        <contenttweaker:geb_godshard>,
        <roots:elemental_soil> * 4,
        <actuallyadditions:item_fertilizer> * 3
    ],
    <liquid:dirt> * 1000,
    15
);
scripts.helper.addSimpleCrushingRecipe(<atum:idol_of_labor>, <atum:fertile_soil_pile> * 32);
scripts.helper.addSimpleCrushingRecipe(<contenttweaker:geb_godshard>, <atum:fertile_soil_pile> * 3);

recipes.addShaped("ia_atum_fertile_soil", <atum:fertile_soil>, [
	[<atum:fertile_soil_pile>, <roots:elemental_soil>, <atum:fertile_soil_pile>], 
	[<atum:fertile_soil_pile>, <roots:elemental_soil>, <atum:fertile_soil_pile>], 
	[<atum:fertile_soil_pile>, <roots:elemental_soil>, <atum:fertile_soil_pile>]
]);

//kiln 
recipes.remove(<atum:kiln>);
mods.jei.JEI.hideCategory("atum.kiln");

//atum matter
recipes.addShapeless("ia_camel_matter", <atum:camel_raw> * 4, [<minecraft:beef>, <deepmoblearning:living_matter_atum>]);
recipes.addShapeless("ia_date_matter", <atum:date> * 4, [<harvestcraft:plumitem>, <deepmoblearning:living_matter_atum>]);

mods.enderio.AlloySmelter.addRecipe(<atum:idol_of_labor>, 
    [
        <deepmoblearning:living_matter_atum> * 32,
        <atum:camel_cooked> * 32,
        <atum:golden_date_enchanted>
    ], 100000
);



//ophidian
mods.roots.Fey.addRecipe(
  "ophidian_vine",         // the name of the recipe; if replacing an existing recipe, be sure to use the same name to ensure Patchouli continuity
  <atum:ophidian_tongue> * 3,   // the itemstack produced by this recipe
  [
    <atum:fertile_soil>,
    <atum:coin_gold>,
    <contenttweaker:seth_godshard>,
    <minecraft:vine>,
    <atum:ophidian_tongue_flower>
  ] // an array of IIngredients that make up the recipe; must contain 5 items
);
recipes.addShapeless("ia_ophidian_extract", <contenttweaker:ophidian_extract>, 
    [
        <minecraft:potion>.withTag({Potion: "minecraft:water"}).noReturn(), 
        <atum:ophidian_tongue_flower>, 
        <harvestcraft:hotsauceitem>, 
        <mekanism:salt>
    ]
);