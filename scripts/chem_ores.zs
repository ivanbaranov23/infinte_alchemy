
{//manyullyn
    {//pilkon
        mods.tconstruct.Alloy.addRecipe( <liquid:cobalt> * 144, [
            <liquid:obsidian> * 576,
            <liquid:pilkon_blood> * 75
        ]);
        mods.tconstruct.Alloy.addRecipe( <liquid:ardite> * 144, [
            <liquid:redstone> * 200,
            <liquid:pilkon_blood> * 75
        ]);

        mods.thermalexpansion.Transposer.addFillRecipe(
            <mekores:mekanismore:38>, 
            <minecraft:obsidian> * 2, <liquid:pilkon_blood> * 75, 
            10000
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <mekores:mekanismore:43>, 
            <minecraft:redstone> * 2, <liquid:pilkon_blood> * 75, 
            10000
        );
    }
    {//pilkon
        mods.tconstruct.Alloy.addRecipe( <liquid:cobalt> * 144, [
            <liquid:obsidian> * 576,
            <liquid:blazing_blood> * 75
        ]);
        mods.tconstruct.Alloy.addRecipe( <liquid:ardite> * 144, [
            <liquid:redstone> * 200,
            <liquid:blazing_blood> * 75
        ]);

        mods.thermalexpansion.Transposer.addFillRecipe(
            <mekores:mekanismore:38>, 
            <minecraft:obsidian> * 2, <liquid:blazing_blood> * 75, 
            10000
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <mekores:mekanismore:43>, 
            <minecraft:redstone> * 2, <liquid:blazing_blood> * 75, 
            10000
        );
    }
}

{//flolit
    recipes.addShaped("ia_flolit_plant", <contenttweaker:flolit_plant>, [
        [<mysticalcreations:bilim_essence>, <contenttweaker:flolit>, <mysticalcreations:bilim_essence>], 
        [<contenttweaker:flolit>, <contenttweaker:creosolon>, <contenttweaker:flolit>], 
        [<mysticalcreations:bilim_essence>, <contenttweaker:flolit>, <mysticalcreations:bilim_essence>]
    ]);

    mods.thermalexpansion.Compactor.addStorageRecipe(<contenttweaker:flolit>, <contenttweaker:flolit_plant> * 8, 1500);

    scripts.content_machines.addFluidMixerRecipe(
        <liquid:flolit_oil> * 2000, 
        <liquid:grape_juice> * 1000, <liquid:naphthalene> * 500, 
        <contenttweaker:primitive_eyes>, 
        256, 40
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:flolit>, 
		<appliedenergistics2:material:4>, <liquid:flolit_oil> * (500), 
		3000
	);
}

scripts.content_machines.addFluidMixerRecipe(
    <liquid:aqua_regia> * 1000, 
    <liquid:nitric_acid> * 500, <liquid:liquidhydrogenchloride> * 500, <minecraft:prismarine_crystals>, 
    256, 40
);
scripts.content_machines.addFluidMixerRecipe(
    <liquid:aqua_regia> * 1000, 
    <liquid:nitric_acid> * 500, <liquid:liquidhydrogenchloride> * 500, <contenttweaker:watertight_steel_nugget>, 
    256, 20
);

{//MA
    mods.thermalexpansion.Transposer.addFillRecipe(
        <mysticalagriculture:crafting:5>, <minecraft:paper> * 4, 
        <liquid:pure_water> * 1000, 
        32000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <mysticalagriculture:crafting:5> * 4, <minecraft:paper> * 4, 
        <liquid:essence_slurp> * 1000, 
        500
    );
}

{//cursed gold & gold

    mods.enderio.Vat.addRecipe(
		<liquid:air_gold2> * 1000, 1.5, <liquid:air_gold> * 1000, 
		[<thermalfoundation:coin:70>, <thermalfoundation:coin:71>, <thermalfoundation:coin:72>], [0.5, 0.75, 1.0], 
		[<atum:loot_sapphire_broach>, <atum:loot_ruby_broach>, <atum:loot_emerald_broach>, <atum:loot_diamond_broach>], [0.5, 1.0, 1.5, 2.0], 
		5000
	);
	mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:cursed_gold_pieces>, 
		<contenttweaker:gold_crystal>, <liquid:air_gold2> * (400), 
		3000
	);

    //cursed -> gold
    mods.mekanism.compressor.addRecipe(<contenttweaker:cursed_gold_pieces>, <gas:rfna>, <exnihilocreatio:item_ore_gold> * 8);
    mods.mekanism.reaction.addRecipe(
        <minecraft:prismarine_crystals>, <liquid:liquidgoldenamber> * 3000, <gas:cleangold> * 200, 
        null, <gas:gold> * 1500, 900, 60
    );
    mods.mekanism.reaction.addRecipe(
        <mysticalworld:unripe_pearl>, <liquid:liquidgoldenamber> * 3000, <gas:cleangold> * 200, 
        null, <gas:gold> * 1500, 900, 60
    );
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:cursed_gold_pieces>, <liquid:liquidgoldenamber> * 3000, <gas:rfna> * 200, 
        <exnihilocreatio:item_ore_gold> * 12, <gas:gold> * 1500, 900, 60
    );

    //chloroauric
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:chloroauric_acid> * 100, 
        <minecraft:gold_ingot> * 2, 
        <liquid:aqua_regia> * 120, 
        3000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:chloroauric_acid> * 500, 
        <aether_legacy:golden_amber>, 
        <liquid:aqua_regia> * 500, 
        5000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:chloroauric_acid> * 500, 
        <mekanism:dirtydust:1>, 
        <liquid:aqua_regia> * 500, 
        5000
    );

    //distilling
    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:aqua_regia> * 900, 
        <contenttweaker:pure_gold_dust> % 40, 
        <liquid:chloroauric_acid> * 1000, 
        4000
    );
    mods.immersivepetroleum.Distillation.addRecipe(
        [<liquid:aqua_regia> * 990], 
        [<contenttweaker:pure_gold_dust>, <mekanism:dirtydust>, <mekores:mekanismore:253>], 
        <liquid:chloroauric_acid> * 1000, 
        20 * 256, 20, 
        [0.5, 0.15, 0.03]
    );


    //pure -> normal
    recipes.addShapeless("ia_pure_gold_to_normal", <thermalfoundation:material:1> * 6, [
        <contenttweaker:pure_gold_dust>, 
        <thermalfoundation:material>, <thermalfoundation:material>, <thermalfoundation:material>, <thermalfoundation:material>, <thermalfoundation:material>
    ]);
    mods.thermalexpansion.InductionSmelter.addRecipe(
		<minecraft:gold_ingot> * 12, 
		<contenttweaker:pure_gold_dust>, <contenttweaker:gilded_soot>, 25000
	);

    //purple gold
    //todo argon
    scripts.helper.scripts.content_machines.addFluidAlloyerRecipe(
        <contenttweaker:unannealed_purple_gold_ingot>, 
        <contenttweaker:pure_gold_dust> * 3, <thermalfoundation:material:132>, <liquid:noble_gases> * 1000, 
        512, 40
    );

    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:purple_gold_ingot>, 
        <contenttweaker:unannealed_purple_gold_ingot>, <liquid:fire_water> * 4000, 
        50000
    );
}
{//cincinnasite
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:cincinnasite_slurry> * 250,
        <betternether:cincinnasite>, <liquid:hf> * 250,
        3000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:cincinnasite_slurry> * 500,
        <contenttweaker:cincinnasite_dirty_dust>, <liquid:hf> * 250,
        3000
    );

    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <mekanism:dirtydust:1> % 30,
            <contenttweaker:arkenium_dust> % 10,
            <contenttweaker:rare_earth_dust> % 3
        ], <liquid:glowstone> * 100,
        <liquid:cincinnasite_slurry> * 250, <contenttweaker:filter_charcoal>,
        <exnihilocreatio:item_mesh:4>, 20, 500
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <mekanism:dirtydust:1> % 40,
            <contenttweaker:arkenium_dust> % 20,
            <contenttweaker:rare_earth_dust> % 5
        ], <liquid:glowstone> * 125,
        <liquid:cincinnasite_slurry> * 250, <contenttweaker:filter_charcoal>,
        <contenttweaker:uranium_mesh>, 20, 1000
    );

    scripts.content_machines.addBioAssemblerRecipe(
        [<betternether:cincinnasite> * 6], null, 
        [
            <contenttweaker:pure_gold_dust>,
            <contenttweaker:arkenium_dust>,
            <contenttweaker:rare_earth_dust>,
            <ore:nuggetDiamond> * 3
            
        ], [
            <liquid:mushroom_stew> * 1000,
            <liquid:glowstone> * 400
        ], <contenttweaker:research_chemistry3>,
        20, 1000
    );
}
{//rare earth
    mods.mekanism.chemical.dissolution.addRecipe(<contenttweaker:rare_earth_dust>, <gas:rare_earth_slurry> * 250);
    mods.mekanism.chemical.crystallizer.addRecipe(<gas:rare_earth_slurry> * 250, <contenttweaker:rare_earth_dust>);

    //in gas_column
}

{//bauxite
    //bauxite
    mods.tconstruct.Casting.addBasinRecipe(
        <immersiveengineering:ore:1>, 
        <minecraft:quartz_block>, 
        <liquid:glass>, 1000, 
        true
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <immersiveengineering:ore:1> * 3, 
        <minecraft:quartz_block> * 2, 
        <liquid:glass> * 1500, 1000
    );
    

    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:bauxite_slurry> * 1000,
        <contenttweaker:bauxite_dust> * 2, <liquid:hf> * 250,
        3000
    );
    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:bauxite_waste> * 125,
        <thermalfoundation:material:68> % 80, <liquid:bauxite_slurry> * 250,
        3000
    );
    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:hf> * 125,
        null, <liquid:bauxite_waste> * 250,
        3000
    );

    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:bauxite_waste_treated> * 1000,
        <contenttweaker:ore_catalyst>, <liquid:bauxite_waste> * 1000,
        8000
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <mekores:mekanismore:33> % 85,
            <contenttweaker:gallium_dust> % 65
        ],  <liquid:hf> * 120, 
        <liquid:bauxite_waste_treated> * 250, <contenttweaker:filter_charcoal>,
        null,
        20, 200
    );
}
{//platinum
    scripts.content_machines.addFluidAlloyerRecipe(
        <exnihilocreatio:item_ore_platinum>, 
        <quark:jasper>, <ore:ring>, <liquid:ore_make> * 400, 
        40, 120
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <exnihilocreatio:item_ore_platinum> * 2, 
        <quark:jasper>, <ore:broach>, <liquid:ore_make> * 400, 
        40, 120
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <exnihilocreatio:item_ore_platinum> * 3, 
        <quark:jasper>, <ore:necklace>, <liquid:ore_make> * 400, 
        40, 120
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <exnihilocreatio:item_ore_platinum> * 5, 
        <quark:jasper>, <ore:scepter>, <liquid:ore_make> * 400, 
        40, 120
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <exnihilocreatio:item_ore_platinum> * 10, 
        <quark:jasper>, <ore:idol>, <liquid:ore_make> * 400, 
        40, 120
    );
}
{//tungsten
    <contenttweaker:dark_shard>.addTooltip("Source of tungsten");
    scripts.content_machines.addFluidAlloyerRecipe(
        <contenttweaker:dark_shard>, 
        <ore:dyeBlack> * 3, <contenttweaker:zinc_dust> * 2, <liquid:essence_slurp> * 500, 
        100, 200
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <contenttweaker:dark_shard>, 
        <ore:dyeBlack> * 3, <contenttweaker:zinc_dust> * 2, <liquid:oil> * 500, 
        100, 200
    );

    mods.thermalexpansion.Crucible.addRecipe(<liquid:blackish_slurp> * 250, <contenttweaker:dark_shard>, 4000);
    mods.thermalexpansion.Imbuer.addRecipe(<liquid:black_slurp> * 1000, <contenttweaker:coaled_biocoal>, <liquid:blackish_slurp> * 1000, 2000);

    mods.mekanism.compressor.addRecipe(<mekanism:shard>, <gas:black_slurp>, <exnihilocreatio:item_ore_tungsten>);
    mods.mekanism.compressor.addRecipe(<mekores:mekanismore:11>, <gas:black_slurp>, <exnihilocreatio:item_ore_tungsten>);
    mods.mekanism.compressor.addRecipe(<mekores:mekanismore:36>, <gas:black_slurp>, <exnihilocreatio:item_ore_tungsten>);
}
{//uranium
    scripts.helper.addFluidAlloyerRecipe(
        <contenttweaker:irradiated_compound>, 
        <immersiveengineering:metal:5> * 4, <bigreactors:ingotyellorium> * 2, <liquid:emerald> * 2000, 
        128, 40
    );
    scripts.helper.addFluidAlloyerRecipe(
        <contenttweaker:irradiated_compound>, 
        <immersiveengineering:metal:5> * 3, <bigreactors:ingotyellorium>, <liquid:liquidirradium> * 576, 
        128, 40
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:banana>, 
		<contenttweaker:irradiated_compound> * 3, <harvestcraft:bananaitem> * 64, 50000
	);
}

{//draconium
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:imperomite_catalyst>,<liquid:dragon_spit> * 4000, <gas:ethyl_cyanoacrylate> * 250, 
        <contenttweaker:imperomite_catalyst_dust>, <gas:cyanoacrylate> * 250, 9000, 60
    );
}


//eezo
    scripts.helper.addFluidAlloyerRecipe(
        <taiga:eezo_ore>, 
        <enderio:item_material:20> * 16, <contenttweaker:black_bronze_ingot> * 1, 
        <liquid:petrotheum> * 2000, 
        256, 30
    );