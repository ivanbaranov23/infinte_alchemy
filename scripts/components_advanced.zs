import scripts.content_machines.addAssemblerRecipe;
//(out as IItemStack[], inp as IIngredient[], fluid as ILiquidStack, time_t as int, rft as int)

mods.enderio.AlloySmelter.addRecipe(<contenttweaker:csitl>, [
		<contenttweaker:cesium_dust> * 4, 
		<contenttweaker:iodine> * 8, 
		<alchemistry:element:81> * 16
	], 25000000
);

//gapo4
mods.thermalexpansion.InductionSmelter.addRecipe(
	<contenttweaker:gapo4>, 
	<contenttweaker:gallium_dust> * 3, <contenttweaker:glowcrystal> * 16, 
	32000
);
mods.alchemistry.Combiner.addRecipe(<contenttweaker:gapo4>, [
	<alchemistry:element:31> * 8, <alchemistry:compound:14> * 8
]);

//signal
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:signal_sender>],
	[
		<contenttweaker:lightning_cell>,
		<enderio:block_transceiver>,
		<contenttweaker:pulse_generator> * 8,
		<enderio:item_material:16> * 4,
		<extendedcrafting:material:36> * 24,
		<contenttweaker:gapo4>
	],
	<liquid:mekanized_steel> * 1000, 40, 1024
);
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:signal_reciever>],
	[
		<contenttweaker:lightning_cell>,
		<enderio:block_transceiver>,
		<contenttweaker:pulse_generator> * 8,
		<enderio:item_material:37> * 4,
		<extendedcrafting:material:36> * 24,
		<contenttweaker:gapo4>
	],
	<liquid:mekanized_steel> * 1000, 40, 1024
);

addAssemblerRecipe([<contenttweaker:temperature_control>], [
	<contenttweaker:cooling_system>,
	<contenttweaker:crucible> * 3,
	<contenttweaker:electric_wool2>,
	<opencomputers:component:2> * 4,
	<opencomputers:material:11> * 16
], <liquid:circuit> * 1000, 40, 10000);

addAssemblerRecipe([<contenttweaker:state_detector>], [
	<contenttweaker:neodymium_plate> * 2,
	<opencomputers:material:10> * 8
], <liquid:circuit> * 1000, 40, 10000);

//clock
addAssemblerRecipe([<contenttweaker:quartz_clock>], [
	<botania:quartz:4>,
	<contenttweaker:pulse_generator> * 24,
	<contenttweaker:temperature_control>,
	<contenttweaker:vibralcum_plate> * 4,
	<opencomputers:material:10> * 32
], <liquid:circuit> * 1000, 40, 10000);

addAssemblerRecipe([<contenttweaker:atomic_clock>], [
	<contenttweaker:quartz_clock>,
	<contenttweaker:state_detector> * 2,
	<contenttweaker:temperature_control>,
	<contenttweaker:signal_sender>,
	<contenttweaker:cesium_dust> * 4,
	<opencomputers:material:10> * 32
], <liquid:circuit> * 1000, 40, 10000);



//