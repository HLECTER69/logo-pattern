# Load Packages -----

library(brandr)
library(downlit)
library(here)
library(knitr)
library(ragg)
library(showtext)
library(xml2)

# Set General Options -----

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  scipen = 10,
  digits = 10,
  stringr.view_n = 6,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

# Set Variables -----

set.seed(2025)

# Set `knitr`` -----

clean_cache() |> suppressWarnings()

opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  root.dir = here(),
  dev = "ragg_png",
  dev.args = list(bg = "transparent"),
  fig.showtext = TRUE
)

# Set `brandr` -----

options(BRANDR_BRAND_YML = here("_brand.yml"))

brandr_options <- list(
  "BRANDR_COLOR_SEQUENTIAL" =
    get_brand_color(c("primary", "secondary")),
  "BRANDR_COLOR_DIVERGING" =
    get_brand_color(c("primary", "secondary", "tertiary")),
  "BRANDR_COLOR_QUALITATIVE" = c(
    get_brand_color("primary"),
    get_brand_color("secondary"),
    get_brand_color("tertiary")
  )
)

for (i in seq_along(brandr_options)) {
  options(brandr_options[i])
}
