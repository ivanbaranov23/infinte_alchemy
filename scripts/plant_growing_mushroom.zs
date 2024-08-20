import mods.immersiveengineering.Mixer as IEMixer;


{//glowshroom stew

    mods.thermalexpansion.Transposer.addFillRecipe(
        <natura:soups:4>, <minecraft:bowl>, <liquid:glowshroom_stew> * 250, 1000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(
        <natura:soups:7>, <natura:empty_bowls:2>, <liquid:glowshroom_stew> * 250, 1000
    );

    mods.thermalexpansion.Transposer.addExtractRecipe(
        <liquid:glowshroom_stew> * 250, <natura:soups:4>, 1000, <minecraft:bowl>
    );
    mods.thermalexpansion.Transposer.addExtractRecipe(
        <liquid:glowshroom_stew> * 250, <natura:soups:7>, 1000, <natura:empty_bowls:2>
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
}