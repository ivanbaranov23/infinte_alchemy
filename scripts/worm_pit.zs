import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import crafttweaker.data.IData;
import crafttweaker.util.Math;


import mods.modularmachinery.RecipeBuilder;


recipes.addShaped("ia_stomper", <contenttweaker:stomper>, [
    [<contenttweaker:mekanized_steel_rod>, <contenttweaker:pulse_generator>, <contenttweaker:mekanized_steel_rod>], 
    [<projectred-core:resource_item:410>, <contenttweaker:calitunti_block>, <projectred-core:resource_item:410>], 
    [<contenttweaker:wear_resistant_alloy_plate>, <contenttweaker:mekanized_steel_block>, <contenttweaker:wear_resistant_alloy_plate>]
]);

static counter as int = 0;
function addWormRecipe(rec_lvl as int, out as IItemStack[], inp as IItemStack[], time_sec as int){
    var rec = RecipeBuilder.newBuilder("worm_pit_rec_" ~ counter, "worm_pit", time_sec * 20);
    counter += 1;

    rec.addEnergyPerTickInput(100);

    for o in out{
        rec.addItemOutput(o);

    }

    for i in inp{
        rec.addItemInput(i);
    }

    if (rec_lvl != 0){
        rec.addItemInput(<ore:bugFoodMeat1>, rec_lvl);
        rec.addItemOutput(<contenttweaker:chewed_meat> * (rec_lvl / 2));
    }
    rec.addDimensionRequirement([17]);

    rec.build();
}

addWormRecipe(16, [<actuallyadditions:item_worm> * 16], [<actuallyadditions:item_worm>, <contenttweaker:worm_feed>], 10);
addWormRecipe(8, [<actuallyadditions:item_worm> * 8], [<actuallyadditions:item_worm>, <atum:fertile_soil_pile> * 2], 10);
addWormRecipe(24, [<contenttweaker:wormweave> * 16], [
    <actuallyadditions:item_worm> * 32, <minecraft:string> * 64, 
    <contenttweaker:titanium_dust> * 3, <mekanism:shard:3> * 5, <industrialforegoing:plastic> * 4, <contenttweaker:dry_fibre> * 8], 10
);



addWormRecipe(64, [
        <contenttweaker:ancient_sandstone> * 8, <contenttweaker:sandy_spice> * 24
    ], [
        <actuallyadditions:item_worm> * 64, 
        <contenttweaker:enspiced_spicy_bioblend> * 8,
        <contenttweaker:empowered_biospice> * 8
    ], 30
);
mods.enderio.SagMill.addRecipe(
    [<contenttweaker:ancient_dust>, <contenttweaker:cursed_gold_pieces>, <contenttweaker:stoneleaf>, <contenttweaker:bedrockium_small_chunk>], 
    [0.75, 0.45, 0.15, 0.05], 
    <contenttweaker:ancient_sandstone>, "MULTIPLY_OUTPUT", 20000
);


mods.thermalexpansion.Centrifuge.addRecipe([
    <prodigytech:meat_ground> % 75,
    <prodigytech:meat_ground> % 40,
    <actuallyadditions:item_worm> % 30,
    <contenttweaker:sandy_spice> % 10
], <contenttweaker:chewed_meat> * 4, <liquid:rot> * 400, 2000);
mods.thermalexpansion.Crucible.addRecipe(
    <liquid:rot> * 250, <contenttweaker:chewed_meat>, 1000
);
mods.thermalexpansion.Centrifuge.addRecipe([
    <contenttweaker:enspiced_spicy_bioblend> % 80,
    <contenttweaker:empowered_biospice> % 40
], <contenttweaker:sandy_spice> * 3, null, 12000);


recipes.addShapeless("ia_gemmed_spice1", <contenttweaker:gemmed_spice>, [
    <contenttweaker:empowered_biospice>,
    <liquid:speed_potion> * 1000,
    <minecraft:emerald>, <biomesoplenty:gem:1>, <biomesoplenty:gem:6>
]);
recipes.addShapeless("ia_gemmed_spice2", <contenttweaker:gemmed_spice> * 2, [
    <contenttweaker:empowered_biospice>, 
    <liquid:speed_potion> * 2000,
    <prodigytech:emerald_dust>, <contenttweaker:gem_ruby_dust>, <contenttweaker:gem_sapphire_dust>
]);
recipes.addShapeless("ia_gemmed_spice3", <contenttweaker:gemmed_spice>, [
    <contenttweaker:empowered_biospice>,
    <harvestcraft:energydrinkitem>, <harvestcraft:energydrinkitem>,
    <minecraft:emerald>, <biomesoplenty:gem:1>, <biomesoplenty:gem:6>
]);
recipes.addShapeless("ia_gemmed_spice4", <contenttweaker:gemmed_spice> * 2, [
    <contenttweaker:empowered_biospice>, 
    <harvestcraft:energydrinkitem>, <harvestcraft:energydrinkitem>, <harvestcraft:energydrinkitem>,
    <prodigytech:emerald_dust>, <contenttweaker:gem_ruby_dust>, <contenttweaker:gem_sapphire_dust>
]);
mods.roots.Fey.addRecipe("ia_gemmed_spice", <contenttweaker:gemmed_spice> * 3, [
    <contenttweaker:empowered_biospice>, 
    <liquid:speed_potion> * 1000,
    <prodigytech:emerald_dust>, <contenttweaker:gem_ruby_dust>, <contenttweaker:gem_sapphire_dust>
]);
scripts.content_machines.addAdvancedMixerRecipe(
    [<contenttweaker:gemmed_spice> * 3], [],
    [
        <contenttweaker:empowered_biospice>, 
        <prodigytech:emerald_dust>, <contenttweaker:gem_ruby_dust>, <contenttweaker:gem_sapphire_dust>
    ], [
        <liquid:speed_potion> * 1000
    ], 20, 1000
);
scripts.content_machines.addAdvancedMixerRecipe(
    [<contenttweaker:gemmed_spice> * 4], [],
    [
        <contenttweaker:empowered_biospice>, 
        <prodigytech:emerald_dust>, <contenttweaker:gem_ruby_dust>, <contenttweaker:gem_sapphire_dust>
    ], [
        <liquid:taurine> * 1000
    ], 20, 1000
);

mods.enderio.AlloySmelter.addRecipe(<contenttweaker:wormium_ingot>, 
    [
        <contenttweaker:wormweave> * 4,
        <tconstruct:ingots:3> * 3,
        <contenttweaker:gemmed_spice>
    ], 25000
);
recipes.addShapeless("ia_centipedium", <contenttweaker:centipedium>, [
        <contenttweaker:wormium_ingot>, 
        <moretcon:dustrunesteel>, 
        <contenttweaker:ophidian_extract>, 
        <erebus:materials:13>
    ]
);

scripts.content_machines.addAdvancedMixerRecipe(
    [<contenttweaker:methyst_dust>], [<liquid:wormy_sand> * 1000],
    [
        <contenttweaker:wormium_ingot> * 3,
        <actuallyadditions:item_worm> * 16,
        <contenttweaker:methyst>
    ], [<liquid:sand> * 1000, <liquid:cool_soup> * 400],
    20, 1000
);
mods.thermalexpansion.Transposer.addFillRecipe(
    <contenttweaker:worm_glass>,
    <extrautils2:decorativeglass>, <liquid:wormy_sand> * 1000,
    1000
);





{
    var rec = RecipeBuilder.newBuilder("worm_finding", "worm_pit", 30 * 20);
    counter += 1;

    rec.addEnergyPerTickInput(10 * 1000 * 1000);

    rec.addItemOutput(<contenttweaker:signal_sandworm>).setChance(0.8);

    rec.addItemInput(<contenttweaker:worm_feed2> * 100);
    rec.addItemInput(<contenttweaker:signal_reciever>);
    
    rec.addDimensionRequirement([17]);

    rec.build();
}

