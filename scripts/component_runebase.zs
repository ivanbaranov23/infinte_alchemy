import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;


scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:rune_string> * 2, <contenttweaker:methyst_dust> * 3], null, 
        [   
            <bloodmagic:soul_snare> * 4,
            <contenttweaker:luck_particle> * 4,
            <contenttweaker:blood_runic_dust> * 12,
            <contenttweaker:methyst> * 3
        ], [<liquid:sentient_metal> * (144 * 8), <liquid:mana_juice> * 200], <contenttweaker:flesh_support>, 20, 100000
);
scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:rune_boule_core> * 4, <contenttweaker:methyst_dust> * 4], null, 
        [   
            <contenttweaker:rune_string> * 12,
            <contenttweaker:tablet_evil>,
            <contenttweaker:flesh_rod> * 8,
            <enderio:item_material:68> * 20,
            <contenttweaker:neuro_crystal2> * 5,
            <contenttweaker:methyst> * 4
        ], [<liquid:sentient_metal> * (144 * 8), <liquid:mana_juice> * 1000], <contenttweaker:flesh_support>, 200, 100000
);

mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:rune_boule>, [
        [null, null, <bloodmagic:demon_extras:10>, <contenttweaker:pure_cincinnasite>, <contenttweaker:pure_cincinnasite>], 
        [null, <bloodmagic:demon_extras:14>, <botania:manaresource:1>, <botania:manaresource:22>, <contenttweaker:pure_cincinnasite>], 
        [<bloodmagic:demon_extras:10>, <botania:manaresource:1>, <contenttweaker:rune_boule_core>, <botania:manaresource:1>, <bloodmagic:demon_extras:10>], 
        [<contenttweaker:pure_cincinnasite>, <botania:manaresource:22>, <botania:manaresource:1>, <bloodmagic:demon_extras:14>, null], 
        [<contenttweaker:pure_cincinnasite>, <contenttweaker:pure_cincinnasite>, <bloodmagic:demon_extras:10>, null, null]
]);


function addRuneCutting(outs as IItemStack[], inps as IItemStack[], bonus as IItemStack[]){
    scripts.content_machines.addBioAssemblerRecipe(
        outs, null,
        inps, [<liquid:ultrapure_water> * 1000], <contenttweaker:pressure_cutter>, 
        100, 120000
    );

    {//kikoku
        var rec = RecipeBuilder.newBuilder(outs[0].displayName ~ "_kikoku", "rune_cutter", 20 * 15);

		rec.addEnergyPerTickInput(2048 * 1000);

        for output in outs
    		rec.addItemOutput(output);
        for output in bonus
    		rec.addItemOutput(output).setChance(0.5);
		
	
    	for input in inps
            rec.addItemInput(input);

		rec.addFluidInput(<liquid:ultrapure_water> * 750);
        rec.addItemInput(<extrautils2:lawsword:*>).setChance(0.02);

		rec.build();
    }
    {//kikoku 2
        var rec = RecipeBuilder.newBuilder(outs[0].displayName ~ "_kikoku2", "rune_cutter", 20 * 10);

		rec.addEnergyPerTickInput(10240 * 1000);

        for output in outs
    		rec.addItemOutput(output);
        for output in bonus
    		rec.addItemOutput(output).setChance(0.75);
		
	
    	for input in inps
            rec.addItemInput(input);

		rec.addFluidInput(<liquid:starlight_lubricant> * 750);
        rec.addItemInput(<extrautils2:lawsword:*>).setChance(0.01);

		rec.build();
    }
    {//sotc
        var rec = RecipeBuilder.newBuilder(outs[0].displayName ~ "_inf", "rune_cutter", 20);

		rec.addEnergyPerTickInput(125 * 1000 * 1000);

        for output in outs
    		rec.addItemOutput(output);
        for output in bonus
    		rec.addItemOutput(output);
		
	
    	for input in inps
            rec.addItemInput(input);

		rec.addFluidInput(<liquid:starlight_lubricant> * 250);
        rec.addItemInput(<avaritia:infinity_sword>).setChance(0.0);

		rec.build();
    }
}

{//rune base
    {//t1
        scripts.content_machines.addAdvancedMixerRecipe(
                [<contenttweaker:rune_boule1>], [],
                [
                    <bloodmagic:slate:4> * 2,
                    <bloodmagic:component:5> | <bloodmagic:component:8> | <contenttweaker:reagent_bug> * 5,
                    <contenttweaker:luck_particle> * 4,
                    <contenttweaker:rune_boule>
                ], [
                    <liquid:mana_juice> * 1000,
                    <liquid:livingrock> * (144 * 4),
                    <liquid:draconium> * 216,
                    <liquid:biotite> * 1000
                ],
                20, 20000
        );
        scripts.content_machines.addAdvancedMixerRecipe(
                [<contenttweaker:rune_boule1>], [],
                [
                    <bloodmagic:slate:4> * 2,
                    <bloodmagic:component:5> | <bloodmagic:component:8> | <contenttweaker:reagent_bug> * 5,
                    <contenttweaker:chitin>,
                    <contenttweaker:rune_boule>
                ], [
                    <liquid:mana_juice> * 1500,
                    <liquid:livingrock> * (144 * 6),
                    <liquid:draconium> * 288,
                    <liquid:biotite> * 1000
                ],
                20, 20000
        );
        scripts.content_machines.addAdvancedMixerRecipe(
                [<contenttweaker:rune_boule1>], [],
                [
                    <bloodmagic:slate:4> * 4,
                    <bloodmagic:component:5> | <bloodmagic:component:8> | <contenttweaker:reagent_bug> * 5,
                    <contenttweaker:entwood_dust> * 12,
                    <contenttweaker:rune_boule>
                ], [
                    <liquid:mana_juice> * 1000,
                    <liquid:livingrock> * (144 * 6),
                    <liquid:draconium> * 288,
                    <liquid:biotite> * 1000
                ],
                20, 20000
        );
    }    

    {//t2
        scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:rune_boule2>], [<liquid:radioactive_waste> * 750],
            [
                <contenttweaker:rune_boule1>,
                <contenttweaker:slate_steel_coil>,
                <contenttweaker:slate_6>,
                <contenttweaker:solid_mana>
            ], [
                <liquid:rune_acid> * 1500,
                <liquid:gem_steel> * 864,
                <liquid:plutonium> * 864
            ], 20, 10000
        );
        scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:rune_boule2>], [<liquid:radioactive_waste> * 750],
            [
                <contenttweaker:rune_boule1>,
                <contenttweaker:slate_steel_coil>,
                <contenttweaker:slate_6>,
                <contenttweaker:solid_mana>
            ], [
                <liquid:rune_acid> * 1500,
                <liquid:gem_steel> * 864,
                <liquid:blutonium> * 864
            ], 20, 10000
        );
        scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:rune_boule2>], [],
            [
                <contenttweaker:rune_boule1>,
                <contenttweaker:slate_steel_coil>,
                <contenttweaker:slate_6>,
                <contenttweaker:solid_mana>
            ], [
                <liquid:rune_acid> * 1500,
                <liquid:gem_steel> * 864,
                <liquid:dense_hydrogen> * 750
            ], 20, 10000
        );
    }

    {//t3
        scripts.content_machines.addAdvancedMixerRecipe(
            [<contenttweaker:rune_boule3>], [<liquid:radioactive_waste> * 750],
            [
                <contenttweaker:rune_boule2>,
                <contenttweaker:chitigicum>
            ], [
                <liquid:rune_acid> *1000,
                <liquid:gem_steel> * 864,
                <liquid:blutonium> * 864
            ], 20, 10000
        );

    }
}
{//cutting
    addRuneCutting([<contenttweaker:rune_base> * 6, <contenttweaker:reinforced_cell>], [
        <contenttweaker:rune_boule1>,
        <contenttweaker:rock_cell>,
        <contenttweaker:ev_coil> * 8,
        <contenttweaker:mana_circuit> * 2,
        <bigreactors:mineralanglesite> * 3
    ], [<contenttweaker:rune_base> * 4]);
    addRuneCutting([<contenttweaker:improved_rune_base> * 6, <contenttweaker:methyst_dirty_dust> * 3], [
        <contenttweaker:rune_boule2>,
        <contenttweaker:orichalconite_plate> * 8,
        <contenttweaker:tartaric_dust> * 2,
        <contenttweaker:rune_base> * 2,
        <contenttweaker:methyst> * 3
    ], [<contenttweaker:improved_rune_base> * 4]);
}





scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:advanced_rune_base> * 2], [],
        [
            <contenttweaker:elemental_essence>,
            <contenttweaker:improved_rune_base> * 3,
            <contenttweaker:super_vibrant_plate> * 12,
            <contenttweaker:gem_steel_gear>
        ], [
            <liquid:rune_acid> * 1000,
            <liquid:mana> * 1000,
            <liquid:terrasteel> * 288,
            <liquid:stellar_alloy> * 288
        ],
        20, 20000
);


//<enderio:item_basic_capacitor:3>.withTag({eiocap: {"enderio:block_farm_station/bonus_size": 3.902588 as float, level: 2.940074 as float, "enderio:block_alloy_smelter/use": 3.3542356 as float, "enderio:block_painter/use": 3.7467136 as float}, "enderio:capname": "Premium Planting Premium Hiding Enhanced Smelting Wonder Capacitor", display: {Name: "Unremarkable Capacitor"}, "enderio:capno": 7, "enderio:glinted": 1})