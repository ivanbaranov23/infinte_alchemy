import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.botania.ManaInfusion;

import mods.botania.RuneAltar;
//RuneAltar.addRecipe(IItemStack output, IIngredient[] input, int mana);

import mods.botania.PureDaisy;
//PureDaisy.addRecipe(IIngredient blockInput, IItemStack blockOutput, @Optional int time);

import mods.botania.ElvenTrade;
//ElvenTrade.addRecipe(IIngredient[] outputs, IIngredient[] input);

import mods.botania.Apothecary;

import mods.modularmachinery.RecipeBuilder;


function addManaHint(out as IItemStack, cat as IIngredient[], mana as int){

    scripts.jei.addJEIhint(
        [
            <botania:pool>.withDisplayName("" ~ (mana as float / 1000000.0) ~ " pools")
        ], [], cat, [out]
    );
}
val pool as int = 1000000;



{//floral fert
    recipes.remove(<botania:fertilizer>);
    recipes.addShapeless("ia_floral_fertilizer1", <botania:fertilizer> * 2, 
        [<prodigytech:meat_ground>, <prodigytech:meat_ground>, <roots:petals>, <minecraft:dye:15>, <roots:terra_moss>]
    );
    recipes.addShapeless("ia_floral_fertilizer2", <botania:fertilizer> * 4, 
        [<prodigytech:meat_ground>, <prodigytech:meat_ground>, <roots:petals>, <minecraft:dye:15>, <roots:terra_moss>, <contenttweaker:bamboo_dust>]
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<botania:fertilizer> * 16], [],
        [
            <roots:petals> * 2,
            <roots:terra_moss>, 
            <contenttweaker:bamboo_dust> * 3,
            <contenttweaker:enriched_biocoal>
        ],
        [
            <liquid:seed_oil> * 1000,
            <liquid:biofuel> * 500,
            <liquid:if.protein> * 500
        ], 20, 500
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [<botania:fertilizer> * 16], [],
        [
            <roots:petals> * 2,
            <roots:terra_moss>, 
            <contenttweaker:bamboo_dust> * 3,
            <contenttweaker:enriched_biocoal>
        ],
        [
            <liquid:tree_oil> * 1000,
            <liquid:biofuel> * 500,
            <liquid:if.protein> * 500
        ], 20, 500
    );
}


//ender air
mods.thermalexpansion.Transposer.addFillRecipe(
    <botania:manaresource:15>, 
    <minecraft:glass_bottle>, 
    <liquid:end_air> * 50, 1000
);


{//mana things
    recipes.addShaped("ia_manaclay_block_expensive", <contenttweaker:manaclay_block>, [
        [<ore:powderMana>, <contenttweaker:elemental_clay>], 
        [<contenttweaker:elemental_clay>, <ore:powderMana>], 
    ]);

    {//manabrick
        var rec = RecipeBuilder.newBuilder("manabrick", "tignalum_oven", 20);

        rec.addEnergyPerTickInput(1024);

        rec.addItemOutput(<contenttweaker:manabrick>);

        rec.addItemInput(<contenttweaker:manaclay>);
        
        
        //rec.addHotAirInput(250, 250, 1001);

        rec.build();
    }

    //mana pools
    recipes.remove(<botania:pool:2>);
    recipes.remove(<botania:pool>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:pool>, [
        [null, null, null, null, null], 
        [<ore:livingrock>, null, null, null, <ore:livingrock>], 
        [<ore:livingrock>, <ore:plateMithril>, <ore:plateMithril>, <ore:plateMithril>, <ore:livingrock>], 
        [<ore:livingrock>, <contenttweaker:manabrick_block>, <contenttweaker:manabrick_block>, <contenttweaker:manabrick_block>, <ore:livingrock>], 
        [<ore:livingrock>, <ore:livingrock>, <ore:livingrock>, <ore:livingrock>, <ore:livingrock>]
    ]);

    //mana powder
    ManaInfusion.removeRecipe(<botania:manaresource:23>);//500
    ManaInfusion.addInfusion(<botania:manaresource:23>, <contenttweaker:blood_runic_dust>, 5000);

    //mana steel
    ManaInfusion.removeRecipe(<botania:manaresource>); //3000
    ManaInfusion.removeRecipe(<botania:storage>); //27000
    ManaInfusion.removeRecipe(<moreplates:manasteel_plate>); //3000
    ManaInfusion.removeRecipe(<moreplates:manasteel_gear>); //3000
    ManaInfusion.addInfusion(<botania:manaresource>, <contenttweaker:mana_absorbing_ingot>, 7500);

    //mana diamond
    ManaInfusion.removeRecipe(<botania:manaresource:2>); //10000
    ManaInfusion.addInfusion(<botania:manaresource:2>, <enderio:item_material:16>, 150000);
    ManaInfusion.addInfusion(<botania:manaresource:2>, <enderio:item_material:18>, 15000);
    ManaInfusion.addInfusion(<botania:manaresource:2>, <contenttweaker:blood_gem>, 15000);

    //mana circuit
    ManaInfusion.addInfusion(<contenttweaker:mana_circuit>, <quantumflux:craftingpiece:5>, 30000);

    //managlass
    ManaInfusion.removeRecipe(<botania:managlass>);//150
    ManaInfusion.addInfusion(<botania:managlass>, <engineersdecor:panzerglass_block>, 1000);

    //mana cloth
    ManaInfusion.removeRecipe(<botania:manaresource:16>);//5000
    ManaInfusion.addInfusion(<botania:manaresource:16>, <contenttweaker:rune_string>, 4000);

    recipes.remove(<botania:manaresource:22>);
    recipes.addShaped("ia_mana_cloth", <botania:manaresource:22>, [
        [<botania:manaresource:16>, <contenttweaker:insulation_fabric>, <botania:manaresource:16>], 
        [<contenttweaker:glass_cloth>, <bloodmagic:component:8>, <contenttweaker:glass_cloth>], 
        [<botania:manaresource:16>, <contenttweaker:insulation_fabric>, <botania:manaresource:16>]
    ]);

    //mana pearl
    ManaInfusion.removeRecipe(<botania:manaresource:1>);//6000
    ManaInfusion.addInfusion(<botania:manaresource:1>, <projectred-expansion:infused_ender_pearl>, 10000);

    {//potato
        ManaInfusion.removeRecipe(<botania:tinypotato>);
        ManaInfusion.addInfusion(<botania:tinypotato>, <minecraft:potato>, 125);
        ManaInfusion.addInfusion(<botania_tweaks:compressed_tiny_potato_1>, <contenttweaker:potato_block1>, 125);
        ManaInfusion.addInfusion(<botania_tweaks:compressed_tiny_potato_2>, <contenttweaker:potato_block2>, 125 * 8);
        ManaInfusion.addInfusion(<botania_tweaks:compressed_tiny_potato_3>, <contenttweaker:potato_block3>, 125 * 64);
        ManaInfusion.addInfusion(<botania_tweaks:compressed_tiny_potato_4>, <contenttweaker:potato_block4>, 125 * 512);
        ManaInfusion.addInfusion(<botania_tweaks:compressed_tiny_potato_5>, <contenttweaker:potato_block5>, 125 * 4096);
    }

    //ManaInfusion.removeRecipe();
    /*
    ManaInfusion.addInfusion(<botania:manaresource:1>, <minecraft:ender_pearl>, 6000);
    ManaInfusion.addInfusion(<botania:storage:3>, <minecraft:diamond_block>, 90000);
    ManaInfusion.addInfusion(<botania:pistonrelay>, <minecraft:piston>, 15000);
    ManaInfusion.addInfusion(<botania:manacookie>, <minecraft:cookie>, 20000);
    ManaInfusion.addInfusion(<botania:grassseeds>, <minecraft:tallgrass:1>, 2500);
    ManaInfusion.addInfusion(<botania:grassseeds:1>, <minecraft:deadbush>, 2500);
    ManaInfusion.addInfusion(<botania:grassseeds:2>, <minecraft:red_mushroom>, 6500);
    ManaInfusion.addInfusion(<botania:grassseeds:2>, <minecraft:brown_mushroom>, 6500);
    ManaInfusion.addInfusion(<botania:quartz:1>, <minecraft:quartz>, 250);
    */

    {//alchemy
        ManaInfusion.addAlchemy(<taiga:tritonite_ingot>, <taiga:terrax_ingot>, 5000);
    }

    ManaInfusion.addInfusion(<contenttweaker:solid_mana>, <contenttweaker:alchemical_clay>, 250 * 1000);
}


recipes.remove(<botania:runealtar>);
mods.extendedcrafting.TableCrafting.addShaped(0, <botania:runealtar>, [
	[<bloodmagic:points_upgrade>, null, null, null, <bloodmagic:points_upgrade>], 
	[<contenttweaker:rune_base>, <botania:manaresource:2>, <botania:manaresource:2>, <botania:manaresource:2>, <contenttweaker:rune_base>], 
	[<botania:livingrock>, <contenttweaker:compact_empowerer>, <contenttweaker:slate_6>, <contenttweaker:compact_empowerer>, <botania:livingrock>], 
	[null, <contenttweaker:manabrick_block>, <contenttweaker:mana_frame>, <contenttweaker:manabrick_block>, null], 
	[null, <botania:livingrock>, <botania:pool>, <botania:livingrock>, null]
]);

{//flowers
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:revived_bush>, <minecraft:deadbush>, 
        <liquid:potion>.withTag({Potion: "extrautils2:xu2.second.chance"}) * 4000, 
        40000
    );

    recipes.remove(<botania:altar>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:altar>, [
        [<bloodmagic:blood_rune>, null, null, null, <bloodmagic:blood_rune>], 
        [<bloodmagic:blood_rune>, <contenttweaker:revived_bush>, <contenttweaker:revived_bush>, <contenttweaker:revived_bush>, <bloodmagic:blood_rune>], 
        [null, <bloodmagic:blood_rune>, <contenttweaker:manabrick_block>, <bloodmagic:blood_rune>, null], 
        [null, <bloodmagic:blood_rune>, <contenttweaker:manabrick_block>, <bloodmagic:blood_rune>, null], 
        [<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <bloodmagic:altar>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>]
    ]);


    Apothecary.removeRecipe("endoflame");
    Apothecary.addRecipe("endoflame", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator"}),
        <botania:petalblock:8>, <botania:petalblock:14>, <botania:petalblock:12>
    ]);

    Apothecary.removeRecipe("hydroangeas");
    Apothecary.addRecipe("hydroangeas", [
        <contenttweaker:revived_bush>,
        <cookingforblockheads:sink>,
        <botania:petalblock:9>, <botania:petalblock:9>
    ]);

    Apothecary.removeRecipe("thermalily");
    Apothecary.addRecipe("thermalily", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}),
        <botania:petalblock:14>, <botania:petalblock:1>, <botania:petalblock:1>, 
        <botania:rune:1>, <botania:rune:2>
    ]);

    //this flower is stupid
    Apothecary.removeRecipe("arcanerose");
    mods.jei.JEI.removeAndHide(<botania:specialflower>.withTag({type: "arcanerose"}));

    Apothecary.removeRecipe("entropinnyum");
    Apothecary.addRecipe("entropinnyum", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}),
        <botania:petalblock:14>, <xreliquary:mob_ingredient:8>, <xreliquary:mob_ingredient:8>, 
        <botania:rune:1>, <botania:rune:13>
    ]);

    Apothecary.removeRecipe("kekimurus");
    Apothecary.addRecipe("kekimurus", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}),
        <dimensionaledibles:end_cake>,
        <botania:petalblock:1>, <botania:petalblock:1>, 
        <botania:rune:10>
    ]);

    Apothecary.removeRecipe("gourmaryllis");
    Apothecary.addRecipe("gourmaryllis", [
        <contenttweaker:revived_bush>,
        <extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}),
        <harvestcraft:meatfeastpizzaitem>,
        <botania:petalblock:4>, <botania:petalblock:4>, 
        <botania:rune:5>, <botania:rune:1>
    ]);
    

    Apothecary.removeRecipe("agricarnation");
    Apothecary.addRecipe("agricarnation", [
        <contenttweaker:revived_bush>,
        <enderio:block_farm_station>,
        <xreliquary:fertile_lilypad>,
        <botania:overgrowthseed>,
        <botania:petalblock:5>, <botania:petalblock:5>, <botania:petalblock:5>,
        <botania:rune:4>
    ]);
    

    Apothecary.removeRecipe("manastar");
    Apothecary.addRecipe("manastar", [
        <contenttweaker:revived_bush>,
        <bloodmagic:demon_will_gauge>,
        <botania:petalblock:14>,
        <botania:petalblock:11>
    ]);
    
}
{//pure daisy
    Apothecary.removeRecipe("puredaisy");
    Apothecary.addRecipe("puredaisy", [
        <contenttweaker:revived_bush>,
        <tconstruct:soil:4>, <contenttweaker:soapart>, <mekanism:machineblock:9>,
        <botania:petalblock>, <botania:petalblock>, <botania:petalblock>
    ]);

    PureDaisy.removeRecipe(<botania:livingwood>);
    PureDaisy.addRecipe(<contenttweaker:revived_log>, <botania:livingwood>);

    PureDaisy.removeRecipe(<botania:livingrock>);
    PureDaisy.addRecipe(<engineersdecor:gas_concrete>, <botania:livingrock>);

    PureDaisy.addRecipe(<minecraft:sand:1>, <thermalfoundation:ore_fluid:5>);
    PureDaisy.addRecipe(<minecraft:diamond_ore>, <mysticalworld:amethyst_ore>);
    PureDaisy.addRecipe(<erebus:ore_copper>, <erebus:ore_jade>);
    PureDaisy.addRecipe(<quark:biome_brick:1>, <netherendingores:ore_other_1:10>);
    PureDaisy.addRecipe(<quark:biome_cobblestone:1>, <aether_legacy:icestone>);

    PureDaisy.addRecipe(<contenttweaker:living_steel_sheetmetal>, <contenttweaker:pure_sheetmetal>);
    PureDaisy.addRecipe(<contenttweaker:crystal_metal_block>, <contenttweaker:pure_metal>);
    PureDaisy.addRecipe(<contenttweaker:fluix_steel_block>, <contenttweaker:pure_cincinnasite>);

    PureDaisy.addRecipe(<minecraft:grass>, <biomesoplenty:grass:5>);
}
{//quartz
    ManaInfusion.removeRecipe(<botania:quartz:1>);
    ManaInfusion.addInfusion(<botania:quartz:1> * 2, <extendedcrafting:singularity_custom:26>, 5000);
    ManaInfusion.addInfusion(<botania:quartz:1> * 2, <extendedcrafting:singularity_custom:25>, 5000);

    recipes.remove(<botania:quartz>);
    ManaInfusion.addInfusion(<botania:quartz> * 2, <extendedcrafting:singularity_custom:27>, 5000);

    recipes.remove(<botania:quartz:6>);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <botania:quartz:6> * 2,
        <extendedcrafting:singularity_custom:25>, <liquid:sunnarium> * 10000,
        5000
    );

    recipes.remove(<botania:quartz:2>);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <botania:quartz:2> * 2,
        <extendedcrafting:singularity_custom:25>, <liquid:super_heat_lava> * 500,
        5000
    );

    ElvenTrade.removeRecipe(<botania:quartz:5>);
    ElvenTrade.addRecipe([<botania:quartz:5>], [<botania:quartz:1>, <botania:manaresource:18>, <botania:manaresource:18>]);

    recipes.remove(<botania:quartz:4>);
    mods.enderio.AlloySmelter.addRecipe(<botania:quartz:4> * 4, [
        <moretcon:hydrogenrichredstonepowder>,
        <extendedcrafting:singularity_custom:26> * 2,
        <contenttweaker:delicate_topaz> * 24
    ], 100 * 1000 * 1000);
}

recipes.addShaped("ia_opencrate", <botania:opencrate>, [
	[<erebus:planks_petrified_wood>, <erebus:materials:7>, <erebus:planks_petrified_wood>], 
	[<erebus:materials:7>, <actuallyadditions:block_dropper>, <erebus:materials:7>], 
	[<erebus:planks_petrified_wood>, null, <erebus:planks_petrified_wood>]
]);

{
    mods.industrialforegoing.Extractor.add(<contenttweaker:revived_log>, <liquid:premana_juice>);
    mods.industrialforegoing.Extractor.add(<botania:livingwood>, <liquid:premana_juice> * 2);
    mods.industrialforegoing.Extractor.add(<contenttweaker:revived_log>, <liquid:premana_juice>);
}



//runes


{//block of rune
    /*recipes.addShaped("ia_botania_block_rune_water", <contenttweaker:rune_water_block>, [
        [<botania:rune>, <botania:rune>, <botania:rune>], 
        [<botania:rune>, <bloodmagic:ritual_stone:1>, <botania:rune>], 
        [<botania:rune>, <botania:rune>, <botania:rune>]
    ]);
    recipes.addShaped("ia_botania_block_rune_fire", <contenttweaker:rune_fire_block>, [
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>], 
        [<botania:rune:1>, <bloodmagic:ritual_stone:2>, <botania:rune:1>], 
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>]
    ]);
    recipes.addShaped("ia_botania_block_rune_earth", <contenttweaker:rune_earth_block>, [
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>], 
        [<botania:rune:2>, <bloodmagic:ritual_stone:3>, <botania:rune:2>], 
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>]
    ]);
    recipes.addShaped("ia_botania_block_rune_air", <contenttweaker:rune_air_block>, [
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>], 
        [<botania:rune:3>, <bloodmagic:ritual_stone:4>, <botania:rune:3>], 
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>]
    ]);*/


    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_water_block>, [
        [<botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>], 
        [<botania:rune>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune>], 
        [<botania:rune>, <contenttweaker:chitin>, <bloodmagic:ritual_stone:1>, <contenttweaker:chitin>, <botania:rune>], 
        [<botania:rune>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune>], 
        [<botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_fire_block>, [
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>], 
        [<botania:rune:1>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune:1>], 
        [<botania:rune:1>, <contenttweaker:chitin>, <bloodmagic:ritual_stone:2>, <contenttweaker:chitin>, <botania:rune:1>], 
        [<botania:rune:1>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune:1>], 
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_earth_block>, [
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>], 
        [<botania:rune:2>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune:2>], 
        [<botania:rune:2>, <contenttweaker:chitin>, <bloodmagic:ritual_stone:3>, <contenttweaker:chitin>, <botania:rune:2>], 
        [<botania:rune:2>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune:2>], 
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_air_block>, [
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>], 
        [<botania:rune:3>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune:3>], 
        [<botania:rune:3>, <contenttweaker:chitin>, <bloodmagic:ritual_stone:4>, <contenttweaker:chitin>, <botania:rune:3>], 
        [<botania:rune:3>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitin>, <contenttweaker:orichalconite_gear>, <botania:rune:3>], 
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>]
    ]);

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_water_block> * 3, [
        [<botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>], 
        [<botania:rune>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune>], 
        [<botania:rune>, <contenttweaker:chitigic>, <bloodmagic:ritual_stone:1>, <contenttweaker:chitigic>, <botania:rune>], 
        [<botania:rune>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune>], 
        [<botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>, <botania:rune>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_fire_block> * 3, [
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>], 
        [<botania:rune:1>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune:1>], 
        [<botania:rune:1>, <contenttweaker:chitigic>, <bloodmagic:ritual_stone:2>, <contenttweaker:chitigic>, <botania:rune:1>], 
        [<botania:rune:1>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune:1>], 
        [<botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>, <botania:rune:1>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_earth_block> * 3, [
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>], 
        [<botania:rune:2>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune:2>], 
        [<botania:rune:2>, <contenttweaker:chitigic>, <bloodmagic:ritual_stone:3>, <contenttweaker:chitigic>, <botania:rune:2>], 
        [<botania:rune:2>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune:2>], 
        [<botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>, <botania:rune:2>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_air_block> * 3, [
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>], 
        [<botania:rune:3>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune:3>], 
        [<botania:rune:3>, <contenttweaker:chitigic>, <bloodmagic:ritual_stone:4>, <contenttweaker:chitigic>, <botania:rune:3>], 
        [<botania:rune:3>, <contenttweaker:orichalconite_gear>, <contenttweaker:chitigic>, <contenttweaker:orichalconite_gear>, <botania:rune:3>], 
        [<botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>, <botania:rune:3>]
    ]);
}

{//spark
    recipes.remove(<botania:spark>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:spark> * 2, [
        [null, null, <botania:manaresource:16>, <taiga:vibranium_block>, <botania:manaresource:16>, null, null], 
        [null, <taiga:vibranium_block>, <fluxnetworks:fluxcore>, <botania:spreader>, <fluxnetworks:fluxcore>, <taiga:vibranium_block>, null], 
        [<botania:manaresource:16>, <fluxnetworks:fluxcore>, <contenttweaker:mana_focus>, <fluxnetworks:fluxcore>, <contenttweaker:mana_focus>, <fluxnetworks:fluxcore>, <botania:manaresource:16>], 
        [<taiga:vibranium_block>, <botania:spreader>, <fluxnetworks:fluxcore>, <botania:rune:3>, <fluxnetworks:fluxcore>, <botania:spreader>, <taiga:vibranium_block>], 
        [<botania:manaresource:16>, <fluxnetworks:fluxcore>, <contenttweaker:mana_focus>, <fluxnetworks:fluxcore>, <contenttweaker:mana_focus>, <fluxnetworks:fluxcore>, <botania:manaresource:16>], 
        [null, <taiga:vibranium_block>, <fluxnetworks:fluxcore>, <botania:spreader>, <fluxnetworks:fluxcore>, <taiga:vibranium_block>, null], 
        [null, null, <botania:manaresource:16>, <taiga:vibranium_block>, <botania:manaresource:16>, null, null]
    ]);
}

{//elven trade
    //elementum
    ElvenTrade.removeRecipe(<botania:manaresource:7>);
    ElvenTrade.removeRecipe(<moreplates:elementium_plate>);
    ElvenTrade.removeRecipe(<moreplates:elementium_gear>);
    ElvenTrade.removeRecipe(<botania:storage:2>);
    ElvenTrade.addRecipe(
        [<botania:manaresource:7> * 6],
        [<botania:storage>, <contenttweaker:terrabit>, <contenttweaker:terrabit>, <contenttweaker:elemental_clay>, <botania:rune:3>]
    );

    //glass
    ElvenTrade.removeRecipe(<botania:elfglass>);
    ElvenTrade.addRecipe(
        [<botania:elfglass>],
        [<botania:managlass>, <botania:managlass>, <contenttweaker:terra_base>, <industrialforegoing:laser_lens:14>]
    );

    //gem
    ElvenTrade.removeRecipe(<botania:manaresource:9>);
    ElvenTrade.addRecipe(
        [<botania:manaresource:9>],
        [<botania:manaresource:2>, <botania:manaresource:2>, <draconicevolution:dragon_heart>, <extendedcrafting:singularity_custom:67>]
    );
}

{//gaia
    
    recipes.remove(<botania:pylon:2>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:pylon:2>, [
        [null, null, <botania:manaresource:8>, <botania:manaresource:8>, <botania:manaresource:8>, null, null], 
        [null, <botania:manaresource:8>, <botania:manaresource:8>, <contenttweaker:elf_mana_circuit>, <botania:manaresource:8>, <botania:manaresource:8>, null], 
        [null, <botania:manaresource:8>, <contenttweaker:death_metal_gear>, <contenttweaker:evil_core>, <contenttweaker:death_metal_gear>, <botania:manaresource:8>, null], 
        [null, <botania:manaresource:8>, <bloodmagic:demon_pylon>, <botania:pylon:1>, <bloodmagic:demon_pylon>, <botania:manaresource:8>, null], 
        [<moreplates:elementium_plate>, <moreplates:elementium_plate>, <contenttweaker:death_metal_gear>, <contenttweaker:mana_frame>, <contenttweaker:death_metal_gear>, <moreplates:elementium_plate>, <moreplates:elementium_plate>], 
        [<moreplates:elementium_plate>, <moreplates:elementium_plate>, <contenttweaker:gearbox_great>, <contenttweaker:mana_frame>, <contenttweaker:gearbox_great>, <moreplates:elementium_plate>, <moreplates:elementium_plate>], 
        [null, <simplyjetpacks:metaitemmods:11>, <simplyjetpacks:metaitemmods:11>, <contenttweaker:elf_mana_circuit>, <simplyjetpacks:metaitemmods:11>, <simplyjetpacks:metaitemmods:11>, null]
    ]);


    //why here and not in metalworks?
    //todo move
    recipes.remove(<botania:manaresource:14>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:manaresource:14>, [
        [null, null, null, <contenttweaker:mekanical_core>, <contenttweaker:mekanical_core>, <contenttweaker:mekanical_core>, <contenttweaker:mekanical_core>], 
        [null, null, <contenttweaker:mekanical_core>, <botania:manaresource:5>, <contenttweaker:terragem>, <contenttweaker:mirion2_gear>, <contenttweaker:mekanical_core>], 
        [null, <contenttweaker:mekanical_core>, <contenttweaker:terragem>, <botania:rune:10>, <botania:rune:12>, <contenttweaker:terragem>, <contenttweaker:mekanical_core>], 
        [<contenttweaker:mekanical_core>, <botania:manaresource:5>, <botania:rune:13>, <botania:rune:9>, <botania:rune:11>, <botania:manaresource:5>, <contenttweaker:mekanical_core>], 
        [<contenttweaker:mekanical_core>, <contenttweaker:terragem>, <botania:rune:15>, <botania:rune:14>, <contenttweaker:terragem>, <contenttweaker:mekanical_core>, null], 
        [<contenttweaker:mekanical_core>,<contenttweaker:mirion2_gear>, <contenttweaker:terragem>, <botania:manaresource:5>, <contenttweaker:mekanical_core>, null, null], 
        [<contenttweaker:mekanical_core>, <contenttweaker:mekanical_core>, <contenttweaker:mekanical_core>, <contenttweaker:mekanical_core>, null, null, null]
    ]);

    RuneAltar.addRecipe(<botania:manaresource:5> * 2, [
        <botania:manaresource:5>,
        <botania:quartz:1>,
        <botania:manaresource:4>,
        <contenttweaker:gem_steel_ingot> 
    ], 3 * pool);
    RuneAltar.addRecipe(<botania:manaresource:5> * 2, [
        <botania:manaresource:5>,
        <botania:quartz:1>,
        <botania:manaresource:4>,
        <contenttweaker:wormholium>
    ], 3 * pool);
    addManaHint(<botania:manaresource:5>, [<botania:pool>], 3 * pool);
}


{//gate
    recipes.remove(<botania:livingwood:5>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:livingwood:5>, [
        [<botania:livingwood>, <botania:livingwood>, <botania:livingwood>, <botania:livingwood>, <botania:livingwood>], 
        [<botania:livingwood>, <mekanism:basicblock:7>, <mekanism:basicblock:7>, <mekanism:basicblock:7>, <botania:livingwood>], 
        [<botania:livingwood>, <bloodmagic:component:17>, <mekanism:basicblock:7>, <bloodmagic:component:17>, <botania:livingwood>], 
        [<botania:livingwood>, <contenttweaker:dim_stable_plate1>, <mekanism:machineblock:11>, <contenttweaker:dim_stable_plate1>, <botania:livingwood>], 
        [<botania:livingwood>, <botania:livingwood>, <botania:livingwood>, <botania:livingwood>, <botania:livingwood>]
    ]);
    recipes.remove(<botania:pylon:1>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:pylon:1>, [
        [null, <botania:livingwood>, null, <botania:livingwood>, null], 
        [null, <enderio:block_tele_pad>, <bloodmagic:component:17>, <enderio:block_tele_pad>, null], 
        [<botania:livingwood>, <enderio:block_tele_pad>, <botania:pylon>, <enderio:block_tele_pad>, <botania:livingwood>], 
        [<botania:livingwood>, <enderio:block_tele_pad>, <contenttweaker:mana_frame>, <enderio:block_tele_pad>, <botania:livingwood>], 
        [<botania:livingwood>, <enderio:block_tele_pad>, <botania:livingwood:5>, <enderio:block_tele_pad>, <botania:livingwood>]
    ]);
    recipes.remove(<botania:alfheimportal>);
    mods.extendedcrafting.TableCrafting.addShaped(0, <botania:alfheimportal>, [
        [<botania:livingwood>, <botania:livingwood>, <botania:livingwood>, <botania:livingwood>, <botania:livingwood>], 
        [<contenttweaker:dim_stable_plate1>, <contenttweaker:elemental_essence>, <contenttweaker:rune_mana_chip>, <contenttweaker:elemental_essence>, <contenttweaker:dim_stable_plate1>], 
        [<contenttweaker:dim_stable_plate1>, <contenttweaker:rune_mana_chip>, <contenttweaker:mana_frame>, <contenttweaker:rune_mana_chip>, <contenttweaker:dim_stable_plate1>], 
        [<contenttweaker:dim_stable_plate1>, <contenttweaker:elemental_essence>, <contenttweaker:rune_mana_chip>, <contenttweaker:elemental_essence>, <contenttweaker:dim_stable_plate1>], 
        [<botania:livingwood>, <botania:livingwood:5>, <botania:livingwood:5>, <botania:livingwood:5>, <botania:livingwood>]
    ]);
}

mods.extendedcrafting.CombinationCrafting.addRecipe(
    <contenttweaker:mana_star>, 4096 * 200, 4096, <contenttweaker:glass_star>, 
    [
        <bloodmagic:demon_extras:11>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>,

        <bloodmagic:demon_extras:12>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>,

        <bloodmagic:demon_extras:13>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>,

        <bloodmagic:demon_extras:14>,
        <botania:manaresource:9>,
        <botania:rune:8>,
        <botania:manaresource:9>
    ]
);


recipes.addShaped("ia_overgrowthseed", <botania:overgrowthseed>, [
	[<contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>], 
	[<contenttweaker:fertilizer7>, <contenttweaker:chlorasteel_gear>, <contenttweaker:fertilizer7>], 
	[<contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>, <contenttweaker:fertilizer7>]
]);
scripts.jei.addJEIhint(
    [<minecraft:grass>], [], 
    [<botania:overgrowthseed>], 
    [<botania:enchantedsoil>.withDisplayName("Increases work speed/mana generated for botania flowers")]
);