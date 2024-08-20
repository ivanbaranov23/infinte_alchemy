

{//copper
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <thermalfoundation:material:163> * 12, 
        <mekanism:dirtydust:3> * 4, <moreplates:tin_stick>, 
        3000
    );
}


{//ardite
    scripts.content_machines.addBioAssemblerRecipe(
        [], <liquid:ardite> * 1500, 
        [
            <thermalfoundation:material:128> * 8,
            <minecraft:gold_ingot> * 8,
            <taiga:valyrium_ingot>,
            <deepmoblearning:living_matter_hellish> * 8,
            <deepmoblearning:soot_covered_redstone> * 5,
            <enderio:block_holy_fog>
        ], [
            <liquid:fiery_essence> * 1000,
            <liquid:high_heat_lava> * 50
        ], <contenttweaker:research_chemistry3>,
        40, 1000
    );
}


{//titanium
    <ore:ingotTitanium>.removeItems(<ore:ingotTitanium>.items);
    <ore:ingotTitanium>.add(<contenttweaker:titanium_ingot>);
    <ore:dustTitanium>.remove(<exnihilocreatio:item_ore_titanium:2>);
    <ore:dustTitanium>.add(<contenttweaker:titanium_dust>);

    furnace.remove(<exnihilocreatio:item_ore_titanium:3>);
    furnace.remove(<ore:ingotTitanium>);
    mods.mekanism.chemical.dissolution.addRecipe(<exnihilocreatio:item_ore_titanium:1>, <gas:titanium> * 1000);
    mods.mekanism.chemical.dissolution.addRecipe(<contenttweaker:titanium_ore>, <gas:titanium> * 1000);

    mods.immersiveengineering.ArcFurnace.removeRecipe(<exnihilocreatio:item_ore_titanium:3>);
    mods.tconstruct.Melting.removeRecipe(<liquid:titanium>, <exnihilocreatio:item_ore_titanium:1>);
    mods.tconstruct.Melting.removeRecipe(<liquid:titanium>, <exnihilocreatio:item_ore_titanium:2>);
    mods.tconstruct.Melting.removeRecipe(<liquid:titanium>, <contenttweaker:titanium_dust>);

    <exnihilocreatio:item_ore_titanium:2>.displayName = "Titanium Ore Dust";
    scripts.helper.addHighOvenSmelting(
        [<contenttweaker:titanium_nugget> * 8], 
        [<contenttweaker:titanium_dust> * 2, <prodigytech:emerald_dust>], 
        [<liquid:lava> * 1000], 10 * 20, 256
    );
    scripts.helper.addHighOvenSmelting(
        [<immersiveengineering:material:7>, <contenttweaker:titanium_nugget> * 12], 
        [<contenttweaker:titanium_dust> * 2, <contenttweaker:jade_dust> * 2], 
        [<liquid:pyrotheum> * 1000], 7 * 20, 256
    );

    <densemetals:dense_rutile_ore>.displayName = "Dense Titanium Ore";
    mods.jei.JEI.addItem(<densemetals:dense_rutile_ore>);
}


//mithril
<moreplates:mana_infused_stick>.displayName = "Mithril Rod";
game.setLocalization("tile.thermalfoundation.ore.mithril.name", "Mithril Ore");
game.setLocalization("tile.thermalfoundation.storage.mithril.name", "Block of Mithril");
<thermalfoundation:coin:72>.displayName = "Mithril Coin";
<thermalfoundation:material:72>.displayName = "Mithril Dust";
<thermalfoundation:material:136>.displayName = "Mithril Ingot";
<thermalfoundation:material:200>.displayName = "Mithril Nugget";
<thermalfoundation:material:264>.displayName = "Mithril Gear";
<thermalfoundation:material:328>.displayName = "Mithril Plate";
game.setLocalization("tile.thermalfoundation.glass.mithril.name", "Hardened Mithril Glass");

{//gallium
    <ore:dustGallium>.add(<contenttweaker:gallium_dust>);
    <ore:ingotGallium>.add(<contenttweaker:gallium_ingot>);
    
}

{//steeleaf
    <ore:dustStoneleaf>.add(<contenttweaker:stoneleaf>);

    mods.actuallyadditions.AtomicReconstructor.addRecipe(<twilightforest:steeleaf_ingot>, <contenttweaker:stoneleaf>, 1000);
    mods.actuallyadditions.AtomicReconstructor.addRecipe(<twilightforest:block_storage:2>, <contenttweaker:stoneleaf_clump>, 10000);

    mods.thermalexpansion.Transposer.addFillRecipe(
        <twilightforest:steeleaf_ingot>, 
        <contenttweaker:stoneleaf>, 
        <liquid:formic_acid> * 500, 
        8000
    );
}


{//draconium
    furnace.remove(<draconicevolution:draconium_ingot>);
    furnace.remove(<ore:ingotDraconium>);

    mods.tconstruct.Melting.removeRecipe(<liquid:draconium>, <exnihilocreatio:item_ore_draconium:2>);
    mods.tconstruct.Melting.removeRecipe(<liquid:draconium>, <exnihilocreatio:item_ore_draconium:1>);
    mods.tconstruct.Melting.removeRecipe(<liquid:draconium>, <draconicevolution:draconium_dust>);
    mods.immersiveengineering.ArcFurnace.removeRecipe(<draconicevolution:draconium_ingot>);
    
    scripts.helper.addFluidAlloyerRecipe(
        <draconicevolution:draconium_ingot>, 
        <draconicevolution:draconium_dust>, <prodigytech:inferno_crystal> * 2, <liquid:pyrotheum> * 2000, 
        4096, 100
    );
}

//orichalcum
<ore:dustOrichalcum>.add(<contenttweaker:orichalcum_dust>);


//gravitite
mods.tconstruct.Melting.removeRecipe(<liquid:gravitite>, <netherendingores:ore_end_modded_2:6>);

//death metal
<ore:dustDeathMetal>.add(<contenttweaker:death_metal_dust>);


{//bedrockium
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <taiga:meteorite_dust> % 50,
            <mekores:mekanismore:88> % 75,
            <contenttweaker:orichalcum_dirty_dust> % 10
        ], <liquid:raw_bedrockium_solution> * 100, 
        <liquid:endacid> * 250, <contenttweaker:bedrockium_small_chunk>,
        <contenttweaker:uranium_mesh>,
        40, 1000
    );
    
}

//polonium
<ore:dustPolonium>.add(<contenttweaker:polonium_dust>);

//beryllium
<ore:dustBeryllium>.add(<contenttweaker:beryllium_dust>);