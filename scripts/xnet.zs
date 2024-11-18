recipes.remove(<xnet:netcable>);
recipes.addShaped("ia_netcable", <xnet:netcable> * 8, [
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>], 
    [<contenttweaker:xnet_wire>, <contenttweaker:xnet_wire>, <contenttweaker:xnet_wire>], 
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>]
]);

recipes.remove(<xnet:connector>);
recipes.addShaped("ia_xnet_connector", <xnet:connector> * 2, [
    [<contenttweaker:xnet_wire>, <xnet:netcable>, <contenttweaker:xnet_wire>], 
    [<contenttweaker:xnet_wire>, <appliedenergistics2:interface>, <contenttweaker:xnet_wire>], 
    [<contenttweaker:xnet_wire>, <xnet:netcable>, <contenttweaker:xnet_wire>]
]);

recipes.remove(<xnet:controller>);
recipes.addShaped("ia_xnet_controller", <xnet:controller>, [
    [<contenttweaker:xnet_plate>, <xnet:connector>, <contenttweaker:xnet_plate>], 
    [<xnet:connector>, <thermalexpansion:frame>, <xnet:connector>], 
    [<contenttweaker:xnet_plate>, <xnet:connector>, <contenttweaker:xnet_plate>]
]);