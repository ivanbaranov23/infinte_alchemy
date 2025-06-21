import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;


{//frame

    recipes.addShaped("ia_myst_frame1", <mysticalagriculture:mystical_machine_frame>, [
        [<mysticalagriculture:crafting>, <contenttweaker:gearbox_funky>, <mysticalagriculture:crafting>], 
        [<mysticalagriculture:crafting>, <mekanism:basicblock:8>, <mysticalagriculture:crafting>], 
        [<mysticalagriculture:crafting>, <actuallyadditions:item_battery>, <mysticalagriculture:crafting>]
    ]);
    recipes.addShaped("ia_myst_frame2", <mysticalagriculture:mystical_machine_frame> * 2, [
        [<mysticalagriculture:crafting:1>, <contenttweaker:gearbox_funky>, <mysticalagriculture:crafting:1>], 
        [<mysticalagriculture:crafting:1>, <actuallyadditions:block_misc:9>, <mysticalagriculture:crafting:1>], 
        [<mysticalagriculture:crafting:1>, <actuallyadditions:item_battery>, <mysticalagriculture:crafting:1>]
    ]);
    recipes.addShaped("ia_myst_frame3", <mysticalagriculture:mystical_machine_frame> * 4, [
        [<mysticalagriculture:crafting:2>, <contenttweaker:gearbox_funky>, <mysticalagriculture:crafting:2>], 
        [<mysticalagriculture:crafting:2>, <enderio:item_material:1>, <mysticalagriculture:crafting:2>], 
        [<mysticalagriculture:crafting:2>, <actuallyadditions:item_battery>, <mysticalagriculture:crafting:2>]
    ]);
    recipes.addShaped("ia_myst_frame4", <mysticalagriculture:mystical_machine_frame> * 8, [
        [<mysticalagriculture:crafting:3>, <contenttweaker:gearbox_funky>, <mysticalagriculture:crafting:3>], 
        [<mysticalagriculture:crafting:3>, <enderio:item_material:53>, <mysticalagriculture:crafting:3>], 
        [<mysticalagriculture:crafting:3>, <actuallyadditions:item_battery>, <mysticalagriculture:crafting:3>]
    ]);
    recipes.addShaped("ia_myst_frame5", <mysticalagriculture:mystical_machine_frame> * 16, [
        [<mysticalagriculture:crafting:4>, <contenttweaker:gearbox_funky>, <mysticalagriculture:crafting:4>], 
        [<mysticalagriculture:crafting:4>, <enderio:item_material:66>, <mysticalagriculture:crafting:4>], 
        [<mysticalagriculture:crafting:4>, <actuallyadditions:item_battery>, <mysticalagriculture:crafting:4>]
    ]);
    recipes.addShaped("ia_myst_frame6", <mysticalagriculture:mystical_machine_frame> * 32, [
        [<mysticalagradditions:insanium>, <contenttweaker:gearbox_funky>, <mysticalagradditions:insanium>], 
        [<mysticalagradditions:insanium>, <enderio:item_material:54>, <mysticalagradditions:insanium>], 
        [<mysticalagradditions:insanium>, <actuallyadditions:item_battery>, <mysticalagradditions:insanium>]
    ]);

}


recipes.addShaped("ia_essence_pump1", <contenttweaker:essence_pump1>, [
    [<projectred-core:resource_item:410>, <moreplates:inferium_plate>, <projectred-core:resource_item:410>],
    [<moreplates:inferium_gear>, <mekanism:machineblock:12>, <moreplates:inferium_gear>],
    [<projectred-core:resource_item:410>, <mysticalagriculture:mystical_machine_frame>, <projectred-core:resource_item:410>]
]);
recipes.addShaped("ia_essence_pump2", <contenttweaker:essence_pump2>, [
    [<projectred-core:resource_item:410>, <moreplates:prudentium_plate>, <projectred-core:resource_item:410>],
    [<moreplates:prudentium_gear>, <contenttweaker:essence_pump1>, <moreplates:prudentium_gear>],
    [<projectred-core:resource_item:410>, <mysticalagriculture:mystical_machine_frame>, <projectred-core:resource_item:410>]
]);
recipes.addShaped("ia_essence_pump3", <contenttweaker:essence_pump3>, [
    [<contenttweaker:pump>, <moreplates:intermedium_plate>, <contenttweaker:pump>],
    [<moreplates:intermedium_gear>, <contenttweaker:essence_pump2>, <moreplates:intermedium_gear>],
    [<contenttweaker:pump>, <mysticalagriculture:mystical_machine_frame>, <contenttweaker:pump>]
]);
recipes.addShaped("ia_essence_pump4", <contenttweaker:essence_pump4>, [
    [<contenttweaker:pump>, <moreplates:superium_plate>, <contenttweaker:pump>],
    [<moreplates:superium_gear>, <contenttweaker:essence_pump3>, <moreplates:superium_gear>],
    [<contenttweaker:pump>, <mysticalagriculture:mystical_machine_frame>, <contenttweaker:pump>]
]);
recipes.addShaped("ia_essence_pump5", <contenttweaker:essence_pump5>, [
    [<contenttweaker:cooling_system>, <moreplates:supremium_plate>, <contenttweaker:cooling_system>],
    [<moreplates:supremium_gear>, <contenttweaker:essence_pump4>, <moreplates:supremium_gear>],
    [<contenttweaker:cooling_system>, <mysticalagriculture:mystical_machine_frame>, <contenttweaker:cooling_system>]
]);

mods.tconstruct.Melting.addRecipe(<liquid:essence_slurp> * 50, <mysticalagriculture:crafting>);
mods.thermalexpansion.Crucible.addRecipe(
    <liquid:essence_slurp> * 50,
    <mysticalagriculture:crafting>,
    1000
);


{//ore-s
    <ore:inferiumSlurp1>.addItems(<ore:listAllseed>.items);
    <ore:inferiumSlurp1>.addItems(<ore:listAllveggie>.items);
    <ore:inferiumSlurp1>.addItems(<ore:listAllnut>.items);
    <ore:inferiumSlurp1>.addItems(<ore:listAllfruit>.items);
    <ore:inferiumSlurp1>.addItems(<ore:listAllfishraw>.items);
    <ore:inferiumSlurp1>.addItems(<ore:listAllgrain>.items);
    <ore:inferiumSlurp1>.addItems(<ore:string>.items);
    <ore:inferiumSlurp1>.addItems([<minecraft:rotten_flesh>, <minecraft:bone>, <prodigytech:ash>, <biomesoplenty:ash>, <minecraft:spider_eye>, <minecraft:arrow>, <minecraft:gunpowder>]);

    
    <ore:inferiumSlurp2>.addItems(<ore:dustWood>.items);
    <ore:inferiumSlurp2>.addItems(<ore:crystalSlag>.items);
    <ore:inferiumSlurp2>.addItems([<thermalfoundation:material>, <thermalfoundation:material:64>, <thermalfoundation:material:65>, <thermalfoundation:material:68>, <thermalfoundation:material:69>, <contenttweaker:zinc_dust>]);
    <ore:inferiumSlurp2>.addItems([<mekanism:otherdust:4>, <mekanism:salt>, <projectred-core:resource_item:105>, <minecraft:redstone>, <minecraft:glowstone_dust>, <thermalfoundation:material:768>, <thermalfoundation:material:769>, <thermalfoundation:material:770>, <thermalfoundation:material:771>]);
    <ore:inferiumSlurp2>.addItems([<minecraft:ender_pearl>, <natura:edibles:10>, <prodigytech:primordium>, <contenttweaker:soot>, <contenttweaker:primitive_eyes>]);

    for ore in <ore:dustDirty*>{
        <ore:inferiumSlurp3>.addItems(ore.items);
    }
    <ore:inferiumSlurp3>.addItems([<mekanism:otherdust>, <prodigytech:emerald_dust>, <prodigytech:energion_dust>, <immersiveengineering:material:17>]);
}

{//slurp1
    var rec = RecipeBuilder.newBuilder("slurp1", "essence_extractor", 20 * 6);

    rec.addEnergyPerTickInput(256);

    rec.addFluidOutput(<liquid:essence_slurp> * 5000);
    rec.addItemInput(<ore:inferiumSlurp1>, 10);

    rec.build();
}{//slurp2
    var rec = RecipeBuilder.newBuilder("slurp2", "essence_extractor", 20 * 6 * 3);

    rec.addEnergyPerTickInput(1024);

    rec.addFluidOutput(<liquid:essence_slurp> * 25000);
    rec.addItemInput(<ore:inferiumSlurp2>, 10);

    rec.build();
}{//slurp3
    var rec = RecipeBuilder.newBuilder("slurp3", "essence_extractor", 20 * 6 * 9);

    rec.addEnergyPerTickInput(4096);

    rec.addFluidOutput(<liquid:essence_slurp> * 50000);
    rec.addItemInput(<ore:inferiumSlurp3>, 10);

    rec.build();
}

{
    var rec = RecipeBuilder.newBuilder("ore1", "essence_extractor", 20 * 6);

    rec.addEnergyPerTickInput(256);

    rec.addFluidInput(<liquid:essence_slurp> * 16000);
    rec.addItemInput(<minecraft:stone> * 16);
    rec.addItemOutput(<mysticalagriculture:inferium_ore> * 16);

    rec.build();
}{
    var rec = RecipeBuilder.newBuilder("ore2", "essence_extractor", 20 * 6);

    rec.addEnergyPerTickInput(512);

    rec.addFluidInput(<liquid:essence_slurp> * 32000);
    rec.addItemInput(<minecraft:netherrack> * 16);
    rec.addItemOutput(<mysticalagriculture:nether_inferium_ore> * 16);

    rec.build();
}{
    var rec = RecipeBuilder.newBuilder("ore3", "essence_extractor", 20 * 6);

    rec.addEnergyPerTickInput(1024);

    rec.addFluidInput(<liquid:essence_slurp> * 40000);
    rec.addItemInput(<minecraft:end_stone> * 16);
    rec.addItemOutput(<mysticalagriculture:end_inferium_ore> * 16);

    rec.build();
}

{//essence compress 1
    {
        var rec = RecipeBuilder.newBuilder("essence_compress1", "essence_extractor", 5);

        rec.addEnergyPerTickInput(10 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 1000);
        rec.addItemInput(<mysticalagriculture:crafting> * 16);
        rec.addItemInput(<ore:slimecrystal>, 4);
        
        rec.addItemOutput(<mysticalagriculture:crafting:1> * 4);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_compress2", "essence_extractor", 5);

        rec.addEnergyPerTickInput(20 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 3000);
        rec.addItemInput(<mysticalagriculture:crafting:1> * 16);
        rec.addItemInput(<ore:slimecrystal>, 6);
        
        rec.addItemOutput(<mysticalagriculture:crafting:2> * 4);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_compress3", "essence_extractor", 5);

        rec.addEnergyPerTickInput(40 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 5000);
        rec.addItemInput(<mysticalagriculture:crafting:2> * 16);
        rec.addItemInput(<ore:slimecrystal>, 8);
        
        rec.addItemOutput(<mysticalagriculture:crafting:3> * 4);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_compress4", "essence_extractor", 5);

        rec.addEnergyPerTickInput(80 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 7000);
        rec.addItemInput(<mysticalagriculture:crafting:3> * 16);
        rec.addItemInput(<ore:slimecrystal>, 12);
        
        rec.addItemOutput(<mysticalagriculture:crafting:4> * 4);

        rec.build();
    }
}

{//essence crystal 1
    {
        var rec = RecipeBuilder.newBuilder("essence_crystal1", "essence_extractor", 5);

        rec.addEnergyPerTickInput(100 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 4000);
        rec.addItemInput(<mysticalagriculture:crafting> * 256);
        rec.addItemInput(<mysticalagriculture:master_infusion_crystal>).setChance(0.0);
        
        rec.addItemOutput(<mysticalagriculture:crafting:1> * 64);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_crystal2", "essence_extractor", 5);

        rec.addEnergyPerTickInput(300 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 8000);
        rec.addItemInput(<mysticalagriculture:crafting:1> * 256);
        rec.addItemInput(<mysticalagriculture:master_infusion_crystal>).setChance(0.0);
        
        rec.addItemOutput(<mysticalagriculture:crafting:2> * 64);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_crystal3", "essence_extractor", 5);

        rec.addEnergyPerTickInput(900 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 16000);
        rec.addItemInput(<mysticalagriculture:crafting:2> * 256);
        rec.addItemInput(<mysticalagriculture:master_infusion_crystal>).setChance(0.0);
        
        rec.addItemOutput(<mysticalagriculture:crafting:3> * 64);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_crystal4", "essence_extractor", 5);

        rec.addEnergyPerTickInput(2700 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 32000);
        rec.addItemInput(<mysticalagriculture:crafting:3> * 256);
        rec.addItemInput(<mysticalagriculture:master_infusion_crystal>).setChance(0.0);
        
        rec.addItemOutput(<mysticalagriculture:crafting:4> * 64);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("essence_crystal5", "essence_extractor", 5);

        rec.addEnergyPerTickInput(8100 * 1000);

        rec.addFluidInput(<liquid:sticky_water> * 64000);
        rec.addItemInput(<mysticalagriculture:crafting:4> * 256);
        rec.addItemInput(<mysticalagriculture:master_infusion_crystal>).setChance(0.0);
        
        rec.addItemOutput(<mysticalagradditions:insanium> * 64);

        rec.build();
    }
}