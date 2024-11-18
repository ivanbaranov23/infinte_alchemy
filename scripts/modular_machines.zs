#priority 1001

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

recipes.removeByMod("modularmachinery");

static gears as IItemStack[] = [
    <thermalfoundation:material:291>,       //0
    <thermalfoundation:material:291>,       //1
    <contenttweaker:duraluminum_gear>,      //2
    <contenttweaker:mekanized_steel_gear>,  //3
    <enderio:item_material:73>,             //4
    <tconevo:metal:29>,                     //5
    <moreplates:awakened_draconium_gear>,   //6
    <moreplates:neutronium_gear>            //7
];
static sides as IItemStack[] = [
    null,       //0
    null,       //1
    <contenttweaker:basic_modularium>,      //2
    <mekanism:controlcircuit:3>,            //3
    <enderio:item_material:18>,             //4
    <bloodmagic:component:27>,              //5
    <astralsorcery:itemcoloredlens:6>,      //6
    <draconicevolution:awakened_core>       //7
];
static corners as IItemStack[] = [
    null,       //0
    null,       //1
    null,       //2
    <contenttweaker:basic_modularium>,  //3
    <contenttweaker:basic_modularium>,  //4
    <modularmachinery:itemmodularium>,  //5
    <modularmachinery:itemmodularium>,  //6
    <extendedcrafting:material:32>      //7
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




recipes.addShaped("mm_blockcasing",
    <modularmachinery:blockcasing> * 2,
    [[null, <contenttweaker:basic_modularium>, null],
    [<contenttweaker:basic_modularium>, <ore:blockGlass>, <contenttweaker:basic_modularium>],
    [null, <contenttweaker:basic_modularium>, null]]
);
recipes.addShaped("mm_blockcasing2", <modularmachinery:blockcasing:4>, [
	[<modularmachinery:itemmodularium>, <contenttweaker:calitunti_plate>, <modularmachinery:itemmodularium>], 
	[<ore:alloyElite>, <modularmachinery:blockcasing>, <ore:alloyElite>], 
	[<modularmachinery:itemmodularium>, <contenttweaker:calitunti_plate>, <modularmachinery:itemmodularium>]
]);



//hatches
/*recipes.addShaped("mm_item_input_small",
    <modularmachinery:blockinputbus:1>,
    [[<tconstruct:wooden_hopper>], [<modularmachinery:blockcasing>], [<ore:gearBronze>]]
);*/
{
    //this is awful
    //item input 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockinputbus:1>, <tconstruct:wooden_hopper>, false);
    addMMPartRecipe(2, <modularmachinery:blockinputbus:1>, <modularmachinery:blockinputbus:2>, <minecraft:hopper>, false);
    addMMPartRecipe(3, <modularmachinery:blockinputbus:2>, <modularmachinery:blockinputbus:3>, <mob_grinding_utils:absorption_hopper>, false);
    addMMPartRecipe(4, <modularmachinery:blockinputbus:3>, <modularmachinery:blockinputbus:4>, <enderio:block_impulse_hopper>, false);
    addMMPartRecipe(6, <modularmachinery:blockinputbus:4>, <modularmachinery:blockinputbus:5>, <botania:specialflower>.withTag({type: "hopperhock"}), false);
    addMMPartRecipe(7, <modularmachinery:blockinputbus:5>, <modularmachinery:blockinputbus:6>, <draconicevolution:draconium_chest>, false);

    //item output 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockoutputbus:1>, <tconstruct:wooden_hopper>, true);
    addMMPartRecipe(2, <modularmachinery:blockoutputbus:1>, <modularmachinery:blockoutputbus:2>, <minecraft:hopper>, true);
    addMMPartRecipe(3, <modularmachinery:blockoutputbus:2>, <modularmachinery:blockoutputbus:3>, <mob_grinding_utils:absorption_hopper>, true);
    addMMPartRecipe(4, <modularmachinery:blockoutputbus:3>, <modularmachinery:blockoutputbus:4>, <enderio:block_impulse_hopper>, true);
    addMMPartRecipe(6, <modularmachinery:blockoutputbus:4>, <modularmachinery:blockoutputbus:5>, <botania:specialflower>.withTag({type: "hopperhock"}), true);
    addMMPartRecipe(7, <modularmachinery:blockoutputbus:5>, <modularmachinery:blockoutputbus:6>, <draconicevolution:draconium_chest>, true);    


    //fluid input 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockfluidinputhatch:1>, <erebus:bambucket>.withTag({}), false);
    addMMPartRecipe(2, <modularmachinery:blockfluidinputhatch:1>, <modularmachinery:blockfluidinputhatch:2>, <minecraft:bucket>, false);
    addMMPartRecipe(3, <modularmachinery:blockfluidinputhatch:2>, <modularmachinery:blockfluidinputhatch:3>, <fluiddrawers:tank>, false);
    addMMPartRecipe(4, <modularmachinery:blockfluidinputhatch:3>, <modularmachinery:blockfluidinputhatch:4>, <enderio:block_tank>, false);
    addMMPartRecipe(5, <modularmachinery:blockfluidinputhatch:4>, <modularmachinery:blockfluidinputhatch:5>, <bloodmagic:blood_tank:2>, false);
    addMMPartRecipe(6, <modularmachinery:blockfluidinputhatch:5>, <modularmachinery:blockfluidinputhatch:6>, <astralsorcery:blockwell>, false);
    addMMPartRecipe(7, <modularmachinery:blockfluidinputhatch:6>, <modularmachinery:blockfluidinputhatch:7>, <alchemistry:xenon_light>, false);

    //fluid output 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockfluidoutputhatch:1>, <erebus:bambucket>.withTag({}), true);
    addMMPartRecipe(2, <modularmachinery:blockfluidoutputhatch:1>, <modularmachinery:blockfluidoutputhatch:2>, <minecraft:bucket>, true);
    addMMPartRecipe(3, <modularmachinery:blockfluidoutputhatch:2>, <modularmachinery:blockfluidoutputhatch:3>, <fluiddrawers:tank>, true);
    addMMPartRecipe(4, <modularmachinery:blockfluidoutputhatch:3>, <modularmachinery:blockfluidoutputhatch:4>, <enderio:block_tank>, true);
    addMMPartRecipe(5, <modularmachinery:blockfluidoutputhatch:4>, <modularmachinery:blockfluidoutputhatch:5>, <bloodmagic:blood_tank:2>, true);
    addMMPartRecipe(6, <modularmachinery:blockfluidoutputhatch:5>, <modularmachinery:blockfluidoutputhatch:6>, <astralsorcery:blockwell>, true);
    addMMPartRecipe(7, <modularmachinery:blockfluidoutputhatch:6>, <modularmachinery:blockfluidoutputhatch:7>, <alchemistry:xenon_light>, true);


    //energy input
    //addMMPartRecipe(0, <modularmachinery:blockcasing>, <modularmachinery:blockenergyinputhatch:0>, <erebus:bambucket>.withTag({}), false);
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockenergyinputhatch:1>, <immersiveengineering:metal_decoration0>, false);
    addMMPartRecipe(2, <modularmachinery:blockenergyinputhatch:1>, <modularmachinery:blockenergyinputhatch:2>, <immersiveengineering:metal_device0:2>, false);
    addMMPartRecipe(3, <modularmachinery:blockenergyinputhatch:2>, <modularmachinery:blockenergyinputhatch:3>, <mekanism:energycube>.withTag({tier: 0}), false);
    addMMPartRecipe(4, <modularmachinery:blockenergyinputhatch:3>, <modularmachinery:blockenergyinputhatch:4>, <enderio:block_cap_bank:2>, false);
    addMMPartRecipe(5, <modularmachinery:blockenergyinputhatch:4>, <modularmachinery:blockenergyinputhatch:5>, <botania:manavoid>, false);
    addMMPartRecipe(6, <modularmachinery:blockenergyinputhatch:5>, <modularmachinery:blockenergyinputhatch:6>, <draconicevolution:draconium_capacitor:1>, false);
    addMMPartRecipe(7, <modularmachinery:blockenergyinputhatch:6>, <modularmachinery:blockenergyinputhatch:7>, <draconicevolution:chaos_shard>, false);

    //energy output 
    addMMPartRecipe(1, <modularmachinery:blockcasing>, <modularmachinery:blockenergyoutputhatch:1>, <immersiveengineering:metal_decoration0>, true);
    addMMPartRecipe(2, <modularmachinery:blockenergyoutputhatch:1>, <modularmachinery:blockenergyoutputhatch:2>, <immersiveengineering:metal_device0:2>, true);
    addMMPartRecipe(3, <modularmachinery:blockenergyoutputhatch:2>, <modularmachinery:blockenergyoutputhatch:3>, <mekanism:energycube>.withTag({tier: 0}), true);
    addMMPartRecipe(4, <modularmachinery:blockenergyoutputhatch:3>, <modularmachinery:blockenergyoutputhatch:4>, <enderio:block_cap_bank:2>, true);
    addMMPartRecipe(5, <modularmachinery:blockenergyoutputhatch:4>, <modularmachinery:blockenergyoutputhatch:5>, <botania:manavoid>, true);
    addMMPartRecipe(6, <modularmachinery:blockenergyoutputhatch:5>, <modularmachinery:blockenergyoutputhatch:6>, <draconicevolution:draconium_capacitor:1>, true);
    addMMPartRecipe(7, <modularmachinery:blockenergyoutputhatch:6>, <modularmachinery:blockenergyoutputhatch:7>, <draconicevolution:chaos_shard>, true);

}

{//others
    recipes.addShaped("mm_heat_input", <modulardiversity:blockhotairinputhatch>, [
        [<modularmachinery:itemmodularium>, <prodigytech:circuit_perfected>, <modularmachinery:itemmodularium>], 
        [<ore:blockZorrasteel>, <modularmachinery:blockcasing>, <ore:blockZorrasteel>], 
        [<modularmachinery:itemmodularium>, <prodigytech:capacitor_charger>, <modularmachinery:itemmodularium>]
    ]);
    recipes.addShaped("mm_heat_pouput", <modulardiversity:blockhotairoutputhatch>, [
        [<modularmachinery:itemmodularium>, <prodigytech:capacitor_aeroheater>, <modularmachinery:itemmodularium>], 
        [<prodigytech:zorrasteel_block>, <modularmachinery:blockcasing>, <prodigytech:zorrasteel_block>], 
        [<modularmachinery:itemmodularium>, <prodigytech:circuit_perfected>, <modularmachinery:itemmodularium>]
    ]);

    recipes.addShaped("ia_mm_laser_input", <modulardiversity:blockmeklaseracceptor>, [
        [<contenttweaker:osgloridium_plate>, <solarflux:mirror>, <contenttweaker:osgloridium_plate>], 
        [<quantumflux:craftingpiece:2>, <modularmachinery:blockcasing:4>, <quantumflux:craftingpiece:2>], 
        [<contenttweaker:osgloridium_plate>, <solarflux:mirror>, <contenttweaker:osgloridium_plate>]
    ]);

    recipes.addShaped("ia_mm_grid_input", <modularmagic:blockgridproviderinput>, [
        [<extrautils2:decorativesolid:3>, <extrautils2:suncrystal>, <extrautils2:decorativesolid:3>], 
        [<moreplates:enchanted_plate>, <modularmachinery:blockcasing:4>, <moreplates:enchanted_plate>], 
        [<extrautils2:decorativesolid:3>, <ore:gemMoon>, <extrautils2:decorativesolid:3>]
    ]);
    recipes.addShaped("ia_mm_grid_output", <modularmagic:blockgridprovideroutput>, [
        [<extrautils2:decorativesolid:8>, <extrautils2:suncrystal>, <extrautils2:decorativesolid:8>], 
        [<ore:plateEvilMetal>, <modularmachinery:blockcasing:4>, <ore:plateEvilMetal>], 
        [<extrautils2:decorativesolid:8>, <ore:gemMoon>, <extrautils2:decorativesolid:8>]
    ]);

    {//will
        mods.bloodmagic.TartaricForge.addRecipe(<modularmagic:blockwillproviderinput>, [
            <bloodmagic:demon_crystallizer>,
            <bloodmagic:demon_extras:10>,
            <modularmachinery:blockcasing:4>,
            <bloodmagic:demon_will_gauge>
        ], 1200, 200);

        mods.bloodmagic.TartaricForge.addRecipe(<modularmagic:blockwillprovideroutput>, [
            <bloodmagic:demon_crucible>,
            <bloodmagic:demon_extras:10>,
            <modularmachinery:blockcasing:4>,
            <bloodmagic:demon_will_gauge>
        ], 1200, 200);
    }

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
recipes.addShaped("ia_mm_heat_input", <modulardiversity:blockmekheatinput>, [
	[<contenttweaker:thermal_plate>, <prodigytech:heat_capacitor_1>, <contenttweaker:thermal_plate>], 
	[<ore:xuRedstoneCoil>, <modularmachinery:blockcasing:4>, <ore:xuRedstoneCoil>], 
	[<contenttweaker:thermal_plate>, <immersiveengineering:metal_device1:1>, <contenttweaker:thermal_plate>]
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
        rec.addItemInput(inp, input_iode_amounts[i]);
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
    recipe.addItemInput(<ore:treeSapling>, 4);
    recipe.addItemInput(<minecraft:dye:15> * 16);
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
mods.jei.JEI.hideCategory("modularmachinery.recipes.research_station");


addMMRecipe("high_oven_glass1", "high_oven", 15*20, 32, 
[<minecraft:glass> * 12], 
[<quark:glass_shards> * 4, <appliedenergistics2:material:3> * 4, <minecraft:sand> * 16], [], [], [<contenttweaker:research_glass_making>]);
addMMRecipe("high_oven_glass2", "high_oven", 15*20, 32, 
[<minecraft:glass> * 16], 
[<mysticalworld:silver_dust_tiny> * 4, <appliedenergistics2:material:3> * 4, <minecraft:sand> * 16], [], [], [<contenttweaker:research_glass_making>]);



//addEarlySingularuty(<extendedcrafting:singularity_custom:100>, <minecraft:log>, );
{//wood
    var recipe = RecipeBuilder.newBuilder("tcp_wood", "tree_powered_compressor", 20*60*5);
    recipe.addItemInput(<ore:logWood>, 256);
    recipe.addItemInput(<ore:treeSapling>, 4);
    recipe.addItemInput(<minecraft:dye:15> * 16);
    recipe.addFluidInput(<fluid:water> * 1000);
    recipe.addItemOutput(<extendedcrafting:singularity_custom:100>);
    recipe.build();
}
addEarlySingularuty(<extendedcrafting:singularity_custom:1>, <minecraft:flint>, 20*60*5);
addEarlySingularuty(<extendedcrafting:singularity_custom:2>, <minecraft:stone>, 20*60*4);
addEarlySingularuty(<extendedcrafting:singularity_custom:3>, <minecraft:glass>, 20*60*3);
