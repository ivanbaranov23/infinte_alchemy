import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

function addBarrelRecipe(out as IItemStack, cat as IItemStack, iin as WeightedItemStack[], fin as ILiquidStack, time_tick as int, energy as int){
    var rec = RecipeBuilder.newBuilder(out.name, "deepslate_barrel", time_tick);
    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    rec.addItemOutput(out);
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    for i in iin{
        rec.addItemInput(i.stack);
		rec.setChance(i.chance);
    }
    if (fin){
        rec.addFluidInput(fin);
    }
    rec.build();
}


addBarrelRecipe(<quark:marble> * 16, <quark:marble>, [<prodigytech:ash>], <liquid:andesite> * 250, 10, 0);
addBarrelRecipe(<quark:limestone> * 16, <quark:limestone>, [<prodigytech:ash>], <liquid:andesite> * 250, 10, 0);
addBarrelRecipe(<quark:jasper> * 16, null, [<minecraft:hardened_clay>], <liquid:clay> * 144, 10, 0);
addBarrelRecipe(<quark:slate> * 16, <quark:slate>, [<prodigytech:ash>], <liquid:andesite> * 250, 10, 0);

addBarrelRecipe(<quark:biome_cobblestone> * 16, null, [<tconstruct:seared:1>, <thermalfoundation:material:771>], <liquid:andesite> * 250, 10, 0);
addBarrelRecipe(<quark:biome_cobblestone:1> * 16, null, [<tconstruct:seared:1>, <mod_lavacow:shattered_ice>], <liquid:andesite> * 250, 10, 0);

addBarrelRecipe(<minecraft:purpur_block> * 16, null, [<minecraft:chorus_fruit_popped> * 4], <liquid:andesite> * 250, 10, 0);

