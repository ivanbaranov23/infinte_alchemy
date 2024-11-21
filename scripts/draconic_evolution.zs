import moretweaker.draconicevolution.FusionCrafting;



recipes.remove(<draconicevolution:potentiometer>);
recipes.addShaped("potentiometer", <draconicevolution:potentiometer>, [
    [null, <extrautils2:redstoneclock>, null], 
    [<projectred-core:resource_item>, <projectred-core:resource_item>, <projectred-core:resource_item>]
]);


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