import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

{//rainbowcurryitem
    recipes.remove(<harvestcraft:rainbowcurryitem>);

    var rec = RecipeBuilder.newBuilder("rainbowcurryitem", "rainbow_leacher", 60 * 20);

    //rec.addEnergyPerTickInput(1000 * 1000 * 1000);

    rec.addItemInput(<harvestcraft:deluxechickencurryitem> * 1000);

    rec.addItemOutput(<harvestcraft:rainbowcurryitem>);

    rec.build();
}
{//epicbaconitem
    recipes.remove(<harvestcraft:epicbaconitem>);

    var rec = RecipeBuilder.newBuilder("epicbaconitem", "rainbow_leacher", 60 * 20);

    //rec.addEnergyPerTickInput(1000 * 1000 * 1000);

    rec.addItemInput(<harvestcraft:bbqplatteritem> * 1000);

    rec.addItemOutput(<harvestcraft:epicbaconitem>);

    rec.build();
}