import crafttweaker.block.IBlockState;
import mods.animus.AnimusPlugin;

//got this from ftb interaction remastered
//print("-------------------------removing glowstone tiles from altar ----------------------------");

var glowstoneToUnregister as IBlockState[] = [
    <blockstate:minecraft:glowstone>,
    <blockstate:minecraft:sea_lantern>,
    <blockstate:chisel:glowstone:variation=0>,
    <blockstate:chisel:glowstone:variation=1>,
    <blockstate:chisel:glowstone:variation=2>,
    <blockstate:chisel:glowstone:variation=3>,
    <blockstate:chisel:glowstone:variation=4>,
    <blockstate:chisel:glowstone:variation=5>,
    <blockstate:chisel:glowstone:variation=6>,
    <blockstate:chisel:glowstone:variation=7>,
    <blockstate:chisel:glowstone:variation=8>,
    <blockstate:chisel:glowstone:variation=9>,
    <blockstate:chisel:glowstone:variation=10>,
    <blockstate:chisel:glowstone:variation=11>,
    <blockstate:chisel:glowstone:variation=12>,
    <blockstate:chisel:glowstone:variation=13>,
    <blockstate:chisel:glowstone:variation=14>,
    <blockstate:chisel:glowstone:variation=15>,
    <blockstate:chisel:glowstone1:variation=0>,
    <blockstate:chisel:glowstone1:variation=1>,
    <blockstate:chisel:glowstone1:variation=2>,
    <blockstate:chisel:glowstone1:variation=3>,
    <blockstate:chisel:glowstone1:variation=4>,
    <blockstate:chisel:glowstone1:variation=5>,
    <blockstate:chisel:glowstone1:variation=6>,
    <blockstate:chisel:glowstone1:variation=7>,
    <blockstate:chisel:glowstone1:variation=8>,
    <blockstate:chisel:glowstone1:variation=9>,
    <blockstate:chisel:glowstone1:variation=10>,
    <blockstate:chisel:glowstone1:variation=11>,
    <blockstate:chisel:glowstone1:variation=12>,
    <blockstate:chisel:glowstone1:variation=13>,
    <blockstate:chisel:glowstone1:variation=14>,
    <blockstate:chisel:glowstone1:variation=15>,
    <blockstate:chisel:glowstone2:variation=0>
];

for i in glowstoneToUnregister {
    AnimusPlugin.removeComponentMapping(i,"GLOWSTONE"); //t3
}

//print("-------------------------adding glowstone tiles to altar ----------------------------");

//todo set smt sensible here
AnimusPlugin.addComponentMapping(<blockstate:contenttweaker:tar_light>, "GLOWSTONE");
