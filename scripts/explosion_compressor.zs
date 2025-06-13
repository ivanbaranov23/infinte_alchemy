import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeBuilder;

{//sin nickel
    var rec = RecipeBuilder.newBuilder("sin_nickel", "explosion_compressor", 15 * 20);

	rec.addEnergyPerTickInput(2048000);

    for i in 0 .. 6{
    	rec.addItemOutput(<contenttweaker:sin_nickel_ingot>);
        rec.setChance(0.8);
    }
    for i in 0 .. 3{
    	rec.addItemOutput(<contenttweaker:gularity>);
        rec.setChance(0.1);
    }


	rec.addItemInput(<extendedcrafting:singularity:25> * 24);
	rec.addItemInput(<contenttweaker:flesh_spurt> * 16);
	rec.addItemInput(<contenttweaker:evil_singularity>);
	
		

	
				
	rec.addItemInput(<contenttweaker:nuke>);
		
	rec.build();
}
{//sin nickel
    var rec = RecipeBuilder.newBuilder("sin_nickel2", "explosion_compressor", 15 * 20);

	rec.addEnergyPerTickInput(2048000);

    for i in 0 .. 6{
    	rec.addItemOutput(<contenttweaker:sin_nickel_ingot>);
        rec.setChance(0.3);
    }
    for i in 0 .. 3{
    	rec.addItemOutput(<contenttweaker:gularity>);
        rec.setChance(0.5);
    }
    rec.addFluidOutput(<liquid:evil_blood> * (1000 * 48));	


	rec.addItemInput(<extendedcrafting:singularity:25> * 24);
	rec.addItemInput(<contenttweaker:flesh_spurt> * 16);

	
	rec.addFluidInput(<liquid:rot> * (1000 * 256));	

	
				
	rec.addItemInput(<contenttweaker:nuke>);
		
	rec.build();
}