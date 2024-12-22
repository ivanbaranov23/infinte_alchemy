import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.data.IData;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;

import mods.ctutils.utils.Math;


{//luck particle
    recipes.addShaped("ia_luck_chip", <contenttweaker:luck_chip>, [
        [<atum:coin_gold>, <atum:coin_gold>, <atum:coin_gold>], 
        [<atum:coin_gold>, <contenttweaker:luck_particle>, <atum:coin_gold>], 
        [<atum:coin_gold>, <atum:coin_gold>, <atum:coin_gold>]
    ]);

    //luck crystal base
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:luck_crystal_base>, [
        [null, null, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>], 
        [null, <actuallyadditions:block_crystal_empowered:4>, <extendedcrafting:singularity:7>, <extendedcrafting:singularity:7>, <actuallyadditions:block_crystal_empowered:4>], 
        [<actuallyadditions:block_crystal_empowered:4>, <extendedcrafting:singularity:7>, <contenttweaker:bouncy_matter>, <extendedcrafting:singularity:7>, <actuallyadditions:block_crystal_empowered:4>], 
        [<actuallyadditions:block_crystal_empowered:4>, <extendedcrafting:singularity:7>, <extendedcrafting:singularity:7>, <actuallyadditions:block_crystal_empowered:4>, null], 
        [<actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, null, null]
    ]);
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:luck_crystal_base>, 
        [
            <contenttweaker:bouncy_matter_small> * 12,
            <actuallyadditions:item_crystal_empowered:4> * 24,
            <contenttweaker:luck_particle> * 64
        ], 300000
    );

    //luck crystal
    <contenttweaker:luck_crystal>.addAdvancedTooltip(function(item){
        if (item.tag.memberGet("luck")){
            //item good
            return "§6Luck: " ~ item.tag.luck.asInt();
        }
        //item bad
        return "§4No luck";
    });
    recipes.addShapeless("ia_luck_crystal", <contenttweaker:luck_crystal>,
        [<contenttweaker:luck_crystal_base>],
            
        function(out, ins, cInfo){
            var range as int = 101;
            var value as int = ((Math.floor(Math.random() * range)) as IData).asInt();
                
            return <contenttweaker:luck_crystal>.withTag( {
                luck: value
            } );
        }, null
    );
    recipes.addShaped("ia_luck_crystal_reroll", <contenttweaker:luck_crystal>,
        [
            [null, <contenttweaker:luck_chip> | <contenttweaker:research_luck>, null],
            [<contenttweaker:luck_chip>, <contenttweaker:luck_crystal>, <contenttweaker:luck_chip>],
            [null, <contenttweaker:luck_chip>, null]
        ],
            
        function(out, ins, cInfo){
            var range as int = 101;
            var value as int = ((Math.floor(Math.random() * range)) as IData).asInt();
                
            return <contenttweaker:luck_crystal>.withTag( {
                luck: value
            } );
        }, null
    );

    //luck particles
    for i in 1 to 101{
        var rec = RecipeBuilder.newBuilder("luck" ~ i, "luck_extractor", 20);
        rec.addEnergyPerTickInput(1024);

        rec.addItemOutput(<contenttweaker:luck_particle> * i);
        rec.addItemInput(
            <contenttweaker:luck_crystal>.withTag({luck: i})
        );
        rec.addFluidInput(<liquid:potion>.withTag({Potion: "cofhcore:luck4"}) * (25 * i));

        rec.build();
    }


    {print("[luck] adding 0.9");
        var recipe = AssemblyRecipe.create(function(container) {
            var luck1 as IItemStack = container.getItem("luck1");
            var luck2 as IItemStack = container.getItem("luck2");

            if (container.jei){
                container.addItemOutput("output0", <contenttweaker:luck_crystal>.withLore([
                    "Luck = (luckA + luckB) * 0.9",
                    "Crystals must be renamed"
                ]));
            }
            else{
                if (luck1.tag.memberGet("luck"))
                if (luck2.tag.memberGet("luck")){
                    container.addItemOutput("output0", <contenttweaker:luck_crystal>.withTag({
                        "luck": (((luck1.tag.luck.asInt() + luck2.tag.luck.asInt()) * 9 / 10) as IData)
                    })    
                    );
                }
            }
        });

        recipe = recipe.requireItem("input", <contenttweaker:luck_crystal>.withDisplayName("luckA").marked("luck1"));
        recipe = recipe.requireItem("input", <contenttweaker:luck_crystal>.withDisplayName("luckB").marked("luck2"));
        recipe = recipe.requireItem("input", <contenttweaker:luck_particle> * 16);
        recipe = recipe.requireItem("input", <contenttweaker:superglue> * 16);
        

        recipe = recipe.requireItem("catalyst", <contenttweaker:research_luck>, 0, 0);
        
        recipe = recipe.requireDuration("duration", 40);
        recipe = recipe.requireEnergy("power", 1000000);

        <assembly:bioassembler>.addRecipe(recipe);
        <assembly:bioassembler>.addJEIRecipe(recipe);	
    }
    {print("[luck] adding 1.0");
        var recipe = AssemblyRecipe.create(function(container) {
            var luck1 as IItemStack = container.getItem("luck1");
            var luck2 as IItemStack = container.getItem("luck2");

            if (container.jei){
                container.addItemOutput("output0", <contenttweaker:luck_crystal>.withLore([
                    "Luck = luckA + luckB",
                    "Crystals must be renamed"
                ]));
            }
            else{
                if (luck1.tag.memberGet("luck"))
                if (luck2.tag.memberGet("luck")){
                    container.addItemOutput("output0", <contenttweaker:luck_crystal>.withTag({
                        "luck": luck1.tag.luck.asInt() + luck2.tag.luck.asInt()
                    })    
                    );
                }
            }
        });

        recipe = recipe.requireItem("input", <contenttweaker:luck_crystal>.withDisplayName("luckA").marked("luck1"));
        recipe = recipe.requireItem("input", <contenttweaker:luck_crystal>.withDisplayName("luckB").marked("luck2"));
        recipe = recipe.requireItem("input", <extendedcrafting:singularity_custom:50>);
        recipe = recipe.requireItem("input", <contenttweaker:superglue> * 32);
        

        recipe = recipe.requireItem("catalyst", <contenttweaker:research_luck>, 0, 0);
        
        recipe = recipe.requireDuration("duration", 40);
        recipe = recipe.requireEnergy("power", 1000000);

        <assembly:bioassembler>.addRecipe(recipe);
        <assembly:bioassembler>.addJEIRecipe(recipe);	
    }
    
    
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:lucky_gearbox>], null,
        [
            <contenttweaker:luck_crystal>.withTag({luck: 100}),
            <contenttweaker:bloody_gearbox> * 8,
            <thermalfoundation:material:27> * 64
        ], [], <contenttweaker:research_luck>,
        50, 10000
    );
}

mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:infinity_treat>, [
    [null, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, null], 
    [<harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>], 
    [<harvestcraft:chaoscookieitem>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <harvestcraft:chaoscookieitem>], 
    [<harvestcraft:chaoscookieitem>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <harvestcraft:chaoscookieitem>], 
    [<harvestcraft:chaoscookieitem>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <harvestcraft:chaoscookieitem>], 
    [<harvestcraft:chaoscookieitem>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <botania_tweaks:compressed_tiny_potato_8>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <harvestcraft:chaoscookieitem>], 
    [<harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <avaritia:cosmic_meatballs>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>], 
    [<contenttweaker:galastem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <harvestcraft:chaoscookieitem>, <contenttweaker:galastem>], 
    [null, <contenttweaker:galastem>, <contenttweaker:galastem>, <contenttweaker:galastem>, <contenttweaker:galastem>, <contenttweaker:galastem>, <contenttweaker:galastem>, <contenttweaker:galastem>, null]
]);



{//bouncy matter
    //Extremly-Extreme Extreme-Bounce-Capable Bouncy Matter (Very Extreme)
    <contenttweaker:very_very_bouncy_matter>.addTooltip("The Extremly...Bouncy Matter was so bouncy, that");
    <contenttweaker:very_very_bouncy_matter>.addTooltip("upgrading it caused it to bounce into the forth dimension");
}