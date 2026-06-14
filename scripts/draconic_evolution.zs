import moretweaker.draconicevolution.FusionCrafting;



recipes.remove(<draconicevolution:potentiometer>);
recipes.addShaped("potentiometer", <draconicevolution:potentiometer>, [
    [null, <extrautils2:redstoneclock>, null], 
    [<projectred-core:resource_item>, <projectred-core:resource_item>, <projectred-core:resource_item>]
]);

recipes.remove(<draconicevolution:diss_enchanter>);
recipes.addShapeless("ia_diss_enchanter", <draconicevolution:diss_enchanter>, [
    <enderio:block_enchanter>, <actuallyadditions:item_disenchanting_lens>
]);

recipes.remove(<draconicevolution:dislocator_receptacle>);
recipes.addShaped("ia_dislocator_receptacle", <draconicevolution:dislocator_receptacle>, [
	[<draconicevolution:infused_obsidian>, <integrateddynamics:logic_director>, <draconicevolution:infused_obsidian>], 
	[<integrateddynamics:logic_director>, <enderio:block_travel_anchor>, <integrateddynamics:logic_director>], 
	[<draconicevolution:infused_obsidian>, <thermalexpansion:frame>, <draconicevolution:infused_obsidian>]
]);

recipes.remove(<draconicevolution:draconic_core>);

FusionCrafting.add(
    <contenttweaker:iv_coil>, <minecraft:coal>, 
    FusionCrafting.DRACONIC, 1000 * 1000, [
        <draconicevolution:awakened_core>,
        <draconicevolution:awakened_core>,
        <draconicevolution:awakened_core>,
        <draconicevolution:awakened_core>,
        
        <tconevo:metal:8>,
        <tconevo:metal:8>,

        <contenttweaker:ev_coil>,
        <contenttweaker:ev_coil>,
        <contenttweaker:ev_coil>,
        <contenttweaker:ev_coil>,

        <tconevo:metal:8>,
        <tconevo:metal:8>
    ]
);