# Batch megadl

## Description

The idea for this project is to be able to copy a long list of mega.nz links, put it into a file, and download all of them using the megadl tool from [megatools](https://megatools.megous.com/).

Example list of links:

1 - https://mega.nz/#!IVN1laCZ!l7Rc9iRwq1miW1krucs2PiILeHwm_TyEiNg-a9mH

2 - https://mega.nz/#!RV8FUCyS!tRukfjuepjFTA6nLrU7xxR9xSFvEM00ey53wxBO2

3 - https://mega.nz/#!xM8DlCLI!ZkrwWsesq-vEc3jXfGS_hRgpSYnL10w_YdW835fO

### Features
- The script will strip anything before 'https' in a given line. This allows for easier copy/pasting if the formatting for your stored links is a markdown list or something similar.
- It also automatically supports links that do not conform to megadl's requirements in some versions (specifically, the Debian unstable version I had at the time of writing this script).

Ex:

1 - https://mega.nz/file/IVN1laCZ#l7Rc9iRwq1miW1krucs2PiILeHwm_TyEiNg-a9mH

See this github issue:
https://github.com/megous/megatools/issues/157

### What it doesn't do
- Handle folders
- Handle directory creation gracefully

## How to use

It accepts two commands:

```
 -f	A path to the file that contains all the links
 -d     A path to the directory to download all the links into. Will be created if it doesn't exist, though this does not work intelligently at the moment.
```

Example:
`bash batch_megadl.sh -f ./my_text_file_full_of_links -d ./my/destination/directory/`

# Installation

- Download and install [megatools](https://megatools.megous.com/)
  - You will need it on your /bin so it can be accessed by the script
- Download this repo's batch_megadl.sh file
- Now you can run `bash batch_megadl.sh ...etc`
