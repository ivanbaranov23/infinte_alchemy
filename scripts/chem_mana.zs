import mods.alchemistry.Evaporator;

import mods.thermalexpansion.Centrifuge;
import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.Imbuer;


import mods.modularmachinery.RecipeBuilder;


{//pilkeum
    recipes.addShapeless("pilkeum", <contenttweaker:pilkeum> * 2, [
        <prodigytech:ferramic_dust>, <prodigytech:ferramic_dust>, 
        <harvestcraft:carrotjuiceitem>,
        <botania:dye:6>,
        <minecraft:gunpowder>,
        <contenttweaker:weak_enhancer>
    ]);
    mods.tconstruct.Melting.addRecipe(<liquid:aluminum> * (144 * 9), <contenttweaker:pilkeum>, 2050);
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:aluminum> * (144 * 9), <contenttweaker:pilkeum>, 2000
    );


    mods.tconstruct.Melting.addRecipe(<liquid:pilkon_blood> * 1000, <contenttweaker:pilkon_corpse>, 2050);
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:pilkon_blood> * 1000, <contenttweaker:pilkon_corpse>, 5000
    );
    mods.immersivepetroleum.Distillation.addRecipe(
        [<liquid:biodiesel> * 200, <liquid:colagen> * 15], 
        [<contenttweaker:pilkeum>], <liquid:pilkon_blood> * 50, 
        2000, 25, 
        [0.04]
    );
    
    //mods.immersiveengineering.Refinery.addRecipe(<liquid:pilkon_blood> * 15, <liquid:blood> * 50, <liquid:if.pink_slime> * 50, 8800);
    scripts.content_machines.addFluidMixerRecipe(<liquid:pilkon_blood> * 750, <liquid:blood> * 1000, <liquid:if.pink_slime> * 1000, <prodigytech:ferramic_dust>, 200, 150);
    //scripts.content_machines.addFluidMixerRecipe(<liquid:pilkon_blood> * 750, <liquid:blood> * 1000, <liquid:if.pink_slime> * 1000, <contenttweaker:ferramic_gravel> * 4, 200, 150);


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
    
    //vile
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:awaken_witherite>, <liquid:vile> * 2000, <gas:nickel> * 2000, 
        null, <gas:evil> * 100, 900, 60
    );
}
{//void
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <moretcon:dustzracohlium> * 4 % 95, <moretcon:dustzracohlium> * 3 % 50,
            <draconicevolution:draconium_dust> * 6 % 80, <contenttweaker:molybdenum_dust> * 4 % 30,
            <contenttweaker:nickel_oxide> * 4 % 50
        ], <liquid:void_residue> * 500, 
        <liquid:acid1> * 1000, <contenttweaker:void_stone>,
        <contenttweaker:research_sieving2>,
        20, 100000
    );
}


{//nether star
    {//wither dust
        recipes.remove(<darkutils:wither_block>);
        recipes.remove(<darkutils:material>);

        scripts.helper.addSimpleCrushingRecipe(<tconstruct:materials:17>, <darkutils:material>);
        scripts.helper.addSimpleCrushingRecipe(<bhc:wither_bone>, <darkutils:material>);
        scripts.helper.addSimpleCrushingRecipe(
            <openblocks:trophy:0>.withTag({entity_id: "minecraft:wither_skeleton"}), 
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

        scripts.content_machines.addBioAssemblerRecipe(
            [<darkutils:material> * 4], null,
            [<prodigytech:ash> * 4], [], <openblocks:trophy:37>.withTag({entity_id: "minecraft:wither_skeleton"}),
            20, 2000
        );
        scripts.content_machines.addBioAssemblerRecipe(
            [<contenttweaker:witherite> * 4], null,
            [<enderio:item_material:20> * 2, <appliedenergistics2:material:45>], [], <openblocks:trophy:37>.withTag({entity_id: "minecraft:wither_skeleton"}),
            20, 2000
        );
        
        mods.thermalexpansion.Compactor.addStorageRecipe(<darkutils:wither_block>, <darkutils:material> * 16, 5000);
        mods.thermalexpansion.Compactor.addStorageRecipe(<darkutils:wither_block>, <contenttweaker:awaken_witherite>, 5000);
    }

    {//witherite
        recipes.addShapeless("witherite", <contenttweaker:witherite>, [
            <enderio:item_material:20>, <enderio:item_material:20>, 
            <quark:black_ash>, <quark:black_ash>, 
            <appliedenergistics2:material:45>
        ]);
        mods.roots.Chrysopoeia.addRecipe("awaken_witherite", <contenttweaker:witherite>, <contenttweaker:awaken_witherite>);
        mods.enderio.SoulBinder.addRecipe(
            <contenttweaker:awaken_witherite>, <contenttweaker:witherite>, 
            ["minecraft:wither_skeleton"], 10000, 8
        );

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
            <contenttweaker:reagent_acid> | <contenttweaker:blood_matter> | <astralsorcery:itemcraftingcomponent:2>, 
            <darkutils:wither_block>, 
            <quantumflux:graphitedust>, <quantumflux:graphitedust>
        ]);
        recipes.addShapeless("ia_nether_star_catalyst2", <contenttweaker:nether_star_catalyst> * 2, [
            <contenttweaker:research_chemistry1>.reuse(), 
            <contenttweaker:nether_star_waste>, 
            <contenttweaker:reagent_acid> | <contenttweaker:blood_matter> | <astralsorcery:itemcraftingcomponent:2>, 
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
        500000, 
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
                <botania:manaresource:5> * 8,
                <botania:rune:14>,
                <botania:manaresource:22> * 8,
                <biomesoplenty:crystal_shard> * 64
            ], [
                <liquid:mana_juice> * 2000,
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
                <contenttweaker:singularity_dust> * 8,
                <contenttweaker:flesh_spurt_activated> * 12,
                <contenttweaker:terragem> * 4
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
    scripts.content_machines.addFluidAlloyerRecipe(
        <minecraft:nether_star>, 
        <contenttweaker:glass_star>, <thermalfoundation:material:1028> * 16, <liquid:nether_star_solution> * 1000, 
        1024, 100
    );

    //shards
    recipes.removeByRecipeName("mysticalagradditions:nether_star_shards");
    recipes.addShaped("ia_ns_shard_to_ns", <minecraft:nether_star>, [
        [null, <mysticalagradditions:stuff>, null],
        [<mysticalagradditions:stuff>, <contenttweaker:mana_wire>, <mysticalagradditions:stuff>],
        [null, <mysticalagradditions:stuff>, null]
    ]);

    scripts.helper.addSawRecipeWByproduct(<minecraft:nether_star>, <mysticalagradditions:stuff> * 2, <mysticalagradditions:stuff>, 50);

    mods.thermalexpansion.InductionSmelter.addRecipe(
        <mysticalagradditions:stuff>, 
        <mysticalagradditions:stuff>, <harvestcraft:starfruitjellyitem> * 64, 
        2000000, 
        <mysticalagradditions:stuff>, 30
    );
}



{//tartaric gel
    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:tartaric_gel> * 250],
        [
            <prodigytech:tartaric_stoker> * 32,
            <moretcon:dustknightmetal> * 12,
            <enderio:item_material:75> * 4,
            <contenttweaker:reagent_wood>
        ], [
            <liquid:tartaric_acid> * 2000,
            <liquid:evil_blood> * 500,
            <liquid:vapor_of_levity> * 500
        ], 40, 25000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
		<contenttweaker:tartaric_dust>, 
		<bloodmagic:soul_gem>.withTag({souls: 64.0, demonWillType: "destructive"}), <liquid:tartaric_gel> * 1000, 
		25000
	);
}

{//living waste
    mods.thermalexpansion.Insolator.addRecipe(
        <botania:livingwood>,
        <contenttweaker:living_waste>, <contenttweaker:fertilizer6>, 25 * 1000 * 1000,
        <contenttweaker:impure_mana_dust>, 4, 1000
    );
    mods.thermalexpansion.Insolator.addRecipe(
        <botania:livingwood>,
        <contenttweaker:living_waste>, <contenttweaker:fertilizer7>, 50 * 1000 * 1000,
        <contenttweaker:impure_mana_dust>, 20, 1000
    );
}

{//dense hydrogen
    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:hydrogen_mix> * 250],
        [
            <botania:manaresource:15> * 8,
            <enderio:item_material:37>,
            <contenttweaker:zeolite> * 6
        ], [
            <liquid:liquidhydrogen> * 1000,
            <liquid:liquiddeuterium> * 1000,
            <liquid:liquidtritium> * 1000
        ], 40, 25000
    );

    mods.mekanism.infuser.addRecipe("MANA", 30, <contenttweaker:palladium_mesh>, <contenttweaker:palladium_mana_mesh>);

    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:palladium_mesh> % 95,
            <contenttweaker:impure_mana_dust>.weight(0.01)
        ], <liquid:dense_hydrogen> * 200, 
        <liquid:hydrogen_mix> * 1000, <contenttweaker:palladium_mana_mesh>,
        <contenttweaker:flesh_support>,
        10, 100000
    );
}

{//dim stable
    scripts.content_machines.addAssemblerRecipe([<contenttweaker:dim_stable_plate1>], [
        <botania:rune:2>,
        <contenttweaker:orichalconite_plate> * 4,
        <contenttweaker:awaken_uru_plate> * 4,
        <contenttweaker:crystal_metal_plate>,
        <contenttweaker:living_steel_plate> * 2
    ], <liquid:circuit> * 1000, 100, 100000);
    scripts.content_machines.addAssemblerRecipe([<contenttweaker:dim_stable_plate1>], [
        <botania:rune:2>,
        <contenttweaker:orichalconite_plate> * 4,
        <contenttweaker:alchemical_brass_plate> * 4,
        <contenttweaker:crystal_metal_plate>,
        <contenttweaker:living_steel_plate> * 2
    ], <liquid:circuit> * 1000, 100, 100000);
    scripts.content_machines.addAssemblerRecipe([<contenttweaker:dim_stable_plate1>], [
        <botania:rune:2>,
        <contenttweaker:orichalconite_plate> * 4,
        <contenttweaker:super_vibrant_plate> * 24,
        <contenttweaker:crystal_metal_plate>,
        <contenttweaker:living_steel_plate> * 2
    ], <liquid:circuit> * 1000, 100, 100000);
}

{//gaia cat
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:gaia_catalyst>],
        [
            <contenttweaker:methyst> * 16,
            <botania:manaresource:14> * 4,
            <extendedcrafting:singularity_custom:66>,
            <contenttweaker:evil_core> * 4,
            <contenttweaker:rune_cyclic> * 8
        ], null,
        200, 100000
    );

    {
        var rec = RecipeBuilder.newBuilder("ultimate", "rune_cracker", 20 * 1, -1000);

        rec.addEnergyPerTickInput(2048 * 10000);

        rec.addItemOutput(<contenttweaker:gaia_catalyst>);
            
        
        rec.addItemInput(<contenttweaker:gaia_catalyst_used>);
        rec.addItemInput(<contenttweaker:rune_cyclic>).setChance(0.1);
        rec.addItemInput(<botania:rune:9>).setChance(0.1);
        rec.addItemInput(<botania:rune:10>).setChance(0.1);
        rec.addItemInput(<botania:rune:11>).setChance(0.1);
        rec.addItemInput(<botania:rune:12>).setChance(0.1);
        rec.addItemInput(<botania:rune:13>).setChance(0.1);
        rec.addItemInput(<botania:rune:14>).setChance(0.1);
        rec.addItemInput(<botania:rune:15>).setChance(0.1);



        rec.build();
    }
}