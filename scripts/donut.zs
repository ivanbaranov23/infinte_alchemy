import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;

var mil as int = 1000000;

{var rec = RecipeBuilder.newBuilder("electron", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:positron> * 64);
    
    rec.addItemOutput(<contenttweaker:electron> * 64);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("positron", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:electron> * 64);
    
    rec.addItemOutput(<contenttweaker:positron> * 64);
	rec.build();
}

{var rec = RecipeBuilder.newBuilder("split1", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    rec.addItemInput(<alchemistry:element:500>);
    rec.addItemInput(<contenttweaker:terragem> * 8);
    rec.addItemInput(<contenttweaker:rune_lightning>);
    
    rec.addItemOutput(<contenttweaker:positron> * 16);
    rec.addItemOutput(<contenttweaker:electron> * 16);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("split_pos", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    rec.addItemInput(<contenttweaker:positron_emitter>);
    rec.setChance(0.0);

    rec.addItemInput(<alchemistry:compound:202>);
    rec.addItemInput(<contenttweaker:terragem> * 8);
    
    rec.addItemOutput(<contenttweaker:positron> * 16);
	rec.build();
}


{var rec = RecipeBuilder.newBuilder("deathon", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    rec.addItemInput(<alchemistry:element:66> * 6);
    rec.addItemInput(<alchemistry:element:103> * 6);
    rec.addItemInput(<contenttweaker:death_metal_dust>);
    
    rec.addItemOutput(<contenttweaker:deathon> * 20);
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


