#loader crafttweaker reloadable
import mods.alchemistry.Evaporator;

import mods.thermalexpansion.Centrifuge;
import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.Imbuer;


import mods.modularmachinery.RecipeBuilder;

{//polyethylene
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:research_chemistry2>, <liquid:liquidoxygen> * 100, <gas:ethene> * 50, 
        <contenttweaker:research_chemistry2>, <gas:polyethylene> * 50, 50000, 60
    );
    mods.mekanism.reaction.addRecipe(
        <mekanism:polyethene> * 3, <liquid:liquidoxygen> * 100, <gas:ethene> * 50, 
        null, <gas:polyethylene> * 25, 50000, 60
    );
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:ldpe>, <liquid:liquidoxygen> * 100, <gas:ethene> * 50, 
        null, <gas:polyethylene> * 25, 50000, 60
    );
}

{//ldpe
    mods.mekanism.reaction.addRecipe(
        <mekanism:substrate>, <liquid:liquidethene> * 50, <gas:butene> * 10, 
        <contenttweaker:ldpe> * 6, <gas:oxygen> * 5, 900, 60
    );

    mods.thermalexpansion.Compactor.addStorageRecipe(<mekanism:polyethene>, <contenttweaker:ldpe> * 4, 1500);
}

{//fluospar & fluorine
    mods.prodigytech.magneticreassembler.addRecipe(<contenttweaker:fluospar_dust>, <contenttweaker:fluospar>);

    

    //fluospar=fluorite=CaF
    mods.mekanism.chemical.oxidizer.addRecipe(<contenttweaker:fluospar_dust>, <gas:fluorine> * 250);
    //mods.mekanism.chemical.oxidizer.addRecipe(<contenttweaker:fluospar_dust>, <gas:fluorine> * 250);
    
    mods.mekanism.chemical.infuser.addRecipe(<gas:fluorine>, <gas:hydrogen>, <gas:hf>);
}


{//gems
    mods.mekanism.separator.addRecipe(<liquid:ruby_slury> * 2, 200, <gas:cleaniron>, <gas:cleanchrome>);
    mods.mekanism.separator.addRecipe(<liquid:topaz_slury>, 200, <gas:fluorine>, <gas:cleanaluminum>);
    
}
{//amethyst
    Crucible.addRecipe(<liquid:ender_amethyst_dirty> * 100, <biomesoplenty:gem>, 4000);
    Crucible.addRecipe(<liquid:ender_amethyst_dirty> * 1000, <biomesoplenty:gem_block>, 40000);
    Imbuer.addRecipe(<liquid:ender_amethyst_dirty> * 200, <biomesoplenty:gem>, <liquid:aqua_regia> * 200, 4000);
    Imbuer.addRecipe(<liquid:ender_amethyst_dirty> * 2000, <biomesoplenty:gem_block>, <liquid:aqua_regia> * 2000, 40000);
    
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:amethyst_dirty_dust> % 40,
            <mekores:mekanismore:123> % 10,

        ], null,
        <liquid:ender_amethyst_dirty> * 100, <contenttweaker:filter_charcoal>,
        <contenttweaker:palladium_mesh>,
        40, 500
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:amethyst_dirty_dust> % 60,
            <mekores:mekanismore:123> % 20,
            <contenttweaker:ender_amethyst_dust> % 10
        ], null,
        <liquid:ender_amethyst_dirty> * 100, <contenttweaker:filter_solar>,
        <contenttweaker:palladium_mesh>,
        40, 500
    );

    furnace.addRecipe(<contenttweaker:amethyst_nugget> * 2, <contenttweaker:amethyst_dust>);
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:amethyst_nugget> * 6, 
		[
			<mysticalworld:amethyst_gem> * 2,
            <industrialforegoing:pink_slime_ingot>,
            <extrautils2:ingredients:3>
		]
	);

    mods.mekanism.reaction.addRecipe(
        <contenttweaker:amethyst_nugget>, <liquid:amaranth_juice> * 1000, <gas:cleaniron> * 250, 
        null, <gas:amethesting> * 250, 900, 60
    );
    mods.mekanism.reaction.addRecipe(
        <atum:khnumite_face>, <liquid:amaranth_juice> * 1000, <gas:amethesting> * 125, 
        null, <gas:amethesting> * 400, 900, 60
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <mysticalworld:amethyst_gem> * 4,
        <aether_legacy:zanite_gemstone>, <liquid:amethesting> * 100,
        10000
    );
}

{//methyst catalyst
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:methyst> * 2],
        [
            <contenttweaker:imperomite_catalyst> * 64,
            <contenttweaker:mana_focus> * 32,
            <enderio:item_capacitor_crystalline> * 16,
            <extendedcrafting:singularity_custom:61> * 3
        ], null,
        40, 1000
    );

    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:methyst> * 3, <contenttweaker:methyst_dust>],
        [
            <contenttweaker:methyst_dust> * 3,
            <contenttweaker:methyst_dirty_dust>,
            <taiga:meteorite_ingot> * 3
        ], <liquid:refined_obsidian> * 500,
        10, 1000
    );
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:methyst> * 3, <contenttweaker:methyst_dirty_dust>],
        [
            <contenttweaker:methyst_dirty_dust> * 3,
            <contenttweaker:methyst_dust>,
            <taiga:meteorite_ingot> * 3
        ], <liquid:refined_glowstone> * 500,
        10, 1000
    );

    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:methyst_dirty_dust>,
        <contenttweaker:methyst_dust>, <liquid:xu_demonic_metal> * 1000,
        20000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:methyst_dust>,
        <contenttweaker:methyst_dirty_dust>, <liquid:angel> * 1000,
        20000
    );

}



{//root and ironwood
    scripts.helper.addSawRecipeWByproduct(<twilightforest:root:1>, <twilightforest:liveroot> * 2, <twilightforest:liveroot>, 50);

    recipes.addShapeless("ia_root_alt1", <harvestcraft:ediblerootitem>, [
        <harvestcraft:cuttingboarditem>.reuse(), <biomesoplenty:plant_1:9> | <roots:wildroot>, <biomesoplenty:plant_1:9> | <roots:wildroot>
    ]);
    recipes.addShapeless("ia_root_alt2", <harvestcraft:ediblerootitem>, [
        <harvestcraft:cuttingboarditem>.reuse(), <quark:root> | <aether_legacy:aether_log> | <aether_legacy:skyroot_sapling>
    ]);
    recipes.addShapeless("ia_root_alt3", <harvestcraft:ediblerootitem> * 3, [
        <harvestcraft:cuttingboarditem>.reuse(), <botania:manaresource:20>
    ]);
    

    
}



{//nitrogen
    //rfna
    mods.mekanism.reaction.addRecipe(
        <prodigytech:heat_capacitor_0>, <liquid:nitric_acid> * 50, <gas:nitric_dioxide> * 50, 
        <prodigytech:heat_capacitor_0:1200>, <gas:rfna> * 50, 1600, 160
    );
    mods.mekanism.reaction.addRecipe(
        <prodigytech:heat_capacitor_1>, <liquid:nitric_acid> * 200, <gas:nitric_dioxide> * 200, 
        <prodigytech:heat_capacitor_1:1200>, <gas:rfna> * 300, 1200, 120
    );
    mods.mekanism.reaction.addRecipe(
        <prodigytech:heat_capacitor_2>, <liquid:nitric_acid> * 800, <gas:nitric_dioxide> * 800, 
        <prodigytech:heat_capacitor_2:1200>, <gas:rfna> * 1600, 1200, 80
    );
    mods.mekanism.reaction.addRecipe(
        <prodigytech:heat_capacitor_3>, <liquid:nitric_acid> * 3200, <gas:nitric_dioxide> * 3200, 
        <prodigytech:heat_capacitor_3:1200>, <gas:rfna> * 8000, 1200, 20
    );

    //cool nitrogen
	mods.mekanism.compressor.addRecipe(<contenttweaker:tank>, <gas:nitrogen>, <contenttweaker:tank_nitrogen>);
	mods.thermalexpansion.Compactor.addStorageRecipe(<contenttweaker:tank_nitrogen_dense>, <contenttweaker:tank_nitrogen>, 12000);
    
    <contenttweaker:tank_nitrogen_dense>.addTooltip("Compressing nitrogen gas makes it hot.");
    <contenttweaker:tank_nitrogen_dense>.addTooltip("Uncompressing can cause it to cool down.");

    mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:cold_nitrogen> * 200, <contenttweaker:tank_nitrogen_dense>, 10000, <contenttweaker:tank>);
}

{//sodium
    mods.mekanism.chemical.infuser.addRecipe(<gas:sodium>, <gas:water>, <gas:naoh>);
    mods.mekanism.chemical.crystallizer.addRecipe(<gas:naoh> * 250, <contenttweaker:naoh>);

}

{//acetic acid & formalde
    mods.thermalexpansion.Refinery.addRecipe(<liquid:acetic_acid> * 50, null, <liquid:vinegar> * 200, 10000);

    mods.thermalexpansion.Refinery.addRecipe(<liquid:acetic_acid> * 50, null, <liquid:tree_oil> * 400, 10000);

    mods.mekanism.reaction.addRecipe(
        <taiga:palladium_dust>, <liquid:ethanol> * 250, <gas:oxygen> * 250, 
        <taiga:palladium_dust>, <gas:acetic_acid> * 250, 900, 60
    );


    mods.thermalexpansion.Imbuer.addRecipe(<liquid:formaldehyde> * 500, <contenttweaker:zinc_dust>, <liquid:formic_acid> * 500, 10000);
    
}

{//concrete
    {//leaded
        mods.thermalexpansion.Transposer.addFillRecipe(
            <immersiveengineering:stone_decoration:7>,
            <immersiveengineering:stone_decoration:5>, <liquid:lead> * 360,
            3000
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <immersiveengineering:stone_decoration:7>,
            <immersiveengineering:stone_decoration:6>, <liquid:lead> * 180,
            3000
        );
    }

    {//tile
        recipes.remove(<immersiveengineering:stone_decoration:6>);
        mods.thermalexpansion.Transposer.addFillRecipe(
            <immersiveengineering:stone_decoration:6> * 4,
            <immersiveengineering:stone_decoration:5> * 4, <liquid:concrete_reinforcer> * 100,
            7500
        );
    }

    {//rebar
        recipes.remove(<engineersdecor:rebar_concrete>);
        recipes.addShaped("ia_rebar_concrete", <engineersdecor:rebar_concrete>, [
            [<immersiveengineering:stone_decoration:7>, <appliedenergistics2:smooth_sky_stone_block>, <immersiveengineering:stone_decoration:7>], 
            [<ore:stickEnderium>, <actuallyadditions:item_crystal_empowered:5>, <ore:stickEnderium>], 
            [<immersiveengineering:stone_decoration:7>, <appliedenergistics2:smooth_sky_stone_block>, <immersiveengineering:stone_decoration:7>]
        ]);
    scripts.content_machines.addAdvancedMixerRecipe(
            [<engineersdecor:rebar_concrete> * 4], [],
            [
                <appliedenergistics2:smooth_sky_stone_block> * 4,
                <immersiveengineering:stone_decoration:7> * 6,
                <moreplates:enderium_stick> * 4,
                <actuallyadditions:item_crystal_empowered:5> * 3
            ], [
                <liquid:concrete> * 2000,
                <liquid:concrete_reinforcer> * 500
            ], 40, 2500
        );
    }

    {//gas
        recipes.remove(<engineersdecor:gas_concrete>);
        mods.mekanism.reaction.addRecipe(
            <bloodmagic:decorative_brick>, <liquid:vapor_of_levity> * 800, <gas:nitric_acid> * 2000, 
            <engineersdecor:gas_concrete>, <gas:waste_gas> * 250, 50000, 60
        );

        mods.mekanism.reaction.addRecipe(
            <bloodmagic:decorative_brick>, <liquid:concrete_reinforcer> * 2000, <gas:nitric_acid> * 2000, 
            <engineersdecor:gas_concrete>, <gas:waste_gas> * 250, 50000, 60
        );

        mods.mekanism.reaction.addRecipe(
            <bloodmagic:slate:4>, <liquid:vapor_of_levity> * 800, <gas:nitric_acid> * 2000, 
            <engineersdecor:gas_concrete>, <gas:waste_gas> * 250, 50000, 60
        );

        mods.mekanism.reaction.addRecipe(
            <bloodmagic:slate:4>, <liquid:concrete_reinforcer> * 2000, <gas:nitric_acid> * 2000, 
            <engineersdecor:gas_concrete>, <gas:waste_gas> * 250, 50000, 60
        );
    }    

    {//rebar tile
        recipes.remove(<engineersdecor:rebar_concrete_tile>);

        //<engineersdecor:rebar_concrete_tile>
    }


    {//l concrete
    scripts.content_machines.addAdvancedMixerRecipe(
            [], [<liquid:concrete> * 1000],
            [
                <ore:sand> * 2,
                <ore:gravel>,
                <minecraft:clay_ball>
            ], [
                <liquid:water> * 1000,
                <liquid:clay> * 500
            ], 60, 250
        );
    scripts.content_machines.addAdvancedMixerRecipe(
            [], [<liquid:concrete> * 2000],
            [
                <ore:sand> * 2,
                <ore:gravel>,
                <contenttweaker:kaolin_clay> | <contenttweaker:rich_clay>
            ], [
                <liquid:water> * 1000,
                <liquid:clay> * 500
            ], 60, 250
        );
    scripts.content_machines.addAdvancedMixerRecipe(
            [], [<liquid:concrete> * 2500],
            [
                <biomesoplenty:dried_sand>,
                <atum:marl>,
                <contenttweaker:kaolin_clay> | <contenttweaker:rich_clay> | <contenttweaker:dolomite>,
                <contenttweaker:gravel_wool>
            ], [
                <liquid:water> * 1000,
                <liquid:clay> * 500
            ], 20, 250
        );
    }    
    

scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:concrete_reinforcer> * 1000],
        [
            <contenttweaker:naoh> * 3,
            <contenttweaker:gravel_wool>,
            <ore:crystalSlag> * 2
        ], [
            <liquid:concrete> * 2000,
            <liquid:naphthalene> * 1000,
            <liquid:sulfuricacid> * 500,
            <liquid:formaldehyde> * 500
        ], 40, 2500
    );

    
}

{//pheromones
    mods.thermalexpansion.Crucible.addRecipe(<liquid:pheromones> * 1000, <erebus:materials:37>, 4000);
    mods.thermalexpansion.Imbuer.addRecipe(<liquid:refined_pheromones> * 500, <xreliquary:mob_ingredient:2>, <liquid:pheromones> * 500, 2000);
}



{//hexane
    mods.mekanism.reaction.addRecipe(
        <thermalfoundation:material:134>, <liquid:liquidethene> * 100, <gas:hydrogen> * 100, 
        <thermalfoundation:material:198> * 5, <gas:hexane> * 100, 1500, 60
    );
    mods.mekanism.reaction.addRecipe(
        <alchemistry:element:78>, <liquid:liquidethene> * 100, <gas:hydrogen> * 100, 
        <alchemistry:element:78>, <gas:hexane> * 100, 1500, 60
    );


    mods.mekanism.reaction.addRecipe(
        <mekanism:polyethene>, <liquid:steam> * 1000, <gas:butene> * 100, 
        null, <gas:ethylbenzene> * 200, 900, 60
    );
    mods.mekanism.reaction.addRecipe(
        <thermalfoundation:material:134>, <liquid:ethylbenzene> * 100, <gas:hydrogen> * 100, 
        <thermalfoundation:material:198> * 7, <gas:hexane> * 200, 900, 60
    );
    mods.mekanism.reaction.addRecipe(
        <alchemistry:element:78>, <liquid:ethylbenzene> * 100, <gas:hydrogen> * 100, 
        <alchemistry:element:78>, <gas:hexane> * 200, 900, 60
    );
}

{//taurine
    mods.mekanism.chemical.infuser.addRecipe(<gas:ethene>, <gas:oxygen>, <gas:ethylene_oxide>);
    mods.mekanism.chemical.infuser.addRecipe(<gas:ethylene_oxide>, <gas:ammonia>, <gas:ethanolamine>);
    mods.mekanism.chemical.infuser.addRecipe(<gas:ethanolamine>, <gas:sulfurdioxide>, <gas:taurine>);
}

{//vitamins
    {//vitamin a
        mods.thermalexpansion.Pulverizer.addRecipe(<contenttweaker:carrot_pulp>, <minecraft:carrot>, 500, <contenttweaker:carrot_pulp>, 50);

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:carotene_solution> * 250, <contenttweaker:carrot_pulp>, <liquid:hexane> * 250, 2000);

        mods.thermalexpansion.Refinery.addRecipe(<liquid:hexane> * 750, <contenttweaker:impure_carotene> % 50, <liquid:carotene_solution> * 1000, 4000);

        mods.thermalexpansion.Centrifuge.addRecipe(
            [<contenttweaker:carotene> % 90, <mekanism:biofuel> % 20], <contenttweaker:impure_carotene>, null, 
            3000
        );

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:carotene> * 1000, <contenttweaker:carotene>, <liquid:pure_water> * 1000, 2000);
        
        mods.mekanism.reaction.addRecipe(
            <contenttweaker:zinc_ingot>, <liquid:carotene> * 200, <gas:oxygen> * 100, 
            <contenttweaker:zinc_nugget> * 7, <gas:retinol> * 100, 900, 60
        );
        mods.mekanism.reaction.addRecipe(
            <alchemistry:element:30>, <liquid:carotene> * 200, <gas:oxygen> * 100, 
            <alchemistry:element:30>, <gas:retinol> * 100, 900, 60
        );
        
        mods.mekanism.chemical.crystallizer.addRecipe(<gas:retinol> * 250, <contenttweaker:vitamin_a>);
    }

    {//vitamin b / bacteria loop
        scripts.helper.scripts.content_machines.addFluidMixerRecipe(
            <liquid:bacteria_broth> * 500, 
            <liquid:if.protein> * 1000, <liquid:pure_water> * 1000, <contenttweaker:bacteria>, 
            32, 20 * 4
        );
        scripts.helper.scripts.content_machines.addFluidMixerRecipe(
            <liquid:bacteria_broth> * 1000, 
            <liquid:nutrient_distillation> * 1000, <liquid:pure_water> * 1000, <contenttweaker:bacteria>, 
            32, 20 * 4
        );
        scripts.helper.scripts.content_machines.addFluidMixerRecipe(
            <liquid:bacteria_broth> * 1250, 
            <liquid:nectar_solution> * 1000, <liquid:pure_water> * 1000, <contenttweaker:bacteria>, 
            32, 20 * 4
        );


        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <minecraft:sugar>, <liquid:bacteria_broth> * 500, 30000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <prodigytech:sugar_cube>, <liquid:bacteria_broth> * 500, 28000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <contenttweaker:starch>, <liquid:bacteria_broth> * 500, 25000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <harvestcraft:soymilkitem>, <liquid:bacteria_broth> * 500, 20000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <harvestcraft:firmtofuitem>, <liquid:bacteria_broth> * 500, 20000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <contenttweaker:yeast>, <liquid:bacteria_broth> * 500, 18000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:fermented_bacteria_broth> * 500, <contenttweaker:yeast_rich>, <liquid:bacteria_broth> * 500, 12000);


        mods.immersivepetroleum.Distillation.addRecipe(
            [<liquid:bacteria_waste> * 25, <liquid:cobalamin> * 20, <liquid:sludge> * 30, <liquid:bacteria_broth> * 25], 
            [<contenttweaker:bacteria>, <biomesoplenty:gem:2>], 
            <liquid:fermented_bacteria_broth> * 125, 
            20 * 256, 20, 
            [0.1, 0.01]
        );

        mods.alchemistry.Evaporator.addRecipe(<contenttweaker:vitamin_b>, <liquid:cobalamin> * 250);
    }

    {//vitanim c
        mods.thermalexpansion.Centrifuge.addRecipe(
            [<contenttweaker:glucose> % 10], <minecraft:sugar>, null, 
            3000
        );
        mods.thermalexpansion.Centrifuge.addRecipe(
            [<contenttweaker:glucose> % 30], <contenttweaker:starch>, null, 
            3000
        );

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:glucose> * 250, <contenttweaker:glucose>, <liquid:pure_water> * 250, 2000);

        mods.immersiveengineering.Refinery.addRecipe(<liquid:sorbitol> * 8, <liquid:glucose> * 8, <liquid:liquidhydrogen> * 8, 400);

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:sorbose> * 500, <contenttweaker:bacteria>, <liquid:sorbitol> * 1000, 10000);

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:gulonic_acid> * 250, <contenttweaker:bacteria>, <liquid:sorbose> * 250, 5000);

        mods.alchemistry.Evaporator.addRecipe(<contenttweaker:vitamin_c>, <liquid:gulonic_acid> * 250);
    }

    recipes.addShapeless("ia_vitamins", <contenttweaker:vitamins>, [<contenttweaker:vitamin_a>, <contenttweaker:vitamin_b>, <contenttweaker:vitamin_c>]);
}
{//bacteria
    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:bacteria> % 20], <liquid:bacteria_broth> * 750, 
        [<contenttweaker:bacteria>], [<liquid:if.protein> * 500, <liquid:pure_water> * 500], <contenttweaker:research_bacteria1>,
        60, 128
    );
    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:bacteria> % 20], <liquid:bacteria_broth> * 1250, 
        [<contenttweaker:bacteria>], [<liquid:nutrient_distillation> * 500, <liquid:pure_water> * 500], <contenttweaker:research_bacteria1>,
        60, 128
    );
    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:bacteria> % 20], <liquid:bacteria_broth> * 1500, 
        [<contenttweaker:bacteria>], [<liquid:nectar_solution> * 500, <liquid:pure_water> * 500], <contenttweaker:research_bacteria1>,
        60, 128
    );


    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:bacteria> % 10, <contenttweaker:bacteria> % 5, <contenttweaker:ender_bacteria> % 1], null,
        [], [<liquid:sludge> * 1000], <contenttweaker:research_bacteria1>,
        20, 1000
    );

    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:bacteria> % 1], <liquid:bacteria_waste> * 500,
        [<contenttweaker:soap> * 4], [<liquid:bacteria_broth> * 1000], <contenttweaker:research_bacteria1>,
        40, 2000
    );

    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:bacteria> % 5], <liquid:ender_bacteria_broth> * 500, 
        [<contenttweaker:ender_bacteria>], [<liquid:bacteria_broth> * 1000], <contenttweaker:research_bacteria1>,
        20, 1000
    );
    mods.thermalexpansion.Refinery.addRecipe(<liquid:biotite> * 25, <contenttweaker:ender_bacteria> % 25, <liquid:ender_bacteria_broth> * 100, 16000);


    scripts.helper.addSawRecipeWByproduct(<contenttweaker:sick_worm>, <contenttweaker:alien_bacteria>, <contenttweaker:alien_bacteria>, 25);
    
}
{//bio fluids
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:imperomite_catalyst_dust>], [<liquid:cool_soup> * 500],
        [
            <contenttweaker:imperomite_catalyst>,
            <harvestcraft:asparagusquicheitem> | <harvestcraft:gummybearsitem> | <harvestcraft:cheeseburgeritem> | <harvestcraft:poutineitem>,
            <prodigytech:meat_patty> * 4
        ],
        [
            <liquid:nutrient_distillation> * 2000,
            <liquid:lifeessence> * 1000,
            <liquid:biotite> * 1000,

        ],
        40, 1000
    );
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:imperomite_catalyst_dust>], [<liquid:cool_soup> * 500],
        [
            <contenttweaker:imperomite_catalyst>,
            <betternether:black_apple> | <betternether:lucis_spore> | <betternether:eye_seed> | <betternether:bone_mushroom>,
            <prodigytech:meat_patty> * 4
        ],
        [
            <liquid:nutrient_distillation> * 2000,
            <liquid:lifeessence> * 1000,
            <liquid:biotite> * 1000,

        ],
        40, 1000
    );
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:imperomite_catalyst_dust>], [<liquid:cool_soup> * 500],
        [
            <contenttweaker:imperomite_catalyst>,
            <prodigytech:meat_patty> * 4
        ],
        [
            <liquid:nutrient_distillation> * 2000,
            <liquid:lifeessence> * 1000,
            <liquid:biotite> * 1000,
            <liquid:glowshroom_stew> * 500
        ],
        40, 1000
    );
}
{//muscles
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:muscle>], null,
        [
            <contenttweaker:muscle_cell> * 3,
            <contenttweaker:basic_neuron> * 2,
            <contenttweaker:medical_alloy_wire> * 4,
            <tconevo:metal:25>
        ], [], <contenttweaker:sewing_unit>,
        20, 10000
    );
}
mods.thermalexpansion.Refinery.addRecipe(<liquid:caffeine> * 200, null, <liquid:coffee> * 400, 8000);

scripts.helper.scripts.content_machines.addFluidMixerRecipe(
    <liquid:aqua_regia> * 1000, 
    <liquid:nitric_acid> * 500, <liquid:liquidhydrogenchloride> * 500, <exnihilocreatio:item_material:3>, 
    256, 20
);

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

    //chloroauric
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:chloroauric_acid> * 100, 
        <minecraft:gold_ingot>, 
        <liquid:aqua_regia> * 100, 
        3000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:chloroauric_acid> * 500, 
        <aether_legacy:golden_amber>, 
        <liquid:aqua_regia> * 500, 
        5000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:chloroauric_acid> * 1000, 
        <mekanism:dirtydust:1>, 
        <liquid:aqua_regia> * 1000, 
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
        [<liquid:aqua_regia> * 1000], 
        [<contenttweaker:pure_gold_dust>, <mekanism:dirtydust>, <mekores:mekanismore:253>], 
        <liquid:chloroauric_acid> * 1000, 
        20 * 256, 20, 
        [0.5, 0.15, 0.1]
    );


    //pure -> normal
    recipes.addShapeless("ia_pure_gold_to_normal", <thermalfoundation:material:1> * 6, [
        <contenttweaker:pure_gold_dust>, 
        <thermalfoundation:material>, <thermalfoundation:material>, <thermalfoundation:material>, <thermalfoundation:material>, <thermalfoundation:material>
    ]);

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
            <contenttweaker:arkenium_dust> % 20,
            <contenttweaker:rare_earth_dust> % 10
        ], <liquid:glowstone> * 100,
        <liquid:cincinnasite_slurry> * 250, <contenttweaker:filter_charcoal>,
        <exnihilocreatio:item_mesh:4>, 20, 500
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <mekanism:dirtydust:1> % 40,
            <contenttweaker:arkenium_dust> % 30,
            <contenttweaker:rare_earth_dust> % 20
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
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:bauxite_slurry> * 1000,
        <contenttweaker:bauxite_dust>, <liquid:hf> * 250,
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

{//glass fiber
    recipes.addShaped("ia_glass_fiber_materials", <contenttweaker:glass_fiber_materials>, [
        [<minecraft:bucket>, <biomesoplenty:white_sand>, <atum:sand>], 
        [<contenttweaker:kaolin_clay>, <contenttweaker:kaolin_clay>, <contenttweaker:fluospar>], 
        [<contenttweaker:dolomite>, null, null]
    ]);

    <forge:bucketfilled>.withTag({FluidName: "glass_fiber_mixture", Amount: 1000}).addTooltip("Craftable");
    furnace.addRecipe(<forge:bucketfilled>.withTag({FluidName: "glass_fiber_mixture", Amount: 1000}), <contenttweaker:glass_fiber_materials>);

    Evaporator.addRecipe(<contenttweaker:glass_fiber_clump>, <liquid:glass_fiber_mixture> * 2000);

    Centrifuge.addRecipe(
		[<contenttweaker:glass_fiber> % 95, <contenttweaker:glass_fiber> % 50, <contenttweaker:glass_fiber> % 15], <contenttweaker:glass_fiber_clump>, null, 
		3000
	);

    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:glass_cloth>],
        [
            <contenttweaker:glass_fiber> * 8,
            <ore:aercloud> * 2
        ],
        <liquid:glass> * 250, 
        10, 256
    );
}


{//super glue
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:nacn>], [],
        [
            <contenttweaker:naoh>
        ], [
            <liquid:ammonia> * 250,
            <liquid:methane> * 250
        ],
        20, 500
    );

scripts.content_machines.addAdvancedMixerRecipe(
        [
            <mekanism:salt>
        ], [
            <liquid:ethyl_cyanoacrylate> * 250
        ], [
            <contenttweaker:nacn>
        ], [
            <liquid:ethanol> * 500,
            <liquid:acetic_acid> * 250,
            <liquid:liquidchlorine> * 250,
            <liquid:formaldehyde> * 250
        ],
        20, 1000
    );

    mods.mekanism.reaction.addRecipe(
        <contenttweaker:research_chemistry2>, <liquid:sterile_water> * 1000, <gas:ethyl_cyanoacrylate> * 250, 
        <contenttweaker:research_chemistry2>, <gas:cyanoacrylate> * 250, 900, 60
    );
    scripts.helper.scripts.content_machines.addFluidAlloyerRecipe(
        <contenttweaker:superglue> * 8, 
        <industrialforegoing:dryrubber>, <appliedenergistics2:material:5>, <liquid:cyanoacrylate> * 1000, 
        512, 40
    );
}

{//gravel wool
    //gravel wool
    //mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<contenttweaker:gravel_wool>, <thermalfoundation:rockwool:7>, 30);
    mods.prodigytech.atomicreshaper.addRecipeMulti(
        <contenttweaker:gravel_wool>, 
        10, 10, 
        [
            <minecraft:blaze_powder>,
            <thermalfoundation:material:2049>,
            <thermalfoundation:material:2053>,
            <thermalfoundation:material:2051>
        ]
    );

}

{//wood things
    //entwood
    mods.enderio.SagMill.addRecipe(
        [<contenttweaker:entwood_dust>, <contenttweaker:entwood_dust>, <contenttweaker:entwood_dust>, <mekanism:sawdust> * 4], 
        [0.95, 0.75, 0.25, 0.5], 
        <contenttweaker:entwood>, "MULTIPLY_OUTPUT", 30000
    );
    scripts.helper.addSawRecipeWByproduct(<contenttweaker:reagent_wood>, <contenttweaker:entwood_dust>, <contenttweaker:entwood_dust>, 10);

    //wood singularity
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <natura:redwood_logs>, 192, <extendedcrafting:material:11>, 5000000);
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <natura:redwood_logs:1>, 192, <extendedcrafting:material:11>, 5000000);
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <roots:wildwood_log>, 160, <extendedcrafting:material:11>, 5000000);
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <botania:livingwood>, 64, <extendedcrafting:material:11>, 5000000);
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <contenttweaker:entwood_dust>, 64, <extendedcrafting:material:11>, 5000000);
    
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <mekanism:sawdust>, 400, <extendedcrafting:material:11>, 5000000);
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <thermalfoundation:material:800>, 400, <extendedcrafting:material:11>, 5000000);
    mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_custom:100>, <prodigytech:sawdust>, 400, <extendedcrafting:material:11>, 5000000);
    


}
{//paper
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:chad>], [],
        [
            <minecraft:paper> * 4,
            <minecraft:reeds> * 12,
            <ore:dustWood> * 8
        ], [
            <liquid:ultrapure_water> * 800
        ], 20, 1000
    );
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:chad2> * 2], [],
        [
            <contenttweaker:chad>,
            <thermalfoundation:material:68>,
            <thermalfoundation:material:832>,
            <contenttweaker:kaolin_clay>
        ], [
            <liquid:liquidsulfurtrioxide> * 1000
        ], 20, 1000
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:space_paper_base>, 
        <contenttweaker:chad2> * 4, <contenttweaker:soggy_wooden_board>, 
        10000
    );
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:space_paper_base>, <liquid:vapor_of_levity> * 200, <gas:polyethylene> * 4000, 
        <contenttweaker:space_paper>, <gas:waste_gas> * 500, 900, 60
    );
}
{//tartaric acid
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:tamarind_juice> * 250,
        <harvestcraft:tamarinditem>, 2000
    );

    mods.thermalexpansion.Refinery.addRecipe(<liquid:tartaric_acid> * 100, null, <liquid:tamarind_juice> * 250, 2000);

    mods.mekanism.reaction.addRecipe(
        <biomesoplenty:gem:2>, <liquid:tartaric_acid> * 1000, <gas:carmin> * 750, 
        <contenttweaker:wine_diamond> * 2, <gas:carmin> * 500, 900, 60
    );
    mods.mekanism.reaction.addRecipe(
        <minecraft:diamond>, <liquid:tartaric_acid> * 1000, <gas:carmin> * 750, 
        <contenttweaker:wine_diamond> * 2, <gas:carmin> * 500, 900, 60
    );

    recipes.addShaped("wine_diamond_cluster", <contenttweaker:wine_diamond_cluster>, [
        [null, <contenttweaker:wine_diamond>, null],
        [<contenttweaker:wine_diamond>, <twilightforest:carminite>, <contenttweaker:wine_diamond>],
        [null, <contenttweaker:wine_diamond>, null]
    ]);

    mods.actuallyadditions.AtomicReconstructor.addRecipe(<twilightforest:block_storage:4>, <contenttweaker:wine_diamond_cluster>, 10000);

    {
        var rec = RecipeBuilder.newBuilder("wine_diamond", "carmine_reactor", 10 * 20);

        rec.addEnergyPerTickInput(1000);

        rec.addItemInput(<biomesoplenty:gem:2>);
        rec.addFluidInput(<liquid:strawberry_wine> * 500);
        rec.addFluidInput(<liquid:tartaric_acid> * 500);

        rec.addItemOutput(<contenttweaker:wine_diamond> * 4);
        
        rec.build();
    }
}

{//carnexan
    mods.bloodmagic.AlchemyTable.addRecipe(
        <contenttweaker:flesh_piece>, 
        [<contenttweaker:food_pellet>, <contenttweaker:flesh_bits>, <tconevo:edible:1>, <tconevo:edible:1>, <contenttweaker:bucket_bio_diesel>], 
        10000, 100, 
        2
    );

    //spurt
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:flesh_spurt>], null, 
        [
            <contenttweaker:flesh_piece>, 
            <minecraft:rotten_flesh> * 64, 
            <tconstruct:ingots:4> * 32,
            <extrautils2:ingredients:17> * 16,
            <contenttweaker:activated_biopower>,
            <extendedcrafting:singularity_custom:9>
        ], [<liquid:bound_metal> * 288, <liquid:xu_demonic_metal> * 1000], <ae2stuff:grower>,
        80, 4096
    );
    mods.mekanism.compressor.addRecipe(<contenttweaker:flesh_spurt>, <gas:neutron_active>, <contenttweaker:flesh_spurt_activated>);

    //rod
    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:flesh_rod> % 100, <contenttweaker:flesh_piece> % 20, <contenttweaker:flesh_bits> % 20, <thermalfoundation:material:657> % 50], null, 
        [<contenttweaker:flesh_spurt>, <bloodmagic:item_demon_crystal:2>, <thermalfoundation:material:657>], [
            <liquid:empowered_steam> * 500,
            <liquid:evil_blood> * 100
        ], <ae2stuff:grower>,
        80, 4096
    );
    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<contenttweaker:flesh_rod> % 100, <contenttweaker:flesh_rod> % 20, <contenttweaker:flesh_bits> % 10, <thermalfoundation:material:657> % 10], null, 
        [<contenttweaker:flesh_spurt_activated>, <bloodmagic:item_demon_crystal:2>, <thermalfoundation:material:657>], [
            <liquid:empowered_steam> * 1000,
            <liquid:evil_blood> * 200
        ], <ae2stuff:grower>,
        80, 4096
    );

    //<extendedcrafting:singularity_custom:9>

    //support structure
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:flesh_support>], null,
        [
            <contenttweaker:flesh_rod> * 16,
            <contenttweaker:osmiridium_support> * 32,
            <contenttweaker:slate_7>,
            <extendedcrafting:singularity_custom:10> * 4,
            <extendedcrafting:singularity_custom:41> * 4,
            <extendedcrafting:singularity:24> * 4
        ],
        [
            <liquid:bound_metal> * (144 * 10),
            <liquid:evil_blood> * 1000
        ], <contenttweaker:sewing_unit>,
        80, 4096
    );
    <contenttweaker:flesh_support>.addTooltip("Causes organic polymers to align properly.");
}

{//chitin
    recipes.addShapeless("ia_aether_bug_to_chitin", <mod_lavacow:chitin> * 4, [<contenttweaker:aether_bug>]);

    {//raw chitin
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:raw_chitin> * 500, 
            <contenttweaker:sandworm_chitin>, 
            <liquid:hexane> * 200, 
            5000
        );
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:raw_chitin> * 300, 
            <erebus:materials>, 
            <liquid:hexane> * 200, 
            5000
        );
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:raw_chitin> * 300, 
            <mod_lavacow:chitin>, 
            <liquid:hexane> * 200, 
            5000
        );

        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:raw_chitin> * 250, 
            <contenttweaker:sandworm_chitin>, 
            <liquid:formic_acid> * 500, 
            5000
        );
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:raw_chitin> * 150, 
            <erebus:materials>, 
            <liquid:formic_acid> * 500, 
            5000
        );
        mods.thermalexpansion.Imbuer.addRecipe(
            <liquid:raw_chitin> * 150, 
            <mod_lavacow:chitin>, 
            <liquid:formic_acid> * 500, 
            5000
        );


        mods.immersivepetroleum.Distillation.addRecipe(
            [<liquid:pheromones> * 40, <liquid:raw_chitin> * 40, <liquid:if.protein> * 20], 
            [], 
            <liquid:bugs> * 100, 
            10 * 128, 10, 
            []
        );
    }

    mods.immersivepetroleum.Distillation.addRecipe(
        [<liquid:pheromones> * 10, <liquid:chitin_grade3> * 3, <liquid:if.protein> * 10], 
        [], 
        <liquid:raw_chitin> * 50, 
        40 * 256, 40, 
        []
    );

    scripts.content_machines.basicFluidMixerRecipe(
        <contenttweaker:imperomite_catalyst_dust>, <liquid:acidic_chitin> * 1000, 
        <contenttweaker:imperomite_catalyst>, [<liquid:raw_chitin> * 1000, <liquid:liquidhydrogenchloride> * 1000], 20, 128
    );

    /*scripts.content_machines.basicFluidMixerRecipe(
        null, <liquid:salty_chitin> * 1000, 
        <bloodmagic:item_demon_crystal:4>, [<liquid:acidic_chitin> * 1000, <liquid:naoh> * 1000], 20, 128
    );*/
    scripts.content_machines.addBioAssemblerRecipe(
        [], <liquid:salty_chitin> * 1000, 
        [
            <bloodmagic:item_demon_crystal:4> * 4,
            <bloodmagic:item_demon_crystal:1> * 4,
            <deepmoblearning:polymer_clay> * 12,
            <contenttweaker:guarding_crystal> * 4
        ], [<liquid:acidic_chitin> * 1000, <liquid:naoh> * 1000], <contenttweaker:flesh_support>,
        40, 4096
    );

    mods.immersivepetroleum.Distillation.addRecipe(
        [<liquid:chitin_grade1> * 10, <liquid:chitin_grade2> * 30, <liquid:chitin_grade3> * 80, <liquid:chitin_grade4> * 30, <liquid:chitin_grade5> * 10], 
        [<mekanism:salt>], 
        <liquid:salty_chitin> * 150, 
        20 * 512, 20, 
        [0.1]
    );

    {//grade folding
        scripts.content_machines.addFluidMixerRecipe(
            <liquid:chitin_grade1> * 200, 
            <liquid:chitin_grade5> * 100, <liquid:chitin_grade2> * 100,  <contenttweaker:mushroomite_nugget>, 10, 128
        );
        scripts.content_machines.addFluidMixerRecipe(
            <liquid:chitin_grade2> * 200, 
            <liquid:chitin_grade1> * 100, <liquid:chitin_grade3> * 100,  <contenttweaker:mushroomite_nugget>, 10, 128
        );
        scripts.content_machines.addFluidMixerRecipe(
            <liquid:chitin_grade3> * 200, 
            <liquid:chitin_grade2> * 100, <liquid:chitin_grade4> * 100,  <contenttweaker:mushroomite_nugget>, 10, 128
        );
        scripts.content_machines.addFluidMixerRecipe(
            <liquid:chitin_grade4> * 200, 
            <liquid:chitin_grade5> * 100, <liquid:chitin_grade3> * 100,  <contenttweaker:mushroomite_nugget>, 10, 128
        );
        scripts.content_machines.addFluidMixerRecipe(
            <liquid:chitin_grade5> * 200, 
            <liquid:chitin_grade1> * 100, <liquid:chitin_grade4> * 100,  <contenttweaker:mushroomite_nugget>, 10, 128
        );
    }


scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:hot_chitin>],
        [<liquid:chitin_grade5> * 200],
        [<contenttweaker:mekanized_steel_ingot> * 4, <thermalfoundation:material:136>, <taiga:fractum_ingot> * 4, <alchemistry:ingot:3> * 8],
        [<liquid:chitin_grade1> * 1000, <liquid:chitin_grade2> * 1000, <liquid:chitin_grade3> * 1000, <liquid:high_heat_lava> * 100],
        20, 2048
    );
scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:hot_chitin>],
        [<liquid:chitin_grade1> * 200],
        [<contenttweaker:mekanized_steel_ingot> * 4, <thermalfoundation:material:136>, <taiga:fractum_ingot> * 4, <alchemistry:ingot:3> * 8],
        [<liquid:chitin_grade5> * 1000, <liquid:chitin_grade4> * 1000, <liquid:chitin_grade3> * 1000, <liquid:high_heat_lava> * 100],
        20, 2048
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:chitin>, 
		<contenttweaker:hot_chitin>, <liquid:cryotheum> * 4000, 
		150000
	);
}

{//nether star
    {//wither dust
        recipes.remove(<darkutils:wither_block>);
        recipes.remove(<darkutils:material>);

        scripts.helper.addSimpleCrushingRecipe(<tconstruct:materials:17>, <darkutils:material>);
        scripts.helper.addSimpleCrushingRecipe(<bhc:wither_bone>, <darkutils:material>);
        scripts.helper.addSimpleCrushingRecipe(
            <openblocks:trophy:37>.withTag({entity_id: "minecraft:wither_skeleton"}), 
            <darkutils:material> * 24
        );

        scripts.helper.addSimpleCrushingRecipeWByproduct(
            <minecraft:skull:1>, 
            <darkutils:material> * 4,  <darkutils:material>, 
            50
        );
        scripts.helper.addSimpleCrushingRecipeWByproduct(
            <xreliquary:mob_ingredient:1>,
            <darkutils:material> * 2, <darkutils:material>,
            50
        );
        
        mods.thermalexpansion.Compactor.addStorageRecipe(<darkutils:wither_block>, <darkutils:material> * 16, 5000);
    }

    {//witherite
        recipes.addShapeless("witherite", <contenttweaker:witherite>, [
            <enderio:item_material:20>, <enderio:item_material:20>, 
            <quark:black_ash>, <quark:black_ash>, 
            <appliedenergistics2:material:45>
        ]);
        mods.roots.Chrysopoeia.addRecipe("awaken_witherite", <contenttweaker:witherite>, <contenttweaker:awaken_witherite>);
        {//druid circle

        }
    }

    recipes.addShaped("ia_glass_star", <contenttweaker:glass_star>, [
        [<contenttweaker:glass_fiber>, <contenttweaker:glass_ingot>, <contenttweaker:glass_fiber>], 
        [<contenttweaker:glass_ingot>, <bloodmagic:item_demon_crystal>, <contenttweaker:glass_ingot>], 
        [<contenttweaker:glass_fiber>, <contenttweaker:glass_ingot>, <contenttweaker:glass_fiber>]
    ]);


    {//catalyst
        recipes.addShapeless("ia_nether_star_catalyst1", <contenttweaker:nether_star_catalyst> * 2, [
            <contenttweaker:nether_star_dust>, 
            <contenttweaker:advanced_cryotheum>, 
            <darkutils:wither_block>, 
            <quantumflux:graphitedust>, <quantumflux:graphitedust>
        ]);
        recipes.addShapeless("ia_nether_star_catalyst2", <contenttweaker:nether_star_catalyst> * 2, [
            <contenttweaker:research_chemistry1>.reuse(), 
            <contenttweaker:nether_star_waste>, 
            <contenttweaker:advanced_cryotheum>, 
            <darkutils:wither_block>, 
            <quantumflux:graphitedust>, 
            <quantumflux:graphitedust>, 
            <bigreactors:dustcyanite>
        ]);
    }

    mods.enderio.SagMill.addRecipe(
        [<contenttweaker:arkenium_dust> * 4, <contenttweaker:nether_star_dust>], [1.0, 0.3], 
        <minecraft:nether_star>, "CHANCE_ONLY", 
        20000
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:nether_star_dust>, 
        <minecraft:nether_star>, <contenttweaker:nether_star_catalyst>, 
        100000, 
        <contenttweaker:nether_star_waste>, 60
    );

    mods.thermalexpansion.Centrifuge.addRecipe(
        [(<contenttweaker:arkenium_dust> * 3) % 50, <taiga:astrium_dust> % 50, <astralsorcery:itemcraftingcomponent:2> % 50, <draconicevolution:draconium_dust> % 50], 
        <contenttweaker:nether_star_waste>, 
        <liquid:nether_star_solution> * 200, 
        20000
    );

    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:nether_star_solution> * (1000), 
        <contenttweaker:nether_star_dust>, 
        <liquid:endacid> * 2000, 
        8000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:nether_star_solution> * (750), 
        <minecraft:nether_star>, 
        <liquid:endacid> * 2000, 
        12000
    );

    {//star polymer
    scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:star_polymer_base_hot>],
            [],
            [
                <contenttweaker:bouncy_matter_small> * 3,
                <contenttweaker:chitin> * 4,
                <botania:manaresource:22> * 8,
                <biomesoplenty:crystal_shard> * 12
            ], [
                <liquid:mana> * 2000,
                <liquid:rune_acid> * 1000,
                <liquid:sunnarium> * 500,
                <liquid:super_heat_lava> * 1000
            ],
            20, 10000
        );

    scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:star_polymer_base>],
            [],
            [
                <contenttweaker:star_polymer_base_hot>,
                <contenttweaker:singularity_dust> * 2,
                <contenttweaker:flesh_piece> * 4,
                <contenttweaker:elemental_clay> * 4
            ], [
                <liquid:cold_liquid> * 1000
            ],
            20, 10000
        );

        /*
        scripts.content_machines.addAssemblerRecipe(
            [<contenttweaker:star_polymer_base> * 12],
            [
                <contenttweaker:bouncy_matter>,
                <contenttweaker:insulation_fabric> * 8,
                <botania:manaresource:22> * 4,
                <biomesoplenty:crystal_shard> * 64,
                <appliedenergistics2:material:6> * 8,
                <contenttweaker:elastic_clay> * 32
            ],
            <liquid:fluorine> * 10000,
            20 * 10, 1000
        );*/

        mods.mekanism.reaction.addRecipe(
            <contenttweaker:star_polymer_base>, <liquid:vapor_of_levity> * 3000, <gas:nether_star_solution> * 4000, 
            <contenttweaker:star_polymer>, <gas:nether_star_inert> * 500, 900, 60
        );
        mods.mekanism.reaction.addRecipe(
            <contenttweaker:star_polymer_base>, <liquid:alien_polymer> * 3000, <gas:nether_star_solution> * 3500, 
            <contenttweaker:star_polymer>, <gas:nether_star_inert> * 500, 900, 60
        );
    }

    mods.mekanism.solarneutronactivator.addRecipe(<gas:nether_star_inert> * 2, <gas:nether_star_solution>);

    mods.mekanism.separator.addRecipe(<liquid:nether_star_inert>, 200, <gas:neutron_inert> * 10, <gas:evil>);
    mods.mekanism.separator.addRecipe(<liquid:nether_star_solution>, 200, <gas:neutron_inert> * 2, <gas:evil>);

    //star -> stuff
    mods.aether_legacy.Enchanter.registerEnchantment(<minecraft:nether_star>, <astralsorcery:itemcraftingcomponent:1> * 2, 1000);
    mods.actuallyadditions.AtomicReconstructor.addRecipe(<contenttweaker:arkenium_ingot> * 4, <minecraft:nether_star>, 10000);

    //making
    recipes.removeByRecipeName("deepmoblearning:living_matter_conversion_21");
    mods.extendedcrafting.CombinationCrafting.addRecipe(
        <minecraft:nether_star>, 1024 * 20, <contenttweaker:glass_star>,
        [
            <draconicevolution:draconium_ingot>,
            <draconicevolution:draconium_ingot>,
            <astralsorcery:itemcraftingcomponent:1>,
            <astralsorcery:itemcraftingcomponent:1>,
            <taiga:astrium_ingot>,
            <taiga:astrium_ingot>,
            <contenttweaker:arkenium_ingot>,
            <contenttweaker:arkenium_ingot>,
            <contenttweaker:arkenium_ingot>,
            <contenttweaker:arkenium_ingot>
        ]
    );
    mods.enderio.AlloySmelter.addRecipe(<minecraft:nether_star>, 
		[
			<contenttweaker:glass_star>,
			<contenttweaker:nether_star_dust>,
			<thermalfoundation:material:1028> * 16
		]
	);
    scripts.helper.scripts.content_machines.addFluidAlloyerRecipe(
        <minecraft:nether_star>, 
        <contenttweaker:glass_star>, <thermalfoundation:material:1028> * 16, <liquid:nether_star_solution> * 1000, 
        1024, 100
    );

}

{//indium
    //indium mixture
scripts.content_machines.addAdvancedMixerRecipe(
        [],
        [<liquid:indium_mixture> * 250],
        [
            <contenttweaker:sphalerite_dust>,
            <contenttweaker:galena_dust>
        ], [
            <liquid:ore_make> * 1000,
            <liquid:high_heat_lava> * 100
        ],
        40, 10000
    );

    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:indium_mixture>, 
        <thermalfoundation:material:1025>, 
        <liquid:indium_mixture> * 1500, 10000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:indium_mixture>, 
        <contenttweaker:ice_shard>, 
        <liquid:indium_mixture> * 1000, 10000
    );
    scripts.content_machines.basicFluidMixerRecipe(
        <contenttweaker:indium_mixture>, null, 
        null, [<liquid:indium_mixture> * 750, <liquid:cold_liquid> * 40], 40, 500
    );
    
    //indium oxide mixture
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:tank>, 
        <contenttweaker:tank_oxygen>, <contenttweaker:indium_mixture>, 
        20000, 
        <contenttweaker:indium_oxides>,
        80
    );


    //+HCl -> salty metallic solution
    mods.thermalexpansion.Imbuer.addRecipe(<liquid:indium_leach> * (1000), <contenttweaker:indium_oxides>, <liquid:aqua_regia> * 1000, 30000);

    //+NaOH -> Pb + Zn + Salty Indium Hydroxide Sol
scripts.content_machines.addAdvancedMixerRecipe(
        [
            <mekanism:dirtydust:6>,
            <mekores:mekanismore:113>
        ],
        [<liquid:indium_salty> * 250], [],
        [
            <liquid:indium_leach> * 250,
            <liquid:naoh> * 250
        ],
        40, 1000
    );

    // -> salt + indium hydroxide sol
    mods.immersivepetroleum.Distillation.addRecipe(
        [<liquid:indium_hydroxide> * 15, <liquid:zinc> * 5, <liquid:lead> * 5], 
        [<mekanism:salt>, <contenttweaker:indium_oxides>], 
        <liquid:indium_salty> * 25, 20 * 1000, 20, 
        [0.02, 0.005]
    );
    mods.thermalexpansion.Refinery.addRecipe(<liquid:indium_hydroxide> * 100, <mekanism:salt> % 20, <liquid:indium_salty> * 250, 20000);

    // + lapis/bonemeal -> indium oxide
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:indium_oxide>,
        <minecraft:dye:15>,
        <liquid:indium_hydroxide> * 350,
        8000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:indium_oxide>,
        <enderio:item_material:32>,
        <liquid:indium_hydroxide> * 250,
        8000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:indium_oxide>,
        <alchemistry:element:20>,
        <liquid:indium_hydroxide> * 250,
        4000
    );

    // + coke coal -> indium
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:indium_dust>, 
        <thermalfoundation:material:802>, <contenttweaker:indium_oxide>, 
        15000
    );
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:indium_dust>], [<contenttweaker:indium_oxide>], 500, 1);
    
}

{//desert blood
scripts.content_machines.addAdvancedMixerRecipe(
        [],
        [<liquid:desert_soup> * 500],
        [
            <mod_lavacow:cactus_thorn> * 16,
            <contenttweaker:alchemical_clay>,
            <taiga:meteorite_dust> * 4,
            <contenttweaker:ancient_dust> * 6
        ],
        [
            <liquid:sand> * 2000,
            <liquid:liquid_sunshine> * 1000,
            <liquid:nuit_fuel> * 1000,
            <liquid:desert_water> * 1000
        ], 
        40, 1000
    );

    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:atum_godshardium_ore>, 
        <atum:porphyry>, 
        <liquid:desert_soup> * 40, 10000
    );  

    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:godshardium>], [],
        [
            <contenttweaker:atum_godshardium_ore> * 3,
            <ore:godshard> * 16,
            <contenttweaker:ancient_dust> * 12,
            <contenttweaker:cursed_gold_ingot> * 4
        ], [
            <liquid:desert_soup> * 1000,
            <liquid:super_heat_lava> * 400,
            <liquid:gem_steel> * 144
        ], 200, 1000
    );
}


{//spaceice
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:radioactive_water> * 1000,
        <contenttweaker:space_ice_crystal>, 20000
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:c14_dust> % 3,
            <contenttweaker:polonium_dust> % 10
        ], <liquid:radioactive_waste> * 50, 
        <liquid:radioactive_water> * 250, <contenttweaker:biotite_dust>,
        <contenttweaker:palladium_mesh>,
        20, 10000
    );

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:c14_gem>, [
        [null, <contenttweaker:c14_dust>, <contenttweaker:blood_gem>, <contenttweaker:c14_dust>, null], 
        [<contenttweaker:c14_dust>, <contenttweaker:blood_gem>, <contenttweaker:sunnarium_chunk>, <contenttweaker:blood_gem>, <contenttweaker:c14_dust>], 
        [<contenttweaker:blood_gem>, <contenttweaker:sunnarium_chunk>, <botania:manaresource:2>, <contenttweaker:sunnarium_chunk>, <contenttweaker:blood_gem>], 
        [<contenttweaker:c14_dust>, <contenttweaker:blood_gem>, <contenttweaker:sunnarium_chunk>, <contenttweaker:blood_gem>, <contenttweaker:c14_dust>], 
        [null, <contenttweaker:c14_dust>, <contenttweaker:blood_gem>, <contenttweaker:c14_dust>, null]
    ]);
}


{//evil

    //normal: 1 ns -> 8 ei

    //this:
    //1 ns -> 1000 lns
    //1000 lns -> 1000 e
    //1000 e -> 4000 en
    //4000 en -> 20 ei

    mods.mekanism.chemical.infuser.addRecipe(<gas:rfna>, <gas:evil>, <gas:evil_nitrate> * 4);
    mods.mekanism.compressor.addRecipe(<mekanism:enrichediron>, <gas:evil_nitrate>, <extrautils2:ingredients:17>);
    
}

{//neutron
    mods.mekanism.solarneutronactivator.addRecipe(<gas:neutron_inert>, <gas:neutron_active>);
}