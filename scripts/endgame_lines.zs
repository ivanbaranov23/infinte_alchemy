import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.data.IData;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;

import mods.ctutils.utils.Math;


{//luck particle
    mods.jei.JEI.addItem(<contenttweaker:luck_crystal>.withTag({luck: 1}));
    mods.jei.JEI.addItem(<contenttweaker:luck_crystal>.withTag({luck: 100}));


    recipes.addShaped("ia_luck_chip", <contenttweaker:luck_chip>, [
        [<atum:coin_gold>, <atum:coin_gold>, <atum:coin_gold>], 
        [<atum:coin_gold>, <contenttweaker:luck_particle>, <atum:coin_gold>], 
        [<atum:coin_gold>, <atum:coin_gold>, <atum:coin_gold>]
    ]);
    recipes.addShaped("ia_luck_chip2", <contenttweaker:luck_chip> * 3, [
        [<atum:coin_gold>, <atum:coin_gold>, <atum:coin_gold>], 
        [<contenttweaker:luck_particle>, <contenttweaker:research_luck>.reuse(), <contenttweaker:luck_particle>], 
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
            [null, <contenttweaker:luck_chip>, null],
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
        rec.addFluidInput(<liquid:potion>.withTag({Potion: "cofhcore:luck4"}) * (125 * i));

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

{//dark matter
    //removing
    

    //making
    {//dark matter unit
        var rec = RecipeBuilder.newBuilder("dark_matter_unit", "space_assembler", 200);
        rec.addEnergyPerTickInput(10 * 1000 * 1000);

        rec.addFluidInput(<liquid:circuit> * 10000);

        rec.addInputs([
            <contenttweaker:onyx_mirror> * 16,
            <botania:tinyplanetblock>,
            <extendedcrafting:singularity_custom:99> * 4,
            <contenttweaker:perfect_mirror_array> * 6,
            <contenttweaker:magnetic_glass> * 16,
            <contenttweaker:star_frame>
        ]);
        
        rec.addItemOutput(<contenttweaker:onyx_unit> * 2);
        rec.build();
    }
    {//filling unit 1
        var rec = RecipeBuilder.newBuilder("filling_dark_matter_unit", "satellite_launch_pad", 200);
        rec.addEnergyPerTickInput(1000000);

        rec.addItemInput(<contenttweaker:space_navigator>.withTag({target: "wimps"}));
        rec.addItemOutput(<contenttweaker:space_navigator>);

        rec.addInput(<contenttweaker:onyx_unit>);
        //rec.addInput(<extendedcrafting:singularity_custom:77>);
        rec.addGasInput(<gas:amethesting> * 25000);
        
        rec.addItemOutput(<contenttweaker:onyx_unit2>);
        rec.addFluidInput(<liquid:rocket_fuel> * 10000);
        

        rec.build();
    }
    {//filling unit 2
        var rec = RecipeBuilder.newBuilder("filling_dark_matter_unit2", "satellite_launch_pad", 200);
        rec.addEnergyPerTickInput(1000000);

        rec.addItemInput(<contenttweaker:space_navigator>.withTag({target: "wimps"}));
        rec.addItemOutput(<contenttweaker:space_navigator>);

        rec.addInput(<contenttweaker:onyx_unit>);
        rec.addInput(<extendedcrafting:singularity_custom:77>).setChance(0.5);
        //rec.addGasInput(<gas:amethesting> * 25000);
        
        rec.addItemOutput(<contenttweaker:onyx_unit2>);
        rec.addFluidInput(<liquid:rocket_fuel> * 10000);
        

        rec.build();
    }

    {//dark matter
        var rec = RecipeBuilder.newBuilder("dark_matter", "space_assembler", 200);
        rec.addEnergyPerTickInput(10 * 1000 * 1000);

        //rec.addFluidInput(<liquid:circuit> * 10000);

        rec.addInputs([
            <contenttweaker:onyx_unit2>
        ]);
        
        rec.addItemOutput(<contenttweaker:onyx_unit> * 1);
        rec.addOutput(<liquid:dark_matter> * (144 * 32));
        rec.build();
    }


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

{//infinity line
    //sieving in ex nihilo
    
    mods.roots.Fey.addRecipe("infline", <contenttweaker:heavy_particle> * 16, [
        <contenttweaker:infline_seed1>,
        <contenttweaker:infline_seed3>,
        <extendedcrafting:singularity_custom:74>,
        <extendedcrafting:singularity_custom:99>,
        <contenttweaker:ma_essence5>
    ]);

    {//matter seeds
        mods.roots.Pyre.addRecipe("matter_seed", <contenttweaker:infline_seed2>, [
            <contenttweaker:infline_seed1>,
            <contenttweaker:proton>,
            <contenttweaker:positronium>,
            <contenttweaker:fertilizer7>,
            <contenttweaker:fertilizer7>
        ]);
        mods.roots.Pyre.addRecipe("antimatter_seed", <contenttweaker:infline_seed4>, [
            <contenttweaker:infline_seed3>,
            <contenttweaker:anti_proton>,
            <contenttweaker:positronium>,
            <contenttweaker:fertilizer7>,
            <contenttweaker:fertilizer7>
        ]);
    }
    {//anti petals
        mods.roots.Mortar.addRecipe("infline_flower1", <contenttweaker:anti_petals>, [<contenttweaker:inf_flower1>]);
        mods.roots.Mortar.addRecipe("infline_flower2", <contenttweaker:anti_petals>, [<contenttweaker:inf_flower2>]);
        mods.roots.Mortar.addRecipe("infline_flower3", <contenttweaker:anti_petals>, [<contenttweaker:inf_flower3>]);
        mods.roots.Mortar.addRecipe("infline_flower4", <contenttweaker:anti_petals>, [<contenttweaker:inf_flower4>]);
        mods.roots.Mortar.addRecipe("infline_flower5", <contenttweaker:anti_petals>, [<contenttweaker:inf_flower5>]);
        
        mods.roots.Mortar.addRecipe("infline_flower1", <contenttweaker:anti_petals> * 15, [
            <contenttweaker:inf_flower1>, <contenttweaker:inf_flower2>, <contenttweaker:inf_flower3>, <contenttweaker:inf_flower4>, <contenttweaker:inf_flower5>
        ]);
    }

    furnace.addRecipe(<contenttweaker:heavy_particle2>, <contenttweaker:heavy_particle>);

    mods.tconstruct.Melting.addRecipe(<liquid:heavy_fluid1> * 144, <contenttweaker:heavy_particle2>, 5000);
    mods.tconstruct.Alloy.addRecipe( <liquid:heavy_fluid2> * (144 * 64), [
                <liquid:heavy_fluid1> * (144 * 64),
                <liquid:dark_matter> * (144 * 64),
                <liquid:lifeessence> * (32000)
    ] );
    mods.tconstruct.Casting.addTableRecipe(<contenttweaker:time_crystal> * 2, <moretcon:spacetimedisruptionpowder>, <liquid:heavy_fluid2>, 144, true);
    mods.tconstruct.Casting.addTableRecipe(<contenttweaker:time_crystal>, null, <liquid:heavy_fluid2>, 144, false);

    {var recipe = RecipeBuilder.newBuilder("time_crystal_singularity", "tree_powered_compressor", 20 * 60 * 5);
        recipe.addItemInput(<contenttweaker:time_crystal> * 256);
        recipe.addItemInput(<contenttweaker:infline_seed2>);
        recipe.addItemInput(<contenttweaker:infline_seed4>);
        recipe.addItemInput(<mysticalagriculture:mystical_fertilizer> * 64);
        recipe.addFluidInput(<liquid:ultrapure_water> * 10000);
        recipe.addItemOutput(<contenttweaker:time_crystal_singularity>);
        recipe.build();
    }

    //prodigy
    mods.prodigytech.explosionfurnace.recipes.addRecipe(
		<contenttweaker:high_superconductor> * 16, <contenttweaker:quantum_wire> * 16, 3000 * 64, <contenttweaker:time_crystal_singularity>, 1
	);

    mods.prodigytech.magneticreassembler.addRecipe(<contenttweaker:quantum_wire>, <contenttweaker:quantum_wire2>);

    mods.prodigytech.solderer.addRecipe(<prodigytech:pattern_circuit_perfected>,
		<contenttweaker:quantum_wire2> * 4, <contenttweaker:quantum_circuit>, 36
	);

    mods.prodigytech.atomicreshaper.addRecipeMulti(
        <contenttweaker:quantum_circuit>, 50, 20, [
            <contenttweaker:quantum_circuit1>, <contenttweaker:quantum_circuit2>, <contenttweaker:quantum_circuit3>
        ]
    );

    //immersive
    mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:quantum_core>, <contenttweaker:quantum_circuit1>, <minecraft:skull:1>, 10000, 1);
    mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:quantum_core> * 2, <contenttweaker:quantum_circuit2>, <minecraft:skull:1>, 10000, 1);
    mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:quantum_core> * 4, <contenttweaker:quantum_circuit3>, <minecraft:skull:1>, 10000, 1);

    mods.immersiveengineering.Mixer.addRecipe(
		<liquid:quantum_circuit> * 1000, <liquid:circuit> * 1000, 
		[<contenttweaker:quantum_core>, <contenttweaker:anti_petals>], 
		20000
	);

    scripts.compact_distill.addCompactDistill(
        [
            <liquid:quantum> * 50,
            <liquid:rainbow> * 50
        ], 
        [], 
        <liquid:quantum_circuit> * 100, 1000000, 10, 
        []
    );

}