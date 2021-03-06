#' Place Lookup
#'
#' Lookup a place by code. Returns all available data if found. Returns 404 if place does not exist.
#'
#' @import httr
#'
#' @param code A string. The unique identifier for places - Ordnance Survey (OSGB) code.
#'
#' @return A list with available places.
#'
#' @export
#'
#' @examples
#' place_lookup("osgb4000000074544700")
#'
place_lookup <- function(code) {
  if (!is.character(code) || nchar(code) < 2) {
    stop("Please provide a valid Ordnance Survey code.")
  }
  r <- GET(paste0("https://api.postcodes.io/places/", code))
  extract_results(r)
}
