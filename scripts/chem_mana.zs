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