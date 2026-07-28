recipes.remove(<botania:terraplate>);
mods.extendedcrafting.TableCrafting.addShaped(0, <botania:terraplate>, [
    [null, null, null, null, null], 
    [<minecraft:lapis_block>, <minecraft:lapis_block>, <contenttweaker:poisotheum>, <minecraft:lapis_block>, <minecraft:lapis_block>], 
    [<moreplates:manasteel_gear>, <botania:rune:6>, <extendedcrafting:singularity_custom:23>, <botania:rune:5>, <moreplates:manasteel_gear>], 
    [<moreplates:draconium_gear>, <contenttweaker:slate_7>, <contenttweaker:mana_frame>, <contenttweaker:slate_7>, <moreplates:draconium_gear>], 
    [<moreplates:manasteel_gear>, <botania:rune:4>, <botania:rune:8>, <botania:rune:7>, <moreplates:manasteel_gear>]
]);


scripts.content_machines.addBioAssemblerRecipe(
    [<contenttweaker:terra_coral>], null,
    [<botania:storage:1> * 3, <contenttweaker:life> * 8, <contenttweaker:coral_dust> * 64], [],
    <contenttweaker:research_terra>,
    20, 100000
);
scripts.content_machines.addBioAssemblerRecipe(
    [<mysticalagriculture:terrasteel_seeds>], null,
    [<botania:storage:1> * 3, <contenttweaker:life> * 8, <mysticalagriculture:crafting:21> * 4], [],
    <contenttweaker:research_terra>,
    20, 100000
);


//terra
scripts.ore_processing.addTingalumOvenRecipe([<contenttweaker:terra_base>], [<contenttweaker:terra_base_dust>], 1000 * 1000, 10, 1000);
scripts.ore_processing.addTingalumOvenRecipe([<botania:manaresource:4>], [
    <contenttweaker:terra_base>, 
    <extendedcrafting:singularity_custom:11>,
    <roots:terra_moss> * 64,
    <contenttweaker:terrabit>
], 100 * 1000 * 1000, 40, 4000);



mods.botaniatweaks.Agglomeration.addRecipe(
        <botania:manaresource:4> * 2,
        [
            <botania:manaresource>,
            <botania:manaresource:1>,
            <botania:manaresource:2>,
            <contenttweaker:terra_coral>
        ],
        500000,
        0xf6faab,
        0x7dd2e0,
        <contenttweaker:entwood_block>, <contenttweaker:entwood_block>, <actuallyadditions:block_crystal:1>,
        null, null, <minecraft:lapis_block>
);

mods.botaniatweaks.Agglomeration.addRecipe(
        <botania:storage:1>,
        [
            <botania:storage:3>,
            <botania:storage>,
            <contenttweaker:manapearl_block>
        ],
        1000000 * 4,
        0xf6faab,
        0x7dd2e0,
        <contenttweaker:terracrux>, <botania:shimmerrock>, <botania:shimmerrock>,
        null, null, null
);
    
mods.botaniatweaks.Agglomeration.addRecipe(
        <botania:storage:1>,
        [
            <contenttweaker:terra_base>,
            <contenttweaker:mana_charged_ingot>,
            <contenttweaker:rare_gem>
        ],
        500000 * 1,
        0xf6faab,
        0x7dd2e0,
        <contenttweaker:terracrux>, <botania:shimmerrock>, <botania:shimmerrock>,
        null, null, null
);
mods.botaniatweaks.Agglomeration.addRecipe(
        <botania:storage:1>,
        [
            <contenttweaker:fey_ingot>,
            <contenttweaker:mana_charged_ingot>,
            <contenttweaker:rare_gem>
        ],
        500000 * 1,
        0xf6faab,
        0x7dd2e0,
        <contenttweaker:terracrux>, <botania:shimmerrock>, <botania:shimmerrock>,
        null, null, null
);






recipes.addShaped("terracrux", <contenttweaker:terracrux>, [
        [<contenttweaker:terragem>, <moreplates:terrasteel_plate>, <contenttweaker:terragem>], 
        [<moreplates:terrasteel_plate>, <contenttweaker:manapearl_block>, <moreplates:terrasteel_plate>], 
        [<contenttweaker:terragem>, <moreplates:terrasteel_plate>, <contenttweaker:terragem>]
]);

    //terrabit
recipes.addShapeless("ia_terra_bit", <contenttweaker:terrabit>, [
        <botania:manaresource:18>,
        <contenttweaker:entangled_particles>,
        <contenttweaker:biotite_dust>,
        <contenttweaker:biotite_dust>,
        <contenttweaker:neodymium_dust>
]);
scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:terrabit> * 3], null,
        [
            <botania:manaresource:18> * 2,
            <contenttweaker:neodymium_ingot>,
            <contenttweaker:entangled_particles>,
            <atum:ectoplasm> * 64
        ], [
            <liquid:biotite> * 250
        ], <contenttweaker:research_terra>, 
        40, 1000
);
scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:terrabit> * 7], null,
        [
            <botania:manaresource:18> * 2,
            <contenttweaker:neodymium_ingot>,
            <contenttweaker:entangled_particles> * 2,
            <atum:ectoplasm> * 64
        ], [
            <liquid:data> * 100
        ], <contenttweaker:research_terra>, 
        40, 1000
);