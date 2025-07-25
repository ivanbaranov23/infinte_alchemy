import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

{//enriched_tar
    var rec = RecipeBuilder.newBuilder("enriched_tar", "tar_pit", 3 * 20);

    rec.addEnergyPerTickInput(1000);

    rec.addItemInput(<contenttweaker:supersalt>);
    rec.addFluidInput(<liquid:tar> * 2000);
    rec.addFluidInput(<liquid:muddy_sludge> * 1000);

    rec.addFluidOutput(<liquid:enriched_tar> * 2500);

    rec.build();
}
{//goop
    {//goop1
        var rec = RecipeBuilder.newBuilder("goop1", "tar_pit", 5 * 20);

        rec.addEnergyPerTickInput(1000);

        rec.addItemInput(<harvestcraft:vinegaritem>);
        rec.addItemInput(<minecraft:ender_pearl> * 2);
        rec.addFluidInput(<liquid:tar> * 2000);

        rec.addFluidOutput(<liquid:goop> * 2000);
        rec.addItemOutput(<minecraft:glass_bottle>);

        rec.build();
    }
    {//goop2
        var rec = RecipeBuilder.newBuilder("goop2", "tar_pit", 5 * 20);

        rec.addEnergyPerTickInput(1000);

        rec.addItemInput(<harvestcraft:vinegaritem>);
        rec.addItemInput(<minecraft:ender_pearl> * 2);
        rec.addFluidInput(<liquid:tar> * 2000);

        rec.addFluidOutput(<liquid:goop> * 2000);
        rec.addItemOutput(<minecraft:glass_bottle>);

        rec.build();
    }
}

{//gas

    {
        var rec = RecipeBuilder.newBuilder("tar_gas", "tar_pit", 3 * 20);

        rec.addEnergyPerTickInput(1000);

        rec.addItemInput(<immersivepetroleum:stone_decoration> * 32);
        rec.addFluidInput(<liquid:oil> * 2000);


        rec.addGasOutput("tar_gas", 2400);

        rec.build();
    }
    {
        var rec = RecipeBuilder.newBuilder("tar_gas2", "tar_pit", 15 * 20);

        rec.addEnergyPerTickInput(1000000);

        rec.addItemInput(<contenttweaker:reagent_oil> * 3);


        rec.addGasOutput("tar_gas", 120000);

        rec.build();
    }
}

{//bone1
    var rec = RecipeBuilder.newBuilder("bone1", "tar_pit", 5 * 20);

    rec.addEnergyPerTickInput(1000);

    rec.addItemInput(<minecraft:bone>);
    rec.addItemOutput(<contenttweaker:tar_bone>);

    rec.build();
}
{//bone2
    <ore:boneCool>.add(<atum:dusty_bone>);
    <ore:boneCool>.add(<mysticalagriculture:slimy_bone_essence>);
    <ore:boneCool>.add(<tconstruct:materials:21>);
    <ore:boneCool>.add(<tconstruct:materials:20>);

    var rec = RecipeBuilder.newBuilder("bone2", "tar_pit", 5 * 20);

    rec.addEnergyPerTickInput(1000);

    rec.addItemInput(<ore:boneCool>, 1);
    rec.addItemOutput(<contenttweaker:tar_bone> * 3);

    rec.build();
}
{//bone3
    <ore:boneVeryCool>.add(<bhc:wither_bone>);
    <ore:boneVeryCool>.add(<tconstruct:materials:17>);
    <ore:boneVeryCool>.add(<tconstruct:materials:22>);

    var rec = RecipeBuilder.newBuilder("bone3", "tar_pit", 5 * 20);

    rec.addEnergyPerTickInput(1000);

    rec.addItemInput(<ore:boneVeryCool>, 1);
    rec.addItemOutput(<contenttweaker:tar_bone> * 9);

    rec.build();
}
{//bone4

    var rec = RecipeBuilder.newBuilder("bone4", "tar_pit", 5 * 20);

    rec.addEnergyPerTickInput(1000);

    rec.addItemInput(<contenttweaker:lich_bone>);
    rec.addItemOutput(<contenttweaker:tar_bone> * 32);

    rec.build();
}

mods.thermalexpansion.Centrifuge.addRecipe([
    <contenttweaker:dna_erebus> % 1
], <contenttweaker:tar_bone> * 3, <liquid:tar> * 500, 4000);