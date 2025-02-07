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

	rec.addGasOutput("fluorine", 2000);
    rec.addGasOutput("chlorine", 1500);
    rec.addGasOutput("butene", 1000);
    rec.addGasOutput("carmin", 250);
    rec.addGasOutput("evil", 100);
    rec.addGasOutput("rare_earth_slurry", 100);
    

	rec.addGasInput("waste_gas", 10000);
    rec.addItemInput(<contenttweaker:research_chemistry1>);
    rec.setChance(0.0);
	
    rec.build();
}
{//rare earth
    var rec = RecipeBuilder.newBuilder("rare_earth_slurry", "gas_column", 200);
    rec.addEnergyPerTickInput(1024);

	rec.addItemOutput(<contenttweaker:neodymium_dirty_dust>);
    rec.setChance(0.4);

    rec.addItemOutput(<contenttweaker:gallium_dirty_dust>);
    rec.setChance(0.7);

    rec.addItemOutput(<contenttweaker:rarer_earth_dust>);
    rec.setChance(0.2);

	rec.addGasInput("rare_earth_slurry", 1000);
    rec.addItemInput(<contenttweaker:research_chemistry1>);
    rec.setChance(0.0);
	
    rec.build();
}

{//waste_gas + impure mana
    var rec = RecipeBuilder.newBuilder("impure", "gas_column", 200);
    rec.addEnergyPerTickInput(1024000);

	rec.addFluidOutput(<liquid:mana> * 50000);
    

	rec.addGasInput("waste_gas", 15000);
    rec.addItemInput(<contenttweaker:impure_mana_dust>);
	
    rec.build();
}


{//heavy water
    var rec = RecipeBuilder.newBuilder("heavy", "gas_column", 100);
    rec.addEnergyPerTickInput(256000);

	rec.addFluidOutput(<liquid:heavywater> * 100000);
    

	rec.addGasInput("nickel", 500);
    rec.addFluidInput(<liquid:sea_water> * 20000);
    rec.addItemInput(<alchemistry:ingot:74>);
	
    rec.build();
}