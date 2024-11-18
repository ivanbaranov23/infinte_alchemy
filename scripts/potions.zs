import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.immersiveengineering.Mixer as IEMixer;
import mods.thermalexpansion.Imbuer as TEImbuer; 
//.removeRecipe(IItemStack input, ILiquidStack secondInput);

val awkward as ILiquidStack = <liquid:potion>.withTag({Potion: "minecraft:awkward"});
function removePotionBrew(ing as IItemStack){
	brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), ing);
	brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), ing);
	brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), ing);
}
function removePotion(ing as IItemStack, liqpot as ILiquidStack){
    val awkward as ILiquidStack = <liquid:potion>.withTag({Potion: "minecraft:awkward"});
	removePotionBrew(ing);
    IEMixer.removeRecipe(liqpot);
}


val haste_quark as ILiquidStack = <liquid:potion>.withTag({Potion: "quark:haste"});
val haste_coth as ILiquidStack = <liquid:potion>.withTag({Potion: "cofhcore:haste"});
val haste_apo as ILiquidStack = <liquid:potion>.withTag({Potion: "apotheosis:haste"});
val swiftness as ILiquidStack = <liquid:potion>.withTag({Potion: "minecraft:swiftness"});
val strength as ILiquidStack = <liquid:potion>.withTag({Potion: "minecraft:strength"});

removePotion(<minecraft:prismarine_crystals>, haste_quark);
removePotion(<minecraft:mushroom_stew>, haste_apo);
removePotion(<thermalfoundation:material:2053>, haste_coth);
TEImbuer.removeRecipe(<thermalfoundation:material:2053>, awkward);
removePotion(<minecraft:blaze_powder>, strength);
TEImbuer.removeRecipe(<minecraft:blaze_powder>, awkward);



function addPotion(pot as string, item as IItemStack){
	val awkward as ILiquidStack = <liquid:potion>.withTag({Potion: "minecraft:awkward"});
	brewing.addBrew(
		<minecraft:potion>.withTag({Potion: "minecraft:awkward"}),
		item,
		<minecraft:potion>.withTag({Potion: pot})
	);
	IEMixer.addRecipe(<liquid:potion>.withTag({Potion: pot}) * 1000, awkward * 1000, [item], 4800);
	TEImbuer.addRecipe(<liquid:potion>.withTag({Potion: pot}) * 500, item, awkward * 500, 4800);

}

/*brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <harvestcraft:chocolatebaritem>, <minecraft:potion>.withTag({Potion: "cofhcore:haste"}));
IEMixer.addRecipe(haste_coth * 1000, awkward * 1000, [<harvestcraft:chocolatebaritem>], 4800);
TEImbuer.addRecipe(haste_coth * 500, <harvestcraft:chocolatebaritem>, awkward * 500, 4800);
*/
addPotion("cofhcore:haste", <harvestcraft:chocolatebaritem>);

removePotion(<minecraft:sugar>, swiftness);
removePotionBrew(<atum:wolf_pelt>);
TEImbuer.removeRecipe(<minecraft:sugar>, awkward);

/*brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <harvestcraft:caramelitem>, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}));
IEMixer.addRecipe(swiftness * 1000, awkward * 1000, [<harvestcraft:caramelitem>], 4800);
TEImbuer.addRecipe(swiftness * 500, <harvestcraft:caramelitem>, awkward * 500, 4800);
*/
addPotion("minecraft:swiftness", <harvestcraft:caramelitem>);


addPotion("minecraft:strength", <harvestcraft:pepperoniitem>);

//second chance
val second_chance as ILiquidStack = <liquid:potion>.withTag({Potion: "extrautils2:xu2.second.chance"});
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:strong_healing"}), <minecraft:golden_apple:1>);
IEMixer.removeRecipe(second_chance);

IEMixer.addRecipe(second_chance * 1000, <liquid:potion>.withTag({Potion: "cofhcore:regeneration4"}) * 1000, [<contenttweaker:luck_particle>], 10000);
TEImbuer.addRecipe(second_chance * 500, <contenttweaker:luck_particle>, <liquid:potion>.withTag({Potion: "cofhcore:regeneration4"}) * 500, 10000);
mods.thermalexpansion.Transposer.addFillRecipe(
	<minecraft:potion>.withTag({Potion: "extrautils2:xu2.second.chance"}), <minecraft:glass_bottle>, second_chance * 250, 5000
);

//love
removePotion(<minecraft:double_plant:4>, <liquid:potion>.withTag({Potion: "extrautils2:xu2.love"}));
addPotion("extrautils2:xu2.love", <contenttweaker:life>);

//gravity
removePotion(<ore:obsidian>.firstItem, <liquid:potion>.withTag({Potion: "extrautils2:xu2.gravity"}));
addPotion("extrautils2:xu2.gravity", <contenttweaker:bedrockium_alloy_ingot>);