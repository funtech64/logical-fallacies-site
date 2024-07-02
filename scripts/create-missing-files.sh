#!/bin/bash

# Directory paths
REPO_PATH=$(dirname "$0")/..
FALLACIES_DIR="$REPO_PATH/fallacies"

# List of all expected fallacy HTML files
expected_files=(
    "accent-fallacies.html"
    "ad-hominem.html"
    "affirming-the-consequent.html"
    "amphiboly.html"
    "appeal-to-anonymous-authority.html"
    "appeal-to-authority.html"
    "appeal-to-biased-authority.html"
    "appeal-to-common-practice.html"
    "appeal-to-consequences.html"
    "appeal-to-emotion.html"
    "appeal-to-faith.html"
    "appeal-to-false-authority.html"
    "appeal-to-fear.html"
    "appeal-to-flattery.html"
    "appeal-to-force.html"
    "appeal-to-hypocrisy.html"
    "appeal-to-ignorance.html"
    "appeal-to-novelty.html"
    "appeal-to-nature.html"
    "appeal-to-pity.html"
    "appeal-to-popularity.html"
    "appeal-to-poverty.html"
    "appeal-to-pragmatism.html"
    "appeal-to-spite.html"
    "appeal-to-tradition.html"
    "appeal-to-wealth.html"
    "argument-from-authority.html"
    "argument-from-incredulity.html"
    "argument-from-silence.html"
    "bandwagon-fallacy.html"
    "begging-the-question.html"
    "cherry-picking.html"
    "complex-question-fallacy.html"
    "composition-fallacy.html"
    "conditional-fallacy.html"
    "correlation-vs-causation.html"
    "cultural-relativism.html"
    "denying-the-antecedent.html"
    "diagnosis-fallacy.html"
    "division-fallacy.html"
    "equivocation-fallacy.html"
    "equivocation-on-god.html"
    "ethnocentrism.html"
    "extra-term-fallacy.html"
    "fallacists-fallacy.html"
    "fallacy-of-aggregate.html"
    "false-analogy.html"
    "false-attribution.html"
    "false-cause.html"
    "false-compromise.html"
    "false-consensus-effect.html"
    "false-dilemma.html"
    "gamblers-fallacy.html"
    "genetic-fallacy.html"
    "god-of-the-gaps.html"
    "historians-fallacy.html"
    "hot-hand-fallacy.html"
    "loaded-question.html"
    "moralistic-fallacy.html"
    "moving-the-goalposts.html"
    "naturalistic-fallacy.html"
    "nocebo-effect-fallacy.html"
    "no-true-scotsman.html"
    "post-hoc-fallacy.html"
    "psychologists-fallacy.html"
    "quoting-out-of-context.html"
    "red-herring.html"
    "slippery-slope-fallacy.html"
    "special-pleading.html"
    "straw-man-fallacy.html"
    "subjectivist-fallacy.html"
    "suppressed-evidence.html"
    "sweeping-generalisation.html"
    "tautology.html"
    "weak-analogy.html"
    "wishful-thinking.html"
    "double-think.html"
)

# Template for HTML files
html_template='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>__TITLE__</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <style>
        .content {
            display: flex;
        }
        .main-content {
            flex: 3;
            padding-right: 20px;
        }
        .sidebar {
            flex: 1;
            border-left: 1px solid #ddd;
            padding-left: 20px;
        }
        .ads {
            flex: 1;
            padding-right: 20px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
        }
        .footer-inner {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-top: 1px solid #ddd;
            text-align: center;
        }
        .category-art-container {
            text-align: center;
            margin-top: 20px;
            width: 100%;
        }
        .unique-art-container {
            text-align: right;
            margin-top: 20px;
            width: 100%;
        }
        .nav-links {
            display: flex;
            justify-content: flex-start;
            margin-top: 20px;
        }
        .nav-links a {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <nav class="container-fluid">
        <ul>
            <li><strong>Logical Fallacies</strong></li>
        </ul>
    </nav>
    <div class="content container">
        <div class="ads">
            <p>Advertisement</p>
        </div>
        <div class="main-content">
            <div class="category-art-container">
                <img src="art/category-art.jpg" alt="Category Art" id="categoryArtImage" style="width:2cm;"/>
            </div>
            <main>
                <section>
                    <hgroup>
                        <h2>__TITLE__</h2>
                        <h3>A logical fallacy</h3>
                    </hgroup>
                    <p>__DESCRIPTION__</p>
                    <h3>Examples</h3>
                    <p><strong>Business Example:</strong> "__BUSINESS_EXAMPLE__"</p>
                    <p><strong>Academic Example:</strong> "__ACADEMIC_EXAMPLE__"</p>
                    <p><strong>Pop-Culture Example:</strong> "__POP_CULTURE_EXAMPLE__"</p>
                    <p><strong>Intimate Partner Example:</strong> "__INTIMATE_PARTNER_EXAMPLE__"</p>
                    <div class="unique-art-container">
                        <img src="art/__IMAGE_NAME__.jpg" alt="__TITLE__ Art" id="uniqueArtImage" style="width:2cm;"/>
                    </div>
                    <div class="nav-links">
                        <a href="index.html">Home</a>
                        <a href="#" id="randomLink">Random</a>
                        <a href="#" id="previousLink">Previous</a>
                        <a href="#" id="nextLink">Next</a>
                    </div>
                </section>
            </main>
        </div>
        <div id="sidebar-container" class="sidebar"></div>
    </div>
    <footer id="footer-container" class="footer">
        <div class="footer-inner">
            <small><a href="index.html">Home</a> • <a href="fallacies.html">Fallacies List</a></small>
        </div>
    </footer>
    <script src="../js/loadSidebar.js"></script>
    <script src="../js/navigation.js"></script>
</body>
</html>'

# Function to create missing files
create_missing_files() {
    local file_name="$1"
    local title="${file_name%.html}"
    title="${title//-/ }"
    title=$(echo "$title" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

    local file_path="$FALLACIES_DIR/$file_name"
    if [ ! -f "$file_path" ]; then
        echo "Creating $file_name..."
        echo "${html_template//__TITLE__/$title}" > "$file_path"
    fi
}

# Create missing files
for file in "${expected_files[@]}"; do
    create_missing_files "$file"
done

echo "All missing files have been created."

