import crafttweaker.item.IItemStack;

function addMBTooltip(mb as IItemStack, tooltips as string[IItemStack]){
    mb.addShiftTooltip("*", "Press shift for modifiers");
    
    for block,tooltip in tooltips{
        mb.addShiftTooltip(block.displayName);
        mb.addShiftTooltip("- " ~ game.localize(tooltip));
        block.addTooltip(game.localize("ia.mb_tooltip.common") ~ game.localize(tooltip));
    }
    
}

addMBTooltip(<modularmachinery:tree_powered_compressor_controller>, {<contenttweaker:slimy_glass>: "ia.mb_tooltip.tpc_sl_glass"});


addMBTooltip(<modularmachinery:bug_hill_controller>, {
    <contenttweaker:bug_hill_exit2>: "ia.mb_tooltip.bh_exit2",
    <contenttweaker:bug_hill_exit3>: "ia.mb_tooltip.bh_exit3",
    <tconstruct:soil:5>: "ia.mb_tooltip.bh_orange",
    <tconevo:earth_material_block>: "ia.mb_tooltip.bh_pink",
    <contenttweaker:mushroomite_mud>: "ia.mb_tooltip.bh_mushroomite",
    <twilightforest:root:1>: "ia.mb_tooltip.bh_root",
    <contenttweaker:glowshroomite_mud>: "ia.mb_tooltip.bh_glowshroomite",
    <contenttweaker:divine_mud>: "ia.mb_tooltip.bh_divine"
});
addMBTooltip(<modularmachinery:large_sifter_controller>, {
    <contenttweaker:grate>: "ia.mb_tooltip.ls_grate1",
    <contenttweaker:lucky_gearbox>: "ia.mb_tooltip.ls_grate2",
});


addMBTooltip(<modularmachinery:essence_extractor_controller>, {
    <contenttweaker:essence_pump1>: "ia.mb_tooltip.ee_pump1",
    <contenttweaker:essence_pump2>: "ia.mb_tooltip.ee_pump2",
    <contenttweaker:essence_pump3>: "ia.mb_tooltip.ee_pump3",
    <contenttweaker:essence_pump4>: "ia.mb_tooltip.ee_pump4",
    <contenttweaker:essence_pump5>: "ia.mb_tooltip.ee_pump5",
    <contenttweaker:essence_pump6>: "ia.mb_tooltip.ee_pump6",
});


addMBTooltip(<modularmachinery:large_cobblegen_controller>, {
    <contenttweaker:rune_water_block>: "ia.mb_tooltip.lcg_water",
    <contenttweaker:rune_fire_block>: "ia.mb_tooltip.lcg_fire",
    <minecraft:bedrock>: "ia.mb_tooltip.lcg_bedrock",
    <contenttweaker:neutronium_sheetmetal>: "ia.mb_tooltip.lcg_neutr"
});