import mods.enderio.SagMill;

//ores



{//t1
    {//iron
        mods.exnihilocreatio.Hammer.addRecipe(
            <minecraft:iron_ore>, <exnihilocreatio:item_ore_iron> * 5,
            0, 1.0, 1.0
        );
        mods.tconstruct.Melting.addRecipe(<liquid:iron> * 288, <minecraft:iron_ore>, 700);

        mods.botania.PureDaisy.addRecipe(<contenttweaker:poor_iron_ore>, <minecraft:iron_ore>);

        
    }
    {//copper
        mods.exnihilocreatio.Hammer.addRecipe(
            <thermalfoundation:ore>, <exnihilocreatio:item_ore_copper> * 5,
            0, 1.0, 1.0
        );
        mods.tconstruct.Melting.addRecipe(<liquid:copper> * 288, <thermalfoundation:ore>, 700);

        recipes.addShapeless("copper_conv", <thermalfoundation:ore>, [
            <immersiveengineering:ore> | <mekanism:oreblock:1>
        ]);

        
    }
    {//tin
        mods.exnihilocreatio.Hammer.addRecipe(
            <thermalfoundation:ore:1>, <exnihilocreatio:item_ore_tin> * 5,
            0, 1.0, 1.0
        );
        mods.tconstruct.Melting.addRecipe(<liquid:tin> * 288, <thermalfoundation:ore:1>, 700);
    }
    {//nickel
        mods.exnihilocreatio.Hammer.addRecipe(
            <thermalfoundation:ore:5>, <exnihilocreatio:item_ore_nickel> * 5,
            0, 1.0, 1.0
        );
        mods.tconstruct.Melting.addRecipe(<liquid:nickel> * 288, <thermalfoundation:ore:5>, 700);

        
    }
    {//aluminum
        mods.exnihilocreatio.Hammer.addRecipe(
            <thermalfoundation:ore:4>, <exnihilocreatio:item_ore_aluminum> * 5,
            0, 1.0, 1.0
        );
        mods.tconstruct.Melting.addRecipe(<liquid:aluminum> * 288, <thermalfoundation:ore:4>, 700);

        furnace.remove(<erebus:materials:42>);
        furnace.addRecipe(<thermalfoundation:material:196> * 2, <contenttweaker:bauxite_dust>);

        
    }
    {//zinc
        mods.exnihilocreatio.Hammer.addRecipe(
            <contenttweaker:zinc_ore>, <exnihilocreatio:item_ore_zinc> * 5,
            0, 1.0, 1.0
        );
        mods.tconstruct.Melting.addRecipe(<liquid:zinc> * 288, <contenttweaker:zinc_ore>, 700);

        <ore:dustZinc>.remove(<exnihilocreatio:item_ore_zinc:2>);
        <ore:dustZinc>.add(<contenttweaker:zinc_dust>);
        <ore:ingotZinc>.remove(<exnihilocreatio:item_ore_zinc:3>);
        <ore:ingotZinc>.add(<contenttweaker:zinc_ingot>);

        furnace.remove(<exnihilocreatio:item_ore_zinc:3>);
        recipes.remove(<exnihilocreatio:item_ore_zinc:3>);
        recipes.remove(<exnihilocreatio:item_ore_zinc:2>);

        mods.tconstruct.Casting.addTableRecipe(<contenttweaker:zinc_ingot>, <minecraft:iron_ingot>, <liquid:andesite>, 250, true);
        mods.thermalexpansion.Transposer.addFillRecipe(
            <contenttweaker:zinc_ingot>, 
            <minecraft:iron_ingot>, <liquid:andesite> * 250, 
            1500
        );

        {//pellets
            mods.thermalexpansion.InductionSmelter.addRecipe(
                <contenttweaker:zinc_pellet>, 
                <mekores:mekanismore:113>,
                <immersiveengineering:material:17>,
                2000
            );
            mods.thermalexpansion.InductionSmelter.addRecipe(
                <contenttweaker:zinc_pellet> * 2, 
                <mekores:mekanismore:111>,
                <immersiveengineering:material:17>,
                2000
            );
            mods.thermalexpansion.InductionSmelter.addRecipe(
                <contenttweaker:zinc_pellet> * 2, 
                <contenttweaker:sphalerite_dust>,
                <immersiveengineering:material:17>,
                2000
            );

            mods.mekanism.reaction.addRecipe(
                <contenttweaker:zinc_pellet>, <liquid:pyrotheum> * 500, <gas:oxygen> * 200, 
                <contenttweaker:zinc_pellet2>, <gas:waste_gas> * 5, 1500, 60
            );
            scripts.content_machines.addFluidSieveRecipeRandom(
                [
                    <contenttweaker:zinc_dust> % 95,
                    <thermalfoundation:material:771> % 25,
                    <contenttweaker:cadmium> % 15
                ], null, 
                <liquid:sulfuricacid> * 500, <contenttweaker:zinc_pellet2>,
                null,
                80, 250
            );

        }
    }
    {//cobalt
        mods.exnihilocreatio.Hammer.addRecipe(
            <netherendingores:ore_other_1:4>, <exnihilocreatio:item_ore_cobalt> * 5,
            0, 1.0, 1.0
        );
    }
    {//ardite
        mods.exnihilocreatio.Hammer.addRecipe(
            <netherendingores:ore_other_1:2>, <exnihilocreatio:item_ore_ardite> * 5,
            0, 1.0, 1.0
        );
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

    {//antimony
        mods.immersiveengineering.AlloySmelter.addRecipe(
            <contenttweaker:antimony_dust> * 2, 
            <contenttweaker:stibnite> * 2,
            <thermalfoundation:material>,
            200
        );
    
        mods.thermalexpansion.InductionSmelter.addRecipe(
            <contenttweaker:antimony_dust> * 2, 
            <contenttweaker:stibnite> * 2,
            <thermalfoundation:material>,
            2000,
            <mekanism:dirtydust>, 30
        );


        mods.alchemistry.Dissolver.addRecipe(<contenttweaker:stibnite>, false, 1, [
            [100, <alchemistry:element:51> * 32, <alchemistry:element:16> * 48]
        ]);

        <contenttweaker:antimony_ore>.addTooltip(game.localize("ia.antimony_tooltip"));
        <contenttweaker:antimony_ore_dense>.addTooltip(game.localize("ia.antimony_tooltip"));
    }
}
{//silver
    recipes.addShapeless("silver_conv", <thermalfoundation:ore:2>, [
        <mysticalworld:silver_ore> | <immersiveengineering:ore:3>
    ]);
}
{//t3
    {
        furnace.remove(<thermalfoundation:material:134>);
        furnace.remove(<ore:ingotPlatinum>);
    }
    {
        furnace.remove(<thermalfoundation:material:135>);
        furnace.remove(<ore:ingotIridium>);
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
        scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:titanium_ingot>], [<contenttweaker:titanium_dust>], 10240, 1);

        mods.jei.JEI.addItem(<densemetals:dense_rutile_ore>);


        
    }
    {
        furnace.remove(<exnihilocreatio:item_ore_tungsten:3>);
    }
    {
        furnace.remove(<immersiveengineering:metal:5>);
        furnace.remove(<ore:ingotUranium>);
    }
    {//yellorium
        furnace.remove(<bigreactors:ingotyellorium>);
        furnace.remove(<ore:ingotYellorium>);
    }

    {//netherite
        <ore:oreNetherite>.remove(<netherite:ancientdebris>);
        <ore:dustNetherite>.add(<netherite:netheritescrap>);
        furnace.remove(<netherite:netheritescrap>);
        furnace.remove(<netherite:netheriteingot>);

        mods.thermalexpansion.Crucible.addRecipe(<liquid:debris> * 1000, <netherite:ancientdebris>, 4000);
        mods.mekanism.reaction.addRecipe(
            <contenttweaker:ancient_dust>, <liquid:debris> * 500, <gas:acetic_acid> * 500, 
            <contenttweaker:debris> * 2, <gas:cleanvalyrium> * 300, 1500, 60
        );

        mods.mekanism.compressor.addRecipe(<contenttweaker:debris>, <gas:hydrogenchloride>, <netherite:netheritescrap>);
        mods.mekanism.compressor.addRecipe(<contenttweaker:debris>, <gas:rfna>, <netherite:netheritescrap> * 2);
        mods.mekanism.compressor.addRecipe(<contenttweaker:debris>, <gas:evil_nitrate>, <netherite:netheritescrap> * 4);
    }
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



{//bismuth
    mods.actuallyadditions.Empowerer.addRecipe(
        <contenttweaker:bismuth_ore> * 2, <chisel:diamond:6>, 
        <contenttweaker:gapo4>, <contenttweaker:fishy_capacitor>, <moretcon:ingotfusionite>, <thermalexpansion:florb>.withTag({Fluid: "ore_make"}), 
        10000, 20 * 4,
        [141 / 255.0, 5 / 255.0, 179 / 255.0]
    );
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
    scripts.ore_processing.addTingalumOvenRecipe([<thermalfoundation:material:136>], [<thermalfoundation:material:72>], 10240, 1);
}
{//chrome
    <ore:ingotChrome>.add(<contenttweaker:chrome_ingot>);
    <ore:dustChrome>.add(<contenttweaker:chrome_dust>);

    scripts.helper.addHighOvenSmelting(
        [<contenttweaker:chrome_ingot> * 2], 
        [<contenttweaker:chrome_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 2000], 20 * 20, 256
    );
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:chrome_ingot>], [<contenttweaker:chrome_dust>], 40960, 1);

    <densemetals:dense_chromium_ore>.displayName = "Dense Chrome Ore";
    mods.jei.JEI.addItem(<densemetals:dense_chromium_ore>);

}
{//neodymium
    <ore:ingotNeodymium>.add(<contenttweaker:neodymium_ingot>);
    <ore:dustNeodymium>.add(<contenttweaker:neodymium_dust>);


    /*scripts.helper.addHighOvenSmelting(
        [<contenttweaker:neodymium_ingot> * 2], 
        [<contenttweaker:neodymium_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 2000], 20 * 20, 256
    );*/
    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:neodymium_ingot>], [<contenttweaker:neodymium_dust>], 40960, 1, 990);

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
{//ironwood
    
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:liquidironwood> * (144 * 9), 
        <contenttweaker:stoneleaf>, <liquid:if.ore_fluid_fermented>.withTag({Ore: "oreIronwood"}) * 400, 
        10000
    );
    mods.thermalexpansion.Imbuer.addRecipe(
        <liquid:liquidironwood> * (144 * 9), 
        <contenttweaker:empowered_biospice>, <liquid:if.ore_fluid_fermented>.withTag({Ore: "oreIronwood"}) * 400, 
        10000
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
        [<draconicevolution:draconium_ingot>], 
        [<draconicevolution:draconium_dust> * 3, <prodigytech:inferno_crystal> * 4], 
        [<liquid:pyrotheum> * 3000], 20 * 20, 1024
    );
    /*scripts.helper.addFluidAlloyerRecipe(
        <draconicevolution:draconium_ingot>, 
        <draconicevolution:draconium_dust>, <prodigytech:inferno_crystal> * 2, <liquid:pyrotheum> * 2000, 
        4096, 100
    );*/

    scripts.ore_processing.addTingalumOvenRecipe([<draconicevolution:draconium_ingot>], [<draconicevolution:draconium_dust>], 40960, 1, 990);
}

{//orichalcum
    <ore:dustOrichalcum>.add(<contenttweaker:orichalcum_dust>);

    scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:orichalcum_ingot>], [<contenttweaker:orichalcum_dust>], 100 * 1000, 5, 1500);
}

//gravitite
mods.tconstruct.Melting.removeRecipe(<liquid:gravitite>, <netherendingores:ore_end_modded_2:6>);

//death metal
<ore:dustDeathMetal>.add(<contenttweaker:death_metal_dust>);
scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:death_metal_ingot>], [<contenttweaker:death_metal_dust>], 10 * 1000 * 1000, 10, 3000);

//kikeridan
<ore:dustKikeridan>.add(<contenttweaker:kikeridan_dust>);

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




//polonium
<ore:dustPolonium>.add(<contenttweaker:polonium_dust>);

//beryllium
<ore:dustBeryllium>.add(<contenttweaker:beryllium_dust>);

<ore:oreCaelumite>.add(<contenttweaker:caelumite_ore>);
<ore:dustCaelumite>.add(<contenttweaker:caelumite_dust>);