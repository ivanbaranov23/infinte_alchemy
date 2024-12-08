
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;

import mods.ctutils.utils.Math;

{//ender chest
	recipes.remove(<enderstorage:ender_storage>);

	recipes.addShaped("ia_ender_chest1", <enderstorage:ender_storage>, [
		[<redstonearsenal:material:224>, <redstonearsenal:storage:1>, <redstonearsenal:material:224>], 
		[<contenttweaker:singularity_dust> | <contenttweaker:wormholium>, <avaritiaddons:avaritiaddons_chest>, <contenttweaker:singularity_dust> | <contenttweaker:wormholium>], 
		[<redstonearsenal:material:224>, <redstonearsenal:storage:1>, <redstonearsenal:material:224>]
	]);
	recipes.addShaped("ia_ender_chest2", <enderstorage:ender_storage> * 2, [
		[<contenttweaker:light_plate>, <bloodmagic:component:27>, <contenttweaker:light_plate>], 
		[<contenttweaker:singularity_dust> | <contenttweaker:wormholium>, <avaritiaddons:avaritiaddons_chest>, <contenttweaker:singularity_dust> | <contenttweaker:wormholium>], 
		[<contenttweaker:light_plate>, <bloodmagic:component:4>, <contenttweaker:light_plate>]
	]);
	recipes.addShaped("ia_ender_chest3", <enderstorage:ender_storage> * 4, [
		[<contenttweaker:mirion2_ingot>, <botania:rune:11>, <contenttweaker:mirion2_ingot>], 
		[<contenttweaker:singularity_dust> | <contenttweaker:wormholium>, <avaritiaddons:avaritiaddons_chest>, <contenttweaker:singularity_dust> | <contenttweaker:wormholium>], 
		[<contenttweaker:mirion2_ingot>, <botania:rune:11>, <contenttweaker:mirion2_ingot>]
	]);
	recipes.addShaped("ia_ender_chest4", <enderstorage:ender_storage> * 8, [
		[<draconicevolution:draconic_ingot>, <projecte:item.pe_covalence_dust:1>, <draconicevolution:draconic_ingot>], 
		[<contenttweaker:singularity_dust> | <contenttweaker:wormholium>, <avaritiaddons:avaritiaddons_chest>, <contenttweaker:singularity_dust> | <contenttweaker:wormholium>], 
		[<draconicevolution:draconic_ingot>, <projecte:item.pe_covalence_dust:1>, <draconicevolution:draconic_ingot>]
	]);
}

//ender tank
recipes.remove(<enderstorage:ender_storage:1>);

recipes.addShaped("ia_ender_tank1", <enderstorage:ender_storage:1>, [
	[<redstonearsenal:material:224>, <redstonearsenal:storage:1>, <redstonearsenal:material:224>], 
	[<contenttweaker:singularity_dust> | <contenttweaker:wormholium>, <mekanism:machineblock2:11>.withTag({tier: 3}), <contenttweaker:singularity_dust> | <contenttweaker:wormholium>], 
	[<redstonearsenal:material:224>, <redstonearsenal:storage:1>, <redstonearsenal:material:224>]
]);

//ender pouch
recipes.remove(<enderstorage:ender_pouch>);
recipes.addShaped("ia_ender_pouch", <enderstorage:ender_pouch>, [
	[null, <xreliquary:mob_ingredient:11>, null], 
	[<minecraft:leather>, <enderstorage:ender_storage>, <minecraft:leather>], 
	[null, <xreliquary:mob_ingredient:11>, null]
]);



mods.thermalexpansion.Pulverizer.addRecipe(<contenttweaker:entangled_particles> * 2, <enderstorage:ender_storage>, 20000);
mods.enderio.SagMill.addRecipe(
    [<contenttweaker:entangled_particles>, <contenttweaker:entangled_particles>, <contenttweaker:entangled_particles>, <contenttweaker:entangled_particles>], 
    [1.0, 0.75, 0.5, 0.5], 
    <enderstorage:ender_storage>, "MULTIPLY_OUTPUT", 100000
);


<contenttweaker:entangled_matter_a>.addAdvancedTooltip(function(item){
	if (item.tag.memberGet("id"))
		return item.tag.id.asString();
	return "*";
});
<contenttweaker:entangled_matter_b>.addAdvancedTooltip(function(item){
	if (item.tag.memberGet("id"))
		return item.tag.id.asString();
	return "*";
});
{
	var recipe = AssemblyRecipe.create(function(container) {
		if(container.jei){
			container.addItemOutput("output0", <contenttweaker:entangled_matter_a>.withLore(["§d§lEntangles to 1 out of 16 frequences"]));
			container.addItemOutput("output1", <contenttweaker:entangled_matter_b>.withLore(["§d§lEntangles to 1 out of 16 frequences"]));
		}
		else{
			container.addItemOutput("output0", <contenttweaker:entangled_matter_a>.withTag({
				id: (Math.floor(Math.random() * 16) + 1)
			}));
			container.addItemOutput("output1", <contenttweaker:entangled_matter_b>.withTag({
				id: (Math.floor(Math.random() * 16) + 1)
			}));
		}	
		
	});
	recipe = recipe.requireItem("input", <contenttweaker:entangled_particles> * 4);
	recipe = recipe.requireItem("input", <contenttweaker:bouncy_matter_small> * 4);
	recipe = recipe.requireItem("input", <appliedenergistics2:material:48>);
	
    
    
    //recipe = recipe.requireFluid("input", fluid);
    
    recipe = recipe.requireDuration("duration", 20);
    recipe = recipe.requireEnergy("power", 100000);

    <assembly:bioassembler>.addRecipe(recipe);
    <assembly:bioassembler>.addJEIRecipe(recipe);	
}