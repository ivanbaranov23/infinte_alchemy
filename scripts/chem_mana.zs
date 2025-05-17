import mods.alchemistry.Evaporator;

import mods.thermalexpansion.Centrifuge;
import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.Imbuer;


import mods.modularmachinery.RecipeBuilder;

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

{//dense hydrogen
    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:hydrogen_mix> * 250],
        [
            <botania:manaresource:15> * 8,
            <enderio:item_material:37>
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