import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;




{//flower
    var rec = RecipeBuilder.newBuilder("flower1", "flower", 800);
    rec.addEnergyPerTickOutput(1000 * 1000 * 35);


    rec.addFluidOutput(<liquid:flowers_depleted> * 3000);
    rec.addFluidInput(<liquid:flowers> * 4000);
    rec.addManaInput(5000, false);


    for it in 0 to 16{
        rec.addItemInput(<botania:petal>.definition.makeStack(it) * 4);
    }
	
    rec.build();
}
{//flower
    var rec = RecipeBuilder.newBuilder("flower2", "flower", 400);
    rec.addEnergyPerTickOutput(1000 * 1000 * 125);


    //rec.addFluidOutput(<liquid:flowers_depleted> * 100);
    rec.addFluidInput(<liquid:flowers> * 2500);
	rec.addGasInput(<gas:neutron_active> * 2500);
    rec.addManaInput(15000, false);

	rec.addItemInput(<moretcon:solidlightning>);


    rec.build();
}


scripts.content_machines.addBioAssemblerRecipe(
    [<contenttweaker:methyst_dust>, <contenttweaker:methyst_dirty_dust>], <liquid:flowers> * 1000,
    [
        <contenttweaker:activated_biopower> * 4,
        <moretcon:gemelectarite> * 2,
        <contenttweaker:methyst> * 2
    ], [
        <liquid:biotite> * 1500,
        <liquid:fire> * 50
    ], <contenttweaker:plasma_gen>, 20, 10000
);