

recipes.remove(<extrautils2:miner>);
//recipes.remove(<actuallyadditions:block_breaker>);

mods.roots.Chrysopoeia.addRecipe("xu2_miner", <projectred-expansion:machine2> * 8, <extrautils2:miner>);
recipes.addShapeless("ia_block_breaker_n999", <extrautils2:miner> * 3,[
    <extrautils2:machine>, <projectred-expansion:machine2>
]);


recipes.remove(<tconstruct:soil:3>);
recipes.addShapeless("ia_grave_soil", <tconstruct:soil:3>,[
    <contenttweaker:undead_essence>, 
    <extrautils2:cursedearth>,
    <liquid:vile> * 1000
]);
recipes.addShapeless("ia_grave_soil2", <tconstruct:soil:3>,[
    <contenttweaker:undead_essence>, 
    <extrautils2:compresseddirt:1>, <extrautils2:compresseddirt:1>, <extrautils2:compresseddirt:1>,
    <liquid:vile> * 1000
]);