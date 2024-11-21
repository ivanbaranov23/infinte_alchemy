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
        hoe: <minecraft:iron_hoe>,

        hammer: <thermalfoundation:tool.hammer_iron>
    },
    copper: {
        sword: <thermalfoundation:tool.sword_copper>,
        pick: <thermalfoundation:tool.pickaxe_copper>,
        shovel: <thermalfoundation:tool.shovel_copper>,
        axe: <thermalfoundation:tool.axe_copper>,
        hoe: <thermalfoundation:tool.hoe_copper>,

        hammer: <thermalfoundation:tool.hammer_copper>
    },
    tin: {
        sword: <thermalfoundation:tool.sword_tin>,
        pick: <thermalfoundation:tool.pickaxe_tin>,
        shovel: <thermalfoundation:tool.shovel_tin>,
        axe: <thermalfoundation:tool.axe_tin>,
        hoe: <thermalfoundation:tool.hoe_tin>,

        hammer: <thermalfoundation:tool.hammer_tin>
    },

    nickel: {
        sword: <thermalfoundation:tool.sword_nickel>,
        shovel: <thermalfoundation:tool.shovel_nickel>,
        pick: <thermalfoundation:tool.pickaxe_nickel>,
        axe: <thermalfoundation:tool.axe_nickel>,
        hoe: <thermalfoundation:tool.hoe_nickel>,
        hammer: <thermalfoundation:tool.hammer_nickel>
    },
    aluminum: {
        sword: <thermalfoundation:tool.sword_aluminum>,
        shovel: <thermalfoundation:tool.shovel_aluminum>,
        pick: <thermalfoundation:tool.pickaxe_aluminum>,
        axe: <thermalfoundation:tool.axe_aluminum>,
        hoe: <thermalfoundation:tool.hoe_aluminum>,
        hammer: <thermalfoundation:tool.hammer_aluminum>
    },

    bronze: {
        sword: <thermalfoundation:tool.sword_bronze>,
        shovel: <thermalfoundation:tool.shovel_bronze>,
        pick: <thermalfoundation:tool.pickaxe_bronze>,
        axe: <thermalfoundation:tool.axe_bronze>,
        hoe: <thermalfoundation:tool.hoe_bronze>,
        hammer: <thermalfoundation:tool.hammer_bronze>
    },
    constantan: {
        sword: <thermalfoundation:tool.sword_constantan>,
        shovel: <thermalfoundation:tool.shovel_constantan>,
        pick: <thermalfoundation:tool.pickaxe_constantan>,
        axe: <thermalfoundation:tool.axe_constantan>,
        hoe: <thermalfoundation:tool.hoe_constantan>,
        hammer: <thermalfoundation:tool.hammer_constantan>
    },
    invar: {
        sword: <thermalfoundation:tool.sword_invar>,
        shovel: <thermalfoundation:tool.shovel_invar>,
        pick: <thermalfoundation:tool.pickaxe_invar>,
        axe: <thermalfoundation:tool.axe_invar>,
        hoe: <thermalfoundation:tool.hoe_invar>,
        hammer: <thermalfoundation:tool.hammer_invar>
    },

    gold: {
        sword: <minecraft:golden_sword>,
        pick: <minecraft:golden_pickaxe>,
        axe: <minecraft:golden_axe>,
        shovel: <minecraft:golden_shovel>,
        hoe: <minecraft:golden_hoe>,

        hammer: <thermalfoundation:tool.hammer_gold>
    },
    lead: {
        sword: <thermalfoundation:tool.sword_lead>,
        shovel: <thermalfoundation:tool.shovel_lead>,
        pick: <thermalfoundation:tool.pickaxe_lead>,
        axe: <thermalfoundation:tool.axe_lead>,
        hoe: <thermalfoundation:tool.hoe_lead>,
        hammer: <thermalfoundation:tool.hammer_lead>
    },
    silver: {
        sword: <thermalfoundation:tool.sword_silver>,
        shovel: <thermalfoundation:tool.shovel_silver>,
        pick: <thermalfoundation:tool.pickaxe_silver>,
        axe: <thermalfoundation:tool.axe_silver>,
        hoe: <thermalfoundation:tool.hoe_silver>,
        hammer: <thermalfoundation:tool.hammer_silver>
    },

    steel: {
        sword: <immersiveengineering:sword_steel>,
        pick: <immersiveengineering:pickaxe_steel>,
        shovel: <immersiveengineering:shovel_steel>,
        axe: <immersiveengineering:axe_steel>,
        hoe: <immersiveengineering:hoe_steel>
    },
    electrum: {
        sword: <thermalfoundation:tool.sword_electrum>,
        shovel: <thermalfoundation:tool.shovel_electrum>,
        pick: <thermalfoundation:tool.pickaxe_electrum>,
        axe: <thermalfoundation:tool.axe_electrum>,
        hoe: <thermalfoundation:tool.hoe_electrum>,
        hammer: <thermalfoundation:tool.hammer_electrum>
    },

    platinum: {
        sword: <thermalfoundation:tool.sword_platinum>,
        shovel: <thermalfoundation:tool.shovel_platinum>,
        pick: <thermalfoundation:tool.pickaxe_platinum>,
        axe: <thermalfoundation:tool.axe_platinum>,
        hoe: <thermalfoundation:tool.hoe_platinum>,
        hammer: <thermalfoundation:tool.hammer_platinum>
    },


    diamond: {
        sword: <minecraft:diamond_sword>,
        pick: <minecraft:diamond_pickaxe>,
        axe: <minecraft:diamond_axe>,
        shovel: <minecraft:diamond_shovel>,
        hoe: <minecraft:diamond_hoe>,

        hammer: <thermalfoundation:tool.hammer_diamond>
    },
    emerald: {
        sword: <actuallyadditions:item_sword_emerald>,
        pick: <actuallyadditions:item_pickaxe_emerald>,
        axe: <actuallyadditions:item_axe_emerald>,
        shovel: <actuallyadditions:item_shovel_emerald>,
        hoe: <actuallyadditions:item_hoe_emerald>
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
    copper: {
        mat: <thermalfoundation:material:320>
    },
    tin: {
        mat: <thermalfoundation:material:321>
    },

    nickel: {
        mat: <thermalfoundation:material:325>
    },
    aluminum: {
        mat: <thermalfoundation:material:324>
    },

    bronze: {
        mat: <thermalfoundation:material:355>
    },
    constantan: {
        mat: <thermalfoundation:material:356>
    },
    invar: {
        mat: <thermalfoundation:material:354>
    },

    gold: {
        mat: <thermalfoundation:material:33>
    },
    lead: {
        mat: <thermalfoundation:material:323>
    },
    silver: {
        mat: <thermalfoundation:material:322>
    },

    steel: {
        mat: <thermalfoundation:material:352>,
        stick: <immersiveengineering:material>
    },
    electrum: {
        mat: <thermalfoundation:material:353>
    },

    platinum: {
        mat: <thermalfoundation:material:326>
    },

    diamond: {
        mat: <moreplates:diamond_plate>,
        gem: <minecraft:diamond>,
        stick: <immersiveengineering:material:1>
    },
    emerald: {
        mat: <moreplates:emerald_plate>
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
        
        if (tool_name == "hammer")
            recipes.addShaped(tool_mat ~ "_" ~ tool_name, tool, [
                [tools[tool_mat].pick, gem, tools[tool_mat].pick], 
                [mat, stick, mat], 
                [null, stick, null]
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
    <mysticalworld:silver_shovel>,

    <thermalfoundation:tool.sword_steel>,
    <thermalfoundation:tool.shovel_steel>,
    <thermalfoundation:tool.pickaxe_steel>,
    <thermalfoundation:tool.axe_steel>,
    <thermalfoundation:tool.hoe_steel>
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