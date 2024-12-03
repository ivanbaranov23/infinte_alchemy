import crafttweaker.item.IItemStack;

function addMBTooltip(mb as IItemStack, tooltips as string[IItemStack]){
    mb.addShiftTooltip("*", "Press shift for modifiers");
    
    for block,tooltip in tooltips{
        mb.addShiftTooltip(block.displayName);
        mb.addShiftTooltip("- " ~ game.localize(tooltip));
        block.addTooltip(game.localize("ia.mb_tooltip.common") ~ game.localize(tooltip));
    }
    
}

addMBTooltip(<modularcontroller:tree_powered_compressor_controller>, {<contenttweaker:slimy_glass>: "ia.mb_tooltip.tpc_sl_glass"});

addMBTooltip(<modularcontroller:large_cobblegen_controller>, {<contenttweaker:rune_water_block>: "ia.mb_tooltip.lcg_water",
    <contenttweaker:rune_fire_block>: "ia.mb_tooltip.lcg_fire",
    <minecraft:bedrock>: "ia.mb_tooltip.lcg_bedrock",
    <contenttweaker:neutronium_sheetmetal>: "ia.mb_tooltip.lcg_neutr"
});