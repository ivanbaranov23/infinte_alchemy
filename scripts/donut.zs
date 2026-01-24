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
{var rec = RecipeBuilder.newBuilder("proton", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:anti_proton> * 64);
    
    rec.addItemOutput(<contenttweaker:proton> * 64);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("anti_proton", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:proton> * 64);
    
    rec.addItemOutput(<contenttweaker:anti_proton> * 64);
	rec.build();
}

{var rec = RecipeBuilder.newBuilder("proton1", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electricium>);
    rec.addItemInput(<contenttweaker:barion2>);
    
    rec.addItemOutput(<contenttweaker:proton> * 64);
	rec.build();
}


{var rec = RecipeBuilder.newBuilder("split1", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    //rec.addItemInput(<alchemistry:element:500>);
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
{var rec = RecipeBuilder.newBuilder("draconic_particle", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

    rec.addItemInput(<alchemistry:element:54> * 4);
    rec.addItemInput(<alchemistry:element:91> * 4);
    rec.addItemInput(<contenttweaker:anti_proton> * 4);
    rec.addItemInput(<draconicevolution:draconic_ingot>);
    
    rec.addItemOutput(<contenttweaker:draconic_particle> * 1);
	rec.build();
}


{//neutronium  
    {var rec = RecipeBuilder.newBuilder("neutronium1", "donut", 5);
        rec.addEnergyPerTickInput(50 * mil);

        rec.addItemInput(<contenttweaker:electron>);
        rec.addItemInput(<contenttweaker:proton>);
        
        rec.addItemOutput(<contenttweaker:neutron>);
        rec.build();
    }
    {var rec = RecipeBuilder.newBuilder("neutronium2", "donut", 5);
        rec.addEnergyPerTickInput(50 * mil);

        rec.addItemInput(<contenttweaker:positron>);
        rec.addItemInput(<contenttweaker:anti_proton>);
        
        rec.addItemOutput(<contenttweaker:neutron>);
        rec.build();
    }
}


{var rec = RecipeBuilder.newBuilder("positronium", "donut", 5);
	rec.addEnergyPerTickInput(50 * mil);

	rec.addItemInput(<contenttweaker:electron>);
    rec.addItemInput(<contenttweaker:positron>);
    
    rec.addItemOutput(<contenttweaker:positronium>);
	rec.build();
}
{var rec = RecipeBuilder.newBuilder("energy", "donut", 5);
	rec.addEnergyPerTickOutput(750 * mil);

	rec.addItemInput(<contenttweaker:positronium>);
    //rec.addItemInput(<contenttweaker:positron>);
    
    //rec.addItemOutput(<contenttweaker:positronium>);
	rec.build();
}

static counter as int = 0;
for outp,inps in {
    32: [2, 15],
    39: [2, 15],
    54: [2, 15],
    57: [2, 15],
    69: [2, 15, 34],
    81: [2, 15, 34],
    88: [2, 15, 34],
    91: [2, 15, 34],
    101: [2, 15, 34],
    103: [2, 15, 34],
    115: [2, 15, 34, 55],
    116: [2, 15, 34, 55],
    117: [2, 15, 34, 55],
    118: [2, 15, 34, 55],
} as int[][int]{
    for inp in inps{
        counter += 1;
        var rec = RecipeBuilder.newBuilder("fusion_" ~ counter, "donut", 5);
        rec.addEnergyPerTickInput(50 * mil);

        rec.addItemInput(<alchemistry:element>.definition.makeStack(inp));
        rec.addItemInput(<alchemistry:element>.definition.makeStack(outp - inp));
        
        rec.addItemOutput(<alchemistry:element>.definition.makeStack(outp));
        rec.build();
    }
    
}