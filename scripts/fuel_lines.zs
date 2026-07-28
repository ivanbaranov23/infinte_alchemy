import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;



{//enriched diesel	
	scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:diesel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
	);
	scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:biodiesel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
	);
	scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:refined_biofuel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
	);
	scripts.helper.addFluidMixerRecipe(
			<liquid:enriched_diesel1> * 2000, 
			<liquid:refined_fuel> * 500, <liquid:kerosene> * 200, <prodigytech:inferno_fuel>, 
			32, 20
	);

	scripts.content_machines.addAdvancedMixerRecipe(
			[<prodigytech:inferno_fuel>],
			[<liquid:enriched_diesel1> * 2000],
			[<prodigytech:inferno_crystal>],
			[<liquid:diesel> * 200, <liquid:biodiesel> * 200, <liquid:refined_biofuel> * 200,<liquid:refined_fuel> * 200],
			20, 128
	);

    {
        var rec = RecipeBuilder.newBuilder("enriched_diesel1", "super_mixer", 20 * 1);

        rec.addEnergyPerTickInput(10000);

        rec.addInputs(<liquid:diesel> * 2000, <liquid:biodiesel> * 2000, <liquid:refined_biofuel> * 2000,<liquid:refined_fuel> * 2000);
        
        rec.addFluidOutput(<liquid:enriched_diesel1> * 20000);

        rec.build();
    }
}

{//nuit
    scripts.helper.addFluidMixerRecipe(
        <liquid:nuit_fuel> * 2000,
        <liquid:enriched_diesel1> * 500, <liquid:ethylbenzene> * 500, <contenttweaker:nuit_godshard>,
        128, 80
    );

    {
        var rec = RecipeBuilder.newBuilder("nuit_fuel", "super_mixer", 20 * 1);

        rec.addEnergyPerTickInput(10000);

        rec.addInputs(<liquid:enriched_diesel1> * 500, <liquid:ethylbenzene> * 500);
        rec.addInput(<contenttweaker:nuit_godshard>);

        rec.addCatalystInput(
            <contenttweaker:toluene> * 1,
            ["Output fluid x1.5"],
            [
                RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
            ]
        ).setChance(0.5);
        rec.addCatalystInput(
            <contenttweaker:phenol> * 1,
            ["Output fluid x1.5"],
            [
                RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
            ]
        ).setChance(0.5);

        
        
        rec.addFluidOutput(<liquid:nuit_fuel> * 4000);

        rec.build();
    }
}


{//enriched diesel 2
    scripts.content_machines.addAdvancedMixerRecipe(
			[<prodigytech:inferno_fuel>],
			[<liquid:enriched_diesel2> * 1000],
			[<prodigytech:inferno_crystal>],
			[<liquid:cold_diesel> * 200, <liquid:nuit_fuel> * 200, <liquid:algal_fuel> * 200, <liquid:sunnarium_base> * 200],
			20, 128
	);

    {
        var rec = RecipeBuilder.newBuilder("enriched_diesel2", "super_mixer", 20 * 1);

        rec.addEnergyPerTickInput(10000);

        rec.addInputs(<liquid:cold_diesel> * 2000, <liquid:nuit_fuel> * 2000, <liquid:algal_fuel> * 2000, <liquid:sunnarium_base> * 2000);
        
        rec.addCatalystInput(
            <botania:quartz:2> * 1,
            ["Output fluid x10"],
            [
                RecipeModifierBuilder.create("modularmachinery:fluid", "output", 10, 1, false).build()
            ]
        ).setChance(0.5);


        rec.addFluidOutput(<liquid:enriched_diesel2> * 10000);

        rec.build();
    }
}

