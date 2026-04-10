import crafttweaker.item.IItemStack;

function addMultiLineTooltip(item as IItemStack, tooltip as string, number as int){
    item.addShiftTooltip("Info:", "Press shift for info");
    item.addShiftTooltip("- - - - -");
    for i in 0 to number{
        item.addShiftTooltip(game.localize("ia.tooltip." ~ tooltip ~ i));
    }
}



addMultiLineTooltip(<requious:altar>, "ore_altar", 8);
addMultiLineTooltip(<requious:altar2>, "trans_altar", 12);

addMultiLineTooltip(<requious:sorter_food>, "sorter_food", 5);
addMultiLineTooltip(<requious:sorter_livespan>, "sorter_lifespan", 5);

addMultiLineTooltip(<modularmachinery:research_station_controller>, "research_tooltip", 11);

addMultiLineTooltip(<requious:void_infuser>, "void_infuser", 20);