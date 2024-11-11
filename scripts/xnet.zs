recipes.remove(<xnet:netcable>);
recipes.addShaped("ia_netcable", <xnet:netcable> * 8, [
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>], 
    [<contenttweaker:xnet_wire>, <contenttweaker:xnet_wire>, <contenttweaker:xnet_wire>], 
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>]
]);

recipes.remove(<xnet:connector>);
recipes.addShaped("ia_xnet_connector", <xnet:connector>, [
    [<xnet:connector>, <xnet:netcable>, <xnet:connector>], 
    [<xnet:connector>, <appliedenergistics2:interface>, <xnet:connector>], 
    [<xnet:connector>, <xnet:netcable>, <xnet:connector>]
]);

recipes.remove(<xnet:controller>);
recipes.addShaped("ia_xnet_controller", <xnet:controller>, [
    [<contenttweaker:xnet_plate>, <xnet:connector>, <contenttweaker:xnet_plate>], 
    [<xnet:connector>, <thermalexpansion:frame>, <xnet:connector>], 
    [<contenttweaker:xnet_plate>, <xnet:connector>, <contenttweaker:xnet_plate>]
]);