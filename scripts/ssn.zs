
recipes.remove(<storagenetwork:kabel>);
recipes.addShaped("ssn_kabel1", <storagenetwork:kabel> * 4, [
    [<roots:bark_wildwood>, <roots:bark_wildwood>, <roots:bark_wildwood>], 
    [<extrautils2:minichest>, <thermaldynamics:duct_32> | <extrautils2:pipe>, <extrautils2:minichest>], 
    [<roots:bark_wildwood>, <roots:bark_wildwood>, <roots:bark_wildwood>]
]);
recipes.remove(<storagenetwork:kabel>);
recipes.addShaped("ssn_kabel2", <storagenetwork:kabel> * 8, [
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>], 
    [<extrautils2:minichest>, <thermaldynamics:duct_32> | <extrautils2:pipe>, <extrautils2:minichest>], 
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>]
]);


recipes.remove(<storagenetwork:simple_kabel>);
recipes.addShapeless("ssn_simple_kabel", <storagenetwork:simple_kabel>, [
    <storagenetwork:kabel>, <prodigytech:circuit_crude>
]);
scripts.recycler.addRecycle(<storagenetwork:simple_kabel>, [
    <storagenetwork:kabel>, <prodigytech:circuit_crude>
]);

recipes.remove(<storagenetwork:storage_kabel>);
recipes.addShapeless("ssn_storage_kabel", <storagenetwork:storage_kabel>, [
    <storagenetwork:simple_kabel>,
    <enderio:item_basic_item_filter>, <prodigytech:circuit_refined>
]);
scripts.recycler.addRecycle(<storagenetwork:storage_kabel>, [
    <storagenetwork:simple_kabel>,
    <enderio:item_basic_item_filter>, <prodigytech:circuit_refined>
]);

recipes.remove(<storagenetwork:im_kabel>);
recipes.addShapeless("ssn_im_kabel", <storagenetwork:im_kabel> * 2, [
    <storagenetwork:simple_kabel>, <storagenetwork:simple_kabel>, <prodigytech:circuit_refined>, <minecraft:sticky_piston>
]);
scripts.recycler.addRecycle(<storagenetwork:im_kabel> * 2, [
    <storagenetwork:simple_kabel> * 2, <prodigytech:circuit_refined>, <minecraft:sticky_piston>
]);
recipes.remove(<storagenetwork:ex_kabel>);
recipes.addShapeless("ssn_ex_kabel", <storagenetwork:ex_kabel> * 2, [
    <storagenetwork:simple_kabel>, <storagenetwork:simple_kabel>, <prodigytech:circuit_refined>, <minecraft:piston>
]);
scripts.recycler.addRecycle(<storagenetwork:ex_kabel> * 2, [
    <storagenetwork:simple_kabel> * 2, <prodigytech:circuit_refined>, <minecraft:piston>
]);

recipes.remove(<storagenetwork:process_kabel>);
recipes.addShapeless("ssn_proc_kabel", <storagenetwork:process_kabel>, [
    <storagenetwork:im_kabel>, <storagenetwork:ex_kabel>, <prodigytech:circuit_refined>
]);
scripts.recycler.addRecycle(<storagenetwork:process_kabel>, [
    <storagenetwork:im_kabel>, <storagenetwork:ex_kabel>, <prodigytech:circuit_refined>
]);



recipes.remove(<storagenetwork:inventory>);
recipes.addShaped("ssn_inventory1", <storagenetwork:inventory> * 2, [
    [<storagenetwork:simple_kabel>, <thermalfoundation:material:358>, <storagenetwork:simple_kabel>], 
    [<moreplates:alumite_plate>, <actuallyadditions:block_giant_chest>, <moreplates:alumite_plate>], 
    [<storagenetwork:simple_kabel>, <storagedrawers:controller>, <storagenetwork:simple_kabel>]
]);
scripts.recycler.addRecycle(<storagenetwork:inventory> * 2, [
    <actuallyadditions:block_giant_chest>,
    <storagenetwork:simple_kabel> * 4,
    <thermalfoundation:material:166> * 4,
    <storagedrawers:controller>,
    <plustic:alumiteingot> * 8,
]);

recipes.remove(<storagenetwork:request>);
recipes.addShaped("ssn_request", <storagenetwork:request>, [
    [<immersiveengineering:metal_decoration0:4>, <prodigytech:magnetic_reassembler>, <immersiveengineering:metal_decoration0:4>], 
    [<moreplates:manyullyn_gear>, <storagenetwork:inventory>, <moreplates:manyullyn_gear>], 
    [<immersiveengineering:metal_decoration0:4>, <prodigytech:magnetic_reassembler>, <immersiveengineering:metal_decoration0:4>]
]);
scripts.recycler.addRecycle(<storagenetwork:request>, [
    <storagenetwork:inventory>,
    <prodigytech:magnetic_reassembler> * 2,
    <immersiveengineering:metal_decoration0:4> * 4,
    <tconstruct:ingots:2> * 16
]);

recipes.remove(<storagenetwork:master>);
/*recipes.addShaped("ssn_master1", <storagenetwork:master>, [
    [<opencomputers:material:29>, <moreplates:alumite_gear>, <opencomputers:material:29>], 
    [<opencomputers:material:29>, <storagenetwork:inventory>, <opencomputers:material:29>], 
    [<opencomputers:material:29>, <moreplates:alumite_gear>, <opencomputers:material:29>]
]);*/
recipes.addShaped("ssn_master2", <storagenetwork:master>, [
    [<immersivepetroleum:stone_decoration> | <contenttweaker:awaken_witherite>, <moreplates:alumite_gear>, <immersivepetroleum:stone_decoration> | <contenttweaker:awaken_witherite>], 
    [<storagenetwork:simple_kabel>, <storagenetwork:inventory>, <storagenetwork:simple_kabel>], 
    [<immersivepetroleum:stone_decoration> | <contenttweaker:awaken_witherite>, <moreplates:alumite_gear>, <immersivepetroleum:stone_decoration> | <contenttweaker:awaken_witherite>]
]);
scripts.recycler.addRecycle(<storagenetwork:master>, [
    <plustic:alumiteingot> * 16,
    <storagenetwork:inventory>, <storagenetwork:simple_kabel> * 2
]);



recipes.remove(<storagenetwork:controller>);
recipes.addShaped("ssn_controller", <storagenetwork:controller>, [
    [<immersiveengineering:metal_decoration0:7>, <storagenetwork:process_kabel>, <immersiveengineering:metal_decoration0:7>], 
    [<immersiveengineering:metal_decoration0:1>, <storagenetwork:process_kabel>, <immersiveengineering:metal_decoration0:1>], 
    [<immersiveengineering:metal_decoration0:7>, <storagenetwork:process_kabel>, <immersiveengineering:metal_decoration0:7>]
]);
scripts.recycler.addRecycle(<storagenetwork:controller>, [
    <storagenetwork:process_kabel> * 3,
    <immersiveengineering:metal_decoration0:7> * 4,
    <immersiveengineering:metal_decoration0:1> * 2
]);