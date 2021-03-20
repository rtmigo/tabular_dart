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
  --exclude="experiments"

#insert=":warning: **At the time of writing, pub.dev does not display \
#the program output correctly. See the \
#[Tabular readme on GitHub](https://github.com/rtmigo/tabular#readme).**"

# replacing \n by \r
old_readme=$(cat README.md | tr '\n' '\r')
# removing everything before "\n# ", the first header
new_readme=$(echo "$old_readme" | perl -p0e 's|^.*?\r# |# \1|')
# inserting the pub.dev formatting warning
#new_readme=$(echo "$new_readme" | perl -p0e "s|\`\`\` text|$insert\\r\\r\`\`\` text \1|")
# replacing \r back to \n
new_readme=$(echo "$new_readme" |  tr '\r' '\n')

echo "$new_readme" > "$temp_pub_dir/README.md"

cd "$temp_pub_dir"
dartfmt -w .
#dart pub publish --dry-run
dart pub publish
#open "$temp_pub_dir"

# :warning: **At the time of writing, pub.dev does not display the program output
# correctly. See the [Tabular readme on GitHub](https://github.com/rtmigo/tabular#readme).**