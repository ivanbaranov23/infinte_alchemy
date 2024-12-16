
inWorldCrafting.fluidToFluid.recipeBuilder()
        .fluidInput(fluid('organic_green'))
        .input(item('contenttweaker:research_cobblegen'))
        
        .fluidOutput(fluid('organic_cg'))
        .register()

inWorldCrafting.fluidToFluid.recipeBuilder()
        .fluidInput(fluid('sludge'))
        .input(item('contenttweaker:research_cobblegen'))
        
        .fluidOutput(fluid('sludge_cg'))
        .register()

inWorldCrafting.fluidToFluid.recipeBuilder()
        .fluidInput(fluid('lava_residue'))
        .input(item('contenttweaker:research_cobblegen'))
        
        .fluidOutput(fluid('residue_cg'))
        .register()