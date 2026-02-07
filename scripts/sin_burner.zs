import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeBuilder;


for sin in [
            <liquid:lust> * 1000,
            <liquid:gluttony> * 1000,
            <liquid:greed> * 1000,
            <liquid:sloth> * 1000,
            <liquid:wrath> * 1000,
            <liquid:envy> * 1000,
            <liquid:pride> * 1000
] as ILiquidStack[]{//
    var rec = RecipeBuilder.newBuilder("sin_" ~ sin.name, "sin_burner", 100);
	rec.addEnergyPerTickOutput(10 * 1000 * 1000);


    rec.addGasOutput(<gas:evil> * 1000);
    rec.addFluidInput(sin * 1000);
    rec.addFluidInput(<liquid:holy_water2> * 1000);
	//rec.addGridPowerInput(200);

	rec.build();
}

