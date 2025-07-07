

mods.immersivepetroleum.Distillation.addRecipe(
	[<liquid:blueslime> * 50, <liquid:rotten_slime> * 30], 
	[<contenttweaker:slime_shard>, <contenttweaker:organic_glue>], 
	<liquid:sticky_water> * 200, 20 * 120, 20, 
	[0.15, 0.001]
);

mods.immersivepetroleum.Distillation.addRecipe(
	[<liquid:biodiesel> * 75, <liquid:blood> * 10], 
	[], 
	<liquid:rotten_slime> * 200, 20 * 120, 20, 
	[]
);
mods.thermalexpansion.Refinery.addRecipe(<liquid:biodiesel> * 750, null, <liquid:rotten_slime> * 2000, 12000);

mods.actuallyadditions.AtomicReconstructor.addRecipe(<exnihilocreatio:item_ore_tungsten:2>, <contenttweaker:anubis_godshard>, 8000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<exnihilocreatio:item_ore_tungsten:2>, <contenttweaker:anput_godshard>, 8000);

{//emolachite
    scripts.content_machines.addFluidMixerRecipe(
        <liquid:emolachite> * 1000, 
        <liquid:electrotine> * 500, <liquid:rich_malachite_solution> * 500, <mekanism:enrichedalloy> * 3, 
        256, 20
    );
    scripts.content_machines.addFluidMixerRecipe(
        <liquid:emolachite> * 1000, 
        <liquid:electrotine> * 250, <liquid:rich_malachite_solution> * 250, <contenttweaker:supersalt>, 
        256, 20
    );
    scripts.content_machines.addFluidMixerRecipe(
        <liquid:emolachite> * 1000, 
        <liquid:electrotine> * 250, <liquid:rich_malachite_solution> * 250, <betternether:bone_mushroom>, 
        256, 20
    );

    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:emolachite>, <liquid:emolachite> * 1000);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:emolachite> * 2,
        <contenttweaker:electric_manyullyn_dust>, <liquid:emolachite> * 1000,
        1000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:emolachite> * 3,
        <contenttweaker:organic_glue>, <liquid:emolachite> * 1000,
        1000
    );

    
}


recipes.addShapeless("soapart_dust", <contenttweaker:soapart_dust>, [
	<mekanism:otherdust:5>, <thermalfoundation:material:1028>, <contenttweaker:soap>, <contenttweaker:soap>,
	<contenttweaker:sandy_spice> | <contenttweaker:emolachite> | <betternether:lucis_spore>,
	<liquid:grease> * 4000
]);
recipes.addShapeless("soapart_dust2", <contenttweaker:soapart_dust>, [
	<mekanism:otherdust:5>, <thermalfoundation:material:1028>, <contenttweaker:soap>, <contenttweaker:soap>,
	<contenttweaker:sandy_spice> | <contenttweaker:emolachite> | <betternether:lucis_spore>,
	<liquid:grease> * 1000, <liquid:grease> * 1000, <liquid:grease> * 1000, <liquid:grease> * 1000
]);
mods.thermalexpansion.Transposer.addFillRecipe(
    <contenttweaker:soapart>,
    <contenttweaker:soapart_dust>, <liquid:crystal_fluid2> * 400,
    1000
);

