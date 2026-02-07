import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.IngredientArrayBuilder;

mods.tconstruct.Casting.addTableRecipe(<exnihilocreatio:item_ore_osmium:1>, <tconstruct:edible:1>, <liquid:invar>, 48, true);
mods.thermalexpansion.Transposer.addFillRecipe(
    <exnihilocreatio:item_ore_osmium:1>, 
    <tconstruct:edible:1>, <liquid:invar> * 48, 
    2000
);
mods.tconstruct.Casting.addTableRecipe(<exnihilocreatio:item_ore_lead:1>, <minecraft:poisonous_potato>, <liquid:wear_resistant_alloy>, 32, true);
mods.thermalexpansion.Transposer.addFillRecipe(
    <exnihilocreatio:item_ore_lead:1>, 
    <minecraft:poisonous_potato>, <liquid:wear_resistant_alloy> * 32, 
    2000
);


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
    scripts.content_machines.addFluidAlloyerRecipe(
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

    {//gas colomn
        var rec = RecipeBuilder.newBuilder("rarer_earth_slurry", "gas_column", 200);
        rec.addEnergyPerTickInput(1024000);

        rec.addGasOutput(<gas:rare_earth_slurry> * 500);
        rec.addGasOutput(<gas:evil> * 100);
        rec.addGasOutput(<gas:cleanneodymium> * 1000);
        rec.addGasOutput(<gas:cleangallium> * 1000);
        rec.addItemOutput(<alchemistry:element:57> * 24);
        rec.addItemOutput(<alchemistry:element:58> * 16);
        rec.addItemOutput(<alchemistry:element:59> * 4);
        

        rec.addGasInput(<gas:rarer_earth_slurry> * 10000);
        rec.addItemInput(<contenttweaker:elemental_reduction> * 12);
        
        rec.build();
    }
}

{//copper proc
    //blue acid
    scripts.content_machines.addFluidMixerRecipe(
        <liquid:blue_acid> * 1000, 
        <liquid:electrotine> * 500, <liquid:sulfuricacid> * 500, <ore:dustWheat>, 
        20, 100
    );
    
    //rejects
    mods.mekanism.reaction.addRecipe(
        <mekanism:dirtydust:3> * 8, <liquid:electrotine> * 500, <gas:waste_gas> * 150, 
        <thermalfoundation:material:64> * 12, <gas:copper_reject> * 250, 9000, 60
    );
    mods.mekanism.reaction.addRecipe(
        <mekanism:dirtydust:3> * 8, <liquid:blue_acid> * 500, <gas:waste_gas> * 150, 
        <thermalfoundation:material:64> * 12, <gas:copper_reject> * 250, 9000, 60
    );

    mods.mekanism.reaction.addRecipe(
        <prodigytech:ash>, <liquid:pyrotheum> * 500, <gas:copper_reject> * 500, 
        <contenttweaker:copper_reject>, <gas:selenium_dioxide> * 500, 9000, 60
    );

    //selenium
    mods.mekanism.chemical.infuser.addRecipe(<gas:selenium_dioxide>, <gas:water>, <gas:selenious_acid>);
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:empty_ingot>, <liquid:liquidsulfurdioxide> * 1000, <gas:selenious_acid> * 1000, 
        <alchemistry:ingot:34>, <gas:sulfuricacid> * 1000, 9000, 60
    );
    

    //rejects
    mods.thermalexpansion.Centrifuge.addRecipe(
        [
            <projectred-core:resource_item:105> * 2,
            <contenttweaker:antimony_dust> * 4,
            <contenttweaker:arsenic_dust>,
            <contenttweaker:tellurium_dust>
        ], <contenttweaker:copper_reject>, <liquid:dore> * 125, 
        3000
    );

    //dore
    mods.thermalexpansion.Refinery.addRecipe(<liquid:electrum> * 250, null, <liquid:dore> * 300, 5000);
    mods.immersivepetroleum.Distillation.addRecipe(
        [
            <liquid:gold> * 100,
            <liquid:silver> * 100,
            <liquid:platinum> * 50,
            <liquid:palladium_fluid> * 10
        ], [], <liquid:dore> * 300, 1000 * 20, 20, []
    );
    mods.mekanism.reaction.addRecipe(
        <alchemistry:element:56>, <liquid:dore> * 125, <gas:oxygen> * 100, 
        <alchemistry:element:56>, <gas:waste_gas> * 300, 9000, 60
    );
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
{//titanium
    mods.thermalexpansion.Transposer.addFillRecipe(
        <exnihilocreatio:item_ore_titanium:1>, 
        <exnihilocreatio:item_ore_osmium> * 2, <liquid:lava_residue> * 400, 
        20000
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

{//barium
    mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:barium_dust> * 2, 
		<contenttweaker:barite_dust> * 3, <immersiveengineering:material:6>, 15000
	);
    mods.thermalexpansion.InductionSmelter.addRecipe(
		<contenttweaker:barium_dust> * 2, 
		<contenttweaker:barite_dust> * 2, <mysticalagriculture:coal:1>, 10000,
        <mysticalagriculture:coal>, 50
	);
    mods.alchemistry.Dissolver.addRecipe(<contenttweaker:barite_dust>, false, 1,
        [
            [100, <alchemistry:compound:51> * 16, <alchemistry:element:38> * 4]
        ]
    );


    mods.alchemistry.Dissolver.addRecipe(<bigreactors:mineralbenitoite>, false, 1,
        [
            [100, <alchemistry:compound:511> * 16, <alchemistry:compound:512> * 16, <alchemistry:compound:1> * 48]
        ]
    );
}
{//molybdenum
    mods.mekanism.reaction.addRecipe(
        <thermalfoundation:material:160>, <liquid:copper> * 288, <gas:black_slurp> * 1000, 
        <contenttweaker:molybdenum_dust>, <gas:waste_gas> * 10, 900, 60
    );
}

{//eezo
    scripts.helper.addFluidAlloyerRecipe(
        <taiga:eezo_ore>, 
        <enderio:item_material:20> * 16, <contenttweaker:black_bronze_ingot> * 1, 
        <liquid:petrotheum> * 2000, 
        256, 30
    );
}

{//pollucite
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:pollucite> * 2], [], 
        [<taiga:dilithium_ingot> * 12, <contenttweaker:enriched_bioslag> * 4, <enderio:item_material:35>], [
            <liquid:ore_make> * 1500,
            <liquid:bauxite_waste> * 1000
        ], 
        20, 10000
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:pollucite> * 2], [], 
        [<taiga:dilithium_ingot> * 12, <biomesoplenty:seaweed> * 16, <enderio:item_material:35>], [
            <liquid:ore_make> * 1500,
            <liquid:bauxite_waste> * 1000
        ], 
        20, 10000
    );
    mods.enderio.Vat.addRecipe(
        <liquid:pollucite1> * 1000, 1.0, <liquid:acid1> * 1000, 
        [<contenttweaker:pollucite>], [1.0], 
        [<contenttweaker:iodine>], [1.0], 
        250000
    );

    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:rubidium_dust> % 25
        ], <liquid:pollucite2> * 500, 
        <liquid:pollucite1> * 500, <contenttweaker:filter_solar>,
        <contenttweaker:weather_chrome_mesh>,
        40, 100000
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:rubidium_dust> % 75
        ], <liquid:pollucite2> * 500, 
        <liquid:pollucite1> * 500, <contenttweaker:filter_blood>,
        <contenttweaker:weather_chrome_mesh>,
        40, 100000
    );
    
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:cesium_dust> % 25
        ], <liquid:acid1> * 500, 
        <liquid:pollucite2> * 500, <contenttweaker:filter_solar>,
        <contenttweaker:weather_chrome_mesh>,
        40, 100000
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:cesium_dust> % 75
        ], <liquid:acid1> * 500, 
        <liquid:pollucite2> * 500, <contenttweaker:filter_blood>,
        <contenttweaker:weather_chrome_mesh>,
        40, 100000
    );
}

{//bastnasite
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:bastnasite>, <liquid:desert_soup> * 500, <gas:chlorosulfonic> * 250, 
        null, <gas:bastnasite_slurry> * 250, 50000, 60
    );
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:bastnasite>, <liquid:evil_blood> * 500, <gas:chlorosulfonic> * 250, 
        null, <gas:bastnasite_slurry> * 250, 50000, 60
    );
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:bastnasite>, <liquid:pilkon_blood> * 5000, <gas:chlorosulfonic> * 250, 
        null, <gas:bastnasite_slurry> * 200, 50000, 60
    );

    {//gas colomn
        var rec = RecipeBuilder.newBuilder("bastnasite_slurry", "gas_column", 200);
        rec.addEnergyPerTickInput(1024000);

        rec.addGasOutput(<gas:rare_earth_slurry> * 12000);
        rec.addGasOutput(<gas:rarer_earth_slurry> * 3000);
        rec.addItemOutput(<alchemistry:ingot:57> * 3);
        rec.addItemOutput(<alchemistry:ingot:58> * 5);
        
        rec.addIngredientArrayInput(IngredientArrayBuilder.newBuilder()
            .addIngredient(<twilightforest:fiery_ingot> * 16)
            .addIngredient(<contenttweaker:centipedium> * 16)
            .addIngredient(<moretcon:ingotgravitonium> * 4)
            .addIngredient(<contenttweaker:neodymium_ingot> * 6)
        );

        rec.addGasInput(<gas:bastnasite_slurry> * 20000);
        
        
        rec.build();
    }
}
{//tantalum niobium
    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:tantalum_niobium_f> * 1000], 
        [<contenttweaker:tantalum_ore_dust> * 4], [<liquid:hf> * 1000], 
        40, 20000
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:imperomite_catalyst_dust>], [
            <liquid:tantalum_f> * 1000,
            <liquid:niobium_f> * 1000
        ], 
        [<contenttweaker:imperomite_catalyst>], [<liquid:tantalum_niobium_f> * 1000], 
        40, 20000
    );

    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:tantalum_dust> % 75
        ], <liquid:hf> * 400, 
        <liquid:tantalum_f> * 500, <contenttweaker:filter_solar>,
        <contenttweaker:uranium_mesh>,
        40, 100000
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:niobium_dust> % 75
        ], <liquid:hf> * 400, 
        <liquid:niobium_f> * 500, <contenttweaker:filter_solar>,
        <contenttweaker:uranium_mesh>,
        40, 100000
    );
}
{//xenotime
    <contenttweaker:xenotime>.addTooltip("(Y,Yb,Gd)PO₄");
    mods.alchemistry.Dissolver.addRecipe(<contenttweaker:xenotime>, false, 1,
        [
            [100, 
                <alchemistry:element:39> * 4, 
                <alchemistry:element:70> * 4, 
                <alchemistry:element:64> * 4,
                <alchemistry:compound:14> * 8,
                <alchemistry:element:66>,
                <alchemistry:element:65>,
            ]
        ]
    );
}

{//scandium
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:scandium_chloride_dust>], [<liquid:phosphoric_acid> * 1000], 
        [<contenttweaker:kolbeckite>], [<liquid:hf> * 1000], 
        40, 20000
    );

}

{//moretcon alt recs
    //garstone
    scripts.content_machines.addFluidAlloyerRecipe(
        <moretcon:gemgarstone>, 
        <thermalfoundation:material:893>, <contenttweaker:glowcrystal>, <liquid:valyrium_fluid> * 288, 
        40, 1000
    );
    scripts.content_machines.addBioAssemblerRecipe(
        [<moretcon:gemgarstone> * 4], null, 
        [
            <thermalfoundation:material:893>, <contenttweaker:glowcrystal>,
            <taiga:valyrium_ingot>,
            <deepmoblearning:living_matter_overworldian> * 4
        ], [
            
        ], <contenttweaker:research_chemistry3>,
        10, 1000
    );

    
    //electarite
    scripts.content_machines.addFluidAlloyerRecipe(
        <moretcon:gemelectarite>, 
        <contenttweaker:electric_manyullyn_ingot> * 3, <contenttweaker:glowcrystal>, <liquid:emolachite> * 250, 
        40, 1000
    );
    scripts.content_machines.addBioAssemblerRecipe(
        [<moretcon:gemelectarite> * 4], null, 
        [
            <contenttweaker:electric_manyullyn_ingot> * 3, <contenttweaker:glowcrystal>,
            <deepmoblearning:living_matter_overworldian> * 4
        ], [
            <liquid:emolachite> * 250
        ], <contenttweaker:research_chemistry3>,
        10, 1000
    );
    scripts.content_machines.addBioAssemblerRecipe(
        [<moretcon:gemelectarite> * 8], null, 
        [
            <contenttweaker:electric_manyullyn_ingot> * 3, <contenttweaker:scandium_dust>,
            <deepmoblearning:living_matter_overworldian> * 4
        ], [
            <liquid:emolachite> * 250
        ], <contenttweaker:research_chemistry3>,
        10, 1000
    );


    //erythynite
    scripts.content_machines.addBioAssemblerRecipe(
        [<moretcon:gemerythynite> * 4], null, 
        [
            <contenttweaker:caelumite_dust> * 3, <taiga:jauxum_dust>, <contenttweaker:glowcrystal> * 2,
            <deepmoblearning:living_matter_hellish> * 4, <alchemistry:element:89> * 8
        ], [
            <liquid:radioactive_waste> * 250
        ], <contenttweaker:research_chemistry3>,
        10, 1000
    );
}