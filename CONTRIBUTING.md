
<!-- CONTRIBUTING.md is generated from CONTRIBUTING.Rmd. Please edit that file -->

# Contribute to `envx`

Contributions are currently limited to the development team due to the
development stage of the package. However, we welcome feedback and
suggestions for improvements – click on the “Issues” tab above to submit
your feedback.

## Adding new tutorials to `envx` package

1.  Create a new tutorial using the `learnr` package. You should already
    know how to do this.
2.  Save the tutorial in the `inst/tutorials` directory:
    - The folder name should be `ENVX#### Wk@ Tutorial`, where `###` is
      the course code and `@` is the week number to inform the user
      which week the tutorial is for. E.g., `ENVX1002 Wk1 Tutorial`.
    - The tutorial file can be named anything you like but I like
      `tut##.Rmd` where `##` is the tutorial number.
3.  Any packages required for the tutorial are automatically installed
    when the user opens the tutorial. Alternatively, you can add the
    packages as dependencies in the DESCRIPTION file. A quick way is to
    use the `usethis` package:

``` r
usethis::use_package("package_name")
```

4.  Once you have done this build the package once:

``` r
devtools::document()
devtools::install()
```

5.  Then push the changes to the repository.
6.  Remind students to update their package to get the new tutorials:

``` r
remotes::install_github("ENVX-resources/envx")
```
