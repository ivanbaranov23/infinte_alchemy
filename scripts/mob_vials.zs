
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import crafttweaker.data.IData;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;

import mods.modularmachinery.RecipeBuilder;



function addVialProcess(entity as string, poison as ILiquidStack, 
    loot as double[WeightedItemStack], blood as ILiquidStack, blood_luck as int
){
    {//jei
        var recipe = AssemblyRecipe.create(function(container) {
            
            for item,o in loot{
                container.addItemOutput("output", item.stack.withLore(["Base chance: " ~ (item.chance * 100) ~ "%", "Luck increase: " ~ (o * 100) ~ "%"]));
            }
            if (blood){
                container.addFluidOutput("output", blood);
                
            }
        });

        recipe = recipe.requireItem("input", <enderio:item_soul_vial:1>.withTag({entityId: entity}));
        recipe = recipe.requireItem("egg", <minecraft:spawn_egg>.withTag({EntityTag: {id: entity}}));
        recipe = recipe.requireFluid("input", poison);
        
        //recipe = recipe.requireDuration("duration", time_t);
        //recipe = recipe.requireEnergy("power", time_t * rft);

        <assembly:vial_processor>.addJEIRecipe(recipe);	
    }

    {//no luck
        var recipe = AssemblyRecipe.create(function(container) {
            
            for i in 0 to loot.keys.length{
                if (container.random.nextDouble() < loot.keys[i].chance) //>
                container.addItemOutput("output" ~ i, loot.keys[i].stack);
            }
            if (blood){
                container.addFluidOutput("output", blood);
                
            }
            container.addItemOutput("vial", <enderio:item_soul_vial>);
        });
        recipe = recipe.requireSelection("selection", <contenttweaker:luck_crystal_base>.withDisplayName("Run with no luck"), false);
        recipe = recipe.requireItem("input", <enderio:item_soul_vial:1>.withTag({entityId: entity}));
        
        recipe = recipe.requireFluid("input", poison);
        
        recipe.setActive(20);
        recipe = recipe.requireDuration("duration", 20);
        recipe = recipe.requireEnergy("power", 1000);

        <assembly:vial_processor>.addRecipe(recipe);	
    }

    {//luck
        var recipe = AssemblyRecipe.create(function(container) {
            var luck_item as IItemStack = container.getItem("luck");
            var luck_c as IData = luck_item.tag.memberGet("luck");
            var luck as double = 0.0;
            if (luck_c) {
                luck += luck_c.asDouble();
                container.addItemOutput("luck2", container.getItem("luck"));
            }

            
            for i in 0 to loot.keys.length{
                var chance as double = (loot.keys[i].chance as double) + (loot.values[i] * luck);
                var out_amount as int = 0;
                for att in 0 to 4{
                    if (container.random.nextDouble() < chance) //>
                        out_amount += 1;
                    chance -= 1.0;
                }
                if (out_amount != 0)
                    container.addItemOutput("output" ~ i, loot.keys[i].stack * (loot.keys[i].stack.amount * out_amount));
            }
            if (blood){
                container.addFluidOutput("output", blood * (blood.amount + (luck * blood_luck)));
                
            }
            container.addItemOutput("vial", <enderio:item_soul_vial>);
        });
        recipe = recipe.requireItem("luck", <contenttweaker:luck_crystal>.marked("luck"));
        recipe = recipe.requireItem("input", <enderio:item_soul_vial:1>.withTag({entityId: entity}));
        
        recipe = recipe.requireFluid("input", poison);
        
        recipe.setActive(20);
        recipe = recipe.requireDuration("duration", 20);
        recipe = recipe.requireEnergy("power", 1000);

        <assembly:vial_processor>.addRecipe(recipe);	
    }
}

{//luck readd
    var recipe = AssemblyRecipe.create(function(container) {
        if (container.getItem("luck"))  
            container.addItemOutput("luck", container.getItem("luck"));
        });
    recipe = recipe.requireItem("luck2", <contenttweaker:luck_crystal>.marked("luck"));

    <assembly:vial_processor>.addRecipe(recipe);	
}

furnace.remove(<mysticalagriculture:crafting:38>);
recipes.addShapeless("soulium_dust", <mysticalagriculture:crafting:29>, [
    <contenttweaker:research_soul>.reuse(),
    <enderio:item_material:52>, 
    <botania:manaresource:15>, 
    <extendedcrafting:material:37>, 
    <contenttweaker:tungsten_mixture>
]);
var rec = RecipeBuilder.newBuilder("soulium", "tignalum_oven", 10 * 20);

rec.addEnergyPerTickInput(10000);
rec.addItemOutput(<mysticalagriculture:crafting:38>);
rec.addItemInput(<mysticalagriculture:crafting:29>);
//rec.addHotAirInput(250, 250, 1001);

rec.build();


mods.extendedcrafting.TableCrafting.addShaped(0, <requious:vial_processor>, [
    [<moreplates:soulium_gear>, <moreplates:soulium_plate>, <moreplates:soulium_plate>, <moreplates:soulium_plate>, <moreplates:soulium_gear>], 
    [<extendedcrafting:material:36>, <contenttweaker:soul_codex8>, <mob_grinding_utils:saw>, <contenttweaker:soul_codex8>, <extendedcrafting:material:36>], 
    [<extendedcrafting:material:36>, <enderio:item_material:44>, <enderio:item_material:55>, <enderio:item_material:44>, <extendedcrafting:material:36>], 
    [<extendedcrafting:material:36>, <contenttweaker:soul_codex8>, <enderio:block_powered_spawner>, <contenttweaker:soul_codex8>, <extendedcrafting:material:36>], 
    [<moreplates:soulium_gear>, <moreplates:soulium_plate>, <moreplates:soulium_plate>, <moreplates:soulium_plate>, <moreplates:soulium_gear>]
]);



val holy as ILiquidStack = <liquid:holy_water> * 100;
val poison as ILiquidStack = <liquid:poison> * 100;
val water as ILiquidStack = <liquid:pure_water> * 100;
val insect as ILiquidStack = <liquid:insecticide> * 100;
val sand as ILiquidStack = <liquid:sand> * 100;
//addVialProcess(entity as string, poison as ILiquidStack, loot as float[IItemStack], blood as ILiquidStack, blood_luck as int)


{//minecraft
    addVialProcess("minecraft:bat", poison, {
            <actuallyadditions:item_misc:15> * 2 % 20: 0.04
        }, <liquid:blood> * 15, 0
    );
    addVialProcess("minecraft:blaze", water, {
            <xreliquary:mob_ingredient:7>: 0.04, 
            <minecraft:blaze_rod> * 4: 0.1, 
            <thermalfoundation:material:771> * 4: 0.05
        }, <liquid:fiery_essence> * 100, 1
    );
    addVialProcess("minecraft:cave_spider", insect, {
            <minecraft:spider_eye> * 4 % 50: 0.03,
            <xreliquary:mob_ingredient:2> * 2 % 90: 0.01,
            <minecraft:string> * 8: 0.04,
            <minecraft:web> % 20: 0.02
        }, null, 0
    );
    addVialProcess("minecraft:chicken", poison, {
            <minecraft:feather> * 2: 0.05,
            <minecraft:chicken>: 0.05,
            <minecraft:egg>: 0.05,
            <minecraft:bone> % 10: 0.01
        }, <liquid:blood> * 25, 0
    );
    addVialProcess("minecraft:cow", poison, {
            <minecraft:beef> * 4: 0.05,
            <minecraft:leather> * 4: 0.05,
            <minecraft:bone>: 0.04
        }, <liquid:milk> * 200, 1
    );

    addVialProcess("minecraft:creeper", poison, {
            <minecraft:skull:4> % 50: 0.04,
            <xreliquary:mob_ingredient:3> % 90: 0.04,
            <minecraft:gunpowder> * 8: 0.05
        }, null, 0
    );
    addVialProcess("minecraft:enderman", water, {
            <enderio:block_enderman_skull> % 50: 0.04,
            <xreliquary:mob_ingredient:11> % 90: 0.04,
            <minecraft:ender_pearl> * 6: 0.05
        }, <liquid:ender_blood> * 100, 2
    );
    addVialProcess("minecraft:endermite", water, {
            <xreliquary:mob_ingredient:11> % 90: 0.04,
            <minecraft:ender_pearl> * 6: 0.04
        }, <liquid:ender_blood> * 200, 4
    );

    addVialProcess("minecraft:evocation_illager", poison * 200, {
            <minecraft:totem_of_undying> % 70: 0.02,
            <minecraft:emerald> * 4: 0.04
        }, <liquid:blood> * 200, 1
    );

    addVialProcess("minecraft:ghast", poison * 150, {
            <xreliquary:mob_ingredient:3> % 90: 0.04,
            <minecraft:ghast_tear> * 6: 0.04,
            <thermalfoundation:material:771> * 8: 0.05
        }, null, 0
    );
    addVialProcess("minecraft:guardian", poison, {
            <xreliquary:mob_ingredient:16> % 90: 0.04,
            <minecraft:fish> * 6: 0.1,
            <minecraft:prismarine_shard> * 4 % 80: 0.03,
            <minecraft:prismarine_crystals> * 2 % 65: 0.03
        }, null, 0
    );

    addVialProcess("minecraft:magma_cube", water, {
            <xreliquary:mob_ingredient:7> % 60: 0.03,
            <minecraft:magma_cream> * 4 % 75: 0.05,
            <thermalfoundation:material:771> * 4: 0.05
        }, <liquid:fiery_essence> * 200, 2
    );

    addVialProcess("minecraft:mooshroom", poison, {
            <minecraft:beef> * 4: 0.05,
            <minecraft:leather> * 4: 0.05,
            <minecraft:bone>: 0.04,
            <minecraft:brown_mushroom> * 4: 0.05,
            <minecraft:red_mushroom> * 4: 0.05
        }, <liquid:mushroom_stew> * 100, 1
    );

    addVialProcess("minecraft:pig", poison, {
            <minecraft:porkchop> * 4: 0.05,
            <quark:tallow> * 4: 0.05,
            <minecraft:bone>: 0.04
        }, <liquid:blood> * 50, 0
    );

    addVialProcess("minecraft:rabbit", poison, {
            <minecraft:rabbit> * 4: 0.05,
            <minecraft:rabbit_hide> * 6: 0.05,
            <minecraft:rabbit_foot> * 2 % 80: 0.04
        }, <liquid:blood> * 15, 0
    );
    addVialProcess("minecraft:sheep", poison, {
            <minecraft:mutton> * 4: 0.05,
            <minecraft:wool> * 6: 0.05
        }, <liquid:blood> * 25, 0
    );

    addVialProcess("minecraft:shulker", water, {
            <minecraft:shulker_shell> * 4: 0.05,
            <darkutils:shulker_pearl> * 2: 0.04
        }, <liquid:ender_blood> * 100, 1
    );

    addVialProcess("minecraft:skeleton", holy, {
            <minecraft:skull> % 60: 0.04,
            <xreliquary:mob_ingredient> * 2: 0.04,
            <minecraft:bone> * 8: 0.05,
            <erebus:materials:2> % 5: 0.005,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, <liquid:ash_solution> * 50, 1
    );

    addVialProcess("minecraft:slime", poison, {
            <minecraft:slime_ball> * 6: 0.05,
            <xreliquary:mob_ingredient:4>: 0.04,
            <contenttweaker:bug_slimeball> % 5: 0.03
        }, null, 0
    );
    addVialProcess("minecraft:spider", insect, {
            <minecraft:spider_eye> * 4 % 70: 0.03,
            <xreliquary:mob_ingredient:2> * 2 % 90: 0.04,
            <minecraft:string> * 8: 0.05,
            <minecraft:web> * 2 % 20: 0.02
        }, null, 0
    );

    addVialProcess("minecraft:squid", poison, {
            <minecraft:dye> * 4 % 80: 0.04,
            <xreliquary:mob_ingredient:12> % 90: 0.04,
            <harvestcraft:calamarirawitem> * 2: 0.05,
            <mysticalworld:raw_squid> * 2 % 50: 0.04
        }, <liquid:blood> * 40, 0
    );

    addVialProcess("minecraft:witch", poison, {
            <minecraft:glass_bottle> * 4 % 80: 0.04,
            <xreliquary:witch_hat> % 95: 0.04,
            <minecraft:redstone> * 6: 0.05,
            <minecraft:glowstone_dust> * 6: 0.05,
            <minecraft:sugar> * 4: 0.05
        }, <liquid:blood> * 40, 1
    );
    addVialProcess("minecraft:vindication_illager", poison, {
            <minecraft:emerald> * 4: 0.04
        }, <liquid:blood> * 100, 1
    );

    addVialProcess("minecraft:wither_skeleton", <liquid:holy_water2> * 100, {
            <minecraft:skull:1> % 60: 0.04,
            <xreliquary:mob_ingredient:1> * 2 % 90: 0.03,
            <tconstruct:materials:17> * 4: 0.04,
            <darkutils:material> * 4: 0.05,
            <minecraft:coal> * 6: 0.05,
            <extrautils2:ingredients:10> % 60: 0.04,
            <contenttweaker:undead_essence>.weight(2.0 / 10000): 0.001
        }, <liquid:ash_solution> * 100, 2
    );

    addVialProcess("minecraft:zombie", <liquid:holy_water> * 100, {
            <minecraft:skull:2> % 60: 0.04,
            <xreliquary:mob_ingredient:6> % 90: 0.03,
            <minecraft:rotten_flesh> * 8: 0.04,
            <minecraft:bone> * 4: 0.05,
            <minecraft:iron_ingot> * 4 % 60: 0.04,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, <liquid:rot> * 50, 1
    );
}

{//atum
    addVialProcess("atum:bonestorm", <liquid:holy_water> * 50, {
            <atum:dusty_bone> * 2: 0.03,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, null, 0
    );
    addVialProcess("atum:camel", poison, {
            <atum:camel_raw> * 4: 0.05,
            <minecraft:leather> * 4: 0.05,
            <minecraft:bone>: 0.04
        }, <liquid:blood> * 50, 0
    );

    addVialProcess("atum:desert_wolf", poison, {
            <atum:wolf_pelt> * 4: 0.05,
            <minecraft:bone>: 0.04
        }, <liquid:blood> * 50, 0
    );

    addVialProcess("atum:forsaken", <liquid:holy_water> * 50, {
            <atum:dusty_bone> * 4: 0.03,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, <liquid:ash_solution> * 50, 1
    );

    addVialProcess("atum:mummy", holy, {
            <xreliquary:mob_ingredient:6> % 70: 0.03,
            <minecraft:rotten_flesh> * 6: 0.04,
            <minecraft:bone> * 4: 0.05,
            <atum:cloth_scrap> * 4 % 80: 0.04,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, <liquid:rot> * 100, 1
    );

    addVialProcess("atum:stoneguard", <liquid:lubricant> * 100, {
            <atum:khnumite> * 4 % 80: 0.04,
            <contenttweaker:khnumite_heart> % 50: 0.02
        }, <liquid:sky_stone> * 100, 1
    );
    addVialProcess("atum:stonewarden", <liquid:lubricant> * 150, {
            <atum:khnumite> * 6 % 80: 0.04,
            <contenttweaker:khnumite_heart> % 50: 0.02
        }, <liquid:sky_stone> * 200, 1
    );

    addVialProcess("atum:sunspeaker", poison, {
            <atum:efreet_heart> % 60: 0.04,
            <contenttweaker:ra_godshard> % 80: 0.05
        }, <liquid:blood> * 100, 2
    );

    addVialProcess("atum:tarantula", insect, {
            <atum:mandibles> * 4 % 80: 0.04,
            <erebus:erebus_food:4> * 2 % 75: 0.03
        }, null, 0
    );

    addVialProcess("atum:wraith", holy, {
            <atum:ectoplasm> * 2 % 80: 0.03,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, null, 0
    );
}

{//erebus
    //todo sort alph
    addVialProcess("erebus:erebus.black_widow", insect, {
            <minecraft:spider_eye> * 4 % 80: 0.03,
            <xreliquary:mob_ingredient:2> * 2 % 90: 0.04,
            <minecraft:string> * 8: 0.05,
            <minecraft:web> * 2 % 30: 0.02,
            <erebus:materials:21> % 80: 0.05
        }, null, 0
    );
    addVialProcess("erebus:erebus.beetle", insect, {
        <erebus:materials> * 6: 0.03
    }, <liquid:beetle_juice> * 100, 1);

    addVialProcess("erebus:erebus.wasp", <liquid:insecticide> * 100,
        {
            <erebus:materials:10>: 0.02, 
            <erebus:materials:6> * 2: 0.02,
            <mod_lavacow:chitin> * 2: 0.05,
            <erebus:materials:19> % 10: 0.02
        }, null, 0
    );
    addVialProcess("erebus:erebus.centipede", insect, {
        <erebus:materials:8> * 4 % 90: 0.04, 
        <erebus:materials:21> * 4 % 90: 0.04
    }, null, 0);
    
    addVialProcess("erebus:erebus.mosquito", insect, {
        <erebus:life_blood> * 8: 0.05, 
        <erebus:materials:6> * 2 % 80: 0.04
    }, <liquid:blood> * 100, 1);
    addVialProcess("erebus:erebus.tarantula", insect, {
        <erebus:erebus_food:4> * 8 % 80: 0.05, 
        <minecraft:spider_eye> * 4 % 70: 0.04
    }, null, 0);

    addVialProcess("erebus:erebus.grasshopper", insect, {
        <erebus:erebus_food:2> * 2: 0.05, 
        <erebus:materials:6> * 2: 0.05
    }, null, 0);

    addVialProcess("erebus:erebus.locust", insect * 300, {
        <erebus:materials:9> * 8: 0.1, 
        <erebus:materials:6> * 2: 0.05
    }, <liquid:blood> * 150, 2);
    addVialProcess("erebus:erebus.rhino_beetle", insect * 300, {
        <erebus:materials:35> * 6: 0.05, 
        <erebus:materials:6> * 2: 0.05
    }, <liquid:blood> * 150, 2);

    addVialProcess("erebus:erebus.glow_worm", insect, {
        <erebus:materials:12> * 8: 0.1
    }, <liquid:worm_blood> * 100, 1);
    addVialProcess("erebus:erebus.bombardier_beetle", insect * 200, {
        <erebus:materials> * 6: 0.1, 
        <erebus:materials:6> * 2: 0.05, 
        <minecraft:blaze_powder> * 8: 0.1, 
        <minecraft:gunpowder> * 8: 0.1
    }, <liquid:blood> * 125, 2);


    addVialProcess("erebus:erebus.praying_mantis", insect, {
        <erebus:materials:18> * 8: 0.05, 
        <erebus:materials:6> * 2: 0.05
    }, <liquid:blood> * 50, 1);
    addVialProcess("erebus:erebus.dragon_fly", insect * 200, {
        <erebus:materials:4> * 4: 0.05, 
        <erebus:materials:24> * 4: 0.05
    }, <liquid:blood> * 75, 1);

    addVialProcess("erebus:erebus.titan_beetle", insect * 300, {
        <erebus:materials> * 10: 0.05, 
        <erebus:materials:6> * 2: 0.05, 
        <erebus:erebus_food:12>: 0.1
    }, <liquid:blood> * 125, 1);

    addVialProcess("erebus:erebus.cicada", insect, {
        <erebus:materials:28> * 8: 0.05, 
        <erebus:materials:6> * 2: 0.05
    }, <liquid:blood> * 50, 0);
    
    addVialProcess("erebus:erebus.zombie_ant", holy, {
        <erebus:materials:65> * 6: 0.05, 
        <erebus:materials:37> * 1: 0.07,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
    }, <liquid:rot> * 75, 1);
    addVialProcess("erebus:erebus.zombie_ant_soldier", holy, {
        <erebus:materials:65> * 8: 0.05, 
        <erebus:materials:37> * 1: 0.07,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
    }, <liquid:rot> * 100, 1);

    addVialProcess("erebus:erebus.pond_skater", insect, {
        <erebus:materials:57> * 8: 0.05
    }, null, 0);
    addVialProcess("erebus:erebus.woodlouse", insect, {
        <erebus:materials:23> * 8: 0.05
    }, null, 0);

    addVialProcess("erebus:erebus.stag_beetle", insect, {
        <erebus:materials> * 12: 0.05, 
        <erebus:materials:66>: 0.05, 
        <erebus:stag_heart_raw>: 0.05
    }, <liquid:beetle_juice> * 100, 1);

    addVialProcess("erebus:erebus.crushroom", poison * 300, {
        <erebus:materials:48> * 8: 0.05
    }, <liquid:mushroom_stew> * 150, 2);
    addVialProcess("erebus:erebus.punchroom", poison, {
        <erebus:materials:9> * 4: 0.05
    }, <liquid:mushroom_stew> * 150, 1);

    addVialProcess("erebus:erebus.solifuge", insect, {
        <erebus:materials:8> * 4 % 80: 0.03
    }, null, 0);

    addVialProcess("erebus:erebus.velvet_worm", insect, {
            <minecraft:slime_ball> * 6: 0.05,
            <xreliquary:mob_ingredient:4> % 20: 0.04,
            <contenttweaker:bug_slimeball> % 25: 0.03
        }, <fluid:worm_blood> * 100, 1
    );

    addVialProcess("erebus:erebus.scorpion", insect, {
        <erebus:materials:21> * 4: 0.05, 
        <erebus:materials:17> * 2: 0.03
    }, <liquid:blood> * 50, 1);

    addVialProcess("erebus:erebus.magma_crawler", water, {
        <erebus:materials:60>: 0.04
    }, <liquid:lava> * 50, 1);
}
{//fish undead mobs
    addVialProcess("mod_lavacow:lavacow", water, {
            <mod_lavacow:moltenbeef> % 80: 0.04,
            <thermalfoundation:material:771> * 2: 0.05
        }, <fluid:lava> * 200, 4
    );
    addVialProcess("mod_lavacow:zombiemushroom", holy, {
            <mod_lavacow:hyphae> * 3: 0.04, 
            <minecraft:rotten_flesh> * 8: 0.02, 
            <minecraft:bone> * 2: 0.04,
            <mod_lavacow:cordy_shroom> % 30: 0.05,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, <liquid:rot> * 125, 1
    );
    addVialProcess("mod_lavacow:parasite", insect * 75, {
            <mod_lavacow:parasite_item> % 80: 0.04,
            <mod_lavacow:parasite_item:2> % 50: 0.04,
            <mod_lavacow:parasite_item:1> % 50: 0.04
        }, <liquid:worm_blood> * 75, 0
    );
    addVialProcess("mod_lavacow:mimic", insect, {
            <mod_lavacow:mimic_claw> * 2 % 80: 0.04
        }, null, 0
    );

    addVialProcess("mod_lavacow:zombiefrozen", holy, {
            <minecraft:skull:2> % 30: 0.04,
            <xreliquary:mob_ingredient:6> % 50: 0.03,
            <minecraft:rotten_flesh> * 4: 0.04,
            <minecraft:bone> * 2: 0.05,
            <mod_lavacow:shattered_ice> * 4 % 60: 0.04,
            <mod_lavacow:frozenthigh> % 20: 0.04,
            <contenttweaker:undead_essence>.weight(1.0 / 10000): 0.001
        }, <liquid:rot> * 50, 1
    );
    addVialProcess("mod_lavacow:undeadswine", holy * 150, {
            <xreliquary:mob_ingredient:6> % 30: 0.03,
            <minecraft:rotten_flesh> * 4: 0.04,
            <minecraft:bone> * 2: 0.05,
            <mod_lavacow:pigboarhide> % 70: 0.04,
            <mod_lavacow:plagued_porkchop> % 70: 0.04,
            <mod_lavacow:sharptooth> * 2 % 70: 0.04,
            <contenttweaker:undead_essence>.weight(2.0 / 10000): 0.001
        }, <liquid:rot> * 50, 2
    );

    addVialProcess("mod_lavacow:salamander", water, {
            <mod_lavacow:moltenbeef> * 2 % 80: 0.04,
            <thermalfoundation:material:771> * 2: 0.05,
            <mod_lavacow:burntovipositor> % 30: 0.03,
            <minecraft:blaze_powder> * 4: 0.04
        }, <fluid:lava> * 250, 4
    );

    addVialProcess("mod_lavacow:ithaqua", holy * 150, {
            <mod_lavacow:scythe_claw> % 30: 0.03,
            <mod_lavacow:foul_hide> % 50: 0.04,
            <minecraft:bone> * 2: 0.05
        }, <liquid:rot> * 50, 2
    );


    addVialProcess("mod_lavacow:ptera", poison, {
            <mod_lavacow:ptera_wing> * 2 % 75: 0.05
        }, <liquid:blood> * 50, 1
    );

    addVialProcess("mod_lavacow:vespa", insect, {
            <mod_lavacow:vespa_carapace> * 3 % 30: 0.03,
            <mod_lavacow:poisonstinger> % 50: 0.04
        }, null, 0
    );

    addVialProcess("mod_lavacow:cactoid", sand, {
            <minecraft:cactus>: 0.05,
            <mod_lavacow:cactus_thorn> * 2: 0.05
        }, <liquid:water> * 50, 1
    );

    addVialProcess("mod_lavacow:pingu", holy, {
            <mod_lavacow:shattered_ice> * 4: 0.05,
            <mod_lavacow:feather_black> * 2: 0.05,
            <minecraft:dye:15>: 0.5
        }, null, 0
    );

    addVialProcess("mod_lavacow:enigmoth", water, {
            <minecraft:ender_pearl> * 4 % 75: 0.05,
            <mod_lavacow:chitin> * 2: 0.05,
            <minecraft:string>: 0.05
        }, <liquid:ender_blood> * 50, 2
    );

    addVialProcess("mod_lavacow:ghostray", holy, {
            <mod_lavacow:ectoplasm> * 2 % 90: 0.05
        }, null, 0
    );
    addVialProcess("mod_lavacow:boneworm", <liquid:holy_water2> * 100, {
            <mod_lavacow:acidicheart>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 44}]}) % 2: 0.005,
            <minecraft:rotten_flesh> * 3: 0.05,
            <minecraft:bone> * 4: 0.05,
            <contenttweaker:primitive_eyes>: 0.05,
            <contenttweaker:undead_essence>.weight(2.0 / 10000): 0.001
        }, <liquid:vile> * 100, 1
    );
}

//twilight
addVialProcess("twilightforest:slime_beetle", poison, {
    <contenttweaker:bug_slimeball> * 8: 1.0
    }, null, 0
);


//misc
addVialProcess("industrialforegoing:pink_slime", poison, {
    <industrialforegoing:pink_slime> * 8: 1.0
    }, <liquid:if.pink_slime> * 200, 4
);