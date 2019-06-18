<!-- badges: start -->
[![Travis build status](https://travis-ci.org/colearendt/shinyCookie.svg?branch=master)](https://travis-ci.org/colearendt/shinyCookie)
[![Codecov test coverage](https://codecov.io/gh/colearendt/shinyCookie/branch/master/graph/badge.svg)](https://codecov.io/gh/colearendt/shinyCookie?branch=master)
<!-- badges: end -->
  
# Shiny Cookie

The `shinycookie` package uses the [`js-cookie`](https://github.com/js-cookie/js-cookie) library to write cookies in Shiny applications without writing JavaScript.

- Initialize `shinycookie` in your UI with `initShinyCookie("myid")`
- Access cookies from the server with `input$myid` (for a list of all cookies) or `input$myid$mycookie` for a specific cookie
- Update cookies from the server with the `updateCookie` function

## Getting Started

Install the development version:

```r
devtools::install_github("colearendt/shinycookie")
```

## Examples

- [Simple example app](./inst/examples/01-cookie-example)
