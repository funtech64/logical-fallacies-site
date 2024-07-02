#!/bin/bash

# Directory paths
REPO_PATH=$(dirname "$0")/..
HTML_DIR="$REPO_PATH"

# SEO and social media tags to be added
read -r -d '' seo_tags << EOM
<meta name="description" content="A comprehensive guide to understanding logical fallacies with detailed explanations and examples.">
<meta name="keywords" content="logical fallacies, critical thinking, argumentation, reasoning, fallacies examples">
<meta name="author" content="Your Name or Organization">
<meta name="robots" content="index, follow">
<meta property="og:title" content="Logical Fallacies Guide">
<meta property="og:description" content="Learn about logical fallacies, their explanations, and examples.">
<meta property="og:image" content="URL_to_an_image">
<meta property="og:url" content="https://yourwebsite.com">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Logical Fallacies Guide">
<meta name="twitter:description" content="Learn about logical fallacies, their explanations, and examples.">
<meta name="twitter:image" content="URL_to_an_image">
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "url": "https://yourwebsite.com",
  "name": "Logical Fallacies Guide",
  "description": "A comprehensive guide to understanding logical fallacies with detailed explanations and examples.",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://yourwebsite.com/search?q={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=YOUR_TRACKING_ID"></script>
<script>
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'YOUR_TRACKING_ID');
</script>
EOM

# Function to update HTML files
update_html_head() {
    local file="$1"
    # Check if the file contains the <head> tag and doesn't already contain the SEO tags
    if grep -q "<head>" "$file" && ! grep -q "<meta name=\"description\"" "$file"; then
        # Create a temporary file
        temp_file=$(mktemp)
        # Insert SEO tags after the <head> tag
        awk -v seo_tags="$seo_tags" '
        /<head>/ { print; print seo_tags; next }
        { print }
        ' "$file" > "$temp_file"
        mv "$temp_file" "$file"
        echo "Updated $file"
    else
        echo "No update needed for $file"
    fi
}

export -f update_html_head
export seo_tags

# Find all HTML files and update them
find "$HTML_DIR" -name "*.html" -exec bash -c 'update_html_head "$0"' {} \;

echo "All HTML files have been processed."
