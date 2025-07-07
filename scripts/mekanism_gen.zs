
recipes.remove(<mekanismgenerators:generator>);
recipes.addShaped("ia_mek_lava_generator", <mekanismgenerators:generator>, [
    [<contenttweaker:hot_energion>, <exnihilocreatio:block_crucible:1>, <contenttweaker:hot_energion>], 
    [<extrautils2:ingredients:13>, <extrautils2:machine>, <extrautils2:ingredients:13>], 
    [<thermalfoundation:material:352>, <morefurnaces:furnaceblock:6>, <thermalfoundation:material:352>]
]);

recipes.remove(<mekanismgenerators:generator:6>);
recipes.addShaped("ia_mek_wind_generator", <mekanismgenerators:generator:6>, [
    [null, <contenttweaker:rotor_blades>, null], 
    [<contenttweaker:simple_motor>, <immersiveengineering:metal_decoration0:1>, <contenttweaker:simple_motor>], 
    [<immersiveengineering:material:9>, <extrautils2:machine>, <immersiveengineering:material:9>]
]);


recipes.remove(<mekanismgenerators:solarpanel>);
recipes.addShaped("ia_mek_solarpanel", <mekanismgenerators:solarpanel>, [
    [<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>], 
    [<enderio:item_material:3>, <mekanism:enrichedalloy> | <extrautils2:suncrystal>, <enderio:item_material:3>], 
    [null, <moreplates:osmium_plate>, null]
]);

{//reactor
    recipes.remove(<mekanismgenerators:reactor:1>);
    recipes.addShaped("ia_mek_reactor_wall", <mekanismgenerators:reactor:1>, [
        [<bigreactors:reactorcasing>, <contenttweaker:diode2>, <bigreactors:reactorcasing>], 
        [<actuallyadditions:item_misc:8>, <mekanism:basicblock:8>, <actuallyadditions:item_misc:8>], 
        [<bigreactors:reactorcasing>, <actuallyadditions:item_battery_triple>, <bigreactors:reactorcasing>]
    ]);

    recipes.remove(<mekanismgenerators:reactorglass:1>);
    recipes.addShaped("ia_mek_reactor_laser_input", <mekanismgenerators:reactorglass:1>, [
        [<contenttweaker:laser_mirror>, <mekanismgenerators:reactorglass>, <contenttweaker:laser_mirror>], 
        [<mekanismgenerators:reactorglass>, <mekanism:machineblock2:14>, <mekanismgenerators:reactorglass>], 
        [<contenttweaker:laser_mirror>, <mekanismgenerators:reactorglass>, <contenttweaker:laser_mirror>]
    ]);
    recipes.addShaped("ia_mek_reactor_laser_input2", <mekanismgenerators:reactorglass:1>, [
        [<contenttweaker:laser_mirror>, <mekanismgenerators:reactorglass>, <contenttweaker:laser_mirror>], 
        [<mekanismgenerators:reactorglass>, <contenttweaker:lens_out> | <contenttweaker:lens_in>, <mekanismgenerators:reactorglass>], 
        [<contenttweaker:laser_mirror>, <mekanismgenerators:reactorglass>, <contenttweaker:laser_mirror>]
    ]);


    recipes.remove(<mekanismgenerators:reactor>);
    recipes.addShaped("ia_mek_reactor_reactor", <mekanismgenerators:reactor>, [
        [<mekanismgenerators:reactor:1>, <mekanism:gastank>.withTag({tier: 3, mekData: {stored: {amount: 512000, gasName: "fusionfuel"}}}), <mekanismgenerators:reactor:1>], 
        [<enderio:item_basic_capacitor:2> | <enderio:item_capacitor_vivid>, <enderio:item_material:1>, <enderio:item_basic_capacitor:2> | <enderio:item_capacitor_vivid>], 
        [<mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>]
    ]);
}
