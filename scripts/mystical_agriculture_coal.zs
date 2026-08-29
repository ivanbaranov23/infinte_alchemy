
scripts.content_machines.addFluidAlloyerRecipe(
    <mysticalagriculture:coal> * 2, 
    <contenttweaker:activated_carbon>, <mysticalagriculture:crafting> * 8, <liquid:napalm> * 1000, 
    512, 40
);

mods.actuallyadditions.Empowerer.addRecipe(
	<mysticalagriculture:coal:1> * 3, <contenttweaker:crystal_coal>, 
	<mysticalagriculture:coal>, <mysticalagriculture:coal>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, 
	10000, 10
);

mods.enderio.AlloySmelter.addRecipe(<mysticalagriculture:coal:2> * 3, 
	[
		<mysticalagriculture:coal:1> * 2,
		<mysticalagriculture:crafting:2> * 2,
		<mysticalagriculture:coal_essence> * 16
	], 50000
);