import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.alchemistry.Evaporator;
import mods.alchemistry.Combiner;
import mods.alchemistry.Dissolver;

import mods.alchemistry.Atomizer;
import mods.alchemistry.Liquifier;

import scripts.content_machines.addChemicalRecipe;

//todo fix everything
//metal 144 mb = 1 ing = 16 el
//fluid 1000 mb = 8 el



function addFluidConv(item as IItemStack, fluid as ILiquidStack, readd as bool = false){
    if (readd){
        Atomizer.removeRecipe(fluid);
        Liquifier.removeRecipe(item);
    }

    Atomizer.addRecipe(item * 8, fluid * 1000);
    Liquifier.addRecipe(fluid * 1000, item * 8);
}

{//Na
    Dissolver.addRecipe(<contenttweaker:naoh>, false, 1,
        [
            [1, <alchemistry:compound:201> * 8]
        ]
    );

    //<contenttweaker:naots>.addTooltip("NaOTs");
}
{//N
    addFluidConv(<alchemistry:compound:209>, <liquid:ammonia>);
    addFluidConv(<alchemistry:compound:212>, <liquid:nitric_acid>);
    
}

{//chlorosulfonic
    addFluidConv(<contenttweaker:chlorosulfonic>, <liquid:chlorosulfonic>);
    <contenttweaker:chlorosulfonic>.addTooltip("ClSO₃H");

    mods.mekanism.reaction.addRecipe(
        <bloodmagic:slate:3>, <liquid:liquidsulfurtrioxide> * 2000, <gas:hydrogenchloride> * 2000, 
        null, <gas:chlorosulfonic> * 25, 50000, 5
    );
}

addFluidConv(<alchemistry:compound:205>, <liquid:liquidethene>);
addFluidConv(<alchemistry:compound:214>, <liquid:formic_acid>);
addFluidConv(<alchemistry:compound:213>, <liquid:formaldehyde>);

{//phenol
    Atomizer.addRecipe(<contenttweaker:ethylbenzene> * 8, <liquid:ethylbenzene> * 1000);
    <contenttweaker:ethylbenzene>.addTooltip("Ph-Et");

    addChemicalRecipe(
        [<contenttweaker:benzene>, <alchemistry:compound:35>],
        [<contenttweaker:ethylbenzene>, <alchemistry:element:1> * 2],
        [<contenttweaker:zeolite> | <alchemistry:compound:46> | <alchemistry:element:78>]
    );
    <contenttweaker:benzene>.addTooltip("C₆H₆");
    <contenttweaker:benzene>.addTooltip("PhH");

    addChemicalRecipe(
        [<contenttweaker:chlorobenzene>, <alchemistry:compound:203>],
        [<contenttweaker:benzene>, <alchemistry:element:17> * 2],
        [<alchemistry:compound:204>]
    );
    <contenttweaker:chlorobenzene>.addTooltip("PhCl");

    addChemicalRecipe(
        [<contenttweaker:pph3>, <alchemistry:compound:6> * 6],
        [<contenttweaker:chlorobenzene> * 3, <alchemistry:compound:1206>, <alchemistry:element:11> * 6],
        []
    );
    <contenttweaker:pph3>.addTooltip("PPh₃");

    addChemicalRecipe(
        [<contenttweaker:benzaldehyde>, <alchemistry:compound:209>],
        [<contenttweaker:benzene>, <alchemistry:compound:207>, <alchemistry:compound:7>],
        [<alchemistry:compound:208>, <alchemistry:compound:203>]
    );
    <contenttweaker:benzaldehyde>.addTooltip("PhCHO");

    addChemicalRecipe(
        [<contenttweaker:phchn>, <contenttweaker:naots>, <alchemistry:compound:7>],
        [<contenttweaker:benzaldehyde>, <contenttweaker:nh2nhts>, <alchemistry:compound:201>],
        []
    );
    <contenttweaker:phchn>.addTooltip("PhCHN₂");

    
}
{//toluene
    Dissolver.addRecipe(<deepmoblearning:pristine_matter_creeper>, false, 1,
        [
            [10, <contenttweaker:toluene>]
        ]
    );
    <contenttweaker:toluene>.addTooltip("C₆H₅-CH₃");
    <contenttweaker:toluene>.addTooltip("Ph-Me");

    addChemicalRecipe(
        [<contenttweaker:tosyl_chloride>, <alchemistry:compound:211>],
        [<contenttweaker:toluene>, <contenttweaker:chlorosulfonic>],
        []
    );
    <contenttweaker:tosyl_chloride>.addTooltip("TsCl");

    addChemicalRecipe(
        [<contenttweaker:nh2nhts>, <alchemistry:compound:203>],
        [<contenttweaker:tosyl_chloride>, <alchemistry:compound:210>],
        [<alchemistry:compound:201>]
    );
    <contenttweaker:nh2nhts>.addTooltip("NH₂NHTs");

    addChemicalRecipe(
        [<contenttweaker:naots>, <alchemistry:compound:6>, <alchemistry:compound:7>],
        [<contenttweaker:tosyl_chloride>, <alchemistry:compound:201> * 2],
        []
    );
    <contenttweaker:naots>.addTooltip("NaOTs");
}
{//xylene
    Dissolver.addRecipe(<contenttweaker:reagent_oil> * 4, false, 2,
        [
            [75, <contenttweaker:benzene>],
            [75, <contenttweaker:toluene>],
            [75, <contenttweaker:xylene>]
        ]
    );
    addChemicalRecipe(
        [<contenttweaker:benzene>, <contenttweaker:xylene>],
        [<contenttweaker:toluene> * 2],
        [<contenttweaker:zeolite>]
    );
}
{//₀₁₂₃₄₅₆₇₈₉
    addChemicalRecipe(
        [<contenttweaker:mesitylene>, <contenttweaker:toluene>],
        [<contenttweaker:xylene> * 2],
        [<contenttweaker:zeolite>]
    );
    <contenttweaker:mesitylene>.addTooltip("C₆H₃Me₃");
    <contenttweaker:mesitylene>.addTooltip("HMes");
    
}
{//cyclopent
    addChemicalRecipe(
        [<contenttweaker:pentadiene>, <alchemistry:compound:503> % 50],
        [<alchemistry:compound:38>, <alchemistry:compound:503>],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:pentadiene>, <alchemistry:compound:504> % 50],
        [<alchemistry:compound:38>, <alchemistry:compound:504>],
        []
    );
    <contenttweaker:pentadiene>.addTooltip("C₅H₈");

    addChemicalRecipe(
        [<contenttweaker:cyclopentadiene>, <alchemistry:compound:46> % 50],
        [<contenttweaker:pentadiene>, <alchemistry:compound:46>],
        [<extendedcrafting:singularity_custom:30> | <extendedcrafting:singularity:34>]
    );
    <contenttweaker:cyclopentadiene>.addTooltip("C₅H₆");

    recipes.addShaped("ia_dcpd", <contenttweaker:dicyclopentadiene>, [
        [<alchemistry:element:37>, <contenttweaker:superglue>, <alchemistry:element:37>],
        [<contenttweaker:cyclopentadiene>, <contenttweaker:rune_water_block>, <contenttweaker:cyclopentadiene>],
        [<alchemistry:element:37>, <contenttweaker:superglue>, <alchemistry:element:37>]
    ]);
}
{//cyclohexane
    addChemicalRecipe(
        [<contenttweaker:cyclohexane>],
        [<contenttweaker:benzene>, <alchemistry:element:1> * 6],
        [<extendedcrafting:singularity:34> | <extendedcrafting:singularity:25>]
    );
    addChemicalRecipe(
        [<contenttweaker:cyclohexane>],
        [<contenttweaker:cyclohexene>, <alchemistry:element:1> * 2],
        [<extendedcrafting:singularity_custom:30>]
    );

    addChemicalRecipe(
        [<contenttweaker:cyclohexene>],
        [<contenttweaker:benzene>, <alchemistry:element:1> * 2],
        [<extendedcrafting:singularity_custom:30>]
    );

    addChemicalRecipe(
        [<contenttweaker:pcy3>, <alchemistry:compound:501>],
        [<contenttweaker:cyclohexyl_bromide>, <alchemistry:element:12>, <alchemistry:compound:1206>],
        []
    );
}
{//H2IMes
    addChemicalRecipe(
        [<contenttweaker:mesitylamine>, <alchemistry:compound:7>],
        [<contenttweaker:mesitylene>, <alchemistry:compound:212>],
        []
    );
    <contenttweaker:mesitylamine>.addTooltip("H₂NMes");

    //simes = mesitylamine + dibrom
    addChemicalRecipe(
        [<contenttweaker:simes>, <alchemistry:compound:502> * 6],
        [<contenttweaker:mesitylamine> * 2, <contenttweaker:dibromoethane> * 3, <enderio:item_capacitor_crystalline>],
        []
    );
    <contenttweaker:simes>.addTooltip("H₂IMes");
    <contenttweaker:simes>.addTooltip("SIMes");
}
addChemicalRecipe([<contenttweaker:methylamine>], [
    <alchemistry:compound:215>, <alchemistry:compound:209>
], []);
{//acet
    //acetic acid
    addFluidConv(<contenttweaker:acetic_acid>, <liquid:acetic_acid>);

    //acetone
    mods.alchemistry.Electrolyzer.addRecipe(
        <liquid:cracked_steam> * 1000, <alchemistry:compound:36> * 2, 100,
        <alchemistry:compound:205>, <alchemistry:compound:34>,
        <contenttweaker:propylene>, 75, null, 0
    );
    addChemicalRecipe(
        [<contenttweaker:acetone>, <contenttweaker:phenol>],
        [<contenttweaker:benzene>, <contenttweaker:propylene>, <alchemistry:element:8> * 2],
        []
    );

    //ethenone h2c2o
    addChemicalRecipe(
        [<contenttweaker:ethenone>, <alchemistry:compound:34>],
        [<contenttweaker:acetone>, <ore:dustPyrotheum>],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:ethenone>, <contenttweaker:acetic_acid>],
        [<contenttweaker:ac2o>, <ore:dustPyrotheum>],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:ethenone>],
        [<contenttweaker:acetic_acid>],
        []//todo triethyl phosphate
    );
    
    //acetic anhydride
    addChemicalRecipe(
        [<contenttweaker:ac2o>],
        [<contenttweaker:ethenone>, <contenttweaker:acetic_acid>],
        []
    );

    addChemicalRecipe(
        [<contenttweaker:acac>],
        [<contenttweaker:acetone>, <contenttweaker:ac2o>],
        []
    );
}

//todo acetone butanol ethanol


{//bromine
    addChemicalRecipe(
        [<contenttweaker:cyclohexyl_bromide>, <alchemistry:compound:502>],
        [<contenttweaker:cyclohexane>, <alchemistry:element:35> * 2],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:cyclohexyl_bromide>],
        [<contenttweaker:cyclohexene>, <alchemistry:compound:502>],
        []
    );

    Combiner.addRecipe(<contenttweaker:dibromoethane>, [
        <alchemistry:element:35> * 2, <alchemistry:compound:205>
    ]);
    <contenttweaker:dibromoethane>.addTooltip("H₄C₂Br₂");
}
{//rubidium
    addChemicalRecipe(
        [<contenttweaker:ruacac>],
        [<contenttweaker:acac>, <alchemistry:element:37>],
        []
    );
}
{//barium
    Dissolver.addRecipe(<contenttweaker:awaken_witherite>, false, 1,
        [
            [100, <alchemistry:compound:506> * 8]
        ]
    );
}
{//iodine
    Dissolver.addRecipe(<contenttweaker:iodine>, false, 1,
        [
            [100, <alchemistry:element:53> * 4]
        ]
    );
    Combiner.addRecipe(<contenttweaker:iodine>, [
        <alchemistry:element:53> * 4
    ]);


    Combiner.addRecipe(<contenttweaker:mai>, [
        <contenttweaker:methylamine>, <alchemistry:compound:508>
    ]);
    Combiner.addRecipe(<contenttweaker:mapbi3>, [
        <contenttweaker:mai>, <alchemistry:compound:25>
    ]);
    
}
{//cerium
    mods.mekanism.compressor.addRecipe(<alchemistry:ingot:58>, <gas:oxygen>, <contenttweaker:ceria>);
}

{//ruthenium thing
    addChemicalRecipe(
        [<contenttweaker:rucl3h2o>],
        [<alchemistry:element:44>, <alchemistry:element:17> * 3],
        [<alchemistry:compound:1205>]
    );
    <contenttweaker:rucl3h2o>.addTooltip("RuCl₃");

    addChemicalRecipe(
        [<contenttweaker:rucl2_pph3_3>, <alchemistry:compound:203>, <alchemistry:element:8>],
        [<contenttweaker:rucl3h2o>, <contenttweaker:pph3> * 3],
        [<alchemistry:compound:26>]
    );
    <contenttweaker:rucl2_pph3_3>.addTooltip("RuCl₂(PPh₃)₃");

    addChemicalRecipe(
        [<contenttweaker:rucl2_pph3_2_chph>, <contenttweaker:pph3>, <alchemistry:element:7> * 2],
        [<contenttweaker:rucl2_pph3_3>, <contenttweaker:phchn>, <botania:manaresource:1>],
        []
    );
    <contenttweaker:rucl2_pph3_2_chph>.addTooltip("RuCl₂(PPh₃)₂(=CHPh)");
    
    addChemicalRecipe(
        [<contenttweaker:rucl2_pcy3_2_chph>, <contenttweaker:pph3> * 2],
        [<contenttweaker:rucl2_pph3_2_chph>, <contenttweaker:pcy3> * 2],
        []
    );
    <contenttweaker:rucl2_pcy3_2_chph>.addTooltip("RuCl₂(PCy₃)₂(=CHPh)");

    addChemicalRecipe(
        [<contenttweaker:grubbs2>, <contenttweaker:pcy3>, <thermalexpansion:florb>.withTag({Fluid: "dark_catalyst2"})],
        [
            <contenttweaker:rucl2_pcy3_2_chph>,
            <contenttweaker:simes>,
            <thermalexpansion:florb>.withTag({Fluid: "dark_catalyst"})
        ], []
    );
    <contenttweaker:grubbs2>.addTooltip("RuCl₂(PCy₃)(SIMes)(=CHPh)");
}

mods.mekanism.reaction.addRecipe(
    <contenttweaker:rarer_earth_dust>, <liquid:acid1> * 1000, <gas:cleanorichalcum> * 250, 
    <alchemistry:ingot:57>, <gas:waste_gas> * 25, 50000, 60
);
