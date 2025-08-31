import mods.modularmachinery.RecipeBuilder;


{//
    var rec = RecipeBuilder.newBuilder("zblan", "space_assembler", 200);
	rec.addEnergyPerTickInput(10 * 1000 * 1000);


    rec.addGasInput(<gas:nitrogen> * 20000);
    rec.addGasInput(<gas:fluorine> * 20000);
    rec.addFluidInput(<liquid:zirconium> * 4000);
    rec.addFluidInput(<liquid:crystal_fluid2> * 10000);
    rec.addItemInput(<contenttweaker:night_glass>);
    rec.addItemInput(<contenttweaker:rune_glass>);
    rec.addItemInput(<alchemistry:ingot:56>);
    rec.addItemInput(<alchemistry:ingot:57>);
    
    rec.addItemOutput(<contenttweaker:zblank>);
	
	

	rec.build();
}

