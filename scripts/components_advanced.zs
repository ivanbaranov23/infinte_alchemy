import scripts.content_machines.addAssemblerRecipe;
//(out as IItemStack[], inp as IIngredient[], fluid as ILiquidStack, time_t as int, rft as int)
import scripts.content_machines.addBioAssemblerRecipe;
//(out as IItemStack[], fluid_out as ILiquidStack, inp as IIngredient[], fluid_in as ILiquidStack[], catalyst as IIngredient,time_t as int, rft as int);

mods.enderio.AlloySmelter.addRecipe(<contenttweaker:csitl>, [
		<contenttweaker:cesium_dust> * 4, 
		<contenttweaker:iodine> * 8, 
		<alchemistry:element:81> * 16
	], 25000000
);

{//ceramic
	scripts.content_machines.addFluidAlloyerRecipe(
		<contenttweaker:batio> * 2, 
		<alchemistry:ingot:56>, <contenttweaker:titanium_ingot>, <liquid:claymud> * 1000, 
		20, 500
	);
	scripts.content_machines.addAdvancedMixerRecipe([
		<contenttweaker:batio> * 8
	], [], [
		<alchemistry:ingot:56> * 2, <contenttweaker:titanium_ingot> * 2, <alchemistry:ingot:38>
	], [<liquid:claymud> * 1000], 20, 5000);
	mods.alchemistry.Combiner.addRecipe(<contenttweaker:batio> * 4, [
		<alchemistry:compound:511> * 8, <alchemistry:compound:512> * 8, <alchemistry:element:38> * 2
	]);
}

//gapo4
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:gapo4>, <contenttweaker:gallium_dust> * 2, <liquid:phosphoric_acid> * 3000, 10000);
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



{//computers
	addBioAssemblerRecipe(
		[<contenttweaker:battle_computer>], null, 
		[
			<extendedcrafting:frame>,
			<contenttweaker:satellite_chip>.withTag({data: "none"}) * 4,
			<contenttweaker:rune_mana_chip> * 2,
			<enderio:item_capacitor_stellar> * 4
		], [
			<liquid:wrath> * 1000,
			<liquid:pride> * 1000
		], 
		null,
		20, 1000000
	);
	addBioAssemblerRecipe(
		[<contenttweaker:stealing_computer>], null, 
		[
			<extendedcrafting:frame>,
			<contenttweaker:satellite_chip>.withTag({data: "none"}) * 4,
			<contenttweaker:rune_mana_chip> * 2,
			<enderio:item_capacitor_stellar> * 4
		], [
			<liquid:greed> * 1000,
			<liquid:envy> * 1000
		], 
		null,
		20, 1000000
	);

}
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:lazy_chip>, [
	[null, null, null, <contenttweaker:neuro_crystal2>, null, null, null], 
	[null, null, <contenttweaker:neuro_crystal2>, <contenttweaker:neuro_singularity>, <contenttweaker:neuro_crystal2>, null, null], 
	[null, <contenttweaker:neuro_crystal2>, <contenttweaker:neuronium_gear>, <contenttweaker:layered_processor>, <contenttweaker:neuronium_gear>, <contenttweaker:neuro_crystal2>, null], 
	[<contenttweaker:neuro_crystal2>, <contenttweaker:neuro_singularity>, <contenttweaker:layered_processor>, <botania:rune:12>, <contenttweaker:layered_processor>, <contenttweaker:neuro_singularity>, <contenttweaker:neuro_crystal2>], 
	[null, <contenttweaker:neuro_crystal2>, <contenttweaker:neuronium_gear>, <contenttweaker:layered_processor>, <contenttweaker:neuronium_gear>, <contenttweaker:neuro_crystal2>, null], 
	[null, null, <contenttweaker:neuro_crystal2>, <contenttweaker:neuro_singularity>, <contenttweaker:neuro_crystal2>, null, null], 
	[null, null, null, <contenttweaker:neuro_crystal2>, null, null, null]
]);