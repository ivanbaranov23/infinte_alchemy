import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;


static counter as int = 0;

for ingot,dust in {
    <minecraft:coal:1>: <ore:logWood>,
    <prodigytech:ash>: <minecraft:coal:1>,
    <contenttweaker:heavy_particle2>: <contenttweaker:heavy_particle>
} as IIngredient[IItemStack]{
    var rec = RecipeBuilder.newBuilder("CB_" ~ counter, "cincinnasite_blaster", 4);
    counter += 1;

    rec.addEnergyPerTickInput(500);
    

    rec.addInput(dust);
    rec.addItemOutput(ingot);
    
    
    rec.build();
}

for mat in [
    "iron", "copper", "tin", "zinc", "nickel", "aluminum",
    "cobalt", "ardite",
    "karmesine", "ovium", "jauxum",

    "gold", "silver", "lead", "osmium",
    "platinum", "iridium",
    "eezo"
] as string[]{
    var rec = RecipeBuilder.newBuilder("CB_" ~ counter, "cincinnasite_blaster", 4);
    counter += 1;

    rec.addEnergyPerTickInput(5000);
    

    rec.addInput(scripts.metalworks.all_metals[mat].dust);
    rec.addItemOutput(scripts.metalworks.all_metals[mat].ingot);
    
    
    rec.build();
}