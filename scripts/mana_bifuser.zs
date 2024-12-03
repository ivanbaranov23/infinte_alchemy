import mods.modularmachinery.RecipeBuilder;

{
    var rec = RecipeBuilder.newBuilder("terraglass", "mana_bifuser", 600);

	rec.addEnergyPerTickInput(1000000);

	rec.addItemOutput(<contenttweaker:terra_base>);
	rec.addItemOutput(<contenttweaker:impure_mana_dust>);
		
	rec.addItemInput(<botania:manaresource:4>);

	rec.addManaInput(100000);
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

	rec.addManaInput(100000);
	rec.build();
}