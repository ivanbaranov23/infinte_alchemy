import crafttweaker.item.IItemStack;

//recipes.removeByMod("agricraft");

recipes.remove(<agricraft:crop_sticks>);
recipes.addShaped("ia_cropstick1", <agricraft:crop_sticks> * 4, [
    [null, <natura:sticks:*>, null],
    [<natura:sticks:*>, <contenttweaker:fertilizer2>, <natura:sticks:*>],
    [null, <natura:sticks:*>, null]
]);
recipes.addShaped("ia_cropstick2", <agricraft:crop_sticks> * 4, [
    [null, <immersiveengineering:material>, null],
    [<immersiveengineering:material>, <contenttweaker:fertilizer2>, <immersiveengineering:material>],
    [null, <immersiveengineering:material>, null]
]);

for i in [
    <agricraft:agri_seed>.withTag({agri_seed: "resource:diamahlia_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:plombean_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:jaslumine_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:quartzanthemum_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:aurigold_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:cuprosia_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:emeryllis_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:ferranium_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:osmonium_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:petinia_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:niccissus_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:lapender_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:platiolus_plant"}),
    <agricraft:agri_seed>.withTag({agri_seed: "resource:redstodendron_plant"})

] as IItemStack[]{
    i.addTooltip(game.localize("ia.rename.disabled"));
    
}