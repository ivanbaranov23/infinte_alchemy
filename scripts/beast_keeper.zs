import crafttweaker.item.IItemStack;

import mods.alfinivia.Milking;
import crafttweaker.entity.IEntityDefinition;


//zombie
/*
scripts.jei.addJEIhint(
    [<minecraft:egg>.withDisplayName(<entity:minecraft:zombie>.id), <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}})], [],
    [<minecraft:bucket>],
    [<forge:bucketfilled>.withTag({FluidName: "rot", Amount: 1000})], [<liquid:rot>]
);*/

//fire beetle
/*Milking.add(
    <minecraft:bucket>,
    <entity:twilightforest:fire_beetle>,
    <forge:bucketfilled>.withTag({FluidName: "fiery_essence", Amount: 1000}), false
);
scripts.jei.addJEIhint(
    [<minecraft:egg>.withDisplayName(<entity:twilightforest:fire_beetle>.id), <minecraft:spawn_egg>.withTag({EntityTag: {id: "twilightforest:fire_beetle"}})], [],
    [<minecraft:bucket>],
    [<forge:bucketfilled>.withTag({FluidName: "fiery_essence", Amount: 1000})], [<liquid:fiery_essence>]
);
*/

function addArrowMilking(ent as IEntityDefinition, item as IItemStack){
    Milking.add(
        <roots:living_arrow>,
        ent,
        item, false
    );
    scripts.jei.addJEIhint(
        [<minecraft:spawn_egg>.withTag({EntityTag: {id: ent.id}})], [],
        [<roots:living_arrow>.withDisplayName("right click")],
        [item]
    );
}
addArrowMilking(<entity:minecraft:zombie>, <exnihilocreatio:item_ore_iron>);
addArrowMilking(<entity:minecraft:skeleton>, <exnihilocreatio:item_ore_tin>);
addArrowMilking(<entity:minecraft:spider>, <exnihilocreatio:item_ore_copper>);
addArrowMilking(<entity:primitivemobs:skeleton_warrior>, <exnihilocreatio:item_ore_zinc>);
addArrowMilking(<entity:minecraft:enderman>, <exnihilocreatio:item_ore_nickel>);

addArrowMilking(<entity:minecraft:creeper>, <thermalfoundation:material:771>);


addArrowMilking(<entity:minecraft:zombie_pigman>, <exnihilocreatio:item_ore_gold>);




Milking.add(
    <tconstruct:edible:3>,
    <entity:twilightforest:loyal_zombie>,
    <contenttweaker:blood_bronze_ball>, false
);
scripts.jei.addJEIhint(
    [<twilightforest:zombie_scepter>], [],
    [<tconstruct:edible:3>.withDisplayName("right click"), <roots:living_arrow>.withDisplayName("right click with coagulated blood")],
    [<contenttweaker:blood_bronze_ball>]
);