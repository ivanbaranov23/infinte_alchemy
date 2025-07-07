
import crafttweaker.item.IItemStack;


for speed,paths in {
    1.5: [
        <minecraft:white_glazed_terracotta>,
        <minecraft:orange_glazed_terracotta>,
        <minecraft:magenta_glazed_terracotta>,
        <minecraft:light_blue_glazed_terracotta>,
        <minecraft:yellow_glazed_terracotta>,
        <minecraft:lime_glazed_terracotta>,
        <minecraft:pink_glazed_terracotta>,
        <minecraft:gray_glazed_terracotta>,
        <minecraft:silver_glazed_terracotta>,
        <minecraft:cyan_glazed_terracotta>,
        <minecraft:purple_glazed_terracotta>,
        <minecraft:blue_glazed_terracotta>,
        <minecraft:brown_glazed_terracotta>,
        <minecraft:green_glazed_terracotta>,
        <minecraft:red_glazed_terracotta>,
        <minecraft:black_glazed_terracotta>,
        <minecraft:hardened_clay>,
        <minecraft:stained_hardened_clay:*>,
    ],
    2: [
        <roots:runestone>,
        <roots:runestone_brick>,
        <roots:runestone_brick_alt>,
        <roots:chiseled_runestone>,

        <prodigytech:charred_stone>,
        <prodigytech:charred_stonebricks>,
        <prodigytech:zorra_planks>,
        <prodigytech:ash_bricks>,
        <prodigytech:particle_board>,
        <prodigytech:particle_board_planks>,

        <immersiveengineering:sheetmetal:*>,
        <immersiveengineering:treated_wood:*>,

        <extrautils2:decorativesolid>,
        <extrautils2:decorativesolid:1>,
        <extrautils2:decorativesolid:5>
    ],
    2.3: [
        <minecraft:obsidian>,
        <minecraft:jukebox>,
        <minecraft:gold_block>,

        <immersiveengineering:stone_decoration:4>, 
        <immersiveengineering:stone_decoration:5>, 
        <immersiveengineering:stone_decoration:7>,
        <engineersdecor:clinker_brick_block>,
        <engineersdecor:clinker_brick_stained_block>,
        <engineersdecor:slag_brick_block>,

        <extrautils2:decorativesolid:2>,
        <extrautils2:decorativesolid:3>,

        <betternether:bone_tile>
    ],
    2.5: [
        <minecraft:diamond_block>,

        <immersiveengineering:stone_decoration:6>
    ],
    3.0: [
        <immersivepetroleum:stone_decoration>
    ],

    10.99: [
        <extrautils2:decorativesolid:8>
    ]
} as IItemStack[][float]{
    for path in paths{
        path.addTooltip("Speed bonus +" ~ ( (speed - 1) * 100 ) as int ~ "%");
    }
}