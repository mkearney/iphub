lookup_ipaddress <- function(ip, key = NULL) {
  if (is.null(key)) {
    key <- Sys.getenv("IPHUB_PAT")
  } else {
    rtweet:::set_renv(IPHUB_PAT = key)
  }
  r <- httr::GET(sprintf("http://v2.api.iphub.info/ip/%s", ip),
    httr::add_headers(`X-Key` = key))
  httr::warn_for_status(r)
  x <- httr::content(r)
  if ("block" %in% names(x)) {
    x$block_text <- switch(as.character(x$block),
      "0" = "Residential/Unclassified IP (i.e. safe IP)",
      "1" = "Non-residential IP (hosting provider, proxy, etc.)",
      "2" = "Non-residential & residential IP (warning, may flag innocent people)"
    )
  }
  x
}


#' Look IP addresses using iphub
#'
#' Looks up safe/unsafe and basic info on provided IP addresses.
#'
#' @param x Vector of IP addresses
#' @param key `X-Key` supplied by iphub. After first time using, this should be
#'   set for future uses on your machine.
#' @examples
#' \dontrun{
#'
#' ips <- c("192.0.2.1", "255.255.255.0")
#' iphub(ips)
#'
#' }
#' @return A tibble data frame or list/parsed response.
#' @export
iphub <- function(x, key = NULL) {
  x <- lapply(x, lookup_ipaddress)
  tryCatch(dplyr::bind_rows(x), error = function(e) x)
}
