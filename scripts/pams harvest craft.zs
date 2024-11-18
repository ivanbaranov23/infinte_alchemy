import crafttweaker.item.IItemStack;
import mods.immersiveengineering.Mixer;
//Mixer.addRecipe(ILiquidStack output, ILiquidStack fluidInput, IIngredient[] itemInputs, int energy);
import mods.thermalexpansion.InductionSmelter;
//InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

import mods.thermalexpansion.Transposer;
import mods.thermalexpansion.Pulverizer;
import mods.thermalexpansion.Centrifuge;

function moveCookingRecipe(raw as IItemStack, cooked as IItemStack){
    furnace.remove(cooked);
    InductionSmelter.addRecipe(
        cooked * 4, 
        <harvestcraft:oliveoilitem>, raw * 4, 
        400
    );
}

//milk ore fix
<ore:milkBucket>.remove(<aether_legacy:skyroot_bucket>);
<ore:listAllmilk>.remove(<aether_legacy:skyroot_bucket>);

recipes.addShapeless(
    "sugarcane_to_paperbark",
    <harvestcraft:paperbark_sapling>,
    [<ore:treeSapling>, <quark:reed_block>]
);

{//machines
    //disable grinder filter and presser
    recipes.remove(<harvestcraft:grinder>);
    recipes.remove(<harvestcraft:waterfilter>);
    recipes.remove(<harvestcraft:presser>);
    recipes.remove(<harvestcraft:market>);
    //<harvestcraft:market>.addTooltip("disabled");
    mods.jei.JEI.hideCategory("jehc.presser");
    mods.jei.JEI.hideCategory("jehc.market");
    mods.jei.JEI.hideCategory("jehc.grinder");
    mods.jei.JEI.hideCategory("jehc.waterfilter");

    //sink
    recipes.remove(<cookingforblockheads:sink>);
    recipes.addShaped("ia_sink1", <cookingforblockheads:sink>, [
        [<enderio:block_reservoir>, <immersiveengineering:metal_device1:6>, <enderio:block_reservoir>], 
        [<enderio:block_reservoir>, <thermalexpansion:device>, <enderio:block_reservoir>], 
        [<ore:hardenedClay>, <thermalfoundation:material:512>, <ore:hardenedClay>]
    ]);
    recipes.addShaped("ia_sink2", <cookingforblockheads:sink>, [
        [<enderio:block_reservoir>, <immersiveengineering:metal_device1:6>, <enderio:block_reservoir>], 
        [<ore:hardenedClay>, <contenttweaker:tefnuts_godshard>, <ore:hardenedClay>], 
        [<ore:hardenedClay>, <immersiveengineering:metal_device1:6>, <ore:hardenedClay>]
    ]);

    //market
    recipes.remove(<farmingforblockheads:market>);
    recipes.addShaped("ia_market", <farmingforblockheads:market>, [
        [<ore:woolRed>, <extendedcrafting:singularity_custom:100>, <ore:woolRed>], 
        [<ore:plankPetrified>, <ore:gearEmerald>, <ore:plankPetrified>], 
        [<ore:plankPetrified>, <contenttweaker:research_plants1>.reuse(), <ore:plankPetrified>]
    ]);
}

//honey
Transposer.addFillRecipe(<harvestcraft:royaljellyitem>, <thermalfoundation:material:1>, <liquid:honey> * 1000, 2000);
Centrifuge.addRecipe(
	[<harvestcraft:beeswaxitem>, <erebus:materials:19> % 25], <harvestcraft:honeyitem>, null, 
	1000
);

recipes.remove(<harvestcraft:cottoncandyitem>);
Centrifuge.addRecipe(
	[<harvestcraft:cottoncandyitem> % 50], <prodigytech:sugar_cube> * 4, null, 
	1000
);

{//saplings
    recipes.addShapeless("ia_nutmeg_sapling", 
        <harvestcraft:nutmeg_sapling>, [<contenttweaker:plant_sample>, <ore:listAllspice>, <ore:treeSapling>]);
    recipes.addShapeless("ia_peppercorn_sapling", 
        <harvestcraft:peppercorn_sapling>, [<contenttweaker:plant_sample>, <harvestcraft:cornitem>, <ore:treeSapling>]);
    recipes.addShapeless("ia_cinnamon_sapling", 
        <harvestcraft:cinnamon_sapling>, [<contenttweaker:plant_sample>, <actuallyadditions:item_food:9>, <ore:treeSapling>]);

    recipes.addShaped("ia_cherry", <harvestcraft:cherryitem> * 4, [
        [null, null, <contenttweaker:plant_sample>], 
        [<ore:dyeRed>, <extrautils2:magicapple>, <ore:dyeRed>], 
        [<ore:dyeRed>, <ore:dyeRed>, <ore:dyeRed>]
    ]);
    recipes.addShaped("ia_dragonfruit", <harvestcraft:dragonfruititem> * 4, [
        [<contenttweaker:plant_sample>, <ore:dyeYellow>, null], 
        [<ore:dyeYellow>, <extrautils2:magicapple>, <ore:dyeRed>], 
        [null, <ore:dyeRed>, <ore:dyeRed>]
    ]);

    recipes.addShaped("ia_banana", <harvestcraft:bananaitem> * 4, [
        [null, null, <contenttweaker:plant_sample>], 
        [null, <extrautils2:magicapple>, <ore:dyeYellow>], 
        [<ore:dyeYellow>, <ore:dyeYellow>, null]
    ]);
    recipes.addShaped("ia_peach", <harvestcraft:peachitem> * 4, [
        [null, <contenttweaker:plant_sample>, null], 
        [<ore:dyeOrange>, <extrautils2:magicapple>, <ore:dyeOrange>], 
        [<ore:dyeOrange>, <ore:dyeOrange>, <ore:dyeOrange>]
    ]);
    recipes.addShaped("ia_plum", <harvestcraft:plumitem> * 4, [
        [null, <contenttweaker:plant_sample>, null], 
        [<ore:dyePurple>, <extrautils2:magicapple>, <ore:dyePurple>], 
        [<ore:dyePurple>, <ore:dyePurple>, <ore:dyePurple>]
    ]);
}

{//bread and cakes
    {//flour
        <ore:foodFlour>.remove(<atum:emmer_flour>);
        <ore:foodFlour>.remove(<natura:materials:1>);
        <ore:foodFlour>.remove(<natura:materials:2>);
        <ore:foodFlour>.remove(<prodigytech:flour>);
        <ore:foodFlour>.remove(<roots:flour>);

        Pulverizer.removeRecipe(<minecraft:wheat>);
        Pulverizer.addRecipe(<natura:materials:2> * 2, <minecraft:wheat>, 1500);

        mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:wheat>);
        mods.appliedenergistics2.Grinder.addRecipe(
            <natura:materials:2>, <minecraft:wheat>, 4,
            <natura:materials:2>, 0.3
        );

        mods.roots.Mortar.removeRecipe(<roots:flour>);
        //mods.roots.Mortar.

        mods.enderio.SagMill.removeRecipe(<minecraft:wheat>);
        mods.enderio.SagMill.addRecipe([<natura:materials:2> * 2, <natura:materials:2>], [1.0, 0.5], <minecraft:wheat>);


        <ore:dustWheat>.add(<atum:emmer_flour>);
        <ore:dustWheat>.add(<natura:materials:1>);
        <ore:dustWheat>.add(<natura:materials:2>);
        <ore:dustWheat>.add(<prodigytech:flour>);

        <ore:dustNormalWheat>.add(<natura:materials:2>);
        <ore:dustNormalWheat>.add(<prodigytech:flour>);
        <ore:dustNormalWheat>.add(<roots:flour>);

        Pulverizer.removeRecipe(<harvestcraft:coconutitem>);
        Pulverizer.removeRecipe(<harvestcraft:riceitem>);
        Pulverizer.removeRecipe(<minecraft:potato>);
        Pulverizer.removeRecipe(<harvestcraft:peasitem>);
        Pulverizer.removeRecipe(<harvestcraft:beanitem>);
        Pulverizer.removeRecipe(<harvestcraft:soybeanitem>);
        Pulverizer.removeRecipe(<harvestcraft:barleyitem>);
        Pulverizer.removeRecipe(<harvestcraft:almonditem>);
        Pulverizer.removeRecipe(<harvestcraft:oatsitem>);
        Pulverizer.removeRecipe(<harvestcraft:chestnutitem>);
        Pulverizer.removeRecipe(<harvestcraft:ryeitem>);
        Pulverizer.removeRecipe(<harvestcraft:bananaitem>);
    }

    <appliedenergistics2:material:4>.displayName = "Mixed Flour";
    recipes.addShapeless("ia_mixed_flour1",
        <appliedenergistics2:material:4> * 3,
        [<harvestcraft:mortarandpestleitem>.reuse(), <minecraft:bowl>.reuse(), 
        <ore:dustNormalWheat>, <natura:materials:1>]
    );
    recipes.addShapeless("ia_mixed_flour2",
        <appliedenergistics2:material:4> * 3,
        [<harvestcraft:mortarandpestleitem>.reuse(), <minecraft:bowl>.reuse(), 
        <ore:dustNormalWheat>, <atum:emmer_flour>]
    );
    recipes.addShapeless("ia_mixed_flour3",
        <appliedenergistics2:material:4> * 5,
        [<harvestcraft:mortarandpestleitem>.reuse(), <minecraft:bowl>.reuse(), 
        <ore:dustNormalWheat>, <natura:materials:1>, <atum:emmer_flour>]
    );

    <ore:foodDough>.remove(<atum:emmer_dough>);
    <harvestcraft:flouritem>.displayName = "Baking Flour";
    recipes.remove(<harvestcraft:flouritem>);
    recipes.addShapeless("ia_baking_flour1",
        <harvestcraft:flouritem> * 3,
        [<harvestcraft:mixingbowlitem>.reuse(), 
        <ore:dustWheat>, <ore:dustWheat>]
    );

    recipes.remove(<actuallyadditions:item_misc:4>);
    recipes.addShapeless("ia_dough1",
        <actuallyadditions:item_misc:4>,
        [<harvestcraft:mixingbowlitem>.reuse(), 
        <harvestcraft:flouritem>, <mekanism:salt>, <ore:listAllwater>]
    );

    {//food dough
        <harvestcraft:doughitem>.displayName = "Food Dough";
        recipes.remove(<harvestcraft:doughitem>);
        recipes.addShapeless("ia_food_dough1", <harvestcraft:doughitem> * 2,
            [<actuallyadditions:item_misc:4>, <harvestcraft:soymilkitem>]
        );
        recipes.addShapeless("ia_food_dough2", <harvestcraft:doughitem> * 4, 
            [<actuallyadditions:item_misc:4>, <harvestcraft:soymilkitem>, <contenttweaker:yeast>]
        );
        recipes.addShapeless("ia_food_dough3", <harvestcraft:doughitem> * 8, 
            [<actuallyadditions:item_misc:4>, <harvestcraft:soymilkitem>, <contenttweaker:yeast_rich>]
        );

        Transposer.addFillRecipe(
            <harvestcraft:doughitem>,
            <actuallyadditions:item_misc:4>, <liquid:milk> * 250,
            1000
        );
    }

    {//cake
        recipes.remove(<harvestcraft:carrotcakeitem>);
        recipes.addShaped("ia_carrotcakeitem", <harvestcraft:carrotcakeitem>, [
            [<harvestcraft:carrotjuiceitem>, <harvestcraft:carrotjuiceitem>, <harvestcraft:carrotjuiceitem>], 
            [<harvestcraft:candiedpecansitem>, <enderio:item_material:70>, <harvestcraft:candiedpecansitem>]
        ]);

        recipes.remove(<harvestcraft:cheesecakeitem>);
        recipes.addShaped("ia_cheesecakeitem", <harvestcraft:cheesecakeitem>, [
            [<ore:listAllheavycream>, <ore:listAllheavycream>, <ore:listAllheavycream>], 
            [<harvestcraft:crackersitem>, <harvestcraft:cheeseitem>, <harvestcraft:crackersitem>]
        ]);
    }
}

{//burger
    recipes.remove(<harvestcraft:hamburgeritem>);
    recipes.addShapeless("ia_burger", <harvestcraft:hamburgeritem>, [
        <harvestcraft:cuttingboarditem>.reuse(),
        <harvestcraft:toastitem>, <prodigytech:meat_patty>, <contenttweaker:msg>, <harvestcraft:ketchupitem>
    ]);
}

{//rice
    recipes.remove(<actuallyadditions:item_misc:9>);
    recipes.addShapeless("ia_rice_dough1", <actuallyadditions:item_misc:9> * 2, [
        <harvestcraft:mixingbowlitem>.reuse(), 
        <ore:cropRice>, <ore:cropRice>, 
        <ore:listAllwater>, <mekanism:salt>]
    );
    recipes.addShapeless("ia_rice_dough2", <actuallyadditions:item_misc:9>, [
        <harvestcraft:mixingbowlitem>.reuse(), 
        <ore:cropRice>, <ore:cropRice>, <ore:cropRice>, 
        <ore:listAllwater>]
    );

    //recipes.remove(<harvestcraft:ricecakeitem>);
    //recipes.addShapeless("ia_rice_dough_2", <harvestcraft:ricecakeitem>, [
    //    <actuallyadditions:item_misc:9>, <ore:listAllmilk>
    //]);

    //recipes.remove(<actuallyadditions:item_food:17>);
    //InductionSmelter.addRecipe(<actuallyadditions:item_food:17> * 4, <harvestcraft:ricecakeitem> * 4, <contenttweaker:yeast>, 2200);
    //InductionSmelter.addRecipe(<actuallyadditions:item_food:17> * 6, <harvestcraft:ricecakeitem> * 4, <contenttweaker:yeast_rich>, 2200);
}

{//dough uses
    mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:70>);
    recipes.addShaped("ia_cake_base", <enderio:item_material:70>, [
        [<ore:listAllsugar>, <harvestcraft:doughitem>, <ore:listAllsugar>], 
        [<ore:listAllegg>, <harvestcraft:doughitem>, <ore:listAllegg>]
    ]);

    recipes.remove(<actuallyadditions:item_food:8>);
    recipes.addShaped("ia_chococake", <actuallyadditions:item_food:8>, [
        [<ore:cropCherry>, <ore:cropCherry>, <ore:cropCherry>], 
        [<ore:foodChocolatebar>, <ore:foodChocolatebar>, <ore:foodChocolatebar>], 
        [null, <ore:itemCakeBase>, null]
    ]);

    recipes.remove(<harvestcraft:crackeritem>);
    InductionSmelter.addRecipe(<harvestcraft:crackeritem> * 4, <harvestcraft:flouritem>, <mekanism:salt> * 2, 1200);
    
}

{//tofu and soy
    mods.thermalexpansion.Centrifuge.removeRecipe(<harvestcraft:silkentofuitem>);
    Transposer.addFillRecipe(
        <harvestcraft:firmtofuitem>,
        <harvestcraft:silkentofuitem>, <liquid:sea_water> * 250,
        5000
    );
    mods.thermalexpansion.Crucible.addRecipe(<liquid:soy_extract> * 500, <harvestcraft:silkentofuitem>, 3500);
    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:soy_milk> * 500, <harvestcraft:soybeanseeditem> % 5, 
        <liquid:soy_extract> * 750, 4000);
    Transposer.addFillRecipe(
        <harvestcraft:soymilkitem>,
        <harvestcraft:freshmilkitem>, <liquid:soy_milk> * 250,
        2000
    );
}

recipes.remove(<harvestcraft:coconutmilkitem>);

{//cactus
    recipes.remove(<harvestcraft:bakedcactusitem>);
    mods.immersiveengineering.BlastFurnace.addRecipe(
        <harvestcraft:bakedcactusitem>, <minecraft:cactus>, 
        20 * 10, 
        <thermalfoundation:material:864>
    );
}

{//mushroom stew
    recipes.remove(<minecraft:mushroom_stew>);
    recipes.addShapeless("ia_mushroom_stew1",
        <minecraft:mushroom_stew>,
        [<harvestcraft:potitem>.reuse(), <minecraft:bowl>, <minecraft:brown_mushroom>, <minecraft:red_mushroom>, 
        <harvestcraft:grilledmushroomitem>]
    );
    recipes.addShapeless("ia_mushroom_stew2",
        <minecraft:mushroom_stew>,
        [<harvestcraft:potitem>.reuse(), <minecraft:bowl>, <minecraft:brown_mushroom>, <minecraft:red_mushroom>, 
        <botania:mushroom:*>]
    );
    recipes.addShapeless("ia_mushroom_stew3",
        <minecraft:mushroom_stew>,
        [<harvestcraft:potitem>.reuse(), <minecraft:bowl>, <minecraft:brown_mushroom>, <minecraft:red_mushroom>, 
        <erebus:dark_capped_mushroom> | <erebus:sarcastic_czech_mushroom> | <erebus:grandmas_shoes_mushroom> | <erebus:dutch_cap_mushroom> | <erebus:kaizers_fingers_mushroom>]
    );
    recipes.addShapeless("ia_mushroom_stew4",
        <minecraft:mushroom_stew>,
        [<harvestcraft:potitem>.reuse(), <minecraft:bowl>, <minecraft:brown_mushroom>, <minecraft:red_mushroom>, 
        <deepmoblearning:living_matter_erebus>]
    );

    Mixer.addRecipe(<liquid:mushroom_stew> * 500, <liquid:water> * 1000, 
        [<minecraft:brown_mushroom>, <minecraft:red_mushroom>, <harvestcraft:grilledmushroomitem>], 1000
    );
    Mixer.addRecipe(<liquid:mushroom_stew> * 1000, <liquid:water> * 1000, 
        [<minecraft:brown_mushroom>, <minecraft:red_mushroom>, <deepmoblearning:living_matter_erebus>], 1000
    );

}

<ore:listAllsugar>.remove(<harvestcraft:honeyitem>);

{//juices
    <harvestcraft:lemonaideitem>.displayName = "Lemon Juice";
    recipes.remove(<harvestcraft:lemonaideitem>);
    Centrifuge.addRecipe(
        [<harvestcraft:lemonaideitem> % 50], <harvestcraft:lemonitem>, null, 
        1000
    );

    //strawberry
    recipes.remove(<harvestcraft:strawberryjuiceitem>);
    Centrifuge.removeRecipe(<harvestcraft:strawberryitem>);
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:strawberry_juice> * 250,
        <harvestcraft:strawberryitem>, 2000
    );
    mods.immersiveengineering.Squeezer.addRecipe(null, <liquid:strawberry_juice> * 1000, <harvestcraft:strawberryitem>, 1000);
    Transposer.addFillRecipe(
        <harvestcraft:strawberryjuiceitem>,
        <minecraft:glass_bottle>, <liquid:strawberry_juice> * 500,
        1000
    );

    mods.thermalexpansion.Imbuer.addRecipe(<liquid:strawberry_wine> * 1000, <contenttweaker:yeast>, <liquid:strawberry_juice> * 1000, 5000);

    
    
}

{//yeast
    Centrifuge.addRecipe(
        [<thermalfoundation:material:816> % 25, <contenttweaker:yeast> % 1], <harvestcraft:fruitbaititem>, null, 
        1000
    );


    InductionSmelter.addRecipe(
        <contenttweaker:yeast> * 2,
        <minecraft:sugar>, <contenttweaker:yeast>, 1000
    );
    InductionSmelter.addRecipe(
        <contenttweaker:yeast> * 4,
        <harvestcraft:honeyitem>, <contenttweaker:yeast>, 1000
    );

    Transposer.addFillRecipe(
        <contenttweaker:yeast> * 2,
        <contenttweaker:yeast>, <liquid:hootch> * 250,
        600
    );
    Transposer.addFillRecipe(
        <contenttweaker:yeast> * 3,
        <contenttweaker:yeast>, <liquid:nutrient_distillation> * 250,
        500
    );
    Transposer.addFillRecipe(
        <contenttweaker:yeast> * 5,
        <contenttweaker:yeast>, <liquid:ethanol> * 250,
        400
    );


    mods.thermalexpansion.Imbuer.addRecipe(<liquid:yeast> * 350, <contenttweaker:yeast>, <liquid:sugary_solution> * 250, 2500);
    mods.thermalexpansion.Imbuer.addRecipe(<liquid:yeast> * 500, <contenttweaker:yeast>, <liquid:glucose> * 250, 2000);
    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:yeast>, <liquid:yeast> * 250);
    
    mods.immersiveengineering.Refinery.addRecipe(<liquid:yeast_rich> * 16, <liquid:yeast> * 8, <liquid:ethanol> * 8, 200);
    mods.immersiveengineering.Refinery.addRecipe(<liquid:yeast_rich> * 20, <liquid:yeast> * 8, <liquid:sorbitol> * 8, 200);

    mods.immersivepetroleum.Distillation.addRecipe(
        [<liquid:yeast> * 25, <liquid:ethanol> * 25], 
        [<contenttweaker:yeast_rich>, <contenttweaker:yeast>, <thermalfoundation:material:817>], 
        <liquid:yeast_rich> * 100, 10 * 128, 10, 
        [0.3, 0.75, 0.1]
    );
    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:yeast_rich>, <liquid:yeast_rich> * 250);

    Centrifuge.addRecipe(
        [<contenttweaker:yeast> * 2, <contenttweaker:yeast> % 75, <contenttweaker:yeast> % 50, <contenttweaker:yeast> % 25], <contenttweaker:yeast_rich>, null,
        1000
    );
}

{//bread
    recipes.remove(<minecraft:bread>);
    furnace.remove(<minecraft:bread>);

    InductionSmelter.addRecipe(<minecraft:bread> * 4, <contenttweaker:yeast>, <harvestcraft:doughitem> * 4, 2000);
    InductionSmelter.addRecipe(<minecraft:bread> * 6, <contenttweaker:yeast_rich>, <harvestcraft:doughitem> * 4, 2000);
    /*InductionSmelter.addRecipe(
        IItemStack primaryOutput, 
        IItemStack primaryInput, IItemStack secondaryInput, 
        int energy
    );
    InductionSmelter.addRecipe(
        IItemStack primaryOutput, 
        IItemStack primaryInput, IItemStack secondaryInput, 
        int energy
    );*/

}

{//vinegar
    recipes.remove(<harvestcraft:grapejuiceitem>);
    Centrifuge.removeRecipe(<harvestcraft:grapeitem>);
    recipes.remove(<harvestcraft:vinegaritem>);


    Centrifuge.addRecipe(
        [<harvestcraft:fruitbaititem>, <thermalfoundation:material:816> % 25], <harvestcraft:greengrapeitem>, <liquid:grape_juice> * 125, 
        1000
    );
    Centrifuge.addRecipe(
        [<harvestcraft:fruitbaititem>, <thermalfoundation:material:816> % 25], <harvestcraft:grapeitem>, <liquid:grape_juice> * 125, 
        1000
    );

    Transposer.addFillRecipe(
        <harvestcraft:grapejuiceitem>,
        <minecraft:glass_bottle>, <liquid:grape_juice> * 250,
        400
    );

    mods.thermalexpansion.Imbuer.addRecipe(<liquid:vinegar> * 1000, <contenttweaker:yeast>, <liquid:grape_juice> * 1000, 5000);
    Transposer.addFillRecipe(
        <harvestcraft:vinegaritem>,
        <minecraft:glass_bottle>, <liquid:vinegar> * 250,
        400
    );
}

{//gelatin
    {//colagen
        //bones
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 150, <minecraft:dye:15>, <liquid:steam> * 500, 4500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 150, <minecraft:dye:15>,<liquid:vinegar> * 200, 3500);

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 100, <minecraft:dye:15>, <liquid:liquidhydrogenchloride> * 200, 1500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 300, <minecraft:bone>, <liquid:liquidhydrogenchloride> * 200, 1500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 700, <betternether:bone_mushroom>, <liquid:liquidhydrogenchloride> * 200, 1500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 1500, <mod_lavacow:bonestew>, <liquid:liquidhydrogenchloride> * 200, 1500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 600, <xreliquary:mob_ingredient>, <liquid:liquidhydrogenchloride> * 200, 1500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 500, <minecraft:skull>, <liquid:liquidhydrogenchloride> * 200, 1500);
        
        //lether
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 300, <minecraft:leather>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 300, <minecraft:leather>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 500, <roots:fey_leather>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 500, <roots:fey_leather>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 400, <natura:materials:6>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 400, <natura:materials:6>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 300, <natura:edibles>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 300, <natura:edibles>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 200, <minecraft:rabbit_hide>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 200, <minecraft:rabbit_hide>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 400, <erebus:materials:48>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 400, <erebus:materials:48>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 1000, <mod_lavacow:pigboarhide>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 1000, <mod_lavacow:pigboarhide>, <liquid:vinegar> * 200, 2500);
        
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 1500, <mod_lavacow:foul_hide>, <liquid:liquidhydrogenchloride> * 200, 2500);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:colagen_solution> * 1500, <mod_lavacow:foul_hide>, <liquid:vinegar> * 200, 2500);
    }

    {//pectin
        Centrifuge.addRecipe(
            [<contenttweaker:pectin> % 50], <harvestcraft:lemonaideitem>, null, 
            1000
        );
    }

    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:impure_colagen> * 400, <minecraft:dye:15> % 3, 
        <liquid:colagen_solution> * 500, 3000
    );
    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:salty_colagen> * 400, <prodigytech:meat_ground> % 3, 
        <liquid:impure_colagen> * 500, 3000
    );
    mods.thermalexpansion.Refinery.addRecipe(
        <liquid:colagen> * 400, <mekanism:salt> % 10, 
        <liquid:salty_colagen> * 500, 3000
    );
    
    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:gelatin_noodle>, <liquid:colagen> * 1000);
    Transposer.addFillRecipe(
        <contenttweaker:gelatin_noodle>,
        <contenttweaker:glucose>, <liquid:colagen> * 350,
        3000
    );
    Transposer.addFillRecipe(
        <contenttweaker:gelatin_noodle> * 2,
        <contenttweaker:pectin>, <liquid:colagen> * 250,
        2000
    );

    scripts.helper.addSimpleCrushingRecipeWByproduct(<contenttweaker:gelatin_noodle>, <contenttweaker:gelatin>, <contenttweaker:gelatin>, 50);
    
    //uses
    recipes.remove(<harvestcraft:gummybearsitem>);
    recipes.addShapeless("ia_gummybearsitem", <harvestcraft:gummybearsitem>, [<harvestcraft:saucepanitem>.reuse(), <contenttweaker:gelatin>, <minecraft:sugar>, <minecraft:dye:1>, <minecraft:dye:2>]);

    recipes.remove(<harvestcraft:slimegummiesitem>);
    recipes.addShapeless("ia_slimegummiesitem1", <harvestcraft:slimegummiesitem>, [
        <harvestcraft:mixingbowlitem>.reuse(), <ore:listAllvenisonraw>, <harvestcraft:oliveoilitem>, <minecraft:dye:2>, 
        <contenttweaker:gelatin>, <ore:slimeball>
    ]);
    recipes.addShapeless("ia_slimegummiesitem2", <harvestcraft:slimegummiesitem> * 3, [
        <harvestcraft:mixingbowlitem>.reuse(), <ore:listAllvenisonraw>, <harvestcraft:oliveoilitem>, <minecraft:dye:2>, 
        <contenttweaker:gelatin>, <industrialforegoing:pink_slime>
    ]);
}

{//starch
    Pulverizer.addRecipe(<contenttweaker:starch>, <minecraft:potato>, 500, <contenttweaker:starch>, 50);
}

{//cheese
    recipes.remove(<actuallyadditions:item_food>);
    recipes.remove(<harvestcraft:cheeseitem>);

    <forge:bucketfilled>.withTag({FluidName: "cheese", Amount: 1000}).addTooltip("Craftable");
    recipes.addShapeless("ia_cheese_ct1", 
        <forge:bucketfilled>.withTag({FluidName: "cheese", Amount: 1000}), 
        [<minecraft:bucket>, <minecraft:milk_bucket>, <mekanism:salt>, <harvestcraft:lemonaideitem>]
    );
    recipes.addShapeless("ia_cheese_ct2", 
        <forge:bucketfilled>.withTag({FluidName: "cheese", Amount: 1000}), 
        [<minecraft:bucket>, <liquid:milk> * 1000, <mekanism:salt>, <harvestcraft:lemonaideitem>]
    );
    recipes.addShapeless("ia_cheese_ct3", 
        <forge:bucketfilled>.withTag({FluidName: "cheese", Amount: 1000}), 
        [<minecraft:bucket>, <harvestcraft:soymilkitem>, <mekanism:salt>, <harvestcraft:lemonaideitem>]
    );
    recipes.addShapeless("ia_cheese_ct4", 
        <forge:bucketfilled>.withTag({FluidName: "cheese", Amount: 1000}), 
        [<minecraft:bucket>, <alchemistry:condensed_milk>, <mekanism:salt>, <harvestcraft:lemonaideitem>]
    );

    Mixer.addRecipe(<liquid:cheese> * 4000, <liquid:milk> * 4000, 
        [<mekanism:salt>, <harvestcraft:lemonaideitem>], 1000
    );
    Mixer.addRecipe(<liquid:cheese> * 4000, <liquid:soy_milk> * 4000, 
        [<mekanism:salt>, <harvestcraft:lemonaideitem>], 1000
    );

    <actuallyadditions:item_food>.displayName = "Wheel of Cheese";
    mods.alchemistry.Evaporator.addRecipe(<actuallyadditions:item_food>, <liquid:cheese> * 1000);

    recipes.addShapeless("ia_cheese_pieces", <harvestcraft:cheeseitem> * 2, [<harvestcraft:cuttingboarditem>, <actuallyadditions:item_food>]);
    scripts.helper.addSawRecipe(<actuallyadditions:item_food>, <harvestcraft:cheeseitem> * 4);
}

{//coffee
    recipes.remove(<harvestcraft:coffeeitem>);
    recipes.addShapeless("coffeeitem", <harvestcraft:coffeeitem>, [
        <actuallyadditions:item_coffee>.transformDamage()
    ]);
    mods.thermalexpansion.Crucible.addRecipe(<liquid:coffee> * 200, <harvestcraft:coffeeitem>, 3500);


    Mixer.addRecipe(<liquid:coffee> * 1000, <liquid:pure_water> * 1000, 
        [<harvestcraft:coffeebeanitem>], 1000
    );
    Mixer.addRecipe(<liquid:coffee> * 1000, <liquid:pure_water> * 1000, 
        [<actuallyadditions:item_coffee_beans>], 1000
    );

    
}

{//energy drink
    recipes.remove(<harvestcraft:energydrinkitem>);
    recipes.addShapeless("energydrinkitem", <harvestcraft:energydrinkitem> * 2, [
        <harvestcraft:potitem>.reuse(),
        <harvestcraft:bubblywateritem>, <harvestcraft:bubblywateritem>, <harvestcraft:cornmealitem>, <contenttweaker:glucose>, <prodigytech:energion_dust>,
        <liquid:caffeine> * 500, <liquid:taurine> * 1000
    ]);
    scripts.content_machines.addAdvancedMixerRecipe(
        [<harvestcraft:energydrinkitem> * 5], [],
        [
            <harvestcraft:bubblywateritem> * 4,
            <harvestcraft:cornmealitem> * 2, 
            <contenttweaker:glucose>, 
            <prodigytech:energion_dust> * 2
        ], [
            <liquid:taurine> * 1000,
            <liquid:caffeine> * 500
        ], 20, 500
    );
}

//corn
recipes.remove(<harvestcraft:cornmealitem>);
mods.thermalexpansion.Sawmill.addRecipe(
    <harvestcraft:cornmealitem>, 
    <harvestcraft:cornitem> * 4, 1500);

//recipes moved to machines
recipes.remove(<harvestcraft:caramelitem>);
recipes.remove(<harvestcraft:oliveoilitem>);
recipes.remove(<harvestcraft:cocoapowderitem>);

recipes.remove(<actuallyadditions:item_food:9>);
recipes.remove(<harvestcraft:chocolatebaritem>);


{//cooking oil
    Centrifuge.removeRecipe(<harvestcraft:walnutitem>);
    Centrifuge.removeRecipe(<harvestcraft:avocadoitem>);
    Centrifuge.removeRecipe(<minecraft:pumpkin_seeds>);
    Centrifuge.removeRecipe(<harvestcraft:mustardseeditem>);
    Centrifuge.removeRecipe(<harvestcraft:cottonseeditem>);
    //Centrifuge.removeRecipe(<harvestcraft:oliveitem>);
    Centrifuge.removeRecipe(<minecraft:pumpkin>);
    Centrifuge.removeRecipe(<harvestcraft:tealeafitem>);
}


recipes.remove(<harvestcraft:grilledmushroomitem>);
InductionSmelter.addRecipe(
	<harvestcraft:grilledmushroomitem> * 4,
	<harvestcraft:oliveoilitem>, <harvestcraft:whitemushroomitem> * 4, 400
);

mods.roots.Pyre.removeRecipe(<minecraft:cooked_beef>);
mods.roots.Pyre.removeRecipe(<minecraft:cooked_porkchop>);
mods.roots.Pyre.removeRecipe(<minecraft:cooked_chicken>);
mods.roots.Pyre.removeRecipe(<minecraft:cooked_mutton>);
mods.roots.Pyre.removeRecipe(<minecraft:cooked_rabbit>);
mods.roots.Pyre.removeRecipe(<mysticalworld:cooked_venison>);

moveCookingRecipe(<minecraft:chicken>, <minecraft:cooked_chicken>);
moveCookingRecipe(<minecraft:mutton>, <minecraft:cooked_mutton>);
moveCookingRecipe(<minecraft:beef>, <minecraft:cooked_beef>);
moveCookingRecipe(<minecraft:rabbit>, <minecraft:cooked_rabbit>);
moveCookingRecipe(<minecraft:porkchop>, <minecraft:cooked_porkchop>);
moveCookingRecipe(<minecraft:fish:1>, <minecraft:cooked_fish:1>);

moveCookingRecipe(<atum:camel_raw>, <atum:camel_cooked>);
moveCookingRecipe(<mysticalworld:venison>, <mysticalworld:cooked_venison>);
moveCookingRecipe(<natura:edibles>, <natura:edibles:1>);
moveCookingRecipe(<harvestcraft:turkeyrawitem>, <harvestcraft:turkeycookeditem>);
moveCookingRecipe(<harvestcraft:venisonrawitem>, <harvestcraft:venisoncookeditem>);
moveCookingRecipe(<harvestcraft:duckrawitem>, <harvestcraft:duckcookeditem>);
moveCookingRecipe(<primitivemobs:dodo>, <primitivemobs:cooked_dodo>);
furnace.remove(<primitivemobs:cooked_dodo>, <primitivemobs:dodo>);
moveCookingRecipe(<twilightforest:raw_venison>, <twilightforest:cooked_venison>);
moveCookingRecipe(<twilightforest:raw_meef>, <twilightforest:cooked_meef>);

moveCookingRecipe(<erebus:erebus_food:2>, <erebus:erebus_food:3>);
moveCookingRecipe(<quark:crab_leg>, <quark:cooked_crab_leg>);
moveCookingRecipe(<erebus:erebus_food:4>, <erebus:erebus_food:5>);
moveCookingRecipe(<harvestcraft:calamarirawitem>, <harvestcraft:calamaricookeditem>);
moveCookingRecipe(<quark:frog_leg>, <quark:cooked_frog_leg>);
moveCookingRecipe(<mod_lavacow:mimic_claw>, <mod_lavacow:mimic_claw_cooked>);
moveCookingRecipe(<harvestcraft:grubitem>, <harvestcraft:cookedgrubitem>);

moveCookingRecipe(<mod_lavacow:piranha>, <mod_lavacow:piranha_cooked>);
moveCookingRecipe(<mod_lavacow:cheirolepis>, <mod_lavacow:cheirolepis_cooked>);
moveCookingRecipe(<mod_lavacow:zombiepiranha_item>, <mod_lavacow:zombiepiranha_item_cooked>);
moveCookingRecipe(<mod_lavacow:enigmoth_larva_item>, <mod_lavacow:enigmoth_larva_item_cooked>);

furnace.remove(<erebus:erebus_food:13>);
InductionSmelter.addRecipe(
    <erebus:erebus_food:13>, 
    <harvestcraft:oliveoilitem>, <erebus:erebus_food:12>, 
    400
);
moveCookingRecipe(<prodigytech:meat_ground>, <prodigytech:meat_patty>);

moveCookingRecipe(<harvestcraft:rawtofuduckitem>, <harvestcraft:cookedtofuduckitem>);
moveCookingRecipe(<harvestcraft:rawtofenisonitem>, <harvestcraft:cookedtofenisonitem>);
moveCookingRecipe(<harvestcraft:rawtofurkeyitem>, <harvestcraft:cookedtofurkeyitem>);
moveCookingRecipe(<harvestcraft:rawtofabbititem>, <harvestcraft:cookedtofabbititem>);
moveCookingRecipe(<harvestcraft:rawtofickenitem>, <harvestcraft:cookedtofickenitem>);
moveCookingRecipe(<harvestcraft:rawtofuttonitem>, <harvestcraft:cookedtofuttonitem>);
moveCookingRecipe(<harvestcraft:rawtofeegitem>, <harvestcraft:cookedtofeegitem>);
moveCookingRecipe(<harvestcraft:rawtofishitem>, <harvestcraft:cookedtofishitem>);
moveCookingRecipe(<harvestcraft:rawtofaconitem>, <harvestcraft:cookedtofaconitem>);
moveCookingRecipe(<harvestcraft:rawtofeakitem>, <harvestcraft:cookedtofeakitem>);

recipes.remove(<harvestcraft:grilledasparagusitem>);
InductionSmelter.addRecipe(
    <harvestcraft:grilledasparagusitem> * 4,
    <harvestcraft:oliveoilitem>, <harvestcraft:asparagusitem> * 4, 
    400
);

furnace.remove(<tconevo:edible:1>);
InductionSmelter.addRecipe(
    <tconevo:edible:1>, 
    <harvestcraft:oliveoilitem>, <tconevo:edible>, 
    400
);

//noodles
recipes.remove(<harvestcraft:noodlesitem>);
mods.thermalexpansion.Sawmill.addRecipe(
    <harvestcraft:noodlesitem> * 4, 
    <harvestcraft:doughitem>, 1500
);


//creeper cookie wings
recipes.remove(<harvestcraft:creeperwingsitem>);
mods.enderio.AlloySmelter.addRecipe(<harvestcraft:creeperwingsitem> * 3, 
    [
        <harvestcraft:turkeycookeditem> * 3,
        <xreliquary:mob_ingredient:8>,
        <xreliquary:mob_ingredient:3> * 5
    ]
);
recipes.remove(<harvestcraft:creepercookieitem>);
mods.enderio.AlloySmelter.addRecipe(<harvestcraft:creepercookieitem> * 3, 
    [
        <minecraft:cookie> * 3,
        <xreliquary:mob_ingredient:8>,
        <xreliquary:mob_ingredient:3> * 5
    ]
);