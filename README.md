# automat_Rdoc

Shell script to automate R documentation. Convert Rd files to html and/or pdf and/or markdown.

## Usage

`bash script.sh -i path_of_the_package_dir -m "yes/no" -p "yes/no" -h "yes/no" -a "yes/no"`

`-m:` is for creating a README.md documentation file, defaults to "yes"

`-p` is for creating a package_name.pdf documentation file, defaults to "yes"

`-h` is for creating a README.html documentation file, defaults to "yes"

`-a` is for adding and not erasing the content that already exists in README.md, defaults to "no"

All the documentation will be created in the same directory of the given path.
