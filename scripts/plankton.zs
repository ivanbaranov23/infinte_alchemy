import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

/*
static counter as int = 0;
function addPTrecipe(, time_sec as int, rf_tick as int){
    var rec = RecipeBuilder.newBuilder("PT_" ~ counter, "plankton_tank", time_sec * 20);
    counter += 1;
    
    if (rf_tick != 0) {rec.addEnergyPerTickInput(rf_tick);}

    for o in outputs{
        rec.addItemOutput(o.stack);
        rec.setChance(o.chance);
    }

    for i in inputs{
        rec.addItemInput(i);
    }

    for i in catalyst{
        rec.addItemInput(i);
        rec.setChance(0.0);
    }
    rec.addCatalystInput(
			<mysticalagriculture:wood_essence> * 4,
			["Output items x2"],
			[RecipeModifierBuilder.create(
				"modularmachinery:item", "output", 2, 1, false
			).build()]
	).setChance(0.5);

    rec.addFluidInput(<liquid:fertilizer> * 400);
    rec.build();
}
*/


{var rec = RecipeBuilder.newBuilder("PT_1", "plankton_tank", 15 * 20);
    
    rec.addEnergyPerTickInput(15 * 1000);

    rec.addItemOutput(<contenttweaker:dirty_biocell>);
    rec.addItemInput(<contenttweaker:biocell_plankton>);
    rec.addFluidInput(<liquid:pure_water> * 4000);
    

    /*for i in catalyst{
        rec.addItemInput(i);
        rec.setChance(0.0);
    }
    rec.addCatalystInput(
			<mysticalagriculture:wood_essence> * 4,
			["Output items x2"],
			[RecipeModifierBuilder.create(
				"modularmachinery:item", "output", 2, 1, false
			).build()]
	).setChance(0.5);*/

    rec.addFluidOutput(<liquid:plankton> * 4000);
    rec.build();
}
{var rec = RecipeBuilder.newBuilder("PT_2", "plankton_tank", 15 * 20);
    
    rec.addEnergyPerTickInput(1500 * 1000);

    rec.addItemOutput(<contenttweaker:dirty_biocell>);
    rec.addItemInput(<contenttweaker:biocell_plankton>);
    rec.addFluidInput(<liquid:ultrapure_water> * 4000);

    rec.addFluidOutput(<liquid:plankton> * 400000);
    rec.build();
}
scripts.compact_distill.addCompactDistill([
        <liquid:methane> * 150,
        <liquid:biocrude> * 100
    ], [], <liquid:plankton> * 50, 5000, 4, []
);



{var rec = RecipeBuilder.newBuilder("PT_3", "plankton_tank", 15 * 20);
    
    rec.addEnergyPerTickInput(15 * 1000);

    rec.addInput(<contenttweaker:plant_sample> * 3);
    rec.addInput(<liquid:organic_green> * 4000);
    //rec.addInput(<liquid:potion>.withTag({Potion: "cofhcore:regeneration4"}) * 4000);
    rec.addFluidInput(<liquid:plankton> * 4000);

    rec.addFluidOutput(<liquid:plankton2> * 4000);
    rec.build();
}
scripts.compact_distill.addCompactDistill([
        <liquid:methane> * 150,
        <liquid:algal_fuel> * 100
    ], [], <liquid:plankton2> * 50, 5000, 4, []
);



{var rec = RecipeBuilder.newBuilder("PT_4", "plankton_tank", 30 * 20);
    
    rec.addEnergyPerTickInput(25 * 1000);

    rec.addInput(<liquid:if.protein> * 1000);
    rec.addFluidInput(<liquid:plankton> * 4000);
    rec.addFluidInput(<liquid:plankton2> * 4000);

    rec.addFluidOutput(<liquid:plankton3> * 4000);
    rec.build();
}

scripts.compact_distill.addCompactDistill([
        <liquid:algal_fuel> * 100,
        <liquid:omega_acids> * 100,
        <liquid:blood> * 1000
    ], [], <liquid:plankton3> * 50, 5000, 40, []
);