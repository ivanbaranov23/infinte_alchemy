import crafttweaker.item.IItemStack;

function addKey(attas as string, item as IItemStack){
    recipes.addShaped("trial_key_" ~ attas, <deepmoblearning:trial_key>.withTag({tier: 1, attunement: attas}), [
        [null, item, null],
        [item, <deepmoblearning:trial_key>, item],
        [null, item, null]
    ]);
}
function addTrial(trial as string, mobs as string[], item as IItemStack){
    var m as IItemStack[] = [];
    for mob in mobs{
        m += <minecraft:spawn_egg>.withTag({EntityTag: {id: mob}});
    }
    scripts.jei.addJEIhint(
        [
            <deepmoblearning:trial_key>.withTag({tier: 1, attunement: trial}),
            item
        ], [], 
        [<deepmoblearning:trial_keystone>], 
        m
    );
}

addKey("stone", <atum:khnumite>);
addTrial("stone", ["atum:stoneguard", "atum:stonewarden"], <atum:khnumite>);

