import mods.modularmachinery.RecipeBuilder;

recipes.addShaped("ia_power_core_block", <contenttweaker:power_core>, [
    [<contenttweaker:power_core_active>, <redstonearsenal:material:224>, <contenttweaker:power_core_active>], 
    [<quantumflux:craftingpiece:5>, <twilightforest:tower_device:12>, <quantumflux:craftingpiece:5>], 
    [<contenttweaker:power_core_active>, <redstonearsenal:material:224>, <contenttweaker:power_core_active>]
]);

{
	var rec = RecipeBuilder.newBuilder("carmin", "carmine_reactor", 10 * 20);

    rec.addEnergyPerTickInput(200);

    rec.addItemInput(<minecraft:redstone>);
	rec.addGasInput(<gas:sodium> * 100);
	rec.addFluidInput(<liquid:strawberry_wine> * 500);

	rec.addGasOutput(<gas:carmin> * 1000);
    
    rec.build();
}
{
	var rec = RecipeBuilder.newBuilder("power", "carmine_reactor", 40 * 20);

    rec.addEnergyPerTickOutput(75000);

    rec.addItemInput(<twilightforest:carminite>);
	rec.addFluidInput(<liquid:glowstone> * 5000);
	rec.addFluidInput(<liquid:electrotine> * 5000);
	
    
    rec.build();
}