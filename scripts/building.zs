

recipes.remove(<buildinggadgets:buildingtool>);
recipes.addShaped("ia_buildingtool", <buildinggadgets:buildingtool>.withTag({anchorcoords: [], blockstate: {Name: "minecraft:air"}}), [
    [<thermalfoundation:material:355>, <thermalfoundation:material:161>, <thermalfoundation:material:355>],
    [<betterbuilderswands:wandiron>.noReturn(), <contenttweaker:singularity_dust>, <betterbuilderswands:wandiron>.noReturn()],
    [<thermalfoundation:material:355>, <thermalfoundation:material:161>, <thermalfoundation:material:355>]
]);
recipes.remove(<buildinggadgets:exchangertool>);
recipes.addShaped("ia_exchangertool", <buildinggadgets:exchangertool>.withTag({anchorcoords: [], blockstate: {Name: "minecraft:air"}}), [
    [<thermalfoundation:material:355>, <thermalfoundation:material:161>, <thermalfoundation:material:355>],
    [<thermalfoundation:material:356>, <contenttweaker:singularity_dust>, <thermalfoundation:material:356>],
    [<thermalfoundation:material:355>, <thermalfoundation:material:161>, <thermalfoundation:material:355>]
]);
recipes.remove(<buildinggadgets:copypastetool>);
recipes.addShaped("ia_copypastetool", <buildinggadgets:copypastetool>.withTag({mode: "Copy"}), [
    [<thermalfoundation:material:355>, <thermalfoundation:material:161>, <thermalfoundation:material:355>],
    [<minecraft:lapis_block>, <contenttweaker:singularity_dust>, <minecraft:lapis_block>],
    [<thermalfoundation:material:355>, <thermalfoundation:material:161>, <thermalfoundation:material:355>]
]);
recipes.remove(<buildinggadgets:destructiontool>);
recipes.addShaped("ia_destructiontool", <buildinggadgets:destructiontool>.withTag({overlay: 1 as byte, fuzzy: 1 as byte}), [
    [<thermalfoundation:material:355>, <extrautils2:trashcan>, <thermalfoundation:material:355>],
    [<minecraft:ender_pearl>, <contenttweaker:singularity_dust>, <minecraft:ender_pearl>],
    [<thermalfoundation:material:355>, <extrautils2:trashcan>, <thermalfoundation:material:355>]
]);


recipes.remove(<buildinggadgets:templatemanager>);
recipes.addShaped("ia_templatemanager", <buildinggadgets:templatemanager>, [
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], 
    [<contenttweaker:zinc_plate>, <buildinggadgets:copypastetool>, <contenttweaker:zinc_plate>], 
    [<contenttweaker:zinc_plate>, <thermalexpansion:frame:64>, <contenttweaker:zinc_plate>]
]);