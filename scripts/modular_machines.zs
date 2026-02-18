#priority 1001

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

recipes.removeByMod("modularmachinery");

static gears as IItemStack[] = [
    <thermalfoundation:material:291>,       //0
    <thermalfoundation:material:291>,       //1
    <contenttweaker:duraluminum_gear>,      //2
    <thermalfoundation:material:295>,
    <contenttweaker:mekanized_steel_gear>,  //3
    <enderio:item_material:73>,             //4
    <tconevo:metal:29>,                     //5
    <moreplates:awakened_draconium_gear>,   //6
    //<moreplates:neutronium_gear>            //7
];
static sides as IItemStack[] = [
    null,       //0
    null,       //1
    <contenttweaker:basic_modularium>,      //2
    <thermalfoundation:material:515>,
    <mekanism:controlcircuit:3>,            //3
    <enderio:item_material:18>,             //4
    <bloodmagic:component:27>,              //5
    <astralsorcery:itemcoloredlens:6>,      //6
    //<draconicevolution:awakened_core>       //7
];
static corners as IItemStack[] = [
    null,       //0
    null,       //1
    null,       //2
    <contenttweaker:basic_modularium>,
    <contenttweaker:basic_modularium>,  //3
    <modularmachinery:itemmodularium>,  //4
    <modularmachinery:itemmodularium>,  //5
    <extendedcrafting:material:32>,  //6
    //<extendedcrafting:material:32>      //7
];
function addMMPartRecipe(lvl as int, inp as IItemStack, out as IItemStack, cat as IItemStack, flip as bool){
    if (flip){
        recipes.addShaped("ia_mm_" + out.name, out,[
            [corners[lvl],  gears[lvl], corners[lvl]],
            [sides[lvl],    inp,        sides[lvl]],
            [corners[lvl],  cat,        corners[lvl]]
        ]);}
    else{
        recipes.addShaped("ia_mm_" + out.name, out,[
            [corners[lvl],  cat,        corners[lvl]],
            [sides[lvl],    inp,        sides[lvl]],
            [corners[lvl],  gears[lvl], corners[lvl]]
        ]);}
}




recipes.addShaped("mm_blockcasing", <modularmachinery:blockcasing> * 3, [
    [<contenttweaker:basic_modularium>, <minecraft:glass>, <contenttweaker:basic_modularium>],
    [<contenttweaker:basic_modularium>, <contenttweaker:simple_motor>, <contenttweaker:basic_modularium>],
    [<contenttweaker:basic_modularium>, <thermalfoundation:material:324>, <contenttweaker:basic_modularium>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<modularmachinery:blockcasing> * 8],
    [
        <contenttweaker:simple_motor>, <thermalfoundation:material:324>,
        <contenttweaker:basic_modularium> * 4
    ], <liquid:glass> * 1000,
    20, 100
);
recipes.addShaped("mm_blockcasing2", <modularmachinery:blockcasing:4>, [
	[<modularmachinery:itemmodularium>, <contenttweaker:calitunti_plate>, <modularmachinery:itemmodularium>], 
	[<ore:alloyElite>, <modularmachinery:blockcasing>, <ore:alloyElite>], 
	[<modularmachinery:itemmodularium>, <contenttweaker:calitunti_plate>, <modularmachinery:itemmodularium>]
]);



//hatches
{
    //this is awful
    //item input 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockinputbus:1>, <tconstruct:wooden_hopper>, false);
    addMMPartRecipe(2, <modularmachinery:blockinputbus:1>, <modularmachinery:blockinputbus:2>, <minecraft:hopper>, false);
    addMMPartRecipe(3, <modularmachinery:blockinputbus:2>, <modularmachinery:blockinputbus:3>, <mob_grinding_utils:absorption_hopper>, false);
    addMMPartRecipe(4, <modularmachinery:blockinputbus:3>, <modularmachinery:blockinputbus:4>, <thermalfoundation:upgrade>, false);
    addMMPartRecipe(6, <modularmachinery:blockinputbus:4>, <modularmachinery:blockinputbus:5>, <enderio:block_impulse_hopper>, false);
    addMMPartRecipe(7, <modularmachinery:blockinputbus:5>, <modularmachinery:blockinputbus:6>, <botania:specialflower>.withTag({type: "hopperhock"}), false);

    //item output 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockoutputbus:1>, <tconstruct:wooden_hopper>, true);
    addMMPartRecipe(2, <modularmachinery:blockoutputbus:1>, <modularmachinery:blockoutputbus:2>, <minecraft:hopper>, true);
    addMMPartRecipe(3, <modularmachinery:blockoutputbus:2>, <modularmachinery:blockoutputbus:3>, <mob_grinding_utils:absorption_hopper>, true);
    addMMPartRecipe(4, <modularmachinery:blockoutputbus:3>, <modularmachinery:blockoutputbus:4>, <thermalfoundation:upgrade>, true);
    addMMPartRecipe(6, <modularmachinery:blockoutputbus:4>, <modularmachinery:blockoutputbus:5>, <enderio:block_impulse_hopper>, true);
    addMMPartRecipe(7, <modularmachinery:blockoutputbus:5>, <modularmachinery:blockoutputbus:6>, <botania:specialflower>.withTag({type: "hopperhock"}), true);    


    //fluid input 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockfluidinputhatch:1>, <erebus:bambucket>.withTag({}), false);
    addMMPartRecipe(2, <modularmachinery:blockfluidinputhatch:1>, <modularmachinery:blockfluidinputhatch:2>, <minecraft:bucket>, false);
    addMMPartRecipe(3, <modularmachinery:blockfluidinputhatch:2>, <modularmachinery:blockfluidinputhatch:3>, <fluiddrawers:tank>, false);
    addMMPartRecipe(4, <modularmachinery:blockfluidinputhatch:3>, <modularmachinery:blockfluidinputhatch:4>, <enderio:block_tank:1>, false);
    addMMPartRecipe(5, <modularmachinery:blockfluidinputhatch:4>, <modularmachinery:blockfluidinputhatch:5>, <thermalfoundation:material:512>, false);
    addMMPartRecipe(6, <modularmachinery:blockfluidinputhatch:5>, <modularmachinery:blockfluidinputhatch:6>, <bloodmagic:blood_tank:2>, false);
    addMMPartRecipe(7, <modularmachinery:blockfluidinputhatch:6>, <modularmachinery:blockfluidinputhatch:7>, <astralsorcery:blockwell>, false);

    //fluid output 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockfluidoutputhatch:1>, <erebus:bambucket>.withTag({}), true);
    addMMPartRecipe(2, <modularmachinery:blockfluidoutputhatch:1>, <modularmachinery:blockfluidoutputhatch:2>, <minecraft:bucket>, true);
    addMMPartRecipe(3, <modularmachinery:blockfluidoutputhatch:2>, <modularmachinery:blockfluidoutputhatch:3>, <fluiddrawers:tank>, true);
    addMMPartRecipe(4, <modularmachinery:blockfluidoutputhatch:3>, <modularmachinery:blockfluidoutputhatch:4>, <enderio:block_tank:1>, true);
    addMMPartRecipe(5, <modularmachinery:blockfluidoutputhatch:4>, <modularmachinery:blockfluidoutputhatch:5>, <thermalfoundation:material:512>, true);
    addMMPartRecipe(6, <modularmachinery:blockfluidoutputhatch:5>, <modularmachinery:blockfluidoutputhatch:6>, <bloodmagic:blood_tank:2>, true);
    addMMPartRecipe(7, <modularmachinery:blockfluidoutputhatch:6>, <modularmachinery:blockfluidoutputhatch:7>, <astralsorcery:blockwell>, true);


    //energy input
    //addMMPartRecipe(0, <modularmachinery:blockcasing>, <modularmachinery:blockenergyinputhatch:0>, <erebus:bambucket>.withTag({}), false);
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockenergyinputhatch:1>, <immersiveengineering:metal_decoration0>, false);
    addMMPartRecipe(2, <modularmachinery:blockenergyinputhatch:1>, <modularmachinery:blockenergyinputhatch:2>, <immersiveengineering:metal_device0:2>, false);
    addMMPartRecipe(3, <modularmachinery:blockenergyinputhatch:2>, <modularmachinery:blockenergyinputhatch:3>, <thermalexpansion:capacitor>, false);
    addMMPartRecipe(4, <modularmachinery:blockenergyinputhatch:3>, <modularmachinery:blockenergyinputhatch:4>, <mekanism:energycube>.withTag({tier: 0}), false);
    addMMPartRecipe(5, <modularmachinery:blockenergyinputhatch:4>, <modularmachinery:blockenergyinputhatch:5>, <enderio:block_cap_bank:2>, false);
    addMMPartRecipe(6, <modularmachinery:blockenergyinputhatch:5>, <modularmachinery:blockenergyinputhatch:6>, <botania:manavoid>, false);
    addMMPartRecipe(7, <modularmachinery:blockenergyinputhatch:6>, <modularmachinery:blockenergyinputhatch:7>, <draconicevolution:draconium_capacitor:1>, false);

    //energy output 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockenergyoutputhatch:1>, <immersiveengineering:metal_decoration0>, true);
    addMMPartRecipe(2, <modularmachinery:blockenergyoutputhatch:1>, <modularmachinery:blockenergyoutputhatch:2>, <immersiveengineering:metal_device0:2>, true);
    addMMPartRecipe(3, <modularmachinery:blockenergyoutputhatch:2>, <modularmachinery:blockenergyoutputhatch:3>, <thermalexpansion:capacitor>, true);
    addMMPartRecipe(4, <modularmachinery:blockenergyoutputhatch:3>, <modularmachinery:blockenergyoutputhatch:4>, <mekanism:energycube>.withTag({tier: 0}), true);
    addMMPartRecipe(5, <modularmachinery:blockenergyoutputhatch:4>, <modularmachinery:blockenergyoutputhatch:5>, <enderio:block_cap_bank:2>, true);
    addMMPartRecipe(6, <modularmachinery:blockenergyoutputhatch:5>, <modularmachinery:blockenergyoutputhatch:6>, <botania:manavoid>, true);
    addMMPartRecipe(7, <modularmachinery:blockenergyoutputhatch:6>, <modularmachinery:blockenergyoutputhatch:7>, <draconicevolution:draconium_capacitor:1>, true);

}

{//others
    recipes.addShaped("ia_mm_grid_input", <modularmachinery:blockgridproviderinput>, [
        [<extrautils2:decorativesolid:3>, <extrautils2:suncrystal>, <extrautils2:decorativesolid:3>], 
        [<contenttweaker:resonating_plate>, <modularmachinery:blockcasing>, <contenttweaker:resonating_plate>], 
        [<extrautils2:decorativesolid:3>, <ore:gemMoon>, <extrautils2:decorativesolid:3>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockgridprovideroutput>, [
        [<biomesoplenty:terrestrial_artifact>, <contenttweaker:resonating_plate>, <extrautils2:suncrystal>, <contenttweaker:resonating_plate>, <biomesoplenty:terrestrial_artifact>], 
        [<moreplates:evil_infused_iron_plate>, <contenttweaker:resonating_plate>, <extrautils2:suncrystal>, <contenttweaker:resonating_plate>, <moreplates:evil_infused_iron_plate>], 
        [<moreplates:evil_infused_iron_plate>, <contenttweaker:resonating_plate>, <modularmachinery:blockcasing:4>, <contenttweaker:resonating_plate>, <moreplates:evil_infused_iron_plate>], 
        [<moreplates:evil_infused_iron_plate>, <contenttweaker:resonating_plate>, <extrautils2:ingredients:5>, <contenttweaker:resonating_plate>, <moreplates:evil_infused_iron_plate>], 
        [<biomesoplenty:terrestrial_artifact>, <contenttweaker:resonating_plate>, <extrautils2:ingredients:5>, <contenttweaker:resonating_plate>, <biomesoplenty:terrestrial_artifact>]
    ]);

    {//will
        mods.bloodmagic.TartaricForge.addRecipe(<modularmachinery:blockwillproviderinput>, [
            <bloodmagic:demon_crystallizer>,
            <bloodmagic:demon_extras:10>,
            <modularmachinery:blockcasing:4>,
            <bloodmagic:demon_will_gauge>
        ], 1200, 200);

        mods.bloodmagic.TartaricForge.addRecipe(<modularmachinery:blockwillprovideroutput>, [
            <bloodmagic:demon_crucible>,
            <bloodmagic:demon_extras:10>,
            <modularmachinery:blockcasing:4>,
            <bloodmagic:demon_will_gauge>
        ], 1200, 200);
    }

    recipes.addShaped("ia_blockdimensionproviderinput", <modularmachineryaddons:blockdimensionproviderinput>, [
        [<minecraft:compass>],
        [<modularmachinery:blockcasing>]
    ]);
    recipes.addShaped("ia_blockbiomeproviderinput", <modularmachineryaddons:blockbiomeproviderinput>, [
        [<naturescompass:naturescompass>],
        [<modularmachinery:blockcasing>]
    ]);
}

{//parallel
    mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller>, [
        [<modularmachinery:blockcasing:5>, <modularmachinery:blockcasing:5>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <modularmachinery:blockcasing:5>, <modularmachinery:blockcasing:5>], 
        [<modularmachinery:blockcasing:5>, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, null, <extendedcrafting:singularity_custom:51>, <modularmachinery:blockcasing:5>], 
        [<contenttweaker:neuronium_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_alloy_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, null, <enderio:item_capacitor_stellar>, <enderio:item_capacitor_stellar>, <enderio:item_capacitor_stellar>, null, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, <contenttweaker:star_alloy_plate>, <enderio:item_capacitor_stellar>, <contenttweaker:cursed_star>, <enderio:item_capacitor_stellar>, <contenttweaker:star_alloy_plate>, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, null, <enderio:item_capacitor_stellar>, <enderio:item_capacitor_stellar>, <enderio:item_capacitor_stellar>, null, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_alloy_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:neuronium_plate>], 
        [<modularmachinery:blockcasing:5>, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, null, <extendedcrafting:singularity_custom:51>, <modularmachinery:blockcasing:5>], 
        [<modularmachinery:blockcasing:5>, <modularmachinery:blockcasing:5>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <modularmachinery:blockcasing:5>, <modularmachinery:blockcasing:5>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:1>, [
        [<modularmachinery:blockparallelcontroller>, <modularmachinery:blockcasing:5>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <modularmachinery:blockcasing:5>, <modularmachinery:blockparallelcontroller>], 
        [<modularmachinery:blockcasing:5>, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, null, <extendedcrafting:singularity_custom:51>, <modularmachinery:blockcasing:5>], 
        [<contenttweaker:neuronium_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_alloy_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, null, <ometweaks:kikeridan_capacitor>, <ometweaks:kikeridan_capacitor>, <ometweaks:kikeridan_capacitor>, null, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, <contenttweaker:star_alloy_plate>, <ometweaks:kikeridan_capacitor>, <contenttweaker:cursed_star>, <ometweaks:kikeridan_capacitor>, <contenttweaker:star_alloy_plate>, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, null, <ometweaks:kikeridan_capacitor>, <ometweaks:kikeridan_capacitor>, <ometweaks:kikeridan_capacitor>, null, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_alloy_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:neuronium_plate>], 
        [<modularmachinery:blockcasing:5>, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, null, <extendedcrafting:singularity_custom:51>, <modularmachinery:blockcasing:5>], 
        [<modularmachinery:blockparallelcontroller>, <modularmachinery:blockcasing:5>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <modularmachinery:blockcasing:5>, <modularmachinery:blockparallelcontroller>]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:2>, [
        [<modularmachinery:blockparallelcontroller:1>, <modularmachinery:blockcasing:5>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <modularmachinery:blockcasing:5>, <modularmachinery:blockparallelcontroller:1>], 
        [<modularmachinery:blockcasing:5>, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, null, <extendedcrafting:singularity_custom:51>, <modularmachinery:blockcasing:5>], 
        [<contenttweaker:neuronium_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_alloy_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, null, <ometweaks:neutronium_capacitor>, <ometweaks:neutronium_capacitor>, <ometweaks:neutronium_capacitor>, null, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, <contenttweaker:star_alloy_plate>, <ometweaks:neutronium_capacitor>, <contenttweaker:cursed_star>, <ometweaks:neutronium_capacitor>, <contenttweaker:star_alloy_plate>, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, <contenttweaker:star_polymer>, null, <ometweaks:neutronium_capacitor>, <ometweaks:neutronium_capacitor>, <ometweaks:neutronium_capacitor>, null, <contenttweaker:star_polymer>, <contenttweaker:neuronium_plate>], 
        [<contenttweaker:neuronium_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_alloy_plate>, null, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:neuronium_plate>], 
        [<modularmachinery:blockcasing:5>, <extendedcrafting:singularity_custom:51>, null, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, <contenttweaker:star_polymer>, null, <extendedcrafting:singularity_custom:51>, <modularmachinery:blockcasing:5>], 
        [<modularmachinery:blockparallelcontroller:1>, <modularmachinery:blockcasing:5>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <contenttweaker:neuronium_plate>, <modularmachinery:blockcasing:5>, <modularmachinery:blockparallelcontroller:1>]
    ]);
}

//other
recipes.addShaped("ia_mm_gearbox", <modularmachinery:blockcasing:3>, [
	[<contenttweaker:basic_modularium>, <contenttweaker:mekanical_core>, <contenttweaker:basic_modularium>], 
	[<ore:gearManyullyn>, <modularmachinery:blockcasing>, <ore:gearManyullyn>], 
	[<contenttweaker:basic_modularium>, <contenttweaker:mekanical_core>, <contenttweaker:basic_modularium>]
]);
recipes.addShaped("ia_mm_circuit_block", <modularmachinery:blockcasing:5>, [
	[<modularmachinery:itemmodularium>, <quantumflux:craftingpiece:5>, <modularmachinery:itemmodularium>], 
	[<quantumflux:craftingpiece>, <modularmachinery:blockcasing:4>, <quantumflux:craftingpiece>], 
	[<modularmachinery:itemmodularium>, <quantumflux:craftingpiece:5>, <modularmachinery:itemmodularium>]
]);
recipes.addShaped("ia_mm_vent", <modularmachinery:blockcasing:1>, [
	[<enderio:block_industrial_insulation>, <mekanism:filterupgrade>, <enderio:block_industrial_insulation>], 
	[<contenttweaker:insulation_fabric>, <modularmachinery:blockcasing:4>, <contenttweaker:insulation_fabric>], 
	[<enderio:block_industrial_insulation>, <mekanism:filterupgrade>, <enderio:block_industrial_insulation>]
]);
recipes.addShaped("ia_mm_firebox", <modularmachinery:blockcasing:2>, [
	[<modularmachinery:itemmodularium>, <actuallyadditions:item_misc:8>, <modularmachinery:itemmodularium>], 
	[<contenttweaker:hot_gear>, <modularmachinery:blockcasing:4>, <contenttweaker:hot_gear>], 
	[<modularmachinery:itemmodularium>, <actuallyadditions:item_misc:8>, <modularmachinery:itemmodularium>]
]);

//recipes
function addMMRecipe(
    recipe_name as string, machine_name as string, time as int, energy as int,
    out as IItemStack[], input_iis as IItemStack[], input_iode as IOreDictEntry[], input_iode_amounts as int[], input_unconsumed as IItemStack[]
){
    print("start building " + recipe_name);
    var rec = RecipeBuilder.newBuilder(recipe_name, machine_name, time);

    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    for o in out{
        rec.addItemOutput(o);
    }

    for i in input_iis{
        rec.addItemInput(i);
    }
    for i, inp in input_iode{
        rec.addItemInput(inp * input_iode_amounts[i]);
    }
    for i in input_unconsumed{
        rec.addItemInput(i);
        rec.setChance(0.0);
    }
    rec.build();
    print("finish building " + recipe_name);
}


function addEarlySingularuty(sing as IItemStack, iten as IItemStack, time as int){
    var recipe = RecipeBuilder.newBuilder("tcp_" + sing.name, "tree_powered_compressor", time);
    recipe.addItemInput(iten * 256);
    recipe.addItemInput(<ore:treeSapling> * 4);
    recipe.addItemInput(<ore:fertilizer> * 16);
    recipe.addFluidInput(<fluid:water> * 1000);
    recipe.addItemOutput(sing);
    recipe.build();
}

function addItemInfoRecipe(items as IItemStack[], info as string[]){
    var recname = "info_";
    for item in items{
        recname += item.name;
    }
    var rec = RecipeBuilder.newBuilder(recname, "research_station", 20);
    rec.addEnergyPerTickInput(32);

    for item in items{
        rec.addItemInput(item);
        rec.setChance(0.0);
    }
    rec.addItemInput(<minecraft:paper>);

    rec.addItemOutput(<minecraft:paper>.withDisplayName("Information").withLore(info));
    rec.build();
}



//todo move
//addEarlySingularuty(<extendedcrafting:singularity_custom:100>, <minecraft:log>, );
{//wood
    var recipe = RecipeBuilder.newBuilder("tcp_wood", "tree_powered_compressor", 20*60*5);
    recipe.addItemInput(<ore:logWood> * 256);
    recipe.addItemInput(<ore:treeSapling> * 4);
    recipe.addItemInput(<ore:fertilizer> * 16);
    recipe.addFluidInput(<fluid:water> * 1000);
    recipe.addItemOutput(<extendedcrafting:singularity_custom:100>);
    recipe.build();
}
addEarlySingularuty(<extendedcrafting:singularity_custom:1>, <minecraft:flint>, 20*60*5);
addEarlySingularuty(<extendedcrafting:singularity_custom:2>, <minecraft:stone>, 20*60*4);
addEarlySingularuty(<extendedcrafting:singularity_custom:3>, <minecraft:glass>, 20*60*3);
