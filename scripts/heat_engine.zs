import mods.modularmachinery.RecipeBuilder;


{//
    var rec = RecipeBuilder.newBuilder("rec", "heat_engine", 200);
	rec.addEnergyPerTickOutput(5 * 1000);

    rec.addInput(<contenttweaker:hot_energion>);

    rec.addOutput(<prodigytech:energion_dust>).setChance(0.5);

	rec.build();
}
