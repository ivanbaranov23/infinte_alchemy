import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import scripts.helper.addCarryRecipe;

/*
: {
        sword: ,
        pick: ,
        axe: ,
        shovel: ,
        hoe: 
    }

: {
        mat: ,
        gem: ,
        stick: 
    }
*/

static tools as IItemStack[string][string] = {
    iron: {
        sword: <minecraft:iron_sword>,
        pick: <minecraft:iron_pickaxe>,
        axe: <minecraft:iron_axe>,
        shovel: <minecraft:iron_shovel>,
        hoe: <minecraft:iron_hoe>
    },
    gold: {
        sword: <minecraft:golden_sword>,
        pick: <minecraft:golden_pickaxe>,
        axe: <minecraft:golden_axe>,
        shovel: <minecraft:golden_shovel>,
        hoe: <minecraft:golden_hoe>
    },
    diamond: {
        sword: <minecraft:diamond_sword>,
        pick: <minecraft:diamond_pickaxe>,
        axe: <minecraft:diamond_axe>,
        shovel: <minecraft:diamond_shovel>,
        hoe: <minecraft:diamond_hoe>
    },
    limestone: {
        sword: <atum:limestone_sword>,
        pick: <atum:limestone_pickaxe>,
        axe: <atum:limestone_axe>,
        shovel: <atum:limestone_shovel>,
        hoe: <atum:limestone_hoe>
    },

    ironwood: {
        sword: <twilightforest:ironwood_sword>.withTag({ench: [{lvl: 1 as short, id: 19}]}),
        pick: <twilightforest:ironwood_pickaxe>.withTag({ench: [{lvl: 1 as short, id: 32}]}),
        axe: <twilightforest:ironwood_axe>.withTag({ench: [{lvl: 1 as short, id: 35}]}),
        shovel: <twilightforest:ironwood_shovel>.withTag({ench: [{lvl: 1 as short, id: 34}]}),
        hoe: <twilightforest:ironwood_hoe>
    },

    amethyst: {
        sword: <mysticalworld:amethyst_sword>,
        pick: <mysticalworld:amethyst_pickaxe>,
        axe: <mysticalworld:amethyst_axe>,
        shovel: <mysticalworld:amethyst_shovel>,
        hoe: <mysticalworld:amethyst_hoe>
    }
};
static materials as IIngredient[string][string] = {
    iron: {
        mat: <thermalfoundation:material:32>
    },
    gold: {
        mat: <thermalfoundation:material:33>
    },
    diamond: {
        mat: <moreplates:diamond_plate>,
        gem: <minecraft:diamond>,
        stick: <immersiveengineering:material:1>
    },

    limestone: {
        mat: <atum:limestone_cracked> | <atum:limestone>,
        stick: <atum:deadwood_stick> | <atum:dusty_bone_stick>
    },

    ironwood: {
        mat: <moreplates:ironwood_plate>,
        gem: <moreplates:ironwood_gear>,
        stick: <moreplates:constantan_stick>
    },

    amethyst: {
        mat: <mysticalworld:amethyst_block>,
        stick: <enderio:item_material:8>
    }
};


for tool_mat in tools{
    var mat as IIngredient = materials[tool_mat].mat;
    var gem as IIngredient;
    var stick as IIngredient;

    if (materials[tool_mat] has "gem"){
        gem = materials[tool_mat].gem;
    }else{
        gem = mat;
    }

    if (materials[tool_mat] has "stick"){
        stick = materials[tool_mat].stick;
    }else{
        stick = <minecraft:stick>;
    }

    for tool_name,tool in tools[tool_mat]{
        recipes.remove(tool);

        if (tool_name == "sword")
            recipes.addShaped(tool_mat ~ "_" ~ tool_name, tool, [
                [mat], 
                [gem], 
                [stick]
            ]);
        
        if (tool_name == "pick")
            recipes.addShaped(tool_mat ~ "_" ~ tool_name, tool, [
                [mat, gem, mat], 
                [null, stick, null], 
                [null, stick, null]
            ]);
        if (tool_name == "axe")
            recipes.addShaped(tool_mat ~ "_" ~ tool_name, tool, [
                [mat, gem], 
                [mat, stick], 
                [null, stick]
            ]);
        if (tool_name == "shovel")
            recipes.addShaped(tool_mat ~ "_" ~ tool_name, tool, [
                [gem], 
                [stick], 
                [stick]
            ]);
        if (tool_name == "hoe")
            recipes.addShaped(tool_mat ~ "_" ~ tool_name, tool, [
                [mat, gem], 
                [null, stick], 
                [null, stick]
            ]);
    }
}


for t in [
    <mysticalworld:copper_pickaxe>,
    <mysticalworld:copper_axe>,
    <mysticalworld:copper_sword>,
    <mysticalworld:copper_hoe>,
    <mysticalworld:copper_shovel>,

    <mysticalworld:silver_pickaxe>,
    <mysticalworld:silver_axe>,
    <mysticalworld:silver_sword>,
    <mysticalworld:silver_hoe>,
    <mysticalworld:silver_shovel>
] as IItemStack[]{
    mods.jei.JEI.removeAndHide(t);
}


//dark
recipes.remove(<enderio:item_dark_steel_pickaxe>);
recipes.remove(<enderio:item_dark_steel_axe>);
recipes.remove(<enderio:item_dark_steel_sword>);
recipes.addShaped("ia_dark_pick", <enderio:item_dark_steel_pickaxe>, [
    [<moreplates:dark_steel_plate>, <redstonearsenal:tool.pickaxe_flux>, <moreplates:dark_steel_plate>],
    [null, <enderio:item_material:8>, null],
    [null, <enderio:item_material:8>, null]
]);
recipes.addShaped("ia_dark_axe", <enderio:item_dark_steel_axe>, [
    [<moreplates:dark_steel_plate>, <redstonearsenal:tool.axe_flux>, null],
    [<moreplates:dark_steel_plate>, <enderio:item_material:8>, null],
    [null, <enderio:item_material:8>, null]
]);
recipes.addShaped("ia_dark_sword", <enderio:item_dark_steel_sword>, [
    [<moreplates:dark_steel_plate>],
    [<redstonearsenal:tool.sword_flux>],
    [<enderio:item_material:8>]
]);
//addCarryRecipe(<enderio:item_dark_steel_pickaxe>, <redstonearsenal:tool.pickaxe_flux>.withTag({Energy: 0}), other as IIngredient[][])