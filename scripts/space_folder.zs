import mods.modularmachinery.RecipeBuilder;


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