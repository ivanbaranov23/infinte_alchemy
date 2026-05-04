import mods.randomtweaker.botania.ICocoon;
import scripts.mob_jei.addJEIentityHint;

recipes.remove(<botania:cocoon>);
recipes.addShaped("ia_bot_cocoon", <botania:cocoon>, [
    [<ore:string>, <ore:string>, <ore:string>],
    [<ore:string>, <botania:felpumpkin>, <ore:string>],
    [<ore:string>, <contenttweaker:transmut_gel>, <ore:string>]
]);
recipes.addShaped("ia_bot_cocoon2", <botania:cocoon> * 3, [
    [<ore:string>, <ore:string>, <ore:string>],
    [<ore:string>, <botania:felpumpkin>, <ore:string>],
    [<ore:string>, <contenttweaker:inversion_dust>, <ore:string>]
]);
addJEIentityHint(
    [<minecraft:emerald> * 20], null, "",
    [<botania:cocoon>.withDisplayName(game.localize("ia.egg_hint.cocoon"))], null,
    [], null, "minecraft:villager"
);
addJEIentityHint(
    [<minecraft:chorus_fruit> * 20], null, "",
    [<botania:cocoon>.withDisplayName(game.localize("ia.egg_hint.cocoon"))], null,
    [], null, "minecraft:shulker"
);


ICocoon.registerSpawn("boneworm", <extrautils2:ingredients:10>, {
    <entity:mod_lavacow:boneworm>: 100.0
});