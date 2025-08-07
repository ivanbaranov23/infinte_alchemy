
import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;


mods.botania.RuneAltar.addRecipe(<contenttweaker:night_glass> * 2, [
    <botania:elfglass>,
    <botania:elfglass>,
    <botania:elfglass>,
    <botania:elfglass>,
    <contenttweaker:star_polymer>,
    <quantumflux:craftingpiece:1>,
    <contenttweaker:indium_dust>
], 20000);


/*
recipes.addShaped("ia_star_frame", <contenttweaker:star_frame>, [
	[<moreplates:stellar_alloy_plate>, <contenttweaker:rune_lightning>, <moreplates:stellar_alloy_plate>], 
	[<contenttweaker:elf_mana_circuit>, <contenttweaker:mana_frame>, <contenttweaker:elf_mana_circuit>], 
	[<contenttweaker:starmetal_plate>, <botania:rune:11>, <contenttweaker:starmetal_plate>]
]);
*/

mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:sunnarium_core>, [
    [<taiga:nihilite_block>, <contenttweaker:compact_empowerer>, <contenttweaker:compact_empowerer>, <contenttweaker:compact_empowerer>, <taiga:nihilite_block>], 
    [<contenttweaker:compact_empowerer>, <contenttweaker:starmetal_plate>, <contenttweaker:sunnarium_chunk>, <contenttweaker:starmetal_plate>, <contenttweaker:compact_empowerer>], 
    [<contenttweaker:compact_empowerer>, <contenttweaker:sunnarium_chunk>, <contenttweaker:light_gear>, <contenttweaker:sunnarium_chunk>, <contenttweaker:compact_empowerer>], 
    [<contenttweaker:compact_empowerer>, <contenttweaker:starmetal_plate>, <contenttweaker:sunnarium_chunk>, <contenttweaker:starmetal_plate>, <contenttweaker:compact_empowerer>], 
    [<taiga:nihilite_block>, <contenttweaker:compact_empowerer>, <contenttweaker:compact_empowerer>, <contenttweaker:compact_empowerer>, <taiga:nihilite_block>]
]);

//altar
recipes.remove(<astralsorcery:blockaltar>);

//lightwell
mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/lightwell");
mods.extendedcrafting.TableCrafting.addShaped(0, <astralsorcery:blockwell>, [
    [<astralsorcery:blockmarble>, null, null, null, <astralsorcery:blockmarble>], 
    [<astralsorcery:blockmarble>, null, null, null, <astralsorcery:blockmarble>], 
    [<astralsorcery:blockmarble>, <astralsorcery:itemcraftingcomponent>, <astralsorcery:itemcraftingcomponent>, <astralsorcery:itemcraftingcomponent>, <astralsorcery:blockmarble>], 
    [<astralsorcery:blockmarble>, <contenttweaker:starmetal_plate>, <actuallyadditions:block_misc:9>, <contenttweaker:starmetal_plate>, <astralsorcery:blockmarble>], 
    [<astralsorcery:blockmarble>, <astralsorcery:blockmarble:6>, <astralsorcery:blockmarble:6>, <astralsorcery:blockmarble:6>, <astralsorcery:blockmarble>]
]);


{
    var recipe = AssemblyRecipe.create(function(container) {
		for o in 0 to 2 {
			if(container.jei)
				container.addItemOutput("output" ~ o, <astralsorcery:itemrockcrystalsimple>.withLore(["200 size", "other stats are the same", "§d§lchance 80%"]));
			else if(container.random.nextDouble() < 0.8) //>
				container.addItemOutput("output" ~ o, <astralsorcery:itemrockcrystalsimple>.withTag(container.getItem("mark").tag + {
                    astralsorcery:{
                        crystalProperties:{
                            size: 200
                        }
                    }
                }));
		}
        
	});
	recipe = recipe.requireItem("input", <astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery: {crystalProperties: {size: 400}}}).marked("mark"));
    
    recipe = recipe.requireFluid("input", <liquid:mekanized_lubricant> * 1000);
    

    recipe = recipe.requireItem("catalyst", <contenttweaker:pressure_cutter>, 0, 0);
    
    recipe = recipe.requireDuration("duration", 100);
    recipe = recipe.requireEnergy("power", 100 * 1000);

    <assembly:bioassembler>.addRecipe(recipe);
    <assembly:bioassembler>.addJEIRecipe(recipe);
}