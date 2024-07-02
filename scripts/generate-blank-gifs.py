from PIL import Image
import os

# Directory to save the GIFs
output_dir = "../images"
abs_output_dir = os.path.abspath(output_dir)
if not os.path.exists(abs_output_dir):
    os.makedirs(abs_output_dir)

# List of 81 fallacies
fallacies = [
    "double_think", "strawman", "ad_hominem", "appeal_to_authority", "false_dilemma",
    "slippery_slope", "circular_argument", "hasty_generalization", "red_herring", "tu_quoque",
    "appeal_to_emotion", "bandwagon", "black_or_white", "appeal_to_nature", "anecdotal",
    "appeal_to_tradition", "appeal_to_novelty", "appeal_to_common_practice", "burden_of_proof",
    "gamblers_fallacy", "middle_ground", "no_true_scotsman", "personal_incredulity", "post_hoc",
    "loaded_question", "composition_division", "genetic", "appeal_to_flattery", "appeal_to_pity",
    "appeal_to_ignorance", "appeal_to_wealth", "appeal_to_fear", "appeal_to_spite", "appeal_to_wrath",
    "argument_from_adverse_consequences", "argument_from_silence", "begging_the_question", "biased_sample",
    "cherry_picking", "circular_reasoning", "confusing_cause_and_effect", "continuum_fallacy",
    "fallacy_of_accident", "false_cause", "false_consensus_effect", "false_equivalence", "false_attribution",
    "guilt_by_association", "half_truth", "ignoring_a_common_cause", "irrelevant_conclusion", "magical_thinking",
    "moving_the_goalposts", "non_sequitur", "over_generalization", "package_deal", "poisoned_well",
    "proof_by_intimidation", "red_herring", "regression_fallacy", "reification", "shotgun_argumentation",
    "special_pleading", "texas_sharpshooter", "thought_terminating_cliche", "two_wrongs_make_a_right", "weasel_words",
    "weak_analogy", "wishful_thinking", "wrong_direction", "zero_tolerance", "affirming_the_consequent",
    "amphiboly", "argument_to_moderation", "argumentum_ad_lazaram", "bifurcation", "equivocation",
    "etymological", "fallacy_of_exclusion", "historian's_fallacy", "negative_proof_fallacy"
]

# Function to create a blank GIF
def create_blank_gif(name, width=200, height=200):
    image = Image.new('RGB', (width, height), color='white')
    image_path = os.path.join(abs_output_dir, f"{name}.gif")
    image.save(image_path)
    print(f"Generated GIF: {image_path}")

# Generate a blank GIF for each fallacy
for fallacy in fallacies:
    create_blank_gif(fallacy)

print(f"Generated {len(fallacies)} blank GIFs in {abs_output_dir}")

