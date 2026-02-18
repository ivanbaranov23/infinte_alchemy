import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;


mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:large_numismatic_controller>, [
    [<contenttweaker:gargeruby>, <contenttweaker:arkenium_plate>, <contenttweaker:arkenium_plate>, <contenttweaker:gargeruby>, <contenttweaker:arkenium_plate>, <contenttweaker:arkenium_plate>, <contenttweaker:gargeruby>], 
    [<contenttweaker:arkenium_plate>, <thermalexpansion:augment:720>, <thermalexpansion:augment:720>, <thermalexpansion:dynamo:5>, <thermalexpansion:augment:720>, <thermalexpansion:augment:720>, <contenttweaker:arkenium_plate>], 
    [<contenttweaker:arkenium_plate>, <thermalexpansion:augment:720>, <thermalfoundation:upgrade:35>, <thermalfoundation:upgrade:35>, <thermalfoundation:upgrade:35>, <thermalexpansion:augment:720>, <contenttweaker:arkenium_plate>], 
    [<contenttweaker:gargeruby>, <thermalexpansion:dynamo:5>, <contenttweaker:laser>, <contenttweaker:mana_frame>, <contenttweaker:laser>, <thermalexpansion:dynamo:5>, <contenttweaker:gargeruby>], 
    [<contenttweaker:arkenium_plate>, <thermalexpansion:augment:720>, <thermalfoundation:upgrade:35>, <thermalfoundation:upgrade:35>, <thermalfoundation:upgrade:35>, <thermalexpansion:augment:720>, <contenttweaker:arkenium_plate>], 
    [<contenttweaker:arkenium_plate>, <thermalexpansion:augment:720>, <thermalexpansion:augment:720>, <thermalexpansion:dynamo:5>, <thermalexpansion:augment:720>, <thermalexpansion:augment:720>, <contenttweaker:arkenium_plate>], 
    [<contenttweaker:gargeruby>, <contenttweaker:arkenium_plate>, <contenttweaker:arkenium_plate>, <contenttweaker:gargeruby>, <contenttweaker:arkenium_plate>, <contenttweaker:arkenium_plate>, <contenttweaker:gargeruby>]
]);
scripts.recycler.addRecycle(<modularmachinery:large_numismatic_controller>, [
    <contenttweaker:mana_frame>, <contenttweaker:laser> * 2, <thermalexpansion:dynamo:5> * 4,
    <thermalexpansion:augment:720> * 12, <thermalfoundation:upgrade:35> * 6,
    <contenttweaker:gargeruby> * 8, <contenttweaker:arkenium_ingot> * (64)
]);


var mil as int = 1000000;

for gem,power in {
    <minecraft:diamond> * 4:                    100 * 1000,

    <bloodmagic:item_demon_crystal:*> * 8:      5 * mil,

    <contenttweaker:gargeruby>:                 125 * mil,
    <contenttweaker:inverse_gargeruby>:         200 * mil,
    <contenttweaker:terragem>:                  125 * mil,

} as int[IItemStack]
{
    {    
        var rec = RecipeBuilder.newBuilder("aaaa" ~ gem.name, "large_numismatic", 20 * 60);

        rec.addEnergyPerTickOutput(power);

        rec.addItemInput(gem);
        
        rec.addFluidInput(<liquid:crystal_fluid1> * 1000);
        rec.addFluidOutput(<liquid:crystal_waste> * 1000);

        rec.build();
    }
}