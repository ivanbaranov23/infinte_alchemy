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
    <blockstate:minecraft:stone:variant=diorite>: [2, 1, 1, 0],
    <blockstate:quark:jasper:variant=stone_jasper>: [-1, 3, 0, 0],
    <blockstate:quark:limestone:variant=stone_limestone>: [0, 0, 3, 1],
    <blockstate:quark:marble:variant=stone_marble>: [0, 3, 0, 1],

    <blockstate:minecraft:sand:variant=sand>: [1, 1, 1, 0],
    <blockstate:minecraft:gravel>: [0, 2, -1, 0],
    <blockstate:minecraft:obsidian>: [2, -1, 2, 0],
    <blockstate:minecraft:glass>: [3, 0, -1, 1],
    <blockstate:exnihilocreatio:block_dust>: [-5, 2, -4, 5],
    <blockstate:erebus:mud>: [5, -8, 2, 10],
    <blockstate:contenttweaker:umberrack_bricks>: [9, 5, -7, 0],
    <blockstate:contenttweaker:burned_slimedirt>: [5, -1, -2, -8],

    <blockstate:extrautils2:compressedcobblestone:compression_level_cobblestone=1>: [1, 4, 4, -5],
    <blockstate:extrautils2:compressedgravel:compression_level_gravel=1>: [3, -3, 7, -2],
    <blockstate:extrautils2:compressedsand:compression_level_sand=1>: [1, 7, -2, -2],

    <blockstate:contenttweaker:pumpk_tile>: [6, 8, 7, -3],
    <blockstate:immersivepetroleum:stone_decoration:type=asphalt>: [-3, -4, 4, 3],
    
    <blockstate:minecraft:concrete:color=red>: [1, 0, 0, 0],
    <blockstate:minecraft:concrete:color=yellow>: [0, 1, 0, 0],
    <blockstate:minecraft:concrete:color=green>: [0, 0, 1, 0],
    <blockstate:minecraft:concrete:color=blue>: [0, 0, 0, 1],

    <blockstate:minecraft:wool:color=red>: [-1, 0, 0, 0],
    <blockstate:minecraft:wool:color=yellow>: [0, -1, 0, 0],
    <blockstate:minecraft:wool:color=green>: [0, 0, -1, 0],
    <blockstate:minecraft:wool:color=blue>: [0, 0, 0, -1],

    <blockstate:minecraft:iron_ore>: [10, 3, 0, 0],
    <blockstate:thermalfoundation:ore:type=copper>: [8, 3, 0, 0],
    <blockstate:thermalfoundation:ore:type=tin>: [9, 3, 3, 0],
    <blockstate:thermalfoundation:ore:type=nickel>: [0, 0, 9, 4],
    <blockstate:thermalfoundation:ore:type=aluminum>: [0, 10, 0, 3],
    <blockstate:contenttweaker:zinc_ore>: [-2, 9, 0, 0],

    <blockstate:contenttweaker:karmesine_tile>: [23, 2, 7, -1],
    <blockstate:contenttweaker:ovium_tile>: [20, 4, -20, -21],
    <blockstate:contenttweaker:jauxum_tile>: [9, 17, -15, 4],
    
    <blockstate:densemetals:dense_iron_ore>: [-6, 9, 23, 0],
    <blockstate:densemetals:dense_copper_ore>: [-13, -24, 17, 17],
    <blockstate:densemetals:dense_tin_ore>: [0, -8, -12, 23],
    <blockstate:densemetals:dense_nickel_ore>: [-14, -19, 14, 6],
    <blockstate:densemetals:dense_aluminum_ore>: [16, -16, 12, -16],
    <blockstate:densemetals:dense_zinc_ore>: [12, 17, 25, -3]
};

static jei_info as int[][IItemStack] = {
    <minecraft:stone:5>: [3, 1, 0, 0],
    <minecraft:stone:1>: [2, 1, 0, 0],
    <minecraft:stone:3>: [2, 1, 1, 0],
    <quark:jasper>: [-1, 3, 0, 0],
    <quark:limestone>: [0, 0, 3, 1],
    <quark:marble>: [0, 3, 0, 1],

    <minecraft:sand>: [1, 1, 1, 0],
    <minecraft:gravel>: [0, 2, -1, 0],
    <minecraft:obsidian>: [2, -1, 2, 0],
    <minecraft:glass>: [3, 0, -1, 1],
    <exnihilocreatio:block_dust>: [-5, 2, -4, 5],
    <erebus:mud>: [5, -8, 2, 10],
    <contenttweaker:umberrack_bricks>: [9, 5, -7, 0],
    <contenttweaker:burned_slimedirt>: [5, -1, -2, -8],

    <extrautils2:compressedcobblestone>: [1, 4, 4, -5],
    <extrautils2:compressedgravel>: [3, -3, 7, -2],
    <extrautils2:compressedsand>: [1, 7, -2, -2],

    <contenttweaker:pumpk_tile>: [6, 8, 7, -3],
    <immersivepetroleum:stone_decoration>: [-3, -4, 4, 3],

    <minecraft:concrete:14>: [1, 0, 0, 0],
    <minecraft:concrete:4>: [0, 1, 0, 0],
    <minecraft:concrete:13>: [0, 0, 1, 0],
    <minecraft:concrete:11>: [0, 0, 0, 1],

    <minecraft:wool:14>: [-1, 0, 0, 0],
    <minecraft:wool:4>: [0, -1, 0, 0],
    <minecraft:wool:13>: [0, 0, -1, 0],
    <minecraft:wool:11>: [0, 0, 0, -1],


    <minecraft:iron_ore>: [10, 3, 0, 0],
    <thermalfoundation:ore>: [8, 3, 0, 0],
    <thermalfoundation:ore:1>: [9, 3, 3, 0],
    <thermalfoundation:ore:5>: [0, 0, 9, 4],
    <thermalfoundation:ore:4>: [0, 10, 0, 3],
    <contenttweaker:zinc_ore>: [-2, 9, 0, 0],

    <contenttweaker:karmesine_tile>: [23, 2, 7, -1],
    <contenttweaker:ovium_tile>: [20, 4, -20, -21],
    <contenttweaker:jauxum_tile>: [9, 17, -15, 4],
    
    <densemetals:dense_iron_ore>: [-6, 9, 23, 0],
    <densemetals:dense_copper_ore>: [-13, -24, 17, 17],
    <densemetals:dense_tin_ore>: [0, -8, -12, 23],
    <densemetals:dense_nickel_ore>: [-14, -19, 14, 6],
    <densemetals:dense_aluminum_ore>: [16, -16, 12, -16],
    <densemetals:dense_zinc_ore>: [12, 17, 25, -3]
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
    if (score[0] > 0) recipe.requireItem("red",         <thermalfoundation:dye:1>.withDisplayName("+") * score[0]);
    else if (score[0] < 0) recipe.requireItem("red",        <botania:dye:14>.withDisplayName("-") * (-score[0]));
    if (score[1] > 0) recipe.requireItem("yellow",      <thermalfoundation:dye:11>.withDisplayName("+")* score[1]);
    else if (score[1] < 0) recipe.requireItem("yellow",     <botania:dye:4>.withDisplayName("-") * (-score[1]));
    if (score[2] > 0) recipe.requireItem("green",       <thermalfoundation:dye:2>.withDisplayName("+") * score[2]);
    else if (score[2] < 0) recipe.requireItem("green",      <botania:dye:13>.withDisplayName("-") * (-score[2]));
    if (score[3] > 0) recipe.requireItem("blue",        <thermalfoundation:dye:4>.withDisplayName("+") * score[3]);
    else if (score[3] < 0) recipe.requireItem("blue",       <botania:dye:11>.withDisplayName("-") * (-score[3]));
    altar.addJEIRecipe(recipe);
}



mods.roots.Fey.addRecipe("altar2", <requious:altar2>, [
    <requious:altar>, <biomesoplenty:gem:7>, <biomesoplenty:gem:7>,
    <contenttweaker:druidic_dust>, <contenttweaker:druidic_dust>
]);
