import mods.immersiveengineering.Mixer as IEMixer;
import mods.thermalexpansion.Imbuer;


{//glowshroom stew

    mods.thermalexpansion.Transposer.addFillRecipe(
        <natura:glowshroom_stew>, <minecraft:bowl>, <liquid:glowshroom_stew> * 250, 1000
    );

    mods.thermalexpansion.Transposer.addExtractRecipe(
        <liquid:glowshroom_stew> * 250, <natura:glowshroom_stew>, 1000, <minecraft:bowl>
    );

    //glowcelium
    recipes.addShaped("ia_glowcelium1", <quark:glowcelium> * 6, [
        [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>], 
        [<minecraft:dirt>, <liquid:glowshroom_stew> * 1000, <minecraft:dirt>], 
        [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>]
    ]);
    recipes.addShaped("ia_glowcelium2", <quark:glowcelium> * 12, [
        [<minecraft:mycelium>, <minecraft:mycelium>, <minecraft:mycelium>], 
        [<minecraft:mycelium>, <liquid:glowshroom_stew> * 1000, <minecraft:mycelium>], 
        [<minecraft:mycelium>, <minecraft:mycelium>, <minecraft:mycelium>]
    ]);

    //stew
    IEMixer.addRecipe(<liquid:glowshroom_stew> * 500, <liquid:water> * 500, [<natura:nether_glowshroom>, <natura:nether_glowshroom:1>, <natura:nether_glowshroom:2>], 4800);

    IEMixer.addRecipe(<liquid:glowshroom_stew> * 1000, <liquid:water> * 1000, [<natura:nether_glowshroom>, <roots:baffle_cap_mushroom>], 4000);
    IEMixer.addRecipe(<liquid:glowshroom_stew> * 1000, <liquid:water> * 1000, [<natura:nether_glowshroom:1>, <roots:baffle_cap_mushroom>], 4000);
    IEMixer.addRecipe(<liquid:glowshroom_stew> * 1000, <liquid:water> * 1000, [<natura:nether_glowshroom:2>, <roots:baffle_cap_mushroom>], 4000);

    IEMixer.addRecipe(<liquid:glowshroom_stew> * 1250, <liquid:water> * 1250, [<quark:glowshroom>, <roots:baffle_cap_mushroom>], 4000);
    IEMixer.addRecipe(<liquid:glowshroom_stew> * 1000, <liquid:mushroom_stew> * 1000, [<quark:glowshroom>], 4000);

    Imbuer.addRecipe(<liquid:glowshroom_stew> * 1000, <quark:glowshroom>, <liquid:mushroom_stew> * 1000, 8000);
}

{//eggplant
    recipes.addShapeless("ia_eggplant", <contenttweaker:eggplant_dust> * 3, [
        <betternether:egg_plant>, <harvestcraft:eggplantitem>, <minecraft:egg>, <contenttweaker:plant_sample>
    ]);
    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:eggplant_dust> * 8], [], 
        [
            <betternether:egg_plant>, <harvestcraft:eggplantitem>, <minecraft:egg>, <contenttweaker:plant_sample>
        ], [], 40, 500
    );
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:eggplant_dust> * 12, [
        <betternether:egg_plant>, <harvestcraft:eggplantitem>, <minecraft:egg>, <contenttweaker:plant_sample>
    ], 100, 8);


    scripts.content_machines.addFluidAlloyerRecipe(
        <betternether:egg_plant>, 
        <contenttweaker:eggplant_dust>, <contenttweaker:fertilizer4>, <liquid:mushroom_stew> * 1000, 
        80, 1000
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <betternether:egg_plant> * 2, 
        <contenttweaker:eggplant_dust>, <contenttweaker:fertilizer3>, <liquid:glowshroom_stew> * 500, 
        80, 1000
    );


    mods.alchemistry.Dissolver.addRecipe(<betternether:egg_plant>, false, 1,
        [
            [100, <alchemistry:compound> * 4, <alchemistry:compound:60> * 32]
        ]
    );
    mods.alchemistry.Dissolver.addRecipe(<contenttweaker:eggplant_dust>, false, 1,
        [
            [100, <alchemistry:compound:60> * 32]
        ]
    );
}