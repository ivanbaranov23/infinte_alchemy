import crafttweaker.item.IItemStack;

import mods.appliedenergistics2.Inscriber;



//chips
function replaceChip(chip as IItemStack, top as IItemStack, mid as IItemStack){
	recipes.remove(chip);
	Inscriber.addRecipe(chip, mid, false, top, <projectred-core:resource_item>);
}
/*
replaceChip(<projectred-core:resource_item:1>, <contenttweaker:redstone_inlay>, <contenttweaker:redstone_inlay>);
replaceChip(<projectred-core:resource_item:2>, <contenttweaker:redstone_inlay>, <projectred-core:resource_item:1>);
replaceChip(<projectred-core:resource_item:10>, <contenttweaker:redstone_inlay>, <immersiveengineering:wirecoil:5>);

replaceChip(<projectred-core:resource_item:20>, <contenttweaker:redstone_inlay>, <projectred-core:resource_item:320>);
replaceChip(<projectred-core:resource_item:21>, <contenttweaker:redstone_inlay>, <projectred-core:resource_item:341>);

replaceChip(<projectred-core:resource_item:3>, <projectred-transmission:wire:17>, <projectred-transmission:wire:17>);
replaceChip(<projectred-core:resource_item:4>, <projectred-core:resource_item:2>, <projectred-core:resource_item:2>);

replaceChip(<projectred-core:resource_item:11>, <minecraft:redstone_torch>, <contenttweaker:redstone_inlay>);
replaceChip(<projectred-core:resource_item:12>, <minecraft:redstone_torch>, <projectred-core:resource_item:301>);
*/

//pre alloy ingots
mods.tconstruct.Casting.addTableRecipe(<projectred-core:resource_item:251>, <minecraft:iron_ingot>, <liquid:redstone>, 100 * 6, true);
mods.tconstruct.Casting.addTableRecipe(<projectred-core:resource_item:252>, <minecraft:iron_ingot>, <liquid:electrotine>, 250 * 6, true);
