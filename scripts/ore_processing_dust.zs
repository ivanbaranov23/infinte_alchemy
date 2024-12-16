
//electotine
mods.tconstruct.Melting.removeRecipe(<liquid:electrotine>, <netherendingores:ore_end_modded_2:4>);

{//ancient dust
    mods.roots.Mortar.addRecipe("ad_fffft",
        <contenttweaker:ancient_dust>,
        [<erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:74>]
    );
    mods.roots.Mortar.addRecipe("ad_ffftt",
        <contenttweaker:ancient_dust> * 2,
        [<erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:74>, <erebus:materials:74>]
    );
    mods.roots.Mortar.addRecipe("ad_ffffg",
        <contenttweaker:ancient_dust>,
        [<erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>]
    );
    mods.roots.Mortar.addRecipe("ad_fffgg",
        <contenttweaker:ancient_dust> * 2,
        [<erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>, <erebus:materials:47>]
    );
    mods.roots.Mortar.addRecipe("ad_fffgt",
        <contenttweaker:ancient_dust> * 3,
        [<erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>, <erebus:materials:74>]
    );



    mods.roots.Mortar.addRecipe("ad_bffft",
        <contenttweaker:ancient_dust> * 2,
        [<atum:dusty_bone>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:74>]
    );
    mods.roots.Mortar.addRecipe("ad_bfftt",
        <contenttweaker:ancient_dust> * 3,
        [<atum:dusty_bone>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:74>, <erebus:materials:74>]
    );
    mods.roots.Mortar.addRecipe("ad_bfffg",
        <contenttweaker:ancient_dust> * 2,
        [<atum:dusty_bone>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>]
    );
    mods.roots.Mortar.addRecipe("ad_bffgg",
        <contenttweaker:ancient_dust> * 3,
        [<atum:dusty_bone>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>, <erebus:materials:47>]
    );
    mods.roots.Mortar.addRecipe("ad_bffgt",
        <contenttweaker:ancient_dust> * 4,
        [<atum:dusty_bone>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>, <erebus:materials:74>]
    );



    mods.roots.Mortar.addRecipe("ad_brfft",
        <contenttweaker:ancient_dust> * 3,
        [<atum:dusty_bone>, <contenttweaker:relic_ingot>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:74>]
    );
    mods.roots.Mortar.addRecipe("ad_brftt",
        <contenttweaker:ancient_dust> * 4,
        [<atum:dusty_bone>, <contenttweaker:relic_ingot>, <erebus:materials:2>, <erebus:materials:74>, <erebus:materials:74>]
    );
    mods.roots.Mortar.addRecipe("ad_brffg",
        <contenttweaker:ancient_dust> * 3,
        [<atum:dusty_bone>, <contenttweaker:relic_ingot>, <erebus:materials:2>, <erebus:materials:2>, <erebus:materials:47>]
    );
    mods.roots.Mortar.addRecipe("ad_brfgg",
        <contenttweaker:ancient_dust> * 4,
        [<atum:dusty_bone>, <contenttweaker:relic_ingot>, <erebus:materials:2>, <erebus:materials:47>, <erebus:materials:47>]
    );
    mods.roots.Mortar.addRecipe("ad_brfgt",
        <contenttweaker:ancient_dust> * 5,
        [<atum:dusty_bone>, <contenttweaker:relic_ingot>, <erebus:materials:2>, <erebus:materials:47>, <erebus:materials:74>]
    );

}
mods.thermalexpansion.Centrifuge.addRecipe(
    [<taiga:meteorite_dust> % 40, <mekores:mekanismore:8> % 25, <mekores:mekanismore:23> % 15, <taiga:prometheum_dust> % 15], 
    <contenttweaker:ancient_dust> * 4, null, 5000
);


//nickel oxide

//graphite
<ore:dustIGraphite>.add(<quantumflux:graphitedust>);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<quantumflux:graphiteore>, <bigreactors:blockgraphite>, 30000);

//rare earth
mods.enderio.SagMill.addRecipe(
    [<contenttweaker:rare_earth_dust>, <contenttweaker:rare_earth_dust>, <contenttweaker:rare_earth_dust>, <contenttweaker:rare_earth_dust>], 
    [1.0, 0.75, 0.5, 0.25], <contenttweaker:rare_earth_sand>, "MULTIPLY_OUTPUT"
);