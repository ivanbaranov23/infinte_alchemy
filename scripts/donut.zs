import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;

var mil as int = 1000000;

{var rec = RecipeBuilder.newBuilder("electron", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:positron>);
    
    rec.addItemOutput(<contenttweaker:electron>);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("positron", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:electron>);
    
    rec.addItemOutput(<contenttweaker:positron>);
	rec.build();
}

{var rec = RecipeBuilder.newBuilder("split1", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    rec.addItemInput(<alchemistry:element:500>);
    rec.addItemInput(<contenttweaker:terragem> * 8);
    rec.addItemInput(<contenttweaker:rune_lightning>);
    
    rec.addItemOutput(<contenttweaker:positron>);
    rec.addItemOutput(<contenttweaker:electron>);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("split_pos", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    rec.addItemInput(<contenttweaker:positron_emitter>);
    rec.setChance(0.0);

    rec.addItemInput(<alchemistry:compound:202>);
    rec.addItemInput(<contenttweaker:terragem> * 8);
    
    rec.addItemOutput(<contenttweaker:positron>);
	rec.build();
}



{var rec = RecipeBuilder.newBuilder("positronium", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electron>);
    rec.addItemInput(<contenttweaker:positron>);
    
    rec.addItemOutput(<contenttweaker:positronium>);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("energy", "donut", 5);
	rec.addEnergyPerTickOutput(500 * mil);

	rec.addItemInput(<contenttweaker:positronium>);
    //rec.addItemInput(<contenttweaker:positron>);
    
    //rec.addItemOutput(<contenttweaker:positronium>);
	rec.build();
}