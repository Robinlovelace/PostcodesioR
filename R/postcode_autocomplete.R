#' Postcode autocomplete
#'
#' Convenience method to return an list of matching postcodes.
#'
#' @import httr
#'
#' @param postcode A string. Valid UK postcode.
#' @param limit An integer. Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' @export
#'
#' @return A list of suggested postcodes.
#'
#' @examples
#' postcode_autocomplete("E1")
#' postcode_autocomplete("E1", limit = 11)
#'
postcode_autocomplete <- function(postcode, limit = 10) {
  if (!is.character(postcode)) {
    stop("Please provide a valid UK postcode.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  r <- GET(paste0("https://api.postcodes.io/postcodes/",
                  postcode, "/autocomplete", "?limit=", limit))
  extract_results(r)
}
