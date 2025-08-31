import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

{//water
    var rec = RecipeBuilder.newBuilder("water", "gas_column", 1000);
    rec.addEnergyPerTickInput(320);

	rec.addGasOutput(<gas:hydrogen> * 20000);
    rec.addGasOutput(<gas:oxygen> * 10000);
    rec.addGasOutput(<gas:sodium> * 400);
    rec.addGasOutput(<gas:chlorine> * 400);
    

	rec.addGasInput(<gas:water> * 10000);
	
    rec.build();
}
{//brine
    var rec = RecipeBuilder.newBuilder("brine", "gas_column", 200);
    rec.addEnergyPerTickInput(512);

    rec.addGasOutput(<gas:sodium> * 300);
    rec.addGasOutput(<gas:chlorine> * 300);
    

	rec.addGasInput(<gas:brine> * 1000);
	
    rec.build();
}
{//waste_gas
    var rec = RecipeBuilder.newBuilder("waste_gas", "gas_column", 200);
    rec.addEnergyPerTickInput(1024);

	rec.addGasOutput(<gas:fluorine> * 2000);
    rec.addGasOutput(<gas:chlorine> * 1500);
    rec.addGasOutput(<gas:butene> * 1000);
    rec.addGasOutput(<gas:carmin> * 250);
    rec.addGasOutput(<gas:evil> * 100);
    rec.addGasOutput(<gas:rare_earth_slurry> * 100);
    

	rec.addGasInput(<gas:waste_gas> * 10000);
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
    rec.setChance(0.02);

	rec.addGasInput(<gas:rare_earth_slurry> * 1000);
    rec.addItemInput(<contenttweaker:research_chemistry1>);
    rec.setChance(0.0);
	
    rec.build();
}

{//waste_gas + impure mana
    var rec = RecipeBuilder.newBuilder("impure", "gas_column", 200);
    rec.addEnergyPerTickInput(1024000);

	rec.addFluidOutput(<liquid:mana> * 150000);
    

	rec.addGasInput(<gas:waste_gas> * 15000);
    rec.addItemInput(<contenttweaker:impure_mana_dust>);
	
    rec.build();
}


{//heavy water
    var rec = RecipeBuilder.newBuilder("heavy", "gas_column", 100);
    rec.addEnergyPerTickInput(256000);

	rec.addFluidOutput(<liquid:heavywater> * 100000);
    

	rec.addGasInput(<gas:nickel> * 500);
    rec.addFluidInput(<liquid:sea_water> * 20000);
    rec.addItemInput(<alchemistry:ingot:74>);
	
    rec.build();
}