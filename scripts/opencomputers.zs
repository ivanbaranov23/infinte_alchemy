
recipes.remove(<opencomputers:material:6>);
recipes.addShaped("ia_oc_transistor", <opencomputers:material:6> * 4, [
    [<immersiveengineering:material:1>, <immersiveengineering:material:1>, <immersiveengineering:material:1>], 
    [<projectred-core:resource_item:1>, <thermalfoundation:material:513>, <projectred-core:resource_item:1>], 
    [<enderio:item_capacitor_grainy>, <projectred-core:resource_item:1>, <enderio:item_capacitor_grainy>]
]);
recipes.remove(<opencomputers:material:12>);
recipes.addShaped("ia_oc_disk", <opencomputers:material:12>, [
    [<mekanism:otherdust>],
    [<projectred-core:resource_item>],
    [<thermalfoundation:material:322>]
]);


recipes.remove(<opencomputers:material:7>);
recipes.addShaped("ia_oc_chip1", <opencomputers:material:7> * 2, [
    [<prodigytech:circuit_crude>, <opencomputers:material:6>, <prodigytech:circuit_crude>], 
    [<immersiveengineering:wirecoil:5>, <projectred-integration:gate>, <immersiveengineering:wirecoil:5>], 
    [<prodigytech:circuit_crude>, <opencomputers:material:6>, <prodigytech:circuit_crude>]
]);
recipes.remove(<opencomputers:material:8>);
recipes.addShaped("ia_oc_chip2", <opencomputers:material:8> * 2, [
    [<prodigytech:circuit_refined>, <opencomputers:material:7>, <prodigytech:circuit_refined>], 
    [<immersiveengineering:wirecoil:5>, <projectred-integration:gate:3>, <immersiveengineering:wirecoil:5>], 
    [<prodigytech:circuit_refined>, <opencomputers:material:7>, <prodigytech:circuit_refined>]
]);
recipes.remove(<opencomputers:material:9>);
recipes.addShaped("ia_oc_chip3", <opencomputers:material:9> * 2, [
    [<prodigytech:circuit_perfected>, <opencomputers:material:8>, <prodigytech:circuit_perfected>], 
    [<immersiveengineering:wirecoil:5>, <projectred-integration:gate:5>, <immersiveengineering:wirecoil:5>], 
    [<prodigytech:circuit_perfected>, <opencomputers:material:8>, <prodigytech:circuit_perfected>]
]);


recipes.remove(<opencomputers:material:10>);
recipes.addShaped("ia_oc_alu", <opencomputers:material:10> * 3, [
    [<immersiveengineering:material:27>, <opencomputers:material:7>, <immersiveengineering:material:27>], 
    [<opencomputers:material:6>, <projectred-integration:gate:17>, <opencomputers:material:6>], 
    [<immersiveengineering:material:27>, <opencomputers:material:7>, <immersiveengineering:material:27>]
]);

recipes.remove(<opencomputers:material:11>);
recipes.addShaped("ia_oc_control", <opencomputers:material:11>, [
    [<contenttweaker:gold_wire>, <opencomputers:material:6>, <contenttweaker:gold_wire>], 
    [<opencomputers:material:6>, <projectred-integration:gate:12>, <opencomputers:material:6>], 
    [<contenttweaker:gold_wire>, <opencomputers:material:6>, <contenttweaker:gold_wire>]
]);