
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

{//lavas
	scripts.compact_distill.addCompactDistill(
		[<liquid:obsidian> * 60, <liquid:iron> * 12, <liquid:gold> * 4, <liquid:lava_residue> * 4], 
		[<chisel:basalt2:7>, <deepmoblearning:soot_covered_redstone>], 
		<liquid:lava> * 100, 1200, 50, 
		[0.25, 0.13]
	);

	//fusion lava
	scripts.content_machines.basicFluidMixerRecipe(
		null, <liquid:liquidfusionlava> * 1000, 
		<moretcon:ingotfusionite>, [
			<liquid:lava> * 1000,
			<liquid:ardite> * 72
		], 10, 1000
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
