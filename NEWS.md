<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# envx 0.0.0.9011 (2025-03-15)

## Features

- Add check_version function for update notifications.

  Function compares local package version with GitHub repository version to inform users about available updates.

## Chore

- Update gitignore.

## Documentation

- Add version control and commit standards to contributing guide.

## Uncategorized

- Merge branch 'organise-tutorials'.

- Merge branch 'SY'.


# envx 0.0.0.9010 (2025-03-04)

## Features

- Update tutorials 1 and 2.

## Chore

- Update gitignore.


# envx 0.0.0.9009 (2025-02-24)

## Features

### tutorial-01

- Fix some typos, add more exercises.

- Add create_download_button function for file downloads in tutorials.

## Build system, external dependencies

### auto

- Namespace update.

## Chore

- Update ignores.

- Update gitignore.

### deps

- Add base64enc and remove downloadthis dependency.

- Project file updated (automatically).

## Documentation

- Add documentation for create_download_button function.

- Update ENVX1002 tutorials for weeks 7-11.

## Refactoring

- Update tutorial 9 to use create_download_button function.

### list_tutorials

- Remove interactive prompts and add direct tutorial access.

  - Add optional tutorial parameter for direct access
  - Remove interactive y/n prompts
  - Add input validation for tutorial numbers
  - Return tutorial data frame invisibly
  - Update documentation with examples

## data

- Add beetle dataset for week 8 tutorial.

## tutorials

- Add week 1 tutorial.

## Uncategorized

- Merge branch 'fix_download'.

- Merge remote-tracking branch 'origin/main'.


# envx 0.0.0.9008 (2025-02-20)

## Refactoring

### list_tutorials

- Remove interactive prompts and add direct tutorial access.

  - Add optional tutorial parameter for direct access
  - Remove interactive y/n prompts
  - Add input validation for tutorial numbers
  - Return tutorial data frame invisibly
  - Update documentation with examples


# envx 0.0.0.9007 (2025-02-18)

## Chore

- Project file updated (automatically).

## tutorials

- Add week 1 tutorial.


# envx 0.0.0.9006 (2024-05-09)

## tutorials

- Add week 12 tutorial.


# envx 0.0.0.9005 (2024-05-06)

## Bug fixes

- Rename folders to arrange tutorial list in proper order.

## tutorials

- Add week 11 tutorial.


# envx 0.0.0.9004 (2024-04-23)

## Bug fixes

- Add link to download file in Tutorial 9.


# envx 0.0.0.9003 (2024-04-23)

## tutorials

- Fix week 8 tutorial slightly.

- Added week 9 tutorial.


# envx 0.0.0.9002 (2024-04-08)

## tutorials

- Removed incorrect message in a quiz.


# envx 0.0.0.9001 (2024-04-08)

## Bug fixes

- Rename tutorial folders to prevent mixup between units.

- Clean up tutorial list display.

## Features

- Function to list and run a tutorial.

## Build system, external dependencies

- Update desc and namespace.

## Documentation

- Add link to contributing notes.

- Add contributing instructions.
