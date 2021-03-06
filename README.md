
<!-- README.md is generated from README.Rmd. Please edit that file -->
tweepsmap
=========

<!-- badges: start -->
<!-- badges: end -->
Make a world map of your twitter followers / people you follow.

Installation
------------

You can install tweepsmap like so. You may need to install the `devtools` package

``` r
devtools::install_github("AnthonyEbert/tweepsmap")
```

Setup
-----

I tried to make this as simple as possible, unfortunately there are still a few steps.

### Get twitter API keys and authenticate them with the R package `twitteR`

The keys below are fake, you will need to get your real ones by creating a Twitter application <http://dev.twitter.com/>

``` r
library(twitteR)

api_key <- “afwwefaw121”
api_secret <- “i372hr87”
access_token <- “ou8fr28j”
access_secret <- “afd823jr”

setup_twitter_oauth(api_key,api_secret, access_token, access_secret)
```

### Get Google API keys and authenticate them with the R package `ggmap`

This key below is fake. Get your real one at <https://developers.google.com/maps/>

``` r
library(ggmap)
register_google("iunf734q89jf", write = TRUE)
```

One you authenticate your API keys for twitter and Google, then the following code should produce a map of your twitter followers.

``` r
user <- "ace_ebert"
tweepsmap::tweep_plot(user)
```

The output from `tweep_plot` is a ggplotly object, which can be saved like so.

``` r
my_map <- tweepsmap::tweep_plot(user)
htmlwidgets::saveWidget(my_map, "index.html")
```
