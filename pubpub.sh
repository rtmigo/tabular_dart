#!/bin/bash
set -e && cd "${0%/*}"

# creates a copy of the project in temporary directory
# and prepares the copy to be published

temp_pub_dir=$(mktemp -d -t pub-XXXXXXX)

echo "$temp_pub_dir"

rsync -Rrv ./ "$temp_pub_dir" \
  --exclude=".git" \
  --exclude="pubpub.sh" \
  --exclude="todo.txt" \
  --exclude="benchmark/" \
  --exclude="reference/" \
  --exclude="README.md" \
  --exclude=".github" \
  --exclude="labuda/" \
  --exclude="draft/" \
  --exclude="analysis_options.yaml" \
  --exclude="experiments"

# replacing \n by \r
old_readme=$(cat README.md | tr '\n' '\r')
# removing everything before "\n# ", the first header
new_readme=$(echo "$old_readme" | perl -p0e 's|^.*?\r# |# \1|')
# replacing \r by \n
new_readme=$(echo "$new_readme" |  tr '\r' '\n')

echo "$new_readme" > "$temp_pub_dir/README.md"

cd "$temp_pub_dir"
dartfmt -w .
dart pub publish