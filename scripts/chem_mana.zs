import mods.alchemistry.Evaporator;

import mods.thermalexpansion.Centrifuge;
import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.Imbuer;


import mods.modularmachinery.RecipeBuilder;


{//dense hydrogen
    mods.mekanism.infuser.addRecipe("MANA", 30, <contenttweaker:palladium_mesh>, <contenttweaker:palladium_mana_mesh>);

    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:palladium_mesh> % 90,
            <contenttweaker:impure_mana_dust>.weight(0.001)
        ], <liquid:dense_hydrogen> * 200, 
        <liquid:liquidhydrogen> * 1000, <contenttweaker:palladium_mana_mesh>,
        <contenttweaker:flesh_support>,
        10, 10000
    );
}

{//dim stable
    scripts.content_machines.addAssemblerRecipe([<contenttweaker:dim_stable_plate1>], [
        <botania:rune:2>,
        <contenttweaker:orichalconite_plate>,
        <contenttweaker:awaken_uru_plate> * 4,
        <contenttweaker:crystal_metal_plate>,
        <contenttweaker:living_steel_plate> * 2
    ], <liquid:mirion2> * 576, 100, 10000);
}