
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;


var meat_names as string[IItemStack][] = [
    {//1
        <mekanism:dirtydust>: "oreIron",
        <mekanism:dirtydust:3>: "oreCopper",
        <mekanism:dirtydust:4>: "oreTin",

        <mekores:mekanismore:33>: "oreAluminum",
        <mekores:mekanismore:13>: "oreNickel",
        <mekores:mekanismore:113>: "oreZinc",

        <actuallyadditions:item_dust:4>: "oreLapis",

        <mekores:mekanismore:273>: "oreKarmesine",
        <mekores:mekanismore:278>: "oreOvium",
        <mekores:mekanismore:283>: "oreJauxum",

        <mekores:mekanismore:248>: "oreTiberium",
        <enderio:item_material:33> * 2: "oreQuartz"
    }, {//2
        <mekanism:dirtydust:1>: "oreGold",
        <mekanism:dirtydust:5>: "oreSilver",
        <mekanism:dirtydust:2>: "oreOsmium",
        <mekanism:dirtydust:6>: "oreLead",

        <mekores:mekanismore:38>: "oreCobalt",
        <mekores:mekanismore:43>: "oreArdite",

        <contenttweaker:cincinnasite_dirty_dust>: "oreCincinnasite",
        <actuallyadditions:item_dust:2> * 2: "oreDiamond",
        <actuallyadditions:item_dust:3> * 2: "oreEmerald",
        
        <mekores:mekanismore:298>: "oreEezo"
    }, {//3
        <mekores:mekanismore:18>: "orePlatinum",
        <mekores:mekanismore:23>: "oreIridium",
        <mekores:mekanismore:88>: "oreTitanium",
        <mekores:mekanismore:108>: "oreTungsten",
        <mekores:mekanismore:3>: "oreUranium",
        <mekores:mekanismore:8>: "oreYellorium",

        <mekores:mekanismore:293>: "oreOsram",
        <mekores:mekanismore:218>: "orePrometheum",
        <mekores:mekanismore:263>: "oreValyrium",

        <contenttweaker:ender_amethyst_dirty_dust>: "oreEnethyst",
        <quantumflux:graphiteore> * 2: "oreIGraphite"
    }, {//4
        <mekores:mekanismore:28>: "oreMithril",
        <contenttweaker:chrome_dirty_dust>: "oreChrome",
        <contenttweaker:neodymium_dirty_dust>: "oreNeodymium",
        <contenttweaker:arkenium_dirty_dust>: "oreArkenium",

        <mekores:mekanismore:268>: "oreVibranium",

        <mekores:mekanismore:303>: "oreAbyssum",
        <mekores:mekanismore:123>: "orePalladium",
        <mekores:mekanismore:253>: "oreAurorium",
        <mekores:mekanismore:288>: "oreUru",
        <mekores:mekanismore:53>: "oreDraconium",

        <contenttweaker:biotite_dirty_dust>: "oreEndBiotite",
        <contenttweaker:amethyst_dirty_dust>: "oreAmethyst"
    }, {//5
        <contenttweaker:orichalcum_dirty_dust>: "oreOrichalcum",
        <mekores:mekanismore:48>: "oreAstralStarmetal",
        <contenttweaker:aquamarine_dirty_dust>: "oreAquamarine",
        <contenttweaker:zirconium_dirty_dust>: "oreZirconium",
        <contenttweaker:moissanite_dirty>: "oreMoissanite",

        <contenttweaker:life_essence_ore> * 2: "oreLifeEssence"
    }
];
var ore_cubes as IItemStack[] = [
    <contenttweaker:ore_cube1>,
    <contenttweaker:ore_cube2>,
    <contenttweaker:ore_cube3>,
    <contenttweaker:ore_cube4>,
    <contenttweaker:ore_cube5>
];

mods.bloodmagic.AlchemyTable.addRecipe(<contenttweaker:ore_cube1>, 
    [
        <contenttweaker:research_sieving>,
        <extendedcrafting:singularity_custom:9>,
        <extendedcrafting:singularity_custom:35>,
        <extendedcrafting:singularity_custom:33>,
        <extendedcrafting:singularity_custom:32>,
        <quark:diamond_heart>

    ], 25000, 200, 2
);


mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:ore_cube2>, <contenttweaker:ore_cube1>, 1, 1000, 10, 1);
mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:ore_cube3>, <contenttweaker:ore_cube2>, 2, 1000, 10, 1);
mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:ore_cube4>, <contenttweaker:ore_cube3>, 3, 1000, 10, 1);
mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:ore_cube5>, <contenttweaker:ore_cube4>, 4, 1000, 10, 1);




for ore_tier in 0 to meat_names.length{
    for item, ore_name in meat_names[ore_tier]{
        var rec = RecipeBuilder.newBuilder("ore_proc_" ~ ore_name, "blood_meat_infuser", 20 + ore_tier * 20);

        rec.addEnergyPerTickInput(500 + 100 * ore_tier);

        rec.addItemOutput(<contenttweaker:ore_cube_spent>);
        rec.addFluidOutput(<liquid:if.ore_fluid_raw>.withTag({Ore: ore_name}) * (3200 * item.amount));

        rec.addItemInput(item * 32);
        rec.addItemInput(ore_cubes[ore_tier]);
        rec.addFluidInput(<liquid:meat> * (3200 * item.amount));
        

        rec.build();
    }
}
