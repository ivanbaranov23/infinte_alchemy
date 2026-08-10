#priority 1000
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

<ore:listAllseed>.addItems([
    <actuallyadditions:item_rice_seed>,
    <actuallyadditions:item_canola_seed>,
    <actuallyadditions:item_flax_seed>,
    <actuallyadditions:item_coffee_seed>,
    <atum:flax_seeds>,
    <atum:emmer_seeds>,
    <erebus:cabbage_seeds>,
    <erebus:materials:32>,
    <immersiveengineering:seed>,
    <harvestcraft:sunflowerseedsitem>,
    <harvestcraft:sesameseedsitem>,
    <roots:moonglow_seed>,
    <roots:spirit_herb_seed>,
    <roots:wildewheet_seed>
]);

//<ore:blockGlass>.removeItems(<ore:blockGlass>.items);
//<ore:blockGlass>.add(<minecraft:glass>);

<ore:blockGlass>.remove(<tconstruct:clear_glass>);
<ore:blockGlass>.removeItems(<tconstruct:clear_stained_glass:*>.items);

//<ore:blockCharcoal>.add(<additionalcompression:charcoal_compressed>);
recipes.addShaped("ia_charcoal_compress", <additionalcompression:charcoal_compressed:1>, [
    [<ore:blockCharcoal>, <ore:blockCharcoal>, <ore:blockCharcoal>],
    [<ore:blockCharcoal>, <ore:blockCharcoal>, <ore:blockCharcoal>],
    [<ore:blockCharcoal>, <ore:blockCharcoal>, <ore:blockCharcoal>]
]);

<ore:blockMagnetable>.removeItems(<ore:blockMagnetable>.items);


{//ores
    for oredic in <ore:oreNether*>{
        oredic.removeItems(oredic.items);
    }
    for oredic in <ore:oreEnd*>{
        oredic.removeItems(oredic.items);
    }


    //vanilla
    <ore:oreGold>.removeItems([<atum:gold_ore>, <erebus:ore_gold>, <exnihilocreatio:item_ore_gold:1>]);
    <ore:oreIron>.removeItems([<atum:iron_ore>, <erebus:ore_iron>, <exnihilocreatio:item_ore_iron:1>]);
    <ore:oreCoal>.removeItems([<atum:coal_ore>, <erebus:ore_coal>]);
    <ore:oreLapis>.removeItems([<atum:lapis_ore>, <erebus:ore_lapis>]);
    <ore:oreDiamond>.removeItems([<atum:diamond_ore>, <erebus:ore_diamond>, <erebus:ore_encrusted_diamond>]);
    <ore:oreRedstone>.removeItems([<atum:redstone_ore>]);
    <ore:oreEmerald>.removeItems([<atum:emerald_ore>, <erebus:ore_emerald>]);
    
    //quartz
    <ore:oreCertusQuartz>.remove(<appliedenergistics2:charged_quartz_ore>);

    //t1
    <ore:oreCopper>.removeItems([<erebus:ore_copper>, <exnihilocreatio:item_ore_copper:1>, <immersiveengineering:ore>, <mekanism:oreblock:1>, <mysticalworld:copper_ore>]);
    <ore:oreTin>.removeItems([<erebus:ore_tin>, <exnihilocreatio:item_ore_tin:1>, <mekanism:oreblock:2>]);

    <ore:oreNickel>.removeItems([<immersiveengineering:ore:4>, <exnihilocreatio:item_ore_nickel:1>]);
    <ore:oreAluminum>.removeItems([<erebus:ore_aluminium>, <exnihilocreatio:item_ore_aluminum:1>, <immersiveengineering:ore:1>]);

    <ore:oreZinc>.remove(<exnihilocreatio:item_ore_zinc:1>);
    <ore:oreZinc>.add(<contenttweaker:zinc_ore>);
    <ore:dustZinc>.add(<contenttweaker:zinc_dust>);
    <ore:ingotZinc>.add(<contenttweaker:zinc_ingot>);

    <ore:oreStibnite>.add(<contenttweaker:antimony_ore>);
    <ore:dustStibnite>.add(<contenttweaker:stibnite>);

    //t2
    <ore:oreSilver>.removeItems([<erebus:ore_silver>, <exnihilocreatio:item_ore_silver:1>, <immersiveengineering:ore:3>, <mysticalworld:silver_ore>]);
    <ore:oreOsmium>.remove(<exnihilocreatio:item_ore_osmium:1>);
    <ore:oreLead>.removeItems([<erebus:ore_lead>, <exnihilocreatio:item_ore_lead:1>, <immersiveengineering:ore:2>]);

    //t3
    <ore:orePlatinum>.remove(<exnihilocreatio:item_ore_platinum:1>);
    <ore:oreIridium>.remove(<exnihilocreatio:item_ore_iridium:1>);
    <ore:oreTungsten>.add(<contenttweaker:tungsten_ore>);

    <ore:oreTitanium>.remove(<exnihilocreatio:item_ore_titanium:1>);
    <ore:oreTitanium>.add(<contenttweaker:titanium_ore>);

    <ore:oreBismuth>.add(<contenttweaker:bismuth_ore>);

    //t4
    <ore:oreChrome>.add(<contenttweaker:chrome_ore>);
    <ore:oreRhodium>.add(<contenttweaker:rhodium_ore>);
    <ore:oreNeodymium>.add(<contenttweaker:neodymium_ore>);
    <ore:oreArkenium>.remove(<moretcon:orearkenium>);
    <ore:oreMolybdenum>.add(<contenttweaker:molybdenum_ore>);
    <ore:oreArsenic>.add(<contenttweaker:arsenic_ore>);

    <ore:oreDraconium>.removeItems([<draconicevolution:draconium_ore:1>, <draconicevolution:draconium_ore:2>, <exnihilocreatio:item_ore_draconium:1>]);

    //t5
    <ore:oreOrichalcum>.add(<contenttweaker:orichalcum_ore>);
    <ore:oreAstralStarmetal>.add(<contenttweaker:starmetal_ore>);
    <ore:oreAstralStarmetal>.remove(<astralsorcery:blockcustomore:1>);

    <ore:oreGermanium>.add(<contenttweaker:germanium_ore>);

    //dusts
    <ore:oreElectrotine>.add(<contenttweaker:electrotine_ore>);

    <ore:oreQuartz>.removeItems([<erebus:ore_petrified_quartz>, <erebus:ore_quartz>, <netherendingores:ore_other_1>, <mysticalworld:granite_quartz_ore>, <minecraft:quartz_ore>, <netherendingores:ore_other_1:1>]);

    <ore:oreIGraphite>.add(<quantumflux:graphiteore>);

    //nether
    <ore:oreCobalt>.removeItems([<tconstruct:ore>, <exnihilocreatio:item_ore_cobalt:1>, <netherendingores:ore_other_1:5>]);
    <ore:oreArdite>.removeItems([<tconstruct:ore:1>, <exnihilocreatio:item_ore_ardite:1>, <netherendingores:ore_other_1:3>]);
    <ore:oreNetherite>.add(<netherite:ancientdebris>);

    <ore:oreHellCoal>.add(<netherendingores:ore_nether_vanilla>);
    <ore:oreHellRedstone>.add(<netherendingores:ore_nether_vanilla:6>);

    <ore:oreHellRuby>.add(<netherendingores:ore_nether_modded_2:1>);

    <ore:oreHellZanite>.add(<netherendingores:ore_nether_modded_2:7>);


    //twilight
    <ore:oreTrollsteinn>.add(<twilightforest:trollsteinn>);
    <ore:dustTrollsteinn>.add(<contenttweaker:trollsteinn>);

    //aether
    <ore:oreAmbrosium>.remove(<aether_legacy:ambrosium_ore>);
    <ore:oreHellAmbrosium>.add(<netherendingores:ore_nether_modded_2:5>);

    //end
    <ore:oreTheendUranium>.add(<netherendingores:ore_end_modded_1:12>);
    <ore:oreTheendCoal>.add(<netherendingores:ore_end_vanilla>);
    <ore:oreTheendRedstone>.add(<netherendingores:ore_end_vanilla:6>);
    <ore:oreTheendEmerald>.add(<netherendingores:ore_end_vanilla:2>);
    <ore:oreTheendPeridot>.add(<netherendingores:ore_end_modded_2:3>);
    <ore:oreTheendElectrotine>.add(<netherendingores:ore_end_modded_2:4>);

    {//chunks
        //t1
        <ore:oreChunkIron>.add(<exnihilocreatio:item_ore_iron:1>);
        <ore:oreChunkCopper>.add(<exnihilocreatio:item_ore_copper:1>);
        <ore:oreChunkTin>.add(<exnihilocreatio:item_ore_tin:1>);
        
        <ore:oreChunkNickel>.add(<exnihilocreatio:item_ore_nickel:1>);
        <ore:oreChunkZinc>.add(<exnihilocreatio:item_ore_zinc:1>);
        <ore:oreChunkAluminum>.add(<exnihilocreatio:item_ore_aluminum:1>);

        
        <ore:oreChunkKarmesine>.add(<contenttweaker:karmesine_chunk>);
        <ore:oreChunkOvium>.add(<contenttweaker:ovium_chunk>);
        <ore:oreChunkJauxum>.add(<contenttweaker:jauxum_chunk>);
        
        //t2
        <ore:oreChunkGold>.add(<exnihilocreatio:item_ore_gold:1>);
        <ore:oreChunkSilver>.add(<exnihilocreatio:item_ore_silver:1>);
        <ore:oreChunkLead>.add(<exnihilocreatio:item_ore_lead:1>);
        <ore:oreChunkOsmium>.add(<exnihilocreatio:item_ore_osmium:1>);
        
        <ore:oreChunkCobalt>.add(<exnihilocreatio:item_ore_cobalt:1>);
        <ore:oreChunkArdite>.add(<exnihilocreatio:item_ore_ardite:1>);
        
        //t3
        <ore:oreChunkPlatinum>.add(<exnihilocreatio:item_ore_platinum:1>);
        <ore:oreChunkIridium>.add(<exnihilocreatio:item_ore_iridium:1>);
        <ore:oreChunkUranium>.add(<contenttweaker:uranium_chunk>);
        <ore:oreChunkYellorium>.add(<exnihilocreatio:item_ore_yellorium:1>);
        <ore:oreChunkTitanium>.add(<exnihilocreatio:item_ore_titanium:1>);
        <ore:oreChunkTungsten>.add(<exnihilocreatio:item_ore_tungsten:1>);
        
        <ore:oreChunkGallium>.add(<contenttweaker:gallium_chunk>);
        <ore:oreChunkArkenium>.add(<contenttweaker:arkenium_chunk>);
        <ore:oreChunkEezo>.add(<contenttweaker:eezo_chunk>);
        <ore:oreChunkOsram>.add(<contenttweaker:osram_chunk>);
        <ore:oreChunkPrometheum>.add(<contenttweaker:prometheum_chunk>);
        <ore:oreChunkCursedgold>.add(<contenttweaker:cursed_gold_chunk>);
        <ore:oreChunkBismuth>.add(<contenttweaker:bismuth_chunk>);

        //t4
        <ore:oreChunkChrome>.add(<contenttweaker:chrome_chunk>);
        <ore:oreChunkRhodium>.add(<contenttweaker:rhodium_chunk>);
        <ore:oreChunkMithril>.add(<exnihilocreatio:item_ore_mithril:1>);
        <ore:oreChunkNeodymium>.add(<contenttweaker:neodymium_chunk>);
        <ore:oreChunkVibranium>.add(<contenttweaker:vibranium_chunk>);
        <ore:oreChunkArsenic>.add(<contenttweaker:arsenic_chunk>);
        <ore:oreChunkTantalum>.add(<contenttweaker:tantalum_chunk>);
        
        //t5
        <ore:oreChunkPalladium>.add(<contenttweaker:palladium_chunk>);
        <ore:oreChunkDraconium>.add(<exnihilocreatio:item_ore_draconium:1>);
        <ore:oreChunkUru>.add(<contenttweaker:uru_chunk>);
        <ore:oreChunkAbyssum>.add(<contenttweaker:abyssum_chunk>);
        <ore:oreChunkGermanium>.add(<contenttweaker:germanium_chunk>);
        <ore:oreChunkNiobium>.add(<contenttweaker:niobium_chunk>);
        <ore:oreChunkBeryllium>.add(<contenttweaker:beryllium_chunk>);

        //t6
        <ore:oreChunkOrichalcum>.add(<contenttweaker:orichalcum_chunk>);
        <ore:oreChunkZirconium>.add(<contenttweaker:zirconium_chunk>);
    }

    {//dense
        <ore:denseOreIron>.add(<densemetals:dense_iron_ore>);
        <ore:denseOreCopper>.add(<densemetals:dense_copper_ore>);
        <ore:denseOreTin>.add(<densemetals:dense_tin_ore>);
        <ore:denseOreNickel>.add(<densemetals:dense_nickel_ore>);
        <ore:denseOreAluminum>.add(<densemetals:dense_aluminum_ore>);
        <ore:denseOreZinc>.add(<densemetals:dense_zinc_ore>);

        <ore:denseOreGold>.add(<densemetals:dense_gold_ore>);
        <ore:denseOreSilver>.add(<densemetals:dense_silver_ore>);
        <ore:denseOreLead>.add(<densemetals:dense_lead_ore>);

        <ore:denseOreRedstone>.add(<densemetals:dense_redstone_ore>);
        <ore:denseOreElectrotine>.add(<contenttweaker:electrotine_ore_dense>);

        <ore:denseOreEmerald>.add(<densemetals:dense_emerald_ore>);


        <ore:denseOreHellLead>.add(<densemetals:dense_nether_lead_ore>);
    }

    //other
    <ore:sandIron>.add(<contenttweaker:iron_sand>);

    <ore:oreOxideNickel>.add(<immersiveengineering:ore:4>);

    <ore:oreFlolit>.add(<contenttweaker:flolit_ore>);

    <ore:oreStoneleaf>.add(<contenttweaker:stoneleaf_ore>);

    <ore:oreBarite>.add(<contenttweaker:barite_ore>);
    <ore:oreStrontium>.add(<contenttweaker:strontium_chunk>);
    <ore:oreTantalum>.add(<contenttweaker:tantalite_ore>);
    <ore:oreTN>.add(<contenttweaker:tantalum_ore>);
    <ore:dustTN>.add(<contenttweaker:tantalum_ore_dust>);

    <ore:oreLifeEssence>.add(<contenttweaker:life_essence_ore>);
    <ore:oreVitriumTerrasteel>.add(<contenttweaker:terrasteel_ore>);

    <ore:oreSpaceSilver>.add(<contenttweaker:argyrodite_ore>);
    <ore:oreSpaceLead>.add(<contenttweaker:rhodplumsite_space_ore>);

    <ore:oreMoissanite>.add(<contenttweaker:moissanite_ore>);
    <ore:oreXenotime>.add(<contenttweaker:xenotime_ore>);

    <ore:oreBeryllium>.add(<contenttweaker:beryllium_ore>);

    <ore:oreOverworldGalena>.add(<immersiveengineering:ore:2>);
}

//slime


//valkyrie
<ore:dustValkyrieMetal>.remove(<moretcon:dustvalkyriemetal>);
<ore:dustValkyrie>.add(<moretcon:dustvalkyriemetal>);



<ore:dustBarite>.add(<contenttweaker:barite_dust>);


//alchemistry
<ore:dustGermanium>.add(<contenttweaker:germanium_dust>);
<ore:dustVanadium>.add(<contenttweaker:vanadium_dust>);
<ore:dustRubidium>.add(<contenttweaker:rubidium_dust>);
<ore:dustMolybdenum>.add(<contenttweaker:molybdenum_dust>);
<ore:dustRhodium>.add(<contenttweaker:rhodium_dust>);
<ore:dustCesium>.add(<contenttweaker:cesium_dust>);
<ore:dustNiobium>.add(<contenttweaker:niobium_dust>);
<ore:dustCadmium>.add(<contenttweaker:cadmium>);
<ore:dustAntimony>.add(<contenttweaker:antimony_dust>);
<ore:dustScandium>.add(<contenttweaker:scandium_dust>);

<ore:dustBismuth>.add(<contenttweaker:bismuth_dust>);
<ore:ingotBismuth>.add(<contenttweaker:bismuth_ingot>);

<ore:dustBarium>.add(<contenttweaker:barium_dust>);
<ore:dustStrontium>.add(<contenttweaker:strontium_dust>);

<ore:dustTantalum>.add(<contenttweaker:tantalum_dust>);