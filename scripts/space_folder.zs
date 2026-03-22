import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.IngredientArrayBuilder;


{
    var rec = RecipeBuilder.newBuilder("brain_computer", "sf_assembler", 20 * 30);
	rec.addEnergyPerTickInput(500 * 1000 * 1000);

    rec.addFluidInput(<liquid:circuit> * 50000);
    rec.addFluidInput(<liquid:dark_catalyst> * 10000);
    rec.addFluidOutput(<liquid:dark_catalyst4> * 7000);
    rec.addFluidOutput(<liquid:dark_catalyst7> * 3000);

    rec.addItemInput(<contenttweaker:lazy_chip> * 4);
    rec.addItemInput(<contenttweaker:brain_matter_block>);
	rec.addItemInput(<contenttweaker:computer> * 2);
    rec.addItemInput(<extendedcrafting:material:13> * 8);
    
    rec.addItemOutput(<contenttweaker:brain_matter_block2>);
	rec.build();
}


{
    var rec = RecipeBuilder.newBuilder("ultimate_singularity", "sf_infuser", 20 * 30);
	rec.addEnergyPerTickInput(500 * 1000 * 1000);

    rec.addFluidInput(<liquid:dark_catalyst> * 10000);
    rec.addFluidOutput(<liquid:dark_catalyst2> * 7000);
    rec.addFluidOutput(<liquid:dark_catalyst5> * 3000);

    rec.addItemInput(<contenttweaker:meta_singularity>);
    rec.addInputs(
        <contenttweaker:neutronium_singularity>,
		<contenttweaker:metal_singularity3>,
		<contenttweaker:gem_singularity3>,
		<extendedcrafting:singularity_custom:69>
    );
    
    rec.addItemOutput(<extendedcrafting:singularity_ultimate> * 2);
	rec.build();
}

{
    var rec = RecipeBuilder.newBuilder("neutronium_flower_bed", "sf_infuser", 20 * 30);
	rec.addEnergyPerTickInput(500 * 1000 * 1000);

    rec.addFluidInput(<liquid:dark_catalyst> * 10000);
    rec.addFluidOutput(<liquid:dark_catalyst6> * 6000);
    rec.addFluidOutput(<liquid:dark_catalyst2> * 1000);
    rec.addFluidOutput(<liquid:dark_catalyst3> * 3000);

    rec.addItemInput(<contenttweaker:neutronium_sand> * 8);
    rec.addInputs(
        <contenttweaker:ma_essence7>,
        <contenttweaker:ancient_wood>,
        <contenttweaker:fertilizer7> * 64
    );
    rec.addIngredientArrayInput(IngredientArrayBuilder.newBuilder()
        .addIngredient(<contenttweaker:mirion2_singularity>)
        .addIngredient(<contenttweaker:hyper_life>)
    );
    rec.addWillInput("STEADFAST", 40);
    
    rec.addItemOutput(<contenttweaker:neutronium_flower_bed> * 8);
	rec.build();
}