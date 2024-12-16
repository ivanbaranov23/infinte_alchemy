import mods.enderio.SagMill;

{//copper
    

    recipes.addShapeless("copper_conv", <thermalfoundation:ore>, [
        <immersiveengineering:ore> | <mekanism:oreblock:1>
    ]);
}
{//aluminum
    furnace.remove(<erebus:materials:42>);
    
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

{//silver
    recipes.addShapeless("silver_conv", <thermalfoundation:ore:2>, [
        <mysticalworld:silver_ore> | <immersiveengineering:ore:3>
    ]);
}


{//atum
    SagMill.addRecipe([<thermalfoundation:material> * 2, <atum:loot_ruby_broach>, <atum:loot_sapphire_broach>], [1.0, 0.1, 0.1], <atum:iron_ore>, "MULTIPLY_OUTPUT");
    SagMill.addRecipe([<thermalfoundation:material:768> * 2, <atum:loot_ruby_broach>, <atum:loot_sapphire_broach>], [1.0, 0.1, 0.1], <atum:coal_ore>, "MULTIPLY_OUTPUT");

    SagMill.addRecipe([<thermalfoundation:material:1> * 2, <atum:loot_ruby_scepter>, <atum:loot_sapphire_scepter>], [1.0, 0.1, 0.1], <atum:gold_ore>, "MULTIPLY_OUTPUT");
    SagMill.addRecipe([<minecraft:redstone> * 8, <atum:loot_ruby_scepter>, <atum:loot_sapphire_scepter>], [1.0, 0.1, 0.1], <atum:redstone_ore>, "MULTIPLY_OUTPUT");
    SagMill.addRecipe([<enderio:item_material:32> * 8, <atum:loot_ruby_scepter>, <atum:loot_sapphire_scepter>], [1.0, 0.1, 0.1], <atum:lapis_ore>, "MULTIPLY_OUTPUT");
    
    SagMill.addRecipe([<prodigytech:emerald_dust> * 2, <atum:loot_ruby_idol>, <atum:loot_sapphire_idol>], [1.0, 0.1, 0.1], <atum:emerald_ore>, "MULTIPLY_OUTPUT");
    SagMill.addRecipe([<mekanism:otherdust> * 2, <atum:loot_ruby_idol>, <atum:loot_sapphire_idol>], [1.0, 0.1, 0.1], <atum:diamond_ore>, "MULTIPLY_OUTPUT");
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

    
    scripts.helper.addHighOvenSmelting(
        [<contenttweaker:titanium_ingot> * 2], 
        [<contenttweaker:titanium_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 2000], 20 * 20, 256
    );
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:titanium_ingot>], [<contenttweaker:titanium_dust>], 1024, 1);

    mods.jei.JEI.addItem(<densemetals:dense_rutile_ore>);
}
{//cursed gold
    <ore:dustCursedgold>.add(<contenttweaker:cursed_gold_dust>);
}

{//mithril
    

    furnace.remove(<thermalfoundation:material:136>);
    furnace.remove(<ore:ingotMithril>);

    mods.immersiveengineering.ArcFurnace.removeRecipe(<thermalfoundation:material:136>);
    mods.tconstruct.Melting.removeRecipe(<liquid:mithril>, <exnihilocreatio:item_ore_mithril:1>);
    mods.tconstruct.Melting.removeRecipe(<liquid:mithril>, <exnihilocreatio:item_ore_mithril:2>);
    mods.tconstruct.Melting.removeRecipe(<liquid:mithril>, <thermalfoundation:material:72>);

    scripts.helper.addHighOvenSmelting(
        [<thermalfoundation:material:136> * 2], 
        [<thermalfoundation:material:72> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 2000], 20 * 20, 256
    );
    scripts.ore_processing.addTingalumOvenRecipe([<thermalfoundation:material:136>], [<thermalfoundation:material:72>], 1024, 1);
}
{//chrome
    <ore:ingotChrome>.add(<contenttweaker:chrome_ingot>);
    <ore:dustChrome>.add(<contenttweaker:chrome_dust>);

    scripts.helper.addHighOvenSmelting(
        [<contenttweaker:chrome_ingot> * 2], 
        [<contenttweaker:chrome_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 2000], 20 * 20, 256
    );
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:chrome_ingot>], [<contenttweaker:chrome_dust>], 4096, 1);

    <densemetals:dense_chromium_ore>.displayName = "Dense Chrome Ore";
    mods.jei.JEI.addItem(<densemetals:dense_chromium_ore>);

}
{//neodymium
    <ore:ingotNeodymium>.add(<contenttweaker:neodymium_ingot>);
    <ore:dustNeodymium>.add(<contenttweaker:neodymium_dust>);


    scripts.helper.addHighOvenSmelting(
        [<contenttweaker:neodymium_ingot> * 2], 
        [<contenttweaker:neodymium_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 2000], 20 * 20, 256
    );
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:neodymium_ingot>], [<contenttweaker:neodymium_dust>], 1024, 1);

}


{//gallium
    <ore:dustGallium>.add(<contenttweaker:gallium_dust>);
    <ore:ingotGallium>.add(<contenttweaker:gallium_ingot>);
    
}
{//arkenium
    <ore:ingotArkenium>.add(<contenttweaker:arkenium_ingot>);
    <ore:dustArkenium>.add(<contenttweaker:arkenium_dust>);

    furnace.remove(<contenttweaker:arkenium_ingot>);
    furnace.remove(<ore:ingotArkenium>);
    
    scripts.helper.addHighOvenSmelting(
        [<contenttweaker:arkenium_ingot> * 2], 
        [<contenttweaker:arkenium_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 3000], 20 * 20, 1024
    );
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:arkenium_ingot>], [<contenttweaker:arkenium_dust>], 4096, 1);

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

    recipes.remove(<draconicevolution:draconium_dust>);
    
    scripts.helper.addHighOvenSmelting(
        [<draconicevolution:draconium_ingot> * 2], 
        [<draconicevolution:draconium_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 3000], 20 * 20, 1024
    );
    /*scripts.helper.addFluidAlloyerRecipe(
        <draconicevolution:draconium_ingot>, 
        <draconicevolution:draconium_dust>, <prodigytech:inferno_crystal> * 2, <liquid:pyrotheum> * 2000, 
        4096, 100
    );*/

    scripts.ore_processing.addTingalumOvenRecipe([<draconicevolution:draconium_ingot>], [<draconicevolution:draconium_dust>], 4096, 1);
}

{//orichalcum
    <ore:dustOrichalcum>.add(<contenttweaker:orichalcum_dust>);

    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:orichalcum_ingot>], [<contenttweaker:orichalcum_dust>], 100 * 1000, 5);
}

//gravitite
mods.tconstruct.Melting.removeRecipe(<liquid:gravitite>, <netherendingores:ore_end_modded_2:6>);

//death metal
<ore:dustDeathMetal>.add(<contenttweaker:death_metal_dust>);
scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:death_metal_ingot>], [<contenttweaker:death_metal_dust>], 10 * 1000 * 1000, 10);


{//bedrockium
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <taiga:meteorite_dust> % 50,
            <mekores:mekanismore:88> % 75,
            <contenttweaker:orichalcum_dirty_dust> % 5
        ], <liquid:raw_bedrockium_solution> * 100, 
        <liquid:endacid> * 250, <contenttweaker:bedrockium_small_chunk>,
        <contenttweaker:uranium_mesh>,
        40, 1000
    );
    
}

//terra
scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:terra_base>], [<contenttweaker:terra_base_dust>], 1000 * 1000, 10);
scripts.ore_processing.addTingalumOvenRecipe([<botania:manaresource:4>], [
    <contenttweaker:terra_base>, 
    <extendedcrafting:singularity_custom:11> * 2,
    <roots:terra_moss> * 64, 
    <botania:quartz:1>
], 100 * 1000 * 1000, 30);


//polonium
<ore:dustPolonium>.add(<contenttweaker:polonium_dust>);

//beryllium
<ore:dustBeryllium>.add(<contenttweaker:beryllium_dust>);

<ore:oreCaelumite>.add(<contenttweaker:caelumite_ore>);
<ore:dustCaelumite>.add(<contenttweaker:caelumite_dust>);