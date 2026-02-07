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

    rec.addItemInput(<bloodmagic:lava_crystal>);
    
    rec.addFluidInput(<liquid:rocket_fuel> * 500);
    rec.addFluidInput(<liquid:super_heat_lava> * 2000);
    rec.addFluidInput(<liquid:blutonium> * 288);
    rec.addGridPowerInput(300);
    rec.addManaInput(100000, false);

    
    rec.addFluidOutput(<liquid:insane_heat_lava> * 1000);

    rec.build();
}

{var rec = RecipeBuilder.newBuilder("flower_plasma", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(2560000);

    rec.addItemOutputs(
        <contenttweaker:methyst_dust>, <contenttweaker:methyst_dirty_dust>
    );
    rec.addItemInputs(
        <contenttweaker:activated_biopower> * 4,
        <moretcon:gemelectarite> * 2,
        <contenttweaker:methyst> * 2,
        <mysticalagriculture:crafting:6>
    );
    rec.addItemInput(<contenttweaker:plasma_gen>).setChance(0.0);
    
    rec.addFluidInputs(
        <liquid:biotite> * 1500,
        <liquid:fire> * 50
    );
    rec.addManaInput(10000, false);

    rec.addCatalystInput(
        <contenttweaker:flower_nether_eye> * 4,
        ["Output fluid x1.5"],
        [
            RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
        ]
    ).setChance(0.5);
    rec.addCatalystInput(
        <moretcon:gemechostone> * 4,
        ["Output fluid x1.5"],
        [
            RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
        ]
    ).setChance(0.5);
    
    
    rec.addFluidOutput(<liquid:flowers> * 3000);

    rec.build();

}