#priority 1000

import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.immersivepetroleum.Distillation;
//Distillation.addRecipe(ILiquidStack[] fluidOutputs, IItemStack[] itemOutputs, ILiquidStack fluidInput, int energy, int time, float[] chance)


recipes.addShaped("distill_sheetmetal", <contenttweaker:distill_sheetmetal> * 2, [
	[<moretcon:ingothallowsite>, <immersiveengineering:metal_decoration1:1>, <moretcon:ingothallowsite>], 
	[<immersiveengineering:sheetmetal:9>, <contenttweaker:rotor_blades>, <immersiveengineering:sheetmetal:9>], 
	[<moretcon:ingothallowsite>, <immersiveengineering:metal_decoration1:1>, <moretcon:ingothallowsite>]
]);
recipes.addShaped("distill_bar", <ddb:infinite_alchemy_test_slab> * 4, [
	[<moretcon:ingothallowsite>, <minecraft:iron_bars>, <moretcon:ingothallowsite>], 
	[<minecraft:iron_bars>, <moretcon:ingothallowsite>, <minecraft:iron_bars>], 
	[<moretcon:ingothallowsite>, <minecraft:iron_bars>, <moretcon:ingothallowsite>]
]);

static counter as int = 0;
function addCompactDistill(
    fluidOutputs as ILiquidStack[], itemOutputs as IItemStack[], fluidInput as ILiquidStack, energy as int, time as int, chance as float[]
){
    Distillation.addRecipe(fluidOutputs, itemOutputs, fluidInput, energy, time, chance);


	var rec = RecipeBuilder.newBuilder("CD_" ~ counter, "compact_distill", time);
    counter += 1;

    rec.addEnergyPerTickInput(energy);
    rec.addFluidInput(fluidInput);

    for fluid in fluidOutputs{
        rec.addFluidOutput(fluid);
    }
    for i,item in itemOutputs{
        rec.addItemOutput(item);
        rec.setChance(chance[i]);
    }
    
    rec.build();
}

{
    var rec = RecipeBuilder.newBuilder("CD_default", "compact_distill", 10);

    rec.addEnergyPerTickInput(2048);
    rec.addFluidInput(<liquid:oil> * 75);

    rec.addFluidOutput(<liquid:lubricant> * 9);
    rec.addFluidOutput(<liquid:diesel> * 27);
    rec.addFluidOutput(<liquid:gasoline> * 39);
    
    rec.addItemOutput(<immersivepetroleum:material>);
    rec.setChance(0.07);
    
    
    rec.build();
}