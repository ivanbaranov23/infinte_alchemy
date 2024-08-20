


mods.botania.RuneAltar.addRecipe(<contenttweaker:night_glass> * 2, [
    <botania:elfglass>,
    <botania:elfglass>,
    <botania:elfglass>,
    <botania:elfglass>,
    <contenttweaker:star_polymer>,
    <quantumflux:craftingpiece:1>,
    <contenttweaker:indium_dust>
], 20000);

mods.botaniatweaks.Agglomeration.addRecipe(
    <contenttweaker:starry_glass>,
    [
        <contenttweaker:night_glass>, 
        <contenttweaker:star_alloy_plate>, 
        <astralsorcery:itemcraftingcomponent:4>,
        <minecraft:nether_star>,
        <contenttweaker:star_polymer>
    ],
    500000,
    0xf6faab,
    0x7dd2e0,
    <extendedcrafting:storage:6>, <minecraft:bedrock>, <contenttweaker:bloody_gearbox>,
    null, <contenttweaker:bedrockium_alloy_block>, <contenttweaker:bloody_gearbox_inactive>
);

recipes.addShaped("ia_star_frame", <contenttweaker:star_frame>, [
	[<moreplates:stellar_alloy_plate>, <contenttweaker:rune_lightning>, <moreplates:stellar_alloy_plate>], 
	[<contenttweaker:elf_mana_circuit>, <contenttweaker:mana_frame>, <contenttweaker:elf_mana_circuit>], 
	[<contenttweaker:starmetal_plate>, <botania:rune:11>, <contenttweaker:starmetal_plate>]
]);


mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:sunnarium_core>, [
    [<taiga:nihilite_block>, <taiga:nihilite_block>, <contenttweaker:compact_empowerer>, <taiga:nihilite_block>, <taiga:nihilite_block>], 
    [<taiga:nihilite_block>, <contenttweaker:starmetal_plate>, <contenttweaker:sunnarium_chunk>, <contenttweaker:starmetal_plate>, <taiga:nihilite_block>], 
    [<contenttweaker:compact_empowerer>, <contenttweaker:sunnarium_chunk>, <contenttweaker:light_gear>, <contenttweaker:sunnarium_chunk>, <contenttweaker:compact_empowerer>], 
    [<taiga:nihilite_block>, <contenttweaker:starmetal_plate>, <contenttweaker:sunnarium_chunk>, <contenttweaker:starmetal_plate>, <taiga:nihilite_block>], 
    [<taiga:nihilite_block>, <taiga:nihilite_block>, <contenttweaker:compact_empowerer>, <taiga:nihilite_block>, <taiga:nihilite_block>]
]);