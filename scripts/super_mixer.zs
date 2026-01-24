import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;


<ore:rocketFuelA>.addItems([
    <contenttweaker:singularity_dust>,
    <contenttweaker:moon_dust>,
    <contenttweaker:fuel_coral>
]);

<ore:rocketFuelB>.addItems([
    <extendedcrafting:singularity_custom:29>,
    <contenttweaker:polonium_dust>
]);


{var rec = RecipeBuilder.newBuilder("leap", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(256000);

    rec.addItemInput(<alchemistry:ingot:52> * 4);
    rec.addItemInput(<taiga:vibranium_ingot> * 4);
    rec.addItemInput(<botania:manaresource:3>);
    rec.addItemInput(<contenttweaker:awaken_witherite> * 8);
    rec.addFluidInput(<liquid:yellow> * 2000);
    rec.addGridPowerInput(100);

    
    rec.addFluidOutput(<liquid:leap> * 10000);

    rec.build();
}

{var rec = RecipeBuilder.newBuilder("insane_lava", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(2560000);

    rec.addItemInput(<alchemistry:ingot:52> * 4);
    rec.addItemInput(<taiga:vibranium_ingot> * 4);
    //rec.addItemInput(<botania:manaresource:3>);
    rec.addItemInput(<contenttweaker:awaken_witherite> * 8);
    rec.addFluidInput(<liquid:super_heat_lava> * 2000);
    rec.addFluidInput(<liquid:blutonium> * 288);
    rec.addGridPowerInput(1000);

    
    rec.addFluidOutput(<liquid:leap> * 10000);

    rec.build();
}