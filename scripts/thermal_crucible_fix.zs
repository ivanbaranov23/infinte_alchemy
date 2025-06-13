import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.thermalexpansion.Crucible;
//Crucible.addRecipe(ILiquidStack output, IItemStack input, int energy);
//removeRecipe(itemstack input)


function readdCrucible(item as IItemStack, fl as ILiquidStack, pow as int){
    //Crucible.removeRecipe(item);
    Crucible.addRecipe(fl, item, pow);
}

//glass
readdCrucible(<minecraft:sand>, <liquid:glass> * 1000, 5000);
readdCrucible(<minecraft:sand:1>, <liquid:glass> * 1000, 5000);

//dirt: fix + extra
//it's probably a mistake to put extra here
readdCrucible(<minecraft:dirt>, <liquid:dirt> * 144, 4000);
readdCrucible(<minecraft:dirt:1>, <liquid:dirt> * 144, 4000);
readdCrucible(<minecraft:dirt:2>, <liquid:dirt> * 144, 4000);