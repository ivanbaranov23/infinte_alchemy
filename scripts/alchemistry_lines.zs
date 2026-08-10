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


function addItemConv(item as IItemStack, el as IItemStack, count as int = 8){
    Dissolver.addRecipe(item, false, 1,
        [
            [100, el * count]
        ]
    );
    Combiner.addRecipe(item, [
        el * count
    ]);
}
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
            [100, <alchemistry:compound:201> * 8]
        ]
    );

    //<contenttweaker:naots>.addTooltip("NaOTs");
}
{//N
    addFluidConv(<alchemistry:compound:209>, <liquid:ammonia>);
    addFluidConv(<alchemistry:compound:212>, <liquid:nitric_acid>);

    Combiner.addRecipe(<contenttweaker:ammonium_chloride>, [
        <alchemistry:compound:209>, <alchemistry:compound:203>
    ]);
    <contenttweaker:ammonium_chloride>.addTooltip("NH₄Cl");

    //nitromethane
    addChemicalRecipe(
        [<contenttweaker:nitromethane>, <alchemistry:compound:6>, <alchemistry:compound:220>],
        [<contenttweaker:chloroacetic_acid>, <alchemistry:compound:229>],
        []
    );
    
}
{//noble
    Dissolver.addRecipe(<contenttweaker:noble_gases_ingot>, false, 2,
        [
            [75, <alchemistry:element:10>],
            [50, <alchemistry:element:18>],
            [25, <alchemistry:element:36>],
            [15, <alchemistry:element:54>]
        ]
    );
}
{//chlorosulfonic
    addFluidConv(<contenttweaker:chlorosulfonic>, <liquid:chlorosulfonic>);
    <contenttweaker:chlorosulfonic>.addTooltip("ClSO₃H");

    mods.mekanism.reaction.addRecipe(
        <bloodmagic:slate>, <liquid:liquidsulfurtrioxide> * 2000, <gas:hydrogenchloride> * 2000, 
        null, <gas:chlorosulfonic> * 250, 50000, 5
    );
}
{//fluoroantimonic
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:fluoroantimonic_acid>, <alchemistry:compound:516>, 
        <liquid:acid1> * 1000, 
        20000
    );

    addChemicalRecipe(
        [<contenttweaker:methanium>, <alchemistry:compound:516> % 50, <alchemistry:compound:228> % 50],
        [<alchemistry:compound:34>, <alchemistry:element:1>, <contenttweaker:fluoroantimonic_acid>],
        []
    );
    
}

addFluidConv(<alchemistry:compound:34>, <liquid:methane>);
addFluidConv(<alchemistry:compound:39>, <liquid:hexane>);
addFluidConv(<alchemistry:compound:205>, <liquid:liquidethene>);

{//formic
    addFluidConv(<alchemistry:compound:214>, <liquid:formic_acid>);
    Combiner.addRecipe(<contenttweaker:ammonium_formate>, [
        <alchemistry:compound:214>, <alchemistry:compound:209>
    ]);

    Dissolver.addRecipe(<contenttweaker:ammonium_formate>, false, 1,
        [
            [100, <contenttweaker:formamide>, <alchemistry:compound:7>]
        ]
    );
}

addFluidConv(<alchemistry:compound:213>, <liquid:formaldehyde>);

addFluidConv(<contenttweaker:tartaric_acid>, <liquid:tartaric_acid>);
addFluidConv(<contenttweaker:ethylene_oxide>, <liquid:ethylene_oxide>);

addItemConv(<contenttweaker:starch>, <alchemistry:compound:19>, 8);
addItemConv(<contenttweaker:sodium_bicarbonate>, <alchemistry:compound:220>, 8);


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

    
    addChemicalRecipe(
        [<contenttweaker:phenol>, <alchemistry:compound:6>],
        [<contenttweaker:chlorobenzene>, <alchemistry:compound:201>],
        []
    );
    <contenttweaker:phenol>.addTooltip("PhOH");


    addChemicalRecipe(
        [<contenttweaker:benzyl_chloride>, <alchemistry:compound:203>],
        [<contenttweaker:toluene>, <alchemistry:element:17> * 2],
        []
    );
    <contenttweaker:benzyl_chloride>.addTooltip("PhCH₂Cl");


    addChemicalRecipe(
        [<contenttweaker:diphenylmethane>, <alchemistry:compound:203>],
        [<contenttweaker:benzyl_chloride>, <contenttweaker:benzene>],
        [<alchemistry:compound:208>]
    );
    <contenttweaker:diphenylmethane>.addTooltip("Ph₂CH₂");

    addChemicalRecipe(
        [<contenttweaker:benzophenone>, <alchemistry:compound:7>],
        [<contenttweaker:diphenylmethane>, <alchemistry:element:8> * 2],
        [<extendedcrafting:singularity:17>]
    );
    <contenttweaker:benzophenone>.addTooltip("Ph₂C=O");
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
    <contenttweaker:xylene>.addTooltip("CH₃-C₆H₄-CH₃");
    <contenttweaker:xylene>.addTooltip("Me-Ph-Me");

    addChemicalRecipe(
        [<contenttweaker:phthalic_anhydride>, <alchemistry:compound:7> * 3],
        [<contenttweaker:xylene>, <alchemistry:element:8> * 6],
        []
    );
    <contenttweaker:phthalic_anhydride>.addTooltip("C₆H₄(CO)₂O");
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
        [<contenttweaker:benzene>, <alchemistry:element:1> * 4],
        [<extendedcrafting:singularity_custom:30>]
    );

    addChemicalRecipe(
        [<contenttweaker:pcy3>, <alchemistry:compound:501>],
        [<contenttweaker:cyclohexyl_bromide>, <alchemistry:element:12>, <alchemistry:compound:1206>],
        []
    );



    addChemicalRecipe(
        [<contenttweaker:adipic_acid>, <alchemistry:compound:7> * 4],
        [<contenttweaker:cyclohexene>, <contenttweaker:h2o2> * 4],
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
<contenttweaker:methylamine>.addTooltip("CH₃NH₂");

{//steam cracking
    mods.alchemistry.Electrolyzer.addRecipe(
        <liquid:cracked_steam> * 1000, <alchemistry:compound:36> * 2, 100,
        <alchemistry:compound:205>, <alchemistry:compound:34>,
        <contenttweaker:propylene>, 75, null, 0
    );
    <contenttweaker:propylene>.addTooltip("CH₃CH=CH₂");

    mods.alchemistry.Electrolyzer.addRecipe(
        <liquid:cracked_steam> * 1000, <alchemistry:compound:37> * 2, 100,
        <alchemistry:compound:36>, <alchemistry:compound:34>,
        <contenttweaker:butadiene>, 75, null, 0
    );
    <contenttweaker:butadiene>.addTooltip("H₂C=CH-CH=CH₂");
}
{//acet
    //acetic acid
    addChemicalRecipe(
        [<contenttweaker:acetic_acid>],
        [<alchemistry:compound:205>, <alchemistry:element:8> * 2],
        [<extendedcrafting:singularity_custom:30>]
    );
    addFluidConv(<contenttweaker:acetic_acid>, <liquid:acetic_acid>);
    <contenttweaker:acetic_acid>.addTooltip("H₃C-COOH");

    //acetone
    
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
        [<contenttweaker:ethenone>, <alchemistry:compound:7>],
        [<contenttweaker:acetic_acid>],
        [<contenttweaker:triethyl_phosphate>]//todo triethyl phosphate
    );
    <contenttweaker:ethenone>.addTooltip("H₂C=C=O");
    
    //acetic anhydride
    addChemicalRecipe(
        [<contenttweaker:ac2o>],
        [<contenttweaker:ethenone>, <contenttweaker:acetic_acid>],
        []
    );
    <contenttweaker:ac2o>.addTooltip("(CH₃CO)₂O");
    <contenttweaker:ac2o>.addTooltip("Ac₂O");

    addChemicalRecipe(
        [<contenttweaker:acac>],
        [<contenttweaker:acetone>, <contenttweaker:ac2o>],
        []
    );

    //acetaldehyde
    addChemicalRecipe(
        [<contenttweaker:acetaldehyde>],
        [<alchemistry:compound:26>, <alchemistry:element:8>],
        [<extendedcrafting:singularity:22>]
    );
    <contenttweaker:acetaldehyde>.addTooltip("ClH₂C-COOH");

    //chloroacetic_acid
    addChemicalRecipe(
        [<contenttweaker:chloroacetic_acid>, <alchemistry:compound:203>],
        [<contenttweaker:acetic_acid>, <alchemistry:element:17> * 2],
        [<contenttweaker:ac2o>]
    );
    <contenttweaker:chloroacetic_acid>.addTooltip("ClH₂C-COOH");

    //
}
{//nitriles
    addChemicalRecipe(
        [<contenttweaker:acrylonitrile>, <alchemistry:compound:7>],
        [<contenttweaker:propylene>, <alchemistry:compound:209>, <alchemistry:element:8> * 3],
        [<alchemistry:element:83>, <alchemistry:element:15>, <alchemistry:element:42>]
    );
    <contenttweaker:acrylonitrile>.addTooltip("H₂C=CH-CN");
    
    addChemicalRecipe(
        [<contenttweaker:adiponitrile>],
        [<contenttweaker:butadiene>, <alchemistry:compound:207>],
        [<extendedcrafting:singularity:25>]
    );
    addChemicalRecipe(
        [<contenttweaker:adiponitrile>],
        [<contenttweaker:acrylonitrile> * 2, <alchemistry:element:1> * 2],
        [<alchemistry:element:48>]
    );
    <contenttweaker:adiponitrile>.addTooltip("(CH₂)₄(CN)₂");
}
{//nylon
    
    addChemicalRecipe(
        [<contenttweaker:hexamethylenediamine>],
        [<contenttweaker:adiponitrile>, <alchemistry:element:1> * 8],
        [<extendedcrafting:singularity:65>, <extendedcrafting:singularity:1>]
    );
    addChemicalRecipe(
        [<contenttweaker:nylon>, <alchemistry:compound:7> * 15],
        [<contenttweaker:hexamethylenediamine> * 8, <contenttweaker:adipic_acid> * 8, <thermalexpansion:florb>.withTag({Fluid: "alien_polymer"})],
        []
    );
}
{//kevlar  ₀₁₂₃₄₅₆₇₈₉
    Combiner.addRecipe(<contenttweaker:chloroxylen>, [
       <contenttweaker:xylene>, <alchemistry:element:17> * 6
    ]);
    <contenttweaker:chloroxylen>.addTooltip("C₆H₄(CCl₃)₂");

    addChemicalRecipe(
        [<contenttweaker:terephthalic_acid>, <alchemistry:compound:7> * 2],
        [<contenttweaker:xylene>, <alchemistry:element:8> * 6],
        [<alchemistry:compound:514>]
    );
    <contenttweaker:terephthalic_acid>.addTooltip("C₆H₄(COOH)₂");

    addChemicalRecipe(
        [<contenttweaker:tcl>, <alchemistry:compound:203>],
        [<contenttweaker:chloroxylen>, <contenttweaker:terephthalic_acid>],
        []
    );
    <contenttweaker:tcl>.addTooltip("C₆H₄(COCl)₂");


    addChemicalRecipe(
        [<contenttweaker:nitrochlorobenzene>, <alchemistry:compound:7>],
        [<contenttweaker:chlorobenzene>, <alchemistry:compound:212>],
        []
    );
    <contenttweaker:nitrochlorobenzene>.addTooltip("ClC₆H₄NO₂");
    addChemicalRecipe(
        [<contenttweaker:ppd>, <contenttweaker:ammonium_chloride>, <alchemistry:compound:7> * 2],
        [<contenttweaker:nitrochlorobenzene>, <alchemistry:compound:209> * 2, <alchemistry:element:1> * 6],
        []
    );
    <contenttweaker:ppd>.addTooltip("C₆H₄(NH₂)₂");
    
    addChemicalRecipe(
        [<contenttweaker:kevlar>, <alchemistry:compound:203> * 16],
        [<contenttweaker:ppd> * 8, <contenttweaker:tcl> * 8, <thermalexpansion:florb>.withTag({Fluid: "alien_polymer"})],
        []
    );
}
{//hydrogen peroxide
    

    addChemicalRecipe(
        [<contenttweaker:ethylantraquinone>, <alchemistry:compound:7> * 1],
        [<contenttweaker:phthalic_anhydride>, <contenttweaker:ethylbenzene>],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:ethylantrahydroquinone>],
        [<contenttweaker:ethylantraquinone>, <alchemistry:element:1> * 2],
        [<extendedcrafting:singularity_custom:30>]
    );
    addChemicalRecipe(
        [<contenttweaker:ethylantraquinone>, <contenttweaker:h2o2>],
        [<contenttweaker:ethylantrahydroquinone>, <alchemistry:element:8> * 2],
        []
    );
}
{//dioxane
    addChemicalRecipe(
        [<contenttweaker:ethylene_glycol>],
        [<contenttweaker:ethylene_oxide>, <alchemistry:compound:7>],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:dioxane>, <alchemistry:compound:7> * 2],
        [<contenttweaker:ethylene_glycol> * 2],
        [<alchemistry:compound:211>]
    );

}
{//cubane
    addChemicalRecipe(
        [<contenttweaker:cyclopentanone>, <alchemistry:compound:7>, <alchemistry:compound:225>],
        [<contenttweaker:adipic_acid>],
        [<alchemistry:compound:226>]
    );
    
    addChemicalRecipe(
        [<contenttweaker:cyclopentanone_ethylene_ketal>, <alchemistry:compound:7>],
        [<contenttweaker:cyclopentanone>, <contenttweaker:ethylene_glycol>],
        [<contenttweaker:tosyl_chloride>]
    );

    addChemicalRecipe(
        [<contenttweaker:tribrom_cyclopentanone_ethylene_ketal>, <alchemistry:compound:502> * 3],
        [<contenttweaker:cyclopentanone_ethylene_ketal>, <alchemistry:element:35> * 6],
        [<contenttweaker:dioxane>]
    );

    addChemicalRecipe(
        [<contenttweaker:tribrom_cyclopentanone_ethylene_ketal2>],
        [<contenttweaker:tribrom_cyclopentanone_ethylene_ketal> * 2],
        [<alchemistry:compound:201>]
    );

    addChemicalRecipe(
        [<contenttweaker:precubane_diketal>, <contenttweaker:ethylene_glycol> * 2],
        [<contenttweaker:tribrom_cyclopentanone_ethylene_ketal2>],
        [<alchemistry:compound:211>]
    );

    addChemicalRecipe(
        [<contenttweaker:precubane>],
        [<contenttweaker:precubane_diketal>],
        [<contenttweaker:uv_lamp>, <contenttweaker:benzophenone>]
    );

    addChemicalRecipe(
        [<contenttweaker:cubane_dicarboxylic_acid>, <alchemistry:compound:514> * 2, <alchemistry:compound:15> * 2],
        [<contenttweaker:precubane>, <alchemistry:compound:201> * 2, <alchemistry:compound:7> * 2],
        []
    );

    addChemicalRecipe(
        [
            <contenttweaker:cubane>,
            <thermalexpansion:florb>.withTag({Fluid: "dark_catalyst1"}) * 3,
            <thermalexpansion:florb>.withTag({Fluid: "dark_catalyst7"})
        ],
        [
            <contenttweaker:cubane_dicarboxylic_acid>,
            <thermalexpansion:florb>.withTag({Fluid: "dark_catalyst"}) * 4
        ],
        []
    );


    addChemicalRecipe(
        [<contenttweaker:octofluorocubane>, <alchemistry:element:1> * 8],
        [<contenttweaker:cubane>, <alchemistry:element:9> * 8],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:octonitrocubane>, <alchemistry:compound:7> * 8],
        [<contenttweaker:cubane>, <alchemistry:compound:212> * 8],
        []
    );
}
{//xenon
    addChemicalRecipe(
        [<contenttweaker:xenon_gold>],
        [
            <alchemistry:compound:515>, <alchemistry:element:54> * 4, <contenttweaker:fluoroantimonic_acid> * 4
        ],
        []
    );
    <contenttweaker:xenon_gold>.addTooltip("AuXe₄(Sb₂F₁₁)₂");
    mods.extendedcrafting.TableCrafting.addShaped(0, <alchemistry:xenon_light> * 2, [
        [<contenttweaker:night_glass>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <contenttweaker:night_glass>], 
        [<extrautils2:ineffableglass:2>, <contenttweaker:xenon_gold>, <contenttweaker:zblank>, <contenttweaker:xenon_gold>, <extrautils2:ineffableglass:2>], 
        [<extrautils2:ineffableglass:2>, <contenttweaker:zblank>, <extendedcrafting:lamp:1>, <contenttweaker:zblank>, <extrautils2:ineffableglass:2>], 
        [<extrautils2:ineffableglass:2>, <contenttweaker:xenon_gold>, <contenttweaker:zblank>, <contenttweaker:xenon_gold>, <extrautils2:ineffableglass:2>], 
        [<contenttweaker:night_glass>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <contenttweaker:night_glass>]
    ]);

}
//todo acetone butanol ethanol
{//ethanol
    addChemicalRecipe(
        [<contenttweaker:diethyl_ether>, <alchemistry:compound:7>],
        [<alchemistry:compound:26>],
        [<alchemistry:compound:3>]
    );
    <contenttweaker:diethyl_ether>.addTooltip("(C₂H₅)₂O");
    <contenttweaker:diethyl_ether>.addTooltip("Et₂O");
}

{//lithium
    addChemicalRecipe(
        [<contenttweaker:phli>, <alchemistry:compound:216>],
        [<contenttweaker:chlorobenzene>, <alchemistry:element:3> * 2],
        []
    );
    <contenttweaker:phli>.addTooltip("PhLi");
}
{//sodium
    addItemConv(<contenttweaker:nacn>, <alchemistry:compound:223>, 8);
}
{//phosporous
    addFluidConv(<alchemistry:compound:217>, <liquid:phosphoric_acid>);
    //mods.thermalexpansion.Refinery.addRecipe(<liquid:phosphoric_acid> * 250, <mekanism:dirtydust:2> % 25, <liquid:refined_glowstone> * 144, 8000);
    mods.mekanism.separator.addRecipe(<liquid:refined_glowstone> * 2, 200, <gas:phosphoric_acid> * 5, <gas:liquidosmium>);


    Dissolver.addRecipe(<enderio:block_holy_fog>, false, 1,
        [
            [100, <alchemistry:element:15> * 2]
        ]
    );

    Combiner.removeRecipe(<alchemistry:compound:230>);
    Combiner.addRecipe(<alchemistry:compound:230>, [
        <alchemistry:compound:14>, <alchemistry:element:15>, <alchemistry:element:8>
    ]);

    addChemicalRecipe(
        [<contenttweaker:triethyl_phosphate> * 2],
        [<contenttweaker:diethyl_ether> * 3, <alchemistry:compound:230>],
        []
    );
    <contenttweaker:triethyl_phosphate>.addTooltip("(C₂H₅)₃PO₄");
}
{//calcium
    addItemConv(<contenttweaker:slacked_lime>, <alchemistry:compound:219>);
    addItemConv(<contenttweaker:quicklime>, <alchemistry:compound:218>);
    addItemConv(<contenttweaker:monocalcium_phosphate>, <alchemistry:compound:222>);
}
{//germanium

}
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
    //witherite
    Dissolver.addRecipe(<contenttweaker:awaken_witherite>, false, 1,
        [
            [100, <alchemistry:compound:506> * 8]
        ]
    );

    //benitoite
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:benitoite> * (500), <bigreactors:mineralbenitoite>, 2000
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:barium_dust> % 50,
            <contenttweaker:titanium_dust> % 50
        ], null, 
        <liquid:benitoite> * 250, <contenttweaker:filter_charcoal>,
        <exnihilocreatio:item_mesh:4>,
        20, 1000
    );

    
}
{//antimony
    addChemicalRecipe(
        [<contenttweaker:ph3sb>, <alchemistry:compound:216> * 3],
        [<alchemistry:compound:509>, <contenttweaker:phli> * 3],
        []
    );
    Combiner.addRecipe(<contenttweaker:ph3sbcl2>, [
        <contenttweaker:ph3sb>, <alchemistry:element:17> * 2
    ]);
    addChemicalRecipe(
        [<contenttweaker:ph5sb>, <alchemistry:compound:216> * 2],
        [<contenttweaker:ph3sbcl2>, <contenttweaker:phli> * 2],
        []
    );
}
{//selenium
    Dissolver.addRecipe(<contenttweaker:worm_heart>, false, 1,
        [
            [50, <contenttweaker:hemocyanin> * 64], 
            [50, <contenttweaker:gpx> * 16]
        ]
    );
    Dissolver.addRecipe(<contenttweaker:gpx>, false, 1,
        [
            [100, <contenttweaker:selenocysteine> * 4]
        ]
    );
    Dissolver.addRecipe(<contenttweaker:selenocysteine>, false, 1,
        [
            [100, <contenttweaker:alanine>, <alchemistry:compound:513>]
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
    <contenttweaker:mai>.addTooltip("CH₃NH₃I");
    <contenttweaker:mai>.addTooltip("MAI");

    Combiner.addRecipe(<contenttweaker:mapbi3>, [
        <contenttweaker:mai>, <alchemistry:compound:25>
    ]);
    <contenttweaker:mapbi3>.addTooltip("CH₃NH₃PbI₃");
    <contenttweaker:mapbi3>.addTooltip("MAPbI₃");
}
{//cerium
    mods.mekanism.compressor.addRecipe(<alchemistry:ingot:58>, <gas:oxygen>, <contenttweaker:ceria>);
}
{//mercury
    
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






{//worm
    Atomizer.addRecipe(<contenttweaker:hemocyanin>, <liquid:worm_blood> * 1000);
    Liquifier.addRecipe(<liquid:worm_blood> * 1000, <contenttweaker:hemocyanin>);

    Dissolver.addRecipe(<contenttweaker:hemocyanin>, false, 1,
        [
            [100, <contenttweaker:histidine> * 4, <alchemistry:element:29> * 32]
        ]
    );
}
{//dragon
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:dragon_yolk> * 250, <minecraft:dragon_egg>, 100000
    );

    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:self_healing_polymer>], null, 
        [<contenttweaker:star_polymer> * 3, <contenttweaker:dicyclopentadiene> * 16, <contenttweaker:grubbs2> * 16], [
            <liquid:dragon_yolk> * 2000,

        ], null,
        20, 1000000
    );
}