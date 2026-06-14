import crafttweaker.item.IItemStack;
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;

print("[XU2] doing funny stuff");

IMachineRegistry.getMachine("extrautils2:enchanter").addRecipe(
    {"input": <extrautils2:powertransmitter> * 3, "input_lapis": <moreplates:enchanted_plate>}, {"output": <contenttweaker:resonating_plate>},
    10 * 1000, 20
);


{//pink gen
    var gen = IMachineRegistry.getMachine("extrautils2:generator_pink");
    
    gen.removeRecipe({
        "input": <minecraft:wool:6>
    });
    gen.removeRecipe({
        "input": <minecraft:concrete:6>
    });
    gen.removeRecipe({
        "input": <minecraft:red_flower:7>
    });



    for item,time in {
        <appliedenergistics2:paint_ball:6>: 3,

        <enderio:item_alloy_endergy_ingot:4>: 20 * 2,
        <enderio:block_alloy_endergy:4>: 20 * 2 * 10,
        <extendedcrafting:singularity_custom:64>: 20 * 2 * 300,

        <contenttweaker:pilkeum>: 5,
        <contenttweaker:pilkon_corpse>: 20 * 5,

        <botania:rune:9>: 20 * 60 * 15,

        <alchemistry:compound:50>: 20 * 5
    } as int[IItemStack] {
        gen.addRecipe(
            {input: item}, {}, time * 1000, time
        );
    }

}
{//ender
    var gen = IMachineRegistry.getMachine("extrautils2:generator_ender");
    
    gen.removeRecipe({
        "input": <minecraft:ender_pearl>
    });
    gen.removeRecipe({
        "input": <minecraft:ender_eye>
    });

    for item,time in {
        <extendedcrafting:material:36>: 20 * 5,
        <enderio:item_material:44>: 20 * 5,
        <extendedcrafting:singularity:50>: 20 * 60 * 3,
        <contenttweaker:ender_crystal>: 20 * 4
    } as int[IItemStack] {
        gen.addRecipe(
            {input: item}, {}, time * 1000, time
        );
    }
}
{//ice
    var gen = IMachineRegistry.getMachine("extrautils2:generator_ice");
    
    gen.removeRecipe({
        "input": <minecraft:ice>
    });
    gen.removeRecipe({
        "input": <minecraft:packed_ice>
    });
    gen.removeRecipe({
        "input": <minecraft:snowball>
    });
    gen.removeRecipe({
        "input": <minecraft:snow>
    });
    gen.removeRecipe({
        "input": <minecraft:snow_layer>
    });
   

    for item,time in {
        <bloodmagic:component:32>: 60 * 20,
        <contenttweaker:awakened_umberrack>: 10 * 20,
        <extendedcrafting:singularity_custom:14>: 20 * 20,
        <contenttweaker:advanced_cryotheum>: 60 * 20,
        <botania:rune:7>: 5 * 60 * 20

    } as int[IItemStack] {
        gen.addRecipe(
            {input: item}, {}, time * 1000, time
        );
    }
}