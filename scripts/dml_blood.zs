#priority -1
import scripts.recycler.addRecycle;

mods.bloodmagic.BloodAltar.removeRecipe(<deepmoblearning:glitch_infused_ingot>);
scripts.blood_magic.BloodAltar_addRecipe(
    <deepmoblearningbm:blood_infused_glitch_ingot>, <deepmoblearning:glitch_infused_ingot>, 
    3, 25000, 25000 / (20 * 30), 1000
);
scripts.blood_magic.BloodAltar_addRecipe(
    <deepmoblearningbm:block_blood_infused_glitch_ingot>, <deepmoblearning:infused_ingot_block>, 
    3, 25000 * 8, 25000 / (20 * 30) * 6, 1000
);


recipes.remove(<deepmoblearningbm:digital_agonizer>);
scripts.content_machines.addBioAssemblerRecipe(
    [<deepmoblearningbm:digital_agonizer>], null,
	[
		<contenttweaker:blood_frame>,
        <deepmoblearningbm:blood_infused_glitch_ingot> * 48,
        <deepmoblearning:soot_covered_plate> * 48,
        <bloodmagic:component:8> * 32,
        <bloodmagic:blood_rune:3> * 8,
        <contenttweaker:living_motor> * 4
	],
	[],
	<contenttweaker:research_magic2>,
	20, 1000
);
addRecycle(<deepmoblearningbm:digital_agonizer>, [
    <contenttweaker:blood_frame>,
    <deepmoblearningbm:blood_infused_glitch_ingot> * 48,
    <deepmoblearning:soot_covered_plate> * 48,
    <bloodmagic:component:8> * 32,
    <bloodmagic:blood_rune:3> * 8,
    <contenttweaker:living_motor> * 4
]);