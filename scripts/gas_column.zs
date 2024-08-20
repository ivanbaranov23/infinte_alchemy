import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

{//water
    var rec = RecipeBuilder.newBuilder("water", "gas_column", 1000);
    rec.addEnergyPerTickInput(320);

	rec.addGasOutput("hydrogen", 20000);
    rec.addGasOutput("oxygen", 10000);
    rec.addGasOutput("sodium", 400);
    rec.addGasOutput("chlorine", 400);
    

	rec.addGasInput("water", 10000);
	
    rec.build();
}
{//brine
    var rec = RecipeBuilder.newBuilder("brine", "gas_column", 200);
    rec.addEnergyPerTickInput(512);

    rec.addGasOutput("sodium", 300);
    rec.addGasOutput("chlorine", 300);
    

	rec.addGasInput("brine", 1000);
	
    rec.build();
}
{//waste_gas
    var rec = RecipeBuilder.newBuilder("waste_gas", "gas_column", 200);
    rec.addEnergyPerTickInput(1024);

	rec.addGasOutput("lithium", 2000);
    rec.addGasOutput("sodium", 2000);
    rec.addGasOutput("chlorine", 1500);
    rec.addGasOutput("butene", 1000);
    rec.addGasOutput("carmin", 250);
    rec.addGasOutput("evil", 100);
    

	rec.addGasInput("waste_gas", 10000);
    rec.addItemInput(<contenttweaker:research_chemistry1>);
    rec.setChance(0.0);
	
    rec.build();
}