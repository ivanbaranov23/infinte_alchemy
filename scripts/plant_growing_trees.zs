import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;

import mods.integrateddynamics.MechanicalSqueezer;


function addIBTrecipe(inputs as IItemStack[], outputs as WeightedItemStack[], catalyst as IItemStack[], time_sec as int, rf_tick as int){
    var rec = RecipeBuilder.newBuilder("IBT_" ~ outputs[0].stack.name, "bonsai", time_sec * 20);

    if (rf_tick != 0) {rec.addEnergyPerTickInput(rf_tick);}

    for o in outputs{
        rec.addItemOutput(o.stack);
        rec.setChance(o.chance);
    }

    for i in inputs{
        rec.addItemInput(i);
    }

    for i in catalyst{
        rec.addItemInput(i);
        rec.setChance(0.0);
    }
    rec.addFluidInput(<liquid:fertilizer> * 200);
    rec.build();
}

//vanilla
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:log> * 24, (<minecraft:apple> * 6) % 75, (<minecraft:sapling> * 8) % 0], [<minecraft:sapling>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:log:1> * 24, (<minecraft:sapling:1> * 8) % 0], [<minecraft:sapling:1>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:log:2> * 24, (<minecraft:sapling:2> * 8) % 0], [<minecraft:sapling:2>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:log:3> * 24, (<minecraft:sapling:3> * 8) % 0], [<minecraft:sapling:3>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:log2> * 24, (<minecraft:sapling:4> * 8) % 0], [<minecraft:sapling:4>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:log2:1> * 24, (<minecraft:sapling:5> * 8) % 0], [<minecraft:sapling:5>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:brown_mushroom> * 12, (<minecraft:brown_mushroom_block> * 8) % 0], 
    [<minecraft:brown_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<minecraft:red_mushroom> * 12, (<minecraft:red_mushroom_block> * 8) % 0], 
    [<minecraft:red_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
);

{//erebus
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_balsam> * 24, (<erebus:sapling_balsam> * 8) % 0], [<erebus:sapling_balsam>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_baobab> * 24, (<erebus:sapling_baobab> * 8) % 0], [<erebus:sapling_baobab>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_marshwood> * 24, (<erebus:sapling_marshwood> * 8) % 0], [<erebus:sapling_marshwood>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_mossbark> * 24, (<erebus:sapling_mossbark> * 8) % 0], [<erebus:sapling_mossbark>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_mahogany> * 24, (<erebus:sapling_mahogany> * 8) % 0], [<erebus:sapling_mahogany>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_cypress> * 24, (<erebus:sapling_cypress> * 8) % 0], [<erebus:sapling_cypress>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_asper> * 24, (<erebus:sapling_asper> * 8) % 0], [<erebus:sapling_asper>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:log_eucalyptus> * 24, (<erebus:sapling_eucalyptus> * 8) % 0], [<erebus:sapling_eucalyptus>], 12, 128
    );

    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<erebus:materials:3> * 32, (<harvestcraft:bambooshootitem> * 4) % 75, (<erebus:sapling_bamboo> * 8) % 0], [<erebus:sapling_bamboo>], 12, 128
    );
}

{//erebus mushroom
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<erebus:kaizers_fingers_mushroom> * 12, (<erebus:kaizers_fingers_mushroom_block> * 8) % 0], 
        [<erebus:kaizers_fingers_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<erebus:dutch_cap_mushroom> * 12, (<erebus:dutch_cap_mushroom_block> * 8) % 0], 
        [<erebus:dutch_cap_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<erebus:grandmas_shoes_mushroom> * 12, (<erebus:grandmas_shoes_mushroom_block> * 8) % 0], 
        [<erebus:grandmas_shoes_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<erebus:sarcastic_czech_mushroom> * 12, (<erebus:sarcastic_czech_mushroom_block> * 8) % 0], 
        [<erebus:sarcastic_czech_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<erebus:dark_capped_mushroom> * 12, (<erebus:dark_capped_mushroom_block> * 8) % 0], 
        [<erebus:dark_capped_mushroom>, <contenttweaker:research_mushroom1>], 10, 128
    );
    
}

//other
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<atum:palm_log> * 24, (<atum:date> * 4) % 75, (<atum:palm_sapling> * 8) % 0], [<atum:palm_sapling>], 12, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
    [<aether_legacy:aether_log> * 24, (<aether_legacy:skyroot_sapling> * 8) % 0], [<aether_legacy:skyroot_sapling>], 12, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
    [<prodigytech:zorra_log> * 16, (<prodigytech:zorra_leaf> * 16) % 75, (<prodigytech:zorra_sapling> * 8) % 0], [<prodigytech:zorra_sapling>], 12, 128
);

{//natura
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<natura:nether_logs:1> * 24, (<natura:edibles:10> * 6) % 75, (<natura:nether_sapling:2> * 8) % 0], [<natura:nether_sapling:2>], 15, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<natura:nether_logs:2> * 24, (<natura:nether_sapling:1> * 8) % 0], [<natura:nether_sapling:1>], 15, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<natura:nether_logs> * 24, (<natura:nether_sapling> * 8) % 0], [<natura:nether_sapling>], 15, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 24], 
        [<natura:nether_logs2> * 24, (<tconstruct:edible:3> * 8) % 50, <tconstruct:edible:33> % 50, (<natura:nether_sapling2> * 8) % 0], [<natura:nether_sapling2>], 15, 256
    );

    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<natura:nether_glowshroom> * 12, (<natura:nether_green_large_glowshroom> * 8) % 0], 
        [<natura:nether_glowshroom>, <contenttweaker:research_mushroom1>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<natura:nether_glowshroom:1> * 12, (<natura:nether_blue_large_glowshroom> * 8) % 0], 
        [<natura:nether_glowshroom:1>, <contenttweaker:research_mushroom1>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
        [<natura:nether_glowshroom:2> * 12, (<natura:nether_purple_large_glowshroom> * 8) % 0], 
        [<natura:nether_glowshroom:2>, <contenttweaker:research_mushroom1>], 10, 128
);
}
addIBTrecipe([<industrialforegoing:fertilizer> * 12], 
    [<quark:glowshroom> * 10, (<quark:glowshroom_block> * 6) % 0], 
    [<quark:glowshroom>, <contenttweaker:research_mushroom1>], 10, 128
);

//tic
addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
    [<tconstruct:slime_congealed:4> * 24, (<minecraft:magma_cream> * 6) % 75, (<tconstruct:edible:3> * 4) % 50, (<tconstruct:slime_sapling:2> * 8) % 0], [<tconstruct:slime_sapling:2>], 15, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
    [(<tconstruct:edible:1> * 6) % 75, <tconstruct:slime_congealed> * 24, (<tconstruct:slime_sapling> * 8) % 0], [<tconstruct:slime_sapling>], 15, 128
);
addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
    [(<tconstruct:edible:2> * 6) % 75, <tconstruct:slime_congealed> * 24, (<tconstruct:slime_sapling:1> * 8) % 0], [<tconstruct:slime_sapling:1>], 15, 128
);


{//interesting
    addIBTrecipe([<industrialforegoing:fertilizer> * 16], 
        [<extrautils2:ironwood_log> * 24, (<exnihilocreatio:item_ore_iron:1>.withDisplayName("Iron Apple") * 4) % 25, (<extrautils2:ironwood_sapling> * 8) % 0], [<extrautils2:ironwood_sapling>], 12, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 24], 
        [<aether_legacy:aether_log:1> * 24, (<aether_legacy:ambrosium_shard> * 2) % 30, <contenttweaker:ambrosium_seed> % 0, (<aether_legacy:golden_oak_sapling> * 8) % 0], [<aether_legacy:golden_oak_sapling> * 49], 30, 512
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 32], 
        [<natura:redwood_logs> * 32, <natura:redwood_logs:1> * 32, (<natura:redwood_sapling> * 8) % 0], [<natura:redwood_sapling> * 49], 30, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 20], 
        [<roots:wildwood_log> * 24, <roots:bark_wildwood> % 75, (<roots:wildwood_sapling> * 8) % 0], [<roots:wildwood_sapling>], 10, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 24], 
        [<integrateddynamics:menril_log> * 16, (<integrateddynamics:menril_log_filled> * 12) % 75, (<integrateddynamics:menril_berries> * 4) % 50, (<integrateddynamics:menril_sapling> * 8) % 0], [<integrateddynamics:menril_sapling>], 30, 512
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 64, <contenttweaker:fertilizer6> * 4], 
        [<stygian:endlog> * 40, (<stygian:endcanopysapling> * 8) % 0], [<stygian:endcanopysapling>], 15, 128
    );
    addIBTrecipe([<industrialforegoing:fertilizer> * 32], 
        [<biomesoplenty:log_0:4> * 24, (<biomesoplenty:sapling_1:7> * 8) % 0], [<biomesoplenty:sapling_1:7>], 15, 128
    );

    addIBTrecipe([<industrialforegoing:fertilizer> * 12, <botania:fertilizer> * 8], 
        [<roots:baffle_cap_mushroom> * 8, (<roots:baffle_cap_huge_top> * 4) % 0], 
        [<roots:baffle_cap_mushroom>, <contenttweaker:research_mushroom1>], 20, 512
);
}
//mine
addIBTrecipe([<industrialforegoing:fertilizer> * 32, <biomesoplenty:log_0:4> * 16, <botania:fertilizer> * 24], 
    [<contenttweaker:revived_log> * 4, <contenttweaker:revived_bush> % 0], [<contenttweaker:revived_bush>], 20, 1024
);





//processing
{//mushroom glowshroom
    scripts.helper.addSawRecipe(<minecraft:brown_mushroom_block>, <minecraft:brown_mushroom> * 4);
    scripts.helper.addSawRecipe(<minecraft:red_mushroom_block>, <minecraft:red_mushroom> * 4);

    scripts.helper.addSawRecipe(<natura:nether_green_large_glowshroom>, <natura:nether_glowshroom> * 4);
    scripts.helper.addSawRecipe(<natura:nether_blue_large_glowshroom>, <natura:nether_glowshroom:1> * 4);
    scripts.helper.addSawRecipe(<natura:nether_purple_large_glowshroom>, <natura:nether_glowshroom:2> * 4);

    scripts.helper.addSawRecipe(<quark:glowshroom_block>, <quark:glowshroom> * 4);
}
scripts.helper.addSawRecipe(<roots:baffle_cap_huge_top>, <roots:baffle_cap_mushroom> * 4);

mods.thermalexpansion.Centrifuge.addRecipe(
    [<erebus:log_balsam_resinless> % 100, <erebus:materials:40> % 100, <thermalfoundation:material:832> % 10], 
    <erebus:log_balsam>, <liquid:resin> * 50, 2000
);
scripts.content_machines.addFluidAlloyerRecipe(
    <erebus:log_rotten>,
    <erebus:log_baobab> | <erebus:log_eucalyptus> | <erebus:log_mahogany> | <erebus:log_mossbark> | <erebus:log_asper> | <erebus:log_cypress> | <erebus:log_marshwood>,
    <minecraft:rotten_flesh>,
    <liquid:bugs> * 1000, 20, 500
);

{//erebus mushroom
    scripts.helper.addSawRecipe(<erebus:kaizers_fingers_mushroom_block>, <erebus:kaizers_fingers_mushroom> * 4);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <minecraft:redstone_ore>, <erebus:kaizers_fingers_mushroom_block> * 2, <liquid:ore_make> * 500, 10000
    );
    scripts.helper.addSawRecipe(<erebus:dutch_cap_mushroom_block>, <erebus:dutch_cap_mushroom> * 4);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <netherendingores:ore_other_1:2>, <erebus:dutch_cap_mushroom_block> * 2, <liquid:ore_make> * 500, 10000
    );
    scripts.helper.addSawRecipe(<erebus:grandmas_shoes_mushroom_block>, <erebus:grandmas_shoes_mushroom> * 4);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <immersiveengineering:ore:5>, <erebus:grandmas_shoes_mushroom_block> * 6, <liquid:ore_make> * 1500, 10000
    );
    scripts.helper.addSawRecipe(<erebus:sarcastic_czech_mushroom_block>, <erebus:sarcastic_czech_mushroom> * 4);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <biomesoplenty:gem_ore:4>, <erebus:sarcastic_czech_mushroom_block> * 3, <liquid:ore_make> * 1000, 10000
    );
    scripts.helper.addSawRecipe(<erebus:dark_capped_mushroom_block>, <erebus:dark_capped_mushroom> * 4);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:electrotine_ore>, <erebus:dark_capped_mushroom_block> * 2, <liquid:ore_make> * 500, 10000
    );
}


//aether
mods.thermalexpansion.Centrifuge.addRecipe(
    [<aether_legacy:aether_log> % 100, <aether_legacy:golden_amber> % 100, <aether_legacy:golden_amber> % 10], 
    <aether_legacy:aether_log:1>, <liquid:skyroot> * 40, 3000
);
mods.thermalexpansion.Centrifuge.addRecipe(
    [],
    <aether_legacy:aether_log>, <liquid:skyroot> * 30, 2500
);
//menril
MechanicalSqueezer.addRecipe(<integrateddynamics:menril_log_filled>,
    <integrateddynamics:menril_log>, 0.95,
    <integrateddynamics:crystalized_menril_chunk>, 0.5,
    <integrateddynamics:crystalized_menril_chunk>, 0.25,
    <liquid:menrilresin> * 500
);


//amaranth
<ore:stickWood>.remove(<natura:sticks:2>);
mods.thermalexpansion.Imbuer.addRecipe(<liquid:amaranth_juice> * 200, <natura:sticks:2>, <liquid:water> * 200, 2000);
mods.thermalexpansion.Imbuer.addRecipe(<liquid:amaranth_juice> * 300, <natura:sticks:2>, <liquid:formic_acid> * 25, 1000);

//exp wood
mods.mekanism.crusher.addRecipe(<natura:nether_logs:2>, <minecraft:gunpowder>);

//bloodwood
MechanicalSqueezer.addRecipe(<natura:nether_logs2>,
    <tconstruct:edible:3>, 0.25,
    <liquid:blood> * 300
);
MechanicalSqueezer.addRecipe(<natura:nether_logs2:15>,
    <tconstruct:edible:3>, 0.25,
    <liquid:blood> * 300
);
MechanicalSqueezer.addRecipe(<natura:nether_planks:1>,
    <tconstruct:edible:3>, 0.15,
    <liquid:blood> * 100
);
MechanicalSqueezer.addRecipe(<natura:nether_sapling2>,
    <tconstruct:edible:3>, 0.05,
    <liquid:blood> * 100
);




{//burnt wood
    <ore:logWood>.remove(<mysticalworld:charred_log>);
    
}