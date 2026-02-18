
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

{//lavas
	mods.immersivepetroleum.Distillation.addRecipe(
		[<liquid:obsidian> * 60, <liquid:iron> * 12, <liquid:gold> * 4, <liquid:lava_residue> * 2], 
		[<chisel:basalt2:7>, <deepmoblearning:soot_covered_redstone>], 
		<liquid:lava> * 100, 1200, 50, 
		[0.25, 0.13]
	);

	//nitronite
	scripts.content_machines.addFluidMixerRecipe(
		<liquid:nitronite_fluid> * 600, 
		<liquid:osram_fluid> * 100, <liquid:magma_fluid> * 600, null, 
		20, 500
	);

	


	scripts.content_machines.addFluidSieveRecipeRandom(
		[
			<exnihilocreatio:item_ore_osmium> % 50,
			<exnihilocreatio:item_ore_titanium> % 30,
			<exnihilocreatio:item_ore_iridium> % 20,
			<minecraft:glowstone_dust> % 20
		], <liquid:meteorite_fluid> * 50,
		<liquid:lava_residue> * 500, <thermalfoundation:material:1025>,
		<contenttweaker:uranium_mesh>,
		20, 400
	);
}

{//heat lava
	scripts.content_machines.addAdvancedMixerRecipe(
			[<prodigytech:heat_capacitor_1:1200>], [<liquid:high_heat_lava> * 400, <liquid:lava_residue> * 100],
			[
				<thermalexpansion:florb>.withTag({Fluid: "napalm"}) * 4,
				<contenttweaker:hot_ingot> | <thermalexpansion:florb:1>.withTag({Fluid: "blazing_blood"}), <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>
			], [
				<liquid:lava> * 2000,
				<liquid:pyrotheum> * 1000, 
				<liquid:empoweredoil> * 1000,
				<liquid:andesite_magma> * 1000
			], 20, 20000
	);
	scripts.content_machines.addAdvancedMixerRecipe(
			[<prodigytech:heat_capacitor_1:1200>], [<liquid:high_heat_lava> * 500, <liquid:lava_residue> * 100],
			[
				<thermalexpansion:florb>.withTag({Fluid: "napalm"}) * 4,
				<contenttweaker:hot_ingot> | <thermalexpansion:florb:1>.withTag({Fluid: "blazing_blood"}), <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>
			], [
				<liquid:lava> * 2000,
				<liquid:pyrotheum> * 1000, 
				<liquid:empoweredoil> * 1000,
				<liquid:nitronite_fluid> * 250
			], 20, 20000
	);
	scripts.content_machines.addAdvancedMixerRecipe(
		[<prodigytech:heat_capacitor_1:1200>], [<liquid:high_heat_lava> * 450, <liquid:lava_residue> * 100],
		[
			<thermalexpansion:florb>.withTag({Fluid: "napalm"}) * 4,
			<contenttweaker:hot_ingot> | <thermalexpansion:florb:1>.withTag({Fluid: "blazing_blood"}), <bloodmagic:component:1>, <prodigytech:heat_capacitor_1>
		], [
			<liquid:lava> * 2000,
			<liquid:pyrotheum> * 1000, 
			<liquid:empoweredoil> * 1000,
			<liquid:fierymetal> * 288
		], 20, 20000
	);

    {
        var rec = RecipeBuilder.newBuilder("high_lava", "super_mixer", 20 * 1);

        rec.addEnergyPerTickInput(256000);

        rec.addItemInput(<contenttweaker:hot_ingot>).setChance(0.5);
        rec.addItemInput(<bloodmagic:component:1>).setChance(0.5);
        rec.addItemInput(<prodigytech:heat_capacitor_1>);
        rec.addItemOutput(<prodigytech:heat_capacitor_1:1200>);
        
        rec.addFluidInput(<liquid:napalm> * 4000);
        rec.addFluidInputs(
            <liquid:lava> * 2000,
			<liquid:pyrotheum> * 1000, 
			<liquid:empoweredoil> * 1000,

			<liquid:andesite_magma> * 1000,
			<liquid:nitronite_fluid> * 250,
			<liquid:fierymetal> * 288
        );

        
        rec.addFluidOutput(<liquid:high_heat_lava> * 1000);
        rec.addFluidOutput(<liquid:lava_residue> * 1000);

        rec.build();
    }
}

//super lava
scripts.content_machines.addAdvancedMixerRecipe(
	[<prodigytech:heat_capacitor_3:1200>], 
	[<liquid:super_heat_lava> * 1000, <liquid:lava_residue> * 1000], 
	[<extendedcrafting:singularity_custom:13>, <botania:rune:1>, <prodigytech:heat_capacitor_3>], 
	[<liquid:high_heat_lava> * 1000, <liquid:fire> * 1000, <liquid:nitronite_fluid> * 1000], 
	40, 1024
);

{var rec = RecipeBuilder.newBuilder("insane_lava", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(2560000);

    rec.addItemInput(<bloodmagic:lava_crystal>);
    
    rec.addFluidInput(<liquid:rocket_fuel> * 500);
    rec.addFluidInput(<liquid:super_heat_lava> * 2000);
    rec.addFluidInput(<liquid:blutonium> * 288);
    rec.addInput(<enderio:item_material:72> * 4);
    rec.addGridPowerInput(300);
    rec.addManaInput(100000, false);

    
    rec.addFluidOutput(<liquid:insane_heat_lava> * 1000);

    rec.build();
}