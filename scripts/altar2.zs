import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.contenttweaker.BlockState;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IVector3d;
import crafttweaker.world.IFacing;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;
import mods.requious.Variable;
import mods.requious.Parameter;

//red       metal
//yellow    amount
//green     gem
//blue      gatedness

static altar as Assembly = <assembly:altar2>;
altar.setDurationSlot(6, 2).setVisual(mods.requious.SlotVisual.arrowRight()).setGroup("duration");
altar.setTextSlot(0,0).setVisual(mods.requious.SlotVisual.create(7,1)).setRenderText("Last recipe\n §4o§0%d §6o§0%d §2o§0%d §bo§0%d", [
    "red", "yellow", "green", "blue"
]);
altar.setItemSlot(4, 4, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");

altar.setJEIItemSlot(0, 0, "red");
altar.setJEIItemSlot(1, 0, "yellow");
altar.setJEIItemSlot(2, 0, "green");
altar.setJEIItemSlot(3, 0, "blue");

altar.setJEIItemSlot(5, 0, "output");




static inputs as int[][IBlockState] = {
    <blockstate:minecraft:stone:variant=andesite>: [3, 1, 0, 0],
    <blockstate:minecraft:stone:variant=granite>: [2, 1, 0, 0],
    
    <blockstate:minecraft:concrete:color=red>: [1, 0, 0, 0],
    <blockstate:minecraft:concrete:color=yellow>: [0, 1, 0, 0],
    <blockstate:minecraft:concrete:color=green>: [0, 0, 1, 0],
    <blockstate:minecraft:concrete:color=blue>: [0, 0, 0, 1],

    <blockstate:minecraft:iron_ore>: [10, 3, 0, 0],
    <blockstate:thermalfoundation:ore:type=copper>: [8, 3, 0, 0],
};

static jei_info as int[][IItemStack] = {
    <minecraft:stone:5>: [3, 1, 0, 0],
    <minecraft:stone:1>: [2, 1, 0, 0],

    <minecraft:concrete:14>: [1, 0, 0, 0],
    <minecraft:concrete:4>: [0, 1, 0, 0],
    <minecraft:concrete:13>: [0, 0, 1, 0],
    <minecraft:concrete:11>: [0, 0, 0, 1],

    <minecraft:iron_ore>: [10, 3, 0, 0],
    <thermalfoundation:ore>: [8, 3, 0, 0],
};



{
    var recipe = AssemblyRecipe.create(function(container) {
        container.addWorldOutput(function(container){
            var states as IBlockState[] = [
                container.world.getBlockState(container.pos.getOffset(container.facing,1)),
                container.world.getBlockState(container.pos.getOffset(container.facing,2)),
                container.world.getBlockState(container.pos.getOffset(container.facing,3)),
                container.world.getBlockState(container.pos.getOffset(container.facing,4))
            ];

            if (states[0] == <blockstate:minecraft:air>) return true;
            if (states[1] == <blockstate:minecraft:air>) return true;
            if (states[2] == <blockstate:minecraft:air>) return true;
            if (states[3] == <blockstate:minecraft:air>) return true;

            var score as int[] = [0, 0, 0, 0];

            for state in states {
                if (inputs has state){
                    score[0] = score[0] + inputs[state][0];
                    score[1] = score[1] + inputs[state][1];
                    score[2] = score[2] + inputs[state][2];
                    score[3] = score[3] + inputs[state][3];
                }
            }

            //var score_str as string = "" ~ score[0] ~ " " ~ score[1] ~ " " ~ score[2] ~ " " ~ score[3];
            var good as bool = false;
            for state,scores in inputs{
                if (score[0]==scores[0])
                if (score[1]==scores[1])
                if (score[2]==scores[2])
                if (score[3]==scores[3]){
                    container.world.setBlockState(state, container.pos.getOffset(container.facing, 1));
                    container.world.setBlockState(state, container.pos.getOffset(container.facing, 2));
                    container.world.setBlockState(state, container.pos.getOffset(container.facing, 3));
                    container.world.setBlockState(state, container.pos.getOffset(container.facing, 4));
                    good = true;
                    break;
                }
                
            }
            if (!good){
                container.world.setBlockState(<blockstate:minecraft:dirt:snowy=false,variant=dirt> ,container.pos.getOffset(container.facing,1));
                container.world.setBlockState(<blockstate:minecraft:dirt:snowy=false,variant=dirt> ,container.pos.getOffset(container.facing,2));
                container.world.setBlockState(<blockstate:minecraft:dirt:snowy=false,variant=dirt> ,container.pos.getOffset(container.facing,3));
                container.world.setBlockState(<blockstate:minecraft:dirt:snowy=false,variant=dirt> ,container.pos.getOffset(container.facing,4));
            }
            
            container.setInteger("red", score[0]);
            container.setInteger("yellow", score[1]);
            container.setInteger("green", score[2]);
            container.setInteger("blue", score[3]);
                
            return true;
        });
        
    });
    
    //recipe.requireSelection("selection", icon, false);
    recipe.requireItem("input", <thermalfoundation:material>);
    recipe.setActive(200).requireDuration("duration", 200);
    

    altar.addRecipe(recipe);
}
for item,score in jei_info{
    
    var recipe = AssemblyRecipe.create(function(container) {
        container.addItemOutput("output", item);
        
    });
    if (score[0] != 0) recipe.requireItem("red",       <thermalfoundation:dye:1> * score[0]);
    if (score[1] != 0) recipe.requireItem("yellow",    <thermalfoundation:dye:11>* score[1]);
    if (score[2] != 0) recipe.requireItem("green",     <thermalfoundation:dye:2> * score[2]);
    if (score[3] != 0) recipe.requireItem("blue",      <thermalfoundation:dye:4> * score[3]);
    altar.addJEIRecipe(recipe);
}



mods.roots.Fey.addRecipe("altar2", <requious:altar2>, [
    <requious:altar>, <biomesoplenty:gem:7>, <biomesoplenty:gem:7>,
    <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>
]);
