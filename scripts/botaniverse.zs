

<botania:pool>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "1 mil");
<botania:pool:2>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "0.5 mil");
<botania:pool:3>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "1 mil");
<botaniverse:morepool>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "4 mil");

<botaniverse:morepool:1>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "10 mil");
<botaniverse:morepool:2>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "100 mil");
<botaniverse:morepool:3>.addTooltip(game.localize("ia.tooltip.mana_capacity") ~ "1000 mil");


recipes.remove(<botaniverse:morepool:1>);
recipes.remove(<botaniverse:morepool:2>);
recipes.remove(<botaniverse:morepool:3>);


scripts.content_machines.addBioAssemblerRecipe(
    [<botaniverse:morepool:1>], null, 
    [
        <botaniverse:morepool>,
        <botaniverse:morerune:1> * 2,
        <botaniverse:morerock:1> * 8,
        <contenttweaker:chlorasteel_plate> * 2
    ], [
        <liquid:rune_acid> * 1000,
        <liquid:livingrock> * 576
    ], <contenttweaker:research_pool>,
    20, 1000000
);