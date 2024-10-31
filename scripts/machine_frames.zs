//for frames and frame parts

recipes.addShaped("ia_machine_frame_frame", <contenttweaker:machine_frame_frame> * 4, [
    [<projectred-core:resource_item>, <immersiveengineering:material:27>, <projectred-core:resource_item>], 
    [<thermalfoundation:material:354>, null, <thermalfoundation:material:354>], 
    [<projectred-core:resource_item>, <immersiveengineering:metal_decoration0:4>, <projectred-core:resource_item>]
]);
recipes.addShaped("ia_machine_frame_frame2", <contenttweaker:machine_frame_frame> * 5, [
    [<projectred-core:resource_item>, <immersiveengineering:material:27>, <projectred-core:resource_item>], 
    [<thermalfoundation:material:354>, <contenttweaker:creosolon_frame>, <thermalfoundation:material:354>], 
    [<projectred-core:resource_item>, <immersiveengineering:metal_decoration0:4>, <projectred-core:resource_item>]
]);
recipes.addShaped("ia_watertight_lead_plate", <contenttweaker:watertight_lead_plate>, [
    [<thermalfoundation:material:323>, <extrautils2:decorativesolid:7>, <thermalfoundation:material:323>], 
    [<contenttweaker:compound_metal>, null, <contenttweaker:compound_metal>], 
    [<thermalfoundation:material:323>, <extrautils2:decorativesolid:7>, <thermalfoundation:material:323>]
]);


recipes.remove(<extrautils2:machine>);
recipes.addShaped("ia_machine_frame1", <extrautils2:machine> * 4, [
	[<contenttweaker:machine_frame_frame>, <morefurnaces:furnaceblock>, <contenttweaker:machine_frame_frame>], 
	[<contenttweaker:power_core_active>, <immersiveengineering:metal_decoration0:5>, <contenttweaker:power_core_active>], 
	[<contenttweaker:machine_frame_frame>, <morefurnaces:furnaceblock>, <contenttweaker:machine_frame_frame>]
]);

recipes.remove(<thermalexpansion:frame:64>);
recipes.addShaped("ia_machine_frame2", <thermalexpansion:frame:64>, [
	[<extrautils2:decorativesolid:3>, <contenttweaker:watertight_lead_plate>, <extrautils2:decorativesolid:3>], 
	[<contenttweaker:flolit_sheet>, <extrautils2:machine>, <contenttweaker:flolit_sheet>], 
	[<extrautils2:decorativesolid:3>, <immersiveengineering:metal_device0:5>, <extrautils2:decorativesolid:3>]
]);

recipes.remove(<thermalexpansion:frame>);
recipes.addShaped("ia_machine_frame3", <thermalexpansion:frame>, [
	[<ore:plateElectricalSteel>, <prodigytech:circuit_perfected>, <ore:plateElectricalSteel>], 
	[<contenttweaker:simple_motor>, <thermalexpansion:frame:64>, <contenttweaker:simple_motor>], 
	[<ore:plateSteel>, <contenttweaker:thermal_gear>, <ore:plateSteel>]
]);