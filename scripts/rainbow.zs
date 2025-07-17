import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

var curry = <harvestcraft:deluxechickencurryitem> as IItemStack;
var bbqplatter = <harvestcraft:bbqplatteritem> as IItemStack;

mods.extendedcrafting.TableCrafting.addShaped(0, <modularcontroller:rainbow_leacher_controller>, [
    [<extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>], 
    [<extrautils2:decorativesolid:7>, curry, curry, curry, <extrautils2:decorativesolid:7>], 
    [<extrautils2:decorativesolid:7>, <biomesoplenty:terrestrial_artifact>, <extendedcrafting:frame>, <biomesoplenty:terrestrial_artifact>, <extrautils2:decorativesolid:7>], 
    [<extrautils2:decorativesolid:7>, bbqplatter, bbqplatter, bbqplatter, <extrautils2:decorativesolid:7>], 
    [<extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>, <extrautils2:decorativesolid:7>]
]);

{//rainbowcurryitem
    recipes.remove(<harvestcraft:rainbowcurryitem>);

    var rec = RecipeBuilder.newBuilder("rainbowcurryitem", "rainbow_leacher", 60 * 20);

    //rec.addEnergyPerTickInput(1000 * 1000 * 1000);

    rec.addItemInput(curry * 1000);

    rec.addItemOutput(<harvestcraft:rainbowcurryitem>);

    rec.build();
}
{//epicbaconitem
    recipes.remove(<harvestcraft:epicbaconitem>);

    var rec = RecipeBuilder.newBuilder("epicbaconitem", "rainbow_leacher", 60 * 20);

    //rec.addEnergyPerTickInput(1000 * 1000 * 1000);

    rec.addItemInput(bbqplatter * 1000);

    rec.addItemOutput(<harvestcraft:epicbaconitem>);

    rec.build();
}