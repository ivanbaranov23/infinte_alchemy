import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.oredict.IOreDictEntry;

import mods.customfishing.FishingBulider;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;


import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.GaugeDirection;
import mods.requious.AssemblyRecipe;

/*
    <ore:fishingRod1>.addItems([
        <minecraft:fishing_rod:*>,
        <thermalfoundation:tool.fishing_rod_copper:*>,
        <thermalfoundation:tool.fishing_rod_tin:*>,
        <thermalfoundation:tool.fishing_rod_aluminum:*>,
        <thermalfoundation:tool.fishing_rod_nickel:*>,
        <thermalfoundation:tool.fishing_rod_invar:*>,
        <thermalfoundation:tool.fishing_rod_bronze:*>,
        <thermalfoundation:tool.fishing_rod_constantan:*>,
        <thermalfoundation:tool.fishing_rod_iron:*>,
    ]);
    <ore:fishingRod2>.addItems([
        <mysticalagriculture:inferium_fishing_rod:*>,
        <thermalfoundation:tool.fishing_rod_silver:*>,
        <thermalfoundation:tool.fishing_rod_lead:*>,
        <thermalfoundation:tool.fishing_rod_steel:*>,
        <thermalfoundation:tool.fishing_rod_electrum:*>,
        <thermalfoundation:tool.fishing_rod_gold:*>,
    ]);
    <ore:fishingRod3>.addItems([
        <thermalfoundation:tool.fishing_rod_diamond:*>,
        <thermalfoundation:tool.fishing_rod_platinum:*>,
        <mysticalagriculture:prudentium_fishing_rod:*>,
    ]);
    <ore:fishingRod4>.addItems([
    <mysticalagriculture:intermedium_fishing_rod:*>,
    <mysticalagriculture:superium_fishing_rod:*>,
    <mysticalagriculture:supremium_fishing_rod:*>,
    <redstonearsenal:tool.fishing_rod_flux:*>,
    ]);
*/
/*
    FishingBulider.create(<liquid:radioactive_waste>, <contenttweaker:activated_green_fish>)
    .addFishBait(<deepmoblearning:pristine_matter_guardian>)
    .addFishRods(<ore:fishingRod1>.items)
    .register();
*/

recipes.addShapeless("ia_bait_0", <thermalfoundation:bait> * 2, [
    <ore:dustWood>, <ore:dustWheat>, <ore:slimeball>
]);
recipes.remove(<thermalfoundation:bait:1>);
recipes.addShapeless("ia_bait_1", <thermalfoundation:bait:1> * 4, [
    <thermalfoundation:bait>, <thermalfoundation:bait>, <thermalfoundation:bait>, <thermalfoundation:bait>,
    <minecraft:nether_wart>, <harvestcraft:fishtrapbaititem>
]);


static Fisher as Assembly = <assembly:fisher>;
{
    {
        Fisher.setItemSlot(1, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Fisher.setItemSlot(2, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Fisher.setItemSlot(3, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");

        Fisher.setItemSlot(1, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Fisher.setItemSlot(2, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Fisher.setItemSlot(3, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
    }

    Fisher.setFluidSlot(2, 3, ComponentFace.all(), 12000)
        .setAccess(true, false)
        .setGroup("input");
    Fisher.setEnergySlot(0, 2, ComponentFace.all(), 4000000)
        .setAccess(true, false)
        .setGroup("power");

    Fisher.setDurationSlot(5, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false))
        .setGroup("duration");

    Fisher.setItemSlot(7, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output0");
    Fisher.setItemSlot(8, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output1");

    
    Fisher.setJEIItemSlot(0, 0, "rod");
    Fisher.setJEIItemSlot(0, 1, "bait");

    Fisher.setJEIFluidSlot(0, 2, "fluid");
    
    Fisher.setJEIDurationSlot(1, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false));
    
    Fisher.setJEIItemSlot(2, 0, "output");
    Fisher.setJEIItemSlot(3, 0, "output");
    Fisher.setJEIItemSlot(4, 0, "output");

    Fisher.setJEIItemSlot(2, 1, "output");
    Fisher.setJEIItemSlot(3, 1, "output");
    Fisher.setJEIItemSlot(4, 1, "output");

    Fisher.setJEIItemSlot(2, 2, "output");
    Fisher.setJEIItemSlot(3, 2, "output");
    Fisher.setJEIItemSlot(4, 2, "output");


    
    Fisher.addJEICatalyst(<minecraft:fishing_rod>);
    Fisher.addJEICatalyst(<mysticalagriculture:inferium_fishing_rod>);
    Fisher.addJEICatalyst(<mysticalagriculture:prudentium_fishing_rod>);
    Fisher.addJEICatalyst(<mysticalagriculture:intermedium_fishing_rod>);
    Fisher.addJEICatalyst(<mysticalagriculture:superium_fishing_rod>);
    Fisher.addJEICatalyst(<mysticalagriculture:supremium_fishing_rod>);
    
}


mods.jei.JEI.hideCategory("customfishing.fishingcondition");


static pool as int = 0;
function addFishing(lt_name as string, liquid as ILiquidStack, bait as IItemStack, fish as int[IItemStack]) {
    pool += 1;
    var lt = LootTweaker.newTable("contenttweaker:fishing_" ~ lt_name);
    var lp = lt.addPool("autopool_fish" ~ pool, 1, 1, 0, 0);
    for item in fish{
        lp.addItemEntry(item, fish[item]);
    }

    FishingBulider.create(liquid, "contenttweaker:fishing_" ~ lt_name)
        .addFishBait(bait)
        //.addFishRods(rod.items)
        .register();

    {
        var recipe = AssemblyRecipe.create(function(container) {
            for item in fish{
                container.addItemOutput("output", item.withLore(["Weight " ~ fish[item]]));
            }
        });
        recipe = recipe.requireItem("bait", bait * 2);
        recipe = recipe.requireFluid("fluid", liquid);

        Fisher.addJEIRecipe(recipe);	
    }
}


addFishing("fish_oil", <liquid:fish_oil>, <harvestcraft:fishtrapbaititem>, {
    <contenttweaker:oil_fish>: 100,
    <contenttweaker:fishy_capacitor>: 10,
    <additionalcompression:meatfish_compressed>: 10
});
addFishing("seaweed_rich_water", <liquid:seaweed_rich_water>, <harvestcraft:fishtrapbaititem>, {
    <contenttweaker:diamond_crab>: 50,
    <harvestcraft:crabrawitem>: 100,
    <harvestcraft:crayfishrawitem>: 100,
    <harvestcraft:shrimprawitem>: 100,
    <harvestcraft:snailrawitem>: 100,
});

addFishing("lava", <liquid:lava>, <harvestcraft:fishtrapbaititem>, {
    <minecraft:blaze_rod>: 100,
    <contenttweaker:fire_jellyfish>: 80,
    <contenttweaker:obsidian_trout>: 80,
    <contenttweaker:basalt_anchovy>: 80,
    <contenttweaker:nether_pest>: 10,
    <contenttweaker:nitrall>.withTag({food: 10}): 3,
    <netherite:netheritescrap>: 20
});
addFishing("andesite_magma", <liquid:andesite_magma>, <contenttweaker:tinley>, {
    <exnihilocreatio:item_ore_cobalt:1>: 100,
    <exnihilocreatio:item_ore_ardite:1>: 100,
    <contenttweaker:cincinnasite_dirty_dust>: 50,
    <netherite:netheritescrap>: 40,
});

addFishing("sand", <liquid:sand>, <harvestcraft:fishtrapbaititem>, {
    <atum:fish_forsaken>: 100,
    <atum:fish_mummified>: 100,
    <atum:fish_jeweled>: 20,
    <atum:fish_skeletal>: 50
});
addFishing("desert_water", <liquid:desert_water>, <harvestcraft:fishtrapbaititem>, {
    <atum:fish_forsaken>: 100,
    <atum:fish_jeweled>: 100
});


addFishing("circuit", <liquid:circuit>, <harvestcraft:fishtrapbaititem>, {
    <contenttweaker:fishy_capacitor>: 1000,
    <contenttweaker:bug_chip>: 50,
    <ometweaks:crab_capacitor>: 1
});
addFishing("radioactive_waste", <liquid:radioactive_waste>, <harvestcraft:fishtrapbaititem>, {
    <contenttweaker:activated_green_fish>: 100,
    <contenttweaker:bug_chip>: 5,
    <contenttweaker:diamond_crab>: 50
});

/*
FishingBulider.create(<fluid:blood>, <entity:gloppy:meat_man_1>)
    //.addFishRods(<ore:fishingRod4>.items)
    .register();*/