#reloadable
//import scripts.mob_jei.addJEIentityHint;

import crafttweaker.util.IRandom;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Functions;
import loottweaker.vanilla.loot.Conditions;


import mods.zenutils.EventPriority;

import crafttweaker.event.EntityLivingDeathDropsEvent;

events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent){

    if (!event.entityLivingBase.isUndead)
        if (event.damageSource.damageType == crafttweaker.damage.IDamageSource.LIGHTNING_BOLT().damageType){
            event.addItem(<contenttweaker:electric_meat>);
            //event.cancel();
        }
        


});
