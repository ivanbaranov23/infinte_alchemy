#priority 4500

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import crafttweaker.data.IData;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;

import mods.modularmachinery.RecipeBuilder;



function addRecycle(machine as IItemStack, loot as IItemStack[]){
    {//jei
        var recipe = AssemblyRecipe.create(function(container) {
            for item in loot{
                var iitem = item;
                container.addItemOutput("output", iitem.withLore(["Base chance: 50% + 1% * luck"]));
            }
        });

        recipe = recipe.requireItem("input", machine);

        <assembly:recycler>.addJEIRecipe(recipe);	
    }

    {//no luck
        var recipe = AssemblyRecipe.create(function(container) {
            
            for i in 0 to loot.length{
                if (container.random.nextDouble() < 0.5) //>
                    container.addItemOutput("output" ~ i, loot[i]);
            }
        });
        recipe = recipe.requireSelection("selection", <contenttweaker:luck_crystal_base>.withDisplayName("Run with no luck"), false);
        recipe = recipe.requireItem("input", machine);

        recipe.setActive(20);
        recipe = recipe.requireDuration("duration", 20);
        recipe = recipe.requireEnergy("power", 1000);

        <assembly:recycler>.addRecipe(recipe);	
    }

    {//luck
        var recipe = AssemblyRecipe.create(function(container) {
            var luck_item as IItemStack = container.getItem("luck");
            var luck_c as IData = luck_item.tag.memberGet("luck");
            var luck as double = 0.0;
            if (luck_c) {
                luck += luck_c.asDouble();
                container.addItemOutput("luck2", container.getItem("luck"));
            }

            
            for i in 0 to loot.length{
                var chance as double = 0.5 + (0.01 * luck);
                if (container.random.nextDouble() < chance) //>
                    container.addItemOutput("output" ~ i, loot[i]);
            }
        });
        recipe = recipe.requireItem("luck", <contenttweaker:luck_crystal>.marked("luck"));
        recipe = recipe.requireItem("input", machine);
        
        recipe.setActive(20);
        recipe = recipe.requireDuration("duration", 20);
        recipe = recipe.requireEnergy("power", 1000);

        <assembly:recycler>.addRecipe(recipe);	
    }
}

{//luck readd
    var recipe = AssemblyRecipe.create(function(container) {
        if (container.getItem("luck"))  
            container.addItemOutput("luck", container.getItem("luck"));
        });
    recipe = recipe.requireItem("luck2", <contenttweaker:luck_crystal>.marked("luck"));

    <assembly:recycler>.addRecipe(recipe);	
}

recipes.addShaped("ia_recycler", <requious:recycler>, [
	[<immersiveengineering:material:27>, <extrautils2:machine>.withTag({Type: "extrautils2:crusher"}), <immersiveengineering:material:27>], 
	[<minecraft:diamond>, <thermalexpansion:frame:64>, <minecraft:diamond>], 
	[<immersiveengineering:material:27>, <extrautils2:machine>.withTag({Type: "extrautils2:crusher"}), <immersiveengineering:material:27>]
]);
addRecycle(<requious:recycler>, [
    <thermalexpansion:frame:64>, <minecraft:diamond> * 2, <extrautils2:machine>.withTag({Type: "extrautils2:crusher"}) * 2,
    <immersiveengineering:material:27> * 4, <minecraft:iron_ingot>.withDisplayName("Irony")
]);