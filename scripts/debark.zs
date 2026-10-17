#loader crafttweaker
#priority 0
#reloadable

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.events.IEventManager;
import crafttweaker.player.IPlayer;
import crafttweaker.event.PlayerInteractBlockEvent;

import mods.zenutils.EventPriority;
/*
events.register(
    function(event as PlayerInteractBlockEvent) {
        if (event.world.isRemote()) {
            return;
        }

        val player = event.player;
        val block = event.block;
        val item = event.item;
        val world = event.world;

        

        if (block.definition.id == "minecraft:stone"
            && item.definition.id == "contenttweaker:steelchisel"
            && player.offHandHeldItem.definition.id == "minecraft:diamond"
            && player.offHandHeldItem.amount >= 1
        ) {
            world.setBlockState(<blockstate:minecraft:grass>, event.position);
            event.damageItem(1);
            player.getItemOffHand().withAmount(player.getItemOffHand().amount - 1);
            event.cancel();
        }
    }
);
*/