import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;


{var rec = mods.modularmachinery.RecipeBuilder.newBuilder("mystical_alloyer_1", "mystical_alloyer", 10 * 20);
    rec.addEnergyPerTickInput(1000);

    rec.addItemOutput(<mysticalagriculture:crafting:33> * 16);
    
    rec.addItemInput(<mysticalagriculture:crafting:32> * 16);
    rec.addInputs(
        <mysticalagriculture:crafting> * 8,
        <tconevo:metal:15>, <contenttweaker:steelwood_ingot>
    );
    rec.addFluidInput(<liquid:giriktanol> * 1000);

    rec.build();
}
{var rec = mods.modularmachinery.RecipeBuilder.newBuilder("mystical_alloyer_2", "mystical_alloyer", 10 * 20);
    rec.addEnergyPerTickInput(10000);

    rec.addItemOutput(<mysticalagriculture:crafting:34> * 16);
    
    rec.addItemInput(<mysticalagriculture:crafting:33> * 16);
    rec.addInputs(
        <mysticalagriculture:crafting:1> * 8,
        <contenttweaker:mitanium_ingot> * 2, <taiga:imperomite_ingot>
    );
    rec.addFluidInput(<liquid:giriktanol2> * 1000);

    rec.build();
}
{var rec = mods.modularmachinery.RecipeBuilder.newBuilder("mystical_alloyer_3", "mystical_alloyer", 10 * 20);
    rec.addEnergyPerTickInput(100000);

    rec.addItemOutput(<mysticalagriculture:crafting:35> * 16);
    
    rec.addItemInput(<mysticalagriculture:crafting:34> * 16);
    rec.addInputs(
        <mysticalagriculture:crafting:2> * 8,
        <redstonearsenal:material:32> * 2, <enderio:item_alloy_ingot:1> * 4
    );
    rec.addFluidInput(<liquid:giriktanol3> * 1000);

    rec.build();
}
{var rec = mods.modularmachinery.RecipeBuilder.newBuilder("mystical_alloyer_4", "mystical_alloyer", 10 * 20);
    rec.addEnergyPerTickInput(1000000);

    rec.addItemOutput(<mysticalagriculture:crafting:36> * 16);
    
    rec.addItemInput(<mysticalagriculture:crafting:35> * 16);
    rec.addInputs(
        <mysticalagriculture:crafting:3> * 8,
        <tconevo:metal:30> * 2, <moretcon:ingotfusionite> * 4
    );
    rec.addFluidInput(<liquid:giriktanol4> * 1000);

    rec.build();
}
{var rec = mods.modularmachinery.RecipeBuilder.newBuilder("mystical_alloyer_5", "mystical_alloyer", 10 * 20);
    rec.addEnergyPerTickInput(10000000);

    rec.addItemOutput(<mysticalagriculture:crafting:37> * 16);
    
    rec.addItemInput(<mysticalagriculture:crafting:36> * 16);
    rec.addInputs(
        <mysticalagriculture:crafting:4> * 8,
        <moretcon:ingotsanguiseelium> * 2, <tconevo:metal:25> * 3
    );
    rec.addFluidInput(<liquid:giriktanol5> * 1000);

    rec.build();
}