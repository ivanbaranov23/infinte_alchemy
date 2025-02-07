import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;

var mil as int = 1000000;

{
    var rec = RecipeBuilder.newBuilder("electron", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:positron>);
    
    rec.addItemOutput(<contenttweaker:electron>);
	rec.build();
}
{
    var rec = RecipeBuilder.newBuilder("positronium", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electron>);
    rec.addItemInput(<contenttweaker:positron>);
    
    rec.addItemOutput(<contenttweaker:positronium>);
	rec.build();
}
{
    var rec = RecipeBuilder.newBuilder("energy", "donut", 5);
	rec.addEnergyPerTickOutput(500 * mil);

	rec.addItemInput(<contenttweaker:positronium>);
    //rec.addItemInput(<contenttweaker:positron>);
    
    //rec.addItemOutput(<contenttweaker:positronium>);
	rec.build();
}