
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mod.mekanism.gas.IGasStack;

import mods.mekanism.chemical.washer;
import mods.mekanism.chemical.crystallizer;

import mods.mekanism.enrichment;
import mods.mekanism.purification;
import mods.mekanism.chemical.injection;
import mods.mekanism.chemical.dissolution;
import mods.mekanism.crusher;

import mods.mekanism.MekanismHelper;


function addMekOreFix(ores as IItemStack[], gas as IGasStack, shard as IItemStack, clump as IItemStack){
    for item in ores{
        dissolution.addRecipe(item, gas * 1000);

        injection.addRecipe(item, <gas:hydrogenchloride>,   shard * 4);
        purification.addRecipe(item, <gas:oxygen>,          clump * 3);
    }
}
function addMekOreNew(
    gas as IGasStack, gasclean as IGasStack, 
    crystal as IItemStack, shard as IItemStack, clump as IItemStack, dirtydust as IItemStack,
    dust as IItemStack
){
    washer.addRecipe(gas, gasclean);
    crystallizer.addRecipe(gasclean * 200, crystal);
    injection.addRecipe(crystal, <gas:hydrogenchloride>, shard);
    purification.addRecipe(shard, <gas:oxygen>, clump);
    crusher.addRecipe(clump, dirtydust);
    enrichment.addRecipe(dirtydust, dust);
}


{//t1
    //iron
    //copper
    //tin

    //nickel
    addMekOreFix([<thermalfoundation:ore:5>, <exnihilocreatio:item_ore_nickel:1>], <gas:nickel>, <mekores:mekanismore:11>, <mekores:mekanismore:12>);
    //zinc
    //aluminum
    addMekOreFix([<thermalfoundation:ore:4>, <exnihilocreatio:item_ore_aluminum:1>, <erebus:ore_aluminium>], <gas:aluminum>, <mekores:mekanismore:31>, <mekores:mekanismore:32>);

    //cobalt
    //ardite

    addMekOreFix([<contenttweaker:karmesine_chunk>], <gas:karmesine>, <mekores:mekanismore:271>, <mekores:mekanismore:272>);
    addMekOreFix([<contenttweaker:ovium_chunk>], <gas:ovium>, <mekores:mekanismore:276>, <mekores:mekanismore:277>);
    addMekOreFix([<contenttweaker:jauxum_chunk>], <gas:jauxum>, <mekores:mekanismore:281>, <mekores:mekanismore:282>);
    
}
{//t2
    //gold
    //silver
    //osmium
    //lead

    //osram
    addMekOreFix([<contenttweaker:osram_chunk>], <gas:osram>, <mekores:mekanismore:291>, <mekores:mekanismore:292>);
    //eezo
    addMekOreFix([<contenttweaker:eezo_chunk>], <gas:eezo>, <mekores:mekanismore:296>, <mekores:mekanismore:297>);
    //dilitheum
    addMekOreNew(<gas:dilithium>, <gas:cleandilithium>, 
        <taiga:dilithium_crystal>, <mekores:mekanismore:126>, <mekores:mekanismore:127>, <mekores:mekanismore:128>,
        <taiga:dilithium_dust>
    );
    addMekOreFix([<taiga:dilithium_ore>, <netherendingores:ore_nether_modded_1:14>], <gas:dilithium>, <taiga:dilithium_crystal>, <mekores:mekanismore:126>);
    
}
{//t3
    //platinum
    addMekOreFix(
        [<thermalfoundation:ore:6>, <exnihilocreatio:item_ore_platinum:1>], <gas:platinum>, <mekores:mekanismore:16>, <mekores:mekanismore:17>
    );
    //iridium
    addMekOreFix([<thermalfoundation:ore:7>, <exnihilocreatio:item_ore_iridium:1>], <gas:iridium>, <mekores:mekanismore:21>, <mekores:mekanismore:22>);
    //titanium -> ore proc
    //tungsten
    //uranium
    addMekOreFix(
        [<immersiveengineering:ore:5>, <contenttweaker:uranium_chunk>], <gas:uranium>, <mekores:mekanismore:1>, <mekores:mekanismore:2>
    );
    //yellorite
    addMekOreFix(
        [<bigreactors:oreyellorite>, <exnihilocreatio:item_ore_yellorium:1>], <gas:yellorium>, <mekores:mekanismore:6>, <mekores:mekanismore:7>
    );
}
{//t4
    //mithril
    addMekOreFix(
        [<thermalfoundation:ore:8>, <exnihilocreatio:item_ore_mithril:1>], <gas:mithril>, <mekores:mekanismore:26>, <mekores:mekanismore:27>
    );
    //chrome
    addMekOreNew(
        <gas:chrome>, <gas:cleanchrome>, 
        <contenttweaker:chrome_crystal>, <contenttweaker:chrome_shard>, <contenttweaker:chrome_cluster>, <contenttweaker:chrome_dirty_dust>, 
        <contenttweaker:chrome_dust>
    );
    addMekOreFix(
        [<contenttweaker:chrome_ore>, <contenttweaker:chrome_chunk>], 
        <gas:chrome>, <contenttweaker:chrome_shard>, <contenttweaker:chrome_cluster>
    );

    //gallium
    addMekOreNew(
        <gas:gallium>, <gas:cleangallium>, 
        <contenttweaker:gallium_crystal>, <contenttweaker:gallium_shard>, <contenttweaker:gallium_clump>, <contenttweaker:gallium_dirty_dust>, 
        <contenttweaker:gallium_dust>
    );
    addMekOreFix(
        [<contenttweaker:gallium_ore>, <contenttweaker:gallium_chunk>], 
        <gas:gallium>, <contenttweaker:gallium_shard>, <contenttweaker:gallium_clump>
    );

    //neodymium
    addMekOreNew(
        <gas:neodymium>, <gas:cleanneodymium>, 
        <contenttweaker:neodymium_crystal>, <contenttweaker:neodymium_shard>, <contenttweaker:neodymium_cluster>, <contenttweaker:neodymium_dirty_dust>, 
        <contenttweaker:neodymium_dust>
    );
    addMekOreFix(
        [<contenttweaker:neodymium_ore>, <contenttweaker:neodymium_chunk>], 
        <gas:neodymium>, <contenttweaker:neodymium_shard>, <contenttweaker:neodymium_cluster>
    );

    //vibranium
    addMekOreFix([<contenttweaker:vibranium_chunk>], <gas:vibranium>, <mekores:mekanismore:266>, <mekores:mekanismore:267>);

    //arkenium
    addMekOreNew(
        <gas:arkenium>, <gas:cleanarkenium>, 
        <contenttweaker:arkenium_crystal>, <contenttweaker:arkenium_shard>, <contenttweaker:arkenium_cluster>, <contenttweaker:arkenium_dirty_dust>, 
        <contenttweaker:arkenium_dust>
    );
    addMekOreFix(
        [<netherendingores:ore_other_1:9>, <contenttweaker:arkenium_chunk>], 
        <gas:arkenium>, <contenttweaker:arkenium_shard>, <contenttweaker:arkenium_cluster>
    );

    //draconium
    addMekOreFix(
        [<draconicevolution:draconium_ore>, <exnihilocreatio:item_ore_draconium:1>], <gas:draconium>, <mekores:mekanismore:51>, <mekores:mekanismore:52>
    );

    //abyssum
    addMekOreFix(
        [<contenttweaker:abyssum_chunk>],
        <gas:abyssum>, <mekores:mekanismore:301>, <mekores:mekanismore:302>
    );

    //orichlcum
    addMekOreNew(
        <gas:orichalcum>, <gas:cleanorichalcum>, 
        <contenttweaker:orichalcum_crystal>, <contenttweaker:orichalcum_shard>, <contenttweaker:orichalcum_clump>, <contenttweaker:orichalcum_dirty_dust>, 
        <contenttweaker:orichalcum_dust>
    );
    addMekOreFix(
        [<contenttweaker:orichalcum_ore>, <contenttweaker:orichalcum_chunk>], 
        <gas:orichalcum>, <contenttweaker:orichalcum_shard>, <contenttweaker:orichalcum_clump>
    );
}
{//t5
    //zirconium
    addMekOreNew(
        <gas:zirconium>, <gas:cleanzirconium>, 
        <contenttweaker:zirconium_crystal>, <contenttweaker:zirconium_shard>, <contenttweaker:zirconium_clump>, <contenttweaker:zirconium_dirty_dust>, 
        <contenttweaker:zirconium_dust>
    );
    addMekOreFix(
        [<contenttweaker:zirconium_ore>, <contenttweaker:zirconium_chunk>], 
        <gas:zirconium>, <contenttweaker:zirconium_shard>, <contenttweaker:zirconium_clump>
    );

    addMekOreNew(
        <gas:death_metal>, <gas:cleandeath_metal>, 
        <contenttweaker:death_metal_crystal>, <contenttweaker:death_metal_shard>, <contenttweaker:death_metal_clump>, <contenttweaker:death_metal_dirty_dust>, 
        <contenttweaker:death_metal_dust>
    );
    addMekOreFix(
        [<contenttweaker:death_metal_ore>, <contenttweaker:death_metal_chunk>], 
        <gas:death_metal>, <contenttweaker:death_metal_shard>, <contenttweaker:death_metal_clump>
    );
}

/*
<ore:shardNickel>
<ore:clumpNickel>
<ore:dustDirtyNickel>

<gas:uranium>
<gas:yellorium> 

<gas:platinum>

<gas:mithril>

<gas:cobalt>
<gas:ardite>
<gas:astral_starmetal> 
<gas:draconium> 

<gas:beryllium> 
<gas:boron>
<gas:magnesium> 
<gas:thorium>

<gas:zirconium> 

<gas:titanium>

<gas:tungsten>
<gas:zinc>

<gas:mercury>

<gas:palladium> 
<gas:dilithium> 
<gas:adamantine>  

<gas:manganese> 

<gas:orichalcum>  

<gas:prometheum>  

<gas:sanguinite>  

<gas:tiberium>
<gas:aurorium>
<gas:duranite>
<gas:valyrium>
<gas:vibranium> 
<gas:karmesine> 
<gas:ovium>
<gas:jauxum>
<gas:uru> 
<gas:osram>
<gas:eezo>
<gas:abyssum>

<gas:vanadium>


*/