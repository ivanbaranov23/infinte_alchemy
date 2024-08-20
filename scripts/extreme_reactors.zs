
import mods.thermalexpansion.InductionSmelter;
//InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);


InductionSmelter.addRecipe(
    <bigreactors:ingotgraphite> * 2, 
    <contenttweaker:charcoal_ball> * 2, <immersiveengineering:material:19> * 3, 
    4000
);

recipes.remove(<bigreactors:reactorcasingcores>);
recipes.addShaped("ia_reactorcasingcores", <bigreactors:reactorcasingcores> * 2, [
	[<contenttweaker:mekanized_steel_rod>, <bigreactors:ingotgraphite>, <contenttweaker:mekanized_steel_rod>], 
	[<contenttweaker:advanced_plating2_2>, <extrautils2:suncrystal>, <contenttweaker:advanced_plating2_2>], 
	[<contenttweaker:mekanized_steel_rod>, <bigreactors:ingotgraphite>, <contenttweaker:mekanized_steel_rod>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<bigreactors:reactorcasingcores> * 3],
	[<extrautils2:suncrystal>, <bigreactors:ingotgraphite>, <contenttweaker:mekanized_steel_rod>, <contenttweaker:advanced_plating2_2>],
	null,
	20, 128
);

recipes.remove(<bigreactors:reactorcasing>);
recipes.addShaped("ia_reactorcasing", <bigreactors:reactorcasing> * 8, [
	[<contenttweaker:advanced_plating2_2>, <liquid:concrete> * 1000, <contenttweaker:advanced_plating2_2>], 
	[<contenttweaker:thermal_rod>, <bigreactors:reactorcasingcores>, <contenttweaker:thermal_rod>], 
	[<contenttweaker:advanced_plating2_2>, <liquid:concrete> * 1000, <contenttweaker:advanced_plating2_2>]
]);

recipes.remove(<bigreactors:reactorcontroller>);
recipes.addShaped("ia_reactorcontroller", <bigreactors:reactorcontroller>, [
	[<bigreactors:reactorcasing>, <mekanism:basicblock:8>, <bigreactors:reactorcasing>], 
	[<bigreactors:mineralbenitoite>, <mekanism:basicblock:14>, <bigreactors:mineralbenitoite>], 
	[<bigreactors:reactorcasing>, <mekanism:basicblock:8>, <bigreactors:reactorcasing>]
]);
recipes.remove(<bigreactors:reactorpowertaprf>);
recipes.addShaped("ia_reactorpowertaprf", <bigreactors:reactorpowertaprf>, [
	[<bigreactors:reactorcasing>, <bigreactors:mineralbenitoite>, <bigreactors:reactorcasing>], 
	[<immersiveengineering:wirecoil:5>, <immersiveengineering:metal_decoration0:3>, <immersiveengineering:wirecoil:5>], 
	[<bigreactors:reactorcasing>, <mekanism:basicblock:8>, <bigreactors:reactorcasing>]
]);
recipes.remove(<bigreactors:reactoraccessport>);
recipes.addShaped("ia_reactoraccessport", <bigreactors:reactoraccessport>, [
	[<bigreactors:reactorcasing>, <minecraft:piston>, <bigreactors:reactorcasing>], 
	[<engineersdecor:factory_hopper>, <ironchest:iron_chest:2>, <engineersdecor:factory_hopper>], 
	[<bigreactors:reactorcasing>, <mekanism:basicblock:8>, <bigreactors:reactorcasing>]
]);
recipes.remove(<bigreactors:reactorfuelrod>);
mods.roots.Fey.addRecipe("ia_reactorfuelrod", <bigreactors:reactorfuelrod>, 
    [<bigreactors:mineralbenitoite>, <bigreactors:reactorcasing>, <appliedenergistics2:quartz_vibrant_glass>,
    <forge:bucketfilled>.withTag({FluidName: "electrical_steel", Amount: 1000}), <bigreactors:blockyellorium>]
);



recipes.remove(<bigreactors:turbinecontroller>);
