import crafttweaker.item.IItemStack;

import mods.appliedenergistics2.Inscriber;

{//comps
	//coils
	recipes.remove(<projectred-core:resource_item:400>);
	recipes.addShaped("ia_pr_copper_coil", <projectred-core:resource_item:400>, [
		[<ore:ingotEezo>, <contenttweaker:coppra>, <contenttweaker:coppra>], 
		[<contenttweaker:coppra>, <contenttweaker:osgloridium_rod>, <contenttweaker:coppra>], 
		[<contenttweaker:coppra>, <contenttweaker:coppra>, <ore:ingotEezo>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:400> * 2],
		[
			<contenttweaker:osgloridium_rod>,
			<contenttweaker:coppra> * 6
		], <liquid:eezo_fluid> * 288,
		20, 1000
	);

	<projectred-core:resource_item:401>.displayName = "Tin Coil";
	recipes.remove(<projectred-core:resource_item:401>);
	recipes.addShaped("ia_pr_tin_coil", <projectred-core:resource_item:401>, [
		[<ore:ingotEezo>, <contenttweaker:nittin>, <contenttweaker:nittin>], 
		[<contenttweaker:nittin>, <contenttweaker:osgloridium_rod>, <contenttweaker:nittin>], 
		[<contenttweaker:nittin>, <contenttweaker:nittin>, <ore:ingotEezo>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:401> * 2],
		[
			<contenttweaker:osgloridium_rod>,
			<contenttweaker:nittin> * 6
		], <liquid:eezo_fluid> * 288,
		20, 1000
	);

	recipes.remove(<projectred-core:resource_item:402>);
	recipes.addShaped("ia_pr_gold_coil", <projectred-core:resource_item:402>, [
		[<ore:ingotEezo>, <contenttweaker:goold>, <contenttweaker:goold>], 
		[<contenttweaker:goold>, <contenttweaker:osgloridium_rod>, <contenttweaker:goold>], 
		[<contenttweaker:goold>, <contenttweaker:goold>, <ore:ingotEezo>]
	]);
	scripts.content_machines.addAssemblerRecipe(
		[<projectred-core:resource_item:402> * 2],
		[
			<contenttweaker:osgloridium_rod>,
			<contenttweaker:goold> * 6
		], <liquid:eezo_fluid> * 288,
		20, 1000
	);

	

	mods.actuallyadditions.Empowerer.addRecipe(
		<projectred-expansion:infused_ender_pearl> * 2, <appliedenergistics2:material:9>, 
		<mysticalworld:pearl>, <contenttweaker:bouncy_matter_small>, <enderio:item_material:75>, <contenttweaker:mana_focus>, 
		10000, 20, [143.0 / 255.0, 41.0 / 255.0, 133.0 / 255.0]
	);
}

//chips
function replaceChip(chip as IItemStack, top as IItemStack, mid as IItemStack){
	recipes.remove(chip);
	Inscriber.addRecipe(chip, mid, false, top, <projectred-core:resource_item>);
}

replaceChip(<projectred-core:resource_item:1>, <contenttweaker:redstone_inlay>, <contenttweaker:redstone_inlay>);
replaceChip(<projectred-core:resource_item:2>, <contenttweaker:redstone_inlay>, <projectred-core:resource_item:1>);
replaceChip(<projectred-core:resource_item:10>, <contenttweaker:redstone_inlay>, <immersiveengineering:wirecoil:5>);

replaceChip(<projectred-core:resource_item:20>, <contenttweaker:redstone_inlay>, <projectred-core:resource_item:320>);
replaceChip(<projectred-core:resource_item:21>, <contenttweaker:redstone_inlay>, <projectred-core:resource_item:341>);

replaceChip(<projectred-core:resource_item:3>, <projectred-transmission:wire:17>, <projectred-transmission:wire:17>);
replaceChip(<projectred-core:resource_item:4>, <projectred-core:resource_item:2>, <projectred-core:resource_item:2>);

replaceChip(<projectred-core:resource_item:11>, <minecraft:redstone_torch>, <contenttweaker:redstone_inlay>);
replaceChip(<projectred-core:resource_item:12>, <minecraft:redstone_torch>, <projectred-core:resource_item:301>);