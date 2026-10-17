
recipes.addShaped("mm_blockcasing", <modularmachinery:blockcasing> * 3, [
    [<contenttweaker:basic_modularium>, <minecraft:glass>, <contenttweaker:basic_modularium>],
    [<contenttweaker:basic_modularium>, <contenttweaker:simple_motor>, <contenttweaker:basic_modularium>],
    [<contenttweaker:basic_modularium>, <thermalfoundation:material:324>, <contenttweaker:basic_modularium>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<modularmachinery:blockcasing> * 8],
    [
        <contenttweaker:simple_motor>, <thermalfoundation:material:324>,
        <contenttweaker:basic_modularium> * 4
    ], <liquid:glass> * 1000,
    20, 100
);
recipes.addShaped("mm_blockcasing2", <modularmachinery:blockcasing:4>, [
	[<modularmachinery:itemmodularium>, <contenttweaker:calitunti_plate>, <modularmachinery:itemmodularium>], 
	[<ore:alloyElite>, <modularmachinery:blockcasing>, <ore:alloyElite>], 
	[<modularmachinery:itemmodularium>, <contenttweaker:calitunti_plate>, <modularmachinery:itemmodularium>]
]);







recipes.addShapeless("ia_osram_pipe_pane", <ddb:infinite_alchemy_osram_pipe_pane>, [
    <contenttweaker:osram_plate>
]);
recipes.addShapeless("ia_vibranium_brace", <ddb:infinite_alchemy_vibranium_brace>, [
    <contenttweaker:vibranium_plate>
]);