#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ActionResult;

import mods.contenttweaker.BlockState;


function compare_defs(state1 as BlockState, state2 as BlockState) as bool{
    //this is so dumb
    return state1.getBlock().definition.getStateFromMeta(0) == state2.getBlock().definition.getStateFromMeta(0);
}


var staffwood = VanillaFactory.createItem("staffwood");
    staffwood.itemDestroyedBlock = function(item, world, block, pos, player) {
        if (item) item.shrink(1);
        return true;
    };
    staffwood.register();
var staffwood_flower = VanillaFactory.createItem("staffwood_flower");
    staffwood_flower.maxStackSize = 1;
    staffwood_flower.maxDamage = 30;
    staffwood_flower.toolLevel = 1;
    staffwood_flower.toolClass = "staffwood_flower";
    staffwood_flower.itemDestroyedBlock = function(item, world, block, pos, player) {
        if (item) item.damage(1, player);
        return true;
    };
    staffwood_flower.onItemUse = function(player, world, pos, hand, facing, blockHit) {
        var block = world.getBlockState(pos);
        if (compare_defs(block, <block:minecraft:leaves>)) {
            world.setBlockState(<block:contenttweaker:leaves_vanilla>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        else if (compare_defs(block, <block:minecraft:leaves2>)) {
            world.setBlockState(<block:contenttweaker:leaves_vanilla>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        else if (compare_defs(block, <block:aether_legacy:crystal_leaves>)) {
            world.setBlockState(<block:contenttweaker:leaves_crystal>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        else if (compare_defs(block, <block:erebus:leaves_marshwood>)) {
            world.setBlockState(<block:contenttweaker:leaves_erebus>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        
        return ActionResult.pass();
    };
    staffwood_flower.register();
var staffwood_mushroom = VanillaFactory.createItem("staffwood_mushroom");
    staffwood_mushroom.maxStackSize = 1;
    staffwood_mushroom.maxDamage = 100;
    staffwood_mushroom.toolLevel = 1;
    staffwood_mushroom.toolClass = "staffwood_mushroom";
    staffwood_mushroom.itemDestroyedBlock = function(item, world, block, pos, player) {
        if (item) item.damage(1, player);
        return true;
    };
    staffwood_mushroom.onItemUse = function(player, world, pos, hand, facing, blockHit) {
        var block = world.getBlockState(pos);
        if (block == <block:erebus:kaizers_fingers_mushroom_block:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_red>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block:erebus:dutch_cap_mushroom_block:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_yellow>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block<erebus:grandmas_shoes_mushroom_block:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_green>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block:erebus:dark_capped_mushroom_block:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_blue>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block:erebus:sarcastic_czech_mushroom_block:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_purple>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block:roots:baffle_cap_huge_top>) {
            world.setBlockState(<block:contenttweaker:oreshroom_baffle>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
         else if (block == <block:roots:baffle_cap_huge_stem>) {
            world.setBlockState(<block:contenttweaker:oreshroom_baffle>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block:twilightforest:huge_mushgloom:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_gloom>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        else if (block == <block:quark:glowshroom_block:14>) {
            world.setBlockState(<block:contenttweaker:oreshroom_glow>, pos);
            player.getHeldItem(hand).damage(2, player);
            return ActionResult.success();
        }
        
        return ActionResult.pass();
    };
    staffwood_mushroom.register();


var staffwood_clay = VanillaFactory.createItem("staffwood_clay");
    staffwood_clay.maxStackSize = 1;
    staffwood_clay.maxDamage = 50;
    staffwood_clay.onItemUse = function(player, world, pos, hand, facing, blockHit) {
        var block = world.getBlockState(pos);
        if (block == <block:contenttweaker:kaolin_clay_block>) {
            world.setBlockState(<block:contenttweaker:forest_clay_block>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        else if (block == <block:minecraft:clay>) {
            world.setBlockState(<block:tconstruct:dried_clay>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        else if (block == <block:excompressum:compressed_block:5>) {
            world.setBlockState(<block:atum:khnumite_raw>, pos);
            player.getHeldItem(hand).damage(1, player);
            return ActionResult.success();
        }
        else if (block == <block:atum:khnumite_block>) {
            world.setBlockState(<block:netherendingores:ore_other_1:6>, pos);
            player.getHeldItem(hand).damage(5, player);
            return ActionResult.success();
        }
        
        return ActionResult.pass();
    };
    staffwood_clay.register();

var staffwood_bug = VanillaFactory.createItem("staffwood_bug");
    staffwood_bug.maxStackSize = 1;
    staffwood_bug.maxDamage = 50;
    staffwood_bug.toolLevel = 1;
    staffwood_bug.toolClass = "staffwood_bug";
    staffwood_bug.itemDestroyedBlock = function(item, world, block, pos, player) {
        if (item) item.damage(1, player);
        return true;
    };
    staffwood_bug.itemRightClick = function(stack, world, player, hand){
        stack.damage(1, player);
        return "Pass";
    };
    staffwood_bug.register();

function addOreshroom(name as string){
    var oreshroom = VanillaFactory.createBlock("oreshroom_" ~ name, <blockmaterial:rock>);
    oreshroom.setToolClass("axe");
    oreshroom.setBlockLayer("TRANSLUCENT");
    oreshroom.register();
}
addOreshroom("red");
addOreshroom("yellow");
addOreshroom("green");
addOreshroom("blue");
addOreshroom("purple");
addOreshroom("baffle");
addOreshroom("gloom");//todo glow
addOreshroom("glow");
