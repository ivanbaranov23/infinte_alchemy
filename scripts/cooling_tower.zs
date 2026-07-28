import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;


import mods.modularmachinery.RecipeBuilder;


{var rec = RecipeBuilder.newBuilder("cold_crude1", "cooling_tower", 20 * 60);

    rec.addEnergyPerTickInput(25600);


    rec.addOutput(<liquid:cold_crude> * 10000);

    
    rec.addFluidInput(<liquid:oil> * 10000);
    rec.addFluidInput(<liquid:cryotheum> * 1000);
                
    rec.build();
}
{var rec = RecipeBuilder.newBuilder("cold_crude2", "cooling_tower", 20 * 60);

    rec.addEnergyPerTickInput(25600);


    rec.addOutput(<liquid:cold_crude> * 10000);

    
    rec.addFluidInput(<liquid:crude_oil> * 10000);
    rec.addFluidInput(<liquid:cryotheum> * 1000);
                
    rec.build();
}
{var rec = RecipeBuilder.newBuilder("cold_crude3", "cooling_tower", 20 * 60);

    rec.addEnergyPerTickInput(25600);


    rec.addOutput(<liquid:cold_crude> * 10000);

    
    rec.addFluidInput(<liquid:coal> * 12500);
    rec.addFluidInput(<liquid:cryotheum> * 1000);
                
    rec.build();
}
{var rec = RecipeBuilder.newBuilder("cold_crude4", "cooling_tower", 20 * 60);

    rec.addEnergyPerTickInput(25600);


    rec.addOutput(<liquid:cold_crude> * 10000);

    
    rec.addFluidInput(<liquid:refinedcanolaoil> * 15000);
    rec.addFluidInput(<liquid:cryotheum> * 1000);
                
    rec.build();
}

{var rec = RecipeBuilder.newBuilder("cold_diesel", "cooling_tower", 20 * 60);

    rec.addEnergyPerTickInput(25600);


    rec.addOutput(<liquid:cold_diesel> * 20000);

    
    rec.addFluidInput(<liquid:enriched_diesel1> * 15000);
    rec.addFluidInput(<liquid:cold_nitrogen> * 3000);
    rec.addFluidInput(<liquid:kerosene> * 5000);
                
    rec.build();
}



{var rec = RecipeBuilder.newBuilder("carmin_tartarate", "cooling_tower", 20 * 60);

    rec.addEnergyPerTickInput(25600);


    rec.addOutput(<gas:carmin_tartrate> * 15000);

    
    rec.addGasInput(<gas:carmin> * 10000);
    rec.addFluidInput(<liquid:tartaric_acid> * 10000);
                
    rec.build();
}

{var rec = RecipeBuilder.newBuilder("blizz", "cooling_tower", 20 * 1);

    rec.addEnergyPerTickInput(2560);


    rec.addOutput(<thermalfoundation:material:2049> * 32);

    
    rec.addInput(<minecraft:snowball> * 64);
                
    rec.build();
}
