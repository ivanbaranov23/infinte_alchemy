import mods.modularmachinery.RecipeBuilder;

{
    var rec = RecipeBuilder.newBuilder("terraglass", "mana_bifuser", 600);

	rec.addEnergyPerTickInput(1000000);

	rec.addItemOutput(<contenttweaker:terra_base>);
	rec.addItemOutput(<contenttweaker:impure_mana_dust>);
		
	rec.addItemInput(<botania:manaresource:4>);

	rec.addManaInput(100000, false);
	rec.build();
}

{
    var rec = RecipeBuilder.newBuilder("terragem", "mana_bifuser", 600);

	rec.addEnergyPerTickInput(20000000);

	rec.addItemOutput(<contenttweaker:terragem>);
		
	rec.addItemInput(<contenttweaker:terrabit> * 15);
	rec.addItemInput(<contenttweaker:empowered_shard> * 4);
	rec.addItemInput(<contenttweaker:corrupted_ambrosium> * 2);
	rec.addFluidInput(<liquid:mana> * (100 * 1000));
	rec.addFluidInput(<liquid:superorganic_green> * 10000);

	rec.addManaInput(100000, false);
	rec.build();
}
{
    var rec = RecipeBuilder.newBuilder("mana_part", "mana_bifuser", 5);

	rec.addEnergyPerTickInput(20000000);

	rec.addItemOutput(<contenttweaker:manathon>);
		
	rec.addItemInput(<contenttweaker:neutron>);
	rec.addItemInput(<alchemistry:element:105>);
	rec.addItemInput(<alchemistry:element:18> * 2);
	//rec.addFluidInput(<liquid:mana> * (100 * 1000));
	//rec.addFluidInput(<liquid:superorganic_green> * 10000);

	rec.addManaInput(1000, false);
	rec.build();
}


{
    var rec = RecipeBuilder.newBuilder("rare_gem", "mana_bifuser", 20 * 10);

	rec.addEnergyPerTickInput(20000000);

	rec.addItemOutput(<contenttweaker:rare_gem>);

	rec.addGasInput(<gas:rare_earth_slurry> * 10000);
	rec.addInputs(<botania:manaresource:2>, <botania:manaresource:1>);

	rec.addManaInput(10000, false);
	rec.build();
}