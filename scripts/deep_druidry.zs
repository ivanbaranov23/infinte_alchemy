import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;


import mods.modularmachinery.RecipeBuilder;

mods.alchemistry.Evaporator.addRecipe(
    <contenttweaker:roving>, <liquid:roving_milk> * 1000
);

recipes.addShapeless("ia_druidic_dust1", <contenttweaker:druidic_dust>, [
    <contenttweaker:wildwood_pulp>,
    <contenttweaker:roving>,
    <roots:runic_dust>, <roots:runic_dust>
]);
recipes.addShapeless("ia_druidic_dust2", <contenttweaker:druidic_dust> * 2, [
    <contenttweaker:wildwood_pulp>,
    <contenttweaker:roving>,
    <roots:runic_dust>, <roots:baffle_cap_mushroom>
]);
recipes.addShapeless("ia_druidic_dust3", <contenttweaker:druidic_dust> * 4, [
    <contenttweaker:wildwood_pulp>,
    <contenttweaker:roving>,
    <roots:runic_dust>, <roots:baffle_cap_mushroom>, <contenttweaker:forest_clay> | <caves_n_cliffs:amethyst_cluster_single>
]);
recipes.addShapeless("ia_druidic_dust4", <contenttweaker:druidic_dust> * 6, [
    <contenttweaker:wildwood_pulp>,
    <contenttweaker:roving>,
    <roots:runic_dust>, <roots:baffle_cap_mushroom>, <contenttweaker:enmaned_biomass>
]);


recipes.addShapeless("ia_druidic_dust5", <contenttweaker:druidic_dust> * 12, [
    <contenttweaker:wildwood_pulp>,
    <contenttweaker:roving>,
    <roots:runic_dust>, <roots:baffle_cap_mushroom>, <contenttweaker:enmaned_biomass>, <contenttweaker:forest_clay> | <caves_n_cliffs:amethyst_cluster_single>
]);




{//druid circle
    {//transmut gel in circle
        var gel_recs as WeightedItemStack[][][int] = {
            1: [
                [
                    <contenttweaker:singularity_dust> * 4 % 23,
                    <prodigytech:primordium> * 40,
                    <contenttweaker:elastic_clay> * 4 % 47
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 23,
                    <prodigytech:primordium> * 36,
                    <erebus:materials:7> * 4 % 80,
                    <contenttweaker:ancient_dust>
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 23,
                    <prodigytech:primordium> * 36,
                    <twilightforest:borer_essence> * 4,
                    <erebus:materials:57> * 4
                ]
            ],
            2: [
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 40,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <darkutils:material> * 4
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 32,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <mekanism:substrate> * 12,
                    <primitivemobs:spider_egg>,
                    <mod_lavacow:mimic_claw>
                ],
            ],
            3: [
                [
                    <contenttweaker:singularity_dust> * 4 % 39,
                    <prodigytech:primordium> * 32,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <mowziesmobs:foliaath_seed>,
                    <betternether:eye_seed>,
                    <thermalfoundation:material:832> * 12,
                    <tconevo:material:1> * 3
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 39,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <extrautils2:redorchid>,
                    <quark:soul_bead> * 3,
                    <deepmoblearning:living_matter_overworldian> * 24
                ],
            ],
            4: [
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <deepmoblearning:living_matter_overworldian> * 24,
                    <contenttweaker:mushroomite_ingot> * 12,
                    <aether_legacy:healing_stone> * 4,
                    <atum:fertile_soil_pile> * 8,
                    <thermalfoundation:geode> * 4
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <deepmoblearning:living_matter_overworldian> * 24,
                    <contenttweaker:mushroomite_ingot> * 12,
                    <aether_legacy:healing_stone> * 4,
                    <atum:fertile_soil_pile> * 8,
                    <contenttweaker:luck_particle> * 4
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <deepmoblearning:living_matter_overworldian> * 24,
                    <contenttweaker:mushroomite_ingot> * 12,
                    <aether_legacy:healing_stone> * 4,
                    <atum:fertile_soil_pile> * 8,
                    <contenttweaker:entwood_dust>
                ],
            ]
        };

        var counter as int = 0;
        {
            var rec = RecipeBuilder.newBuilder("transmut_gel" ~ counter, "druid_circle", 120);
            counter += 1;

            rec.addEnergyPerTickInput(256);


            rec.addItemOutput(<contenttweaker:transmut_gel> * 4);

            rec.addItemInput(<contenttweaker:singularity_dust> * 4).setChance(0.08 * 4.999);
            rec.addItemInput(<thermalfoundation:material:1028> * 8).setChance(0.08 * 8.999);
            rec.addItemInput(<prodigytech:primordium> * 12);
            rec.addItemInput(<quark:soul_bead>);
            rec.addItemInput(<atum:fertile_soil_pile> * 12);

            rec.addFluidInput(<liquid:pereskia_soup> * 250);
                
            rec.build();
        }
        
    }

    {//fluid_conversions
        var fluid_conversions as ILiquidStack[ILiquidStack][int[]] = {
            //transmut, fluid in, fluid out
            [1, 144 * 16, 144 * 20]: {
                <liquid:copper>: <liquid:iron>,
                <liquid:iron>: <liquid:tin>,
                <liquid:tin>: <liquid:copper>,

                <liquid:aluminum>: <liquid:zinc>,
                <liquid:zinc>: <liquid:nickel>,
                <liquid:nickel>: <liquid:aluminum>,

                <liquid:ardite>: <liquid:cobalt>,
                <liquid:cobalt>: <liquid:ardite>,

                <liquid:silver>: <liquid:gold>,
                <liquid:gold>: <liquid:lead>,
                <liquid:lead>: <liquid:osmium>,
                <liquid:osmium>: <liquid:silver>,
                
                <liquid:karmesine_fluid>: <liquid:ovium_fluid>,
                <liquid:ovium_fluid>: <liquid:jauxum_fluid>,
                <liquid:jauxum_fluid>: <liquid:karmesine_fluid>
            }
        };

        for amounts,recs in fluid_conversions{
            for f_in,f_out in recs{
                var rec = RecipeBuilder.newBuilder("fluid_conversions" ~ f_in.name ~ "_" ~ f_out.name, "druid_circle", 80);

                rec.addEnergyPerTickInput(128);


                rec.addItemInput(<contenttweaker:transmut_gel> * amounts[0]);
                rec.addItemInput(<contenttweaker:singularity_dust> * 4);
                rec.setChance(0.08 * 2.999);
                rec.addItemInput(<contenttweaker:druidic_dust>);
                rec.setChance(0.08 * 5.999);

                rec.addItemInput(<contenttweaker:soot> * 12);

                rec.addFluidInput(f_in * amounts[1]);
                rec.addFluidOutput(f_out * amounts[2]);
                
                rec.build();
            }
        }
    }


    {//druid_soup
        var rec = RecipeBuilder.newBuilder("druid_soup", "druid_circle", 120);

        rec.addEnergyPerTickInput(25600);


        

        rec.addItemInput(<contenttweaker:transmut_gel> * 4).setChance(0.08 * 5.999);
        rec.addItemInput(<thermalfoundation:material:1028> * 8).setChance(0.08 * 8.999);
        rec.addItemInput(<contenttweaker:druidic_dust> * 12);
        rec.addItemInput(<contenttweaker:gelatin> * 12);

        rec.addFluidInput(<liquid:pereskia_soup> * 1000);
        rec.addFluidOutput(<liquid:druid_soup> * 1000);
                
        rec.build();
    }

    {//druid_soup
        var rec = RecipeBuilder.newBuilder("enchanter", "druid_circle", 120);

        rec.addEnergyPerTickInput(25600);

        rec.addItemInput(<contenttweaker:transmut_gel> * 4).setChance(0.08 * 5.999);
        rec.addItemInput(<thermalfoundation:material:1028> * 8).setChance(0.08 * 8.999);
        rec.addItemInput(<thermalexpansion:machine:13>);
        rec.addItemInput(<mekanism:basicblock:8>);

        rec.addItemOutput(<enderio:block_enchanter>);
        rec.addFluidInput(<liquid:druid_soup> * 2000);
                
        rec.build();
    }
}

recipes.addShapeless("ia_inversion_dust", <contenttweaker:inversion_dust>, [
    <moretcon:gemgarstone>, 
    <contenttweaker:transmut_gel>, <betternether:cincinnasite_block>, <mekanism:saltblock>,
    <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>
]);
recipes.addShapeless("ia_inversion_dust2", <contenttweaker:inversion_dust> * 2, [
    <moretcon:gemgarstone>, 
    <contenttweaker:transmut_gel>, <betternether:cincinnasite_block>, <contenttweaker:supersalt>,
    <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>
]);
recipes.addShapeless("ia_inversion_dust3", <contenttweaker:inversion_dust> * 6, [
    <moretcon:gemgarstone>, 
    <contenttweaker:transmut_gel>, <betternether:cincinnasite_block>, <contenttweaker:supersalt>,
    <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>,
    <alchemistry:element:67>
]);


{//druid_soup
    var rec = RecipeBuilder.newBuilder("lightwell", "druid_circle", 120);

    rec.addEnergyPerTickInput(25600);


        

    rec.addItemInput(<actuallyadditions:block_misc:9>);
    rec.addItemInput(<astralsorcery:itemcraftingcomponent> * 3);
    rec.addItemInput(<contenttweaker:starmetal_plate> * 2);
    rec.addItemInput(<astralsorcery:blockmarble> * 10);
    rec.addItemInput(<astralsorcery:blockmarble:6> * 3);

    rec.addItemOutput(<astralsorcery:blockwell>);
                
    rec.build();
}

scripts.content_machines.addFluidAlloyerRecipe(
    <contenttweaker:ice_bone>, 
    <contenttweaker:druid_bone>, <contenttweaker:druidic_dust> * 4, <liquid:astralsorcery.liquidstarlight> * 2000, 
    20, 1000
);
scripts.content_machines.addFluidAlloyerRecipe(
    <contenttweaker:ice_bone>, 
    <contenttweaker:tar_bone> * 4, <contenttweaker:druidic_dust> * 4, <liquid:astralsorcery.liquidstarlight> * 2000, 
    20, 1000
);

{//fey steel
    mods.roots.Fey.addRecipe("fey_steel", <contenttweaker:fey_ingot> * 2, [
        <moretcon:gemenderal>, <contenttweaker:flower_steel_ingot>, <botania:manaresource:8>, <alchemistry:ingot:32>, <contenttweaker:transmut_gel>
    ]);

    {
        var rec = RecipeBuilder.newBuilder("fey_steel", "druid_circle", 20);
        rec.addEnergyPerTickInput(25600);

        rec.addItemInputs(<moretcon:gemenderal>, <contenttweaker:flower_steel_ingot>, <botania:manaresource:8>, <alchemistry:ingot:32>, <contenttweaker:transmut_gel>);

        rec.addItemOutput(<contenttweaker:fey_ingot> * 2);
                    
        rec.build();
    }
}
