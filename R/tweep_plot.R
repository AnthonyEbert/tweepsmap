
#' plot a world map of your followers / people you follow
#' @export
#' @param user character. Twitter id to query.
#' @param followers TRUE/FALSE depending on whether you want your followers or people you follow.
#' @param jitter numeric. How much to jitter the dots so they don't stack up on eachother.
#' @param ggplotly TRUE/FALSE depending on whether you want interactive output from ggplotly or not.
#' @details You need to register your twitter and google apis first. See the readme.
tweep_plot <- function(user, followers = TRUE, jitter = 2, ggplotly = TRUE, ...){

  tweep_df <- tweep_dataframe(user, followers)

  output <- tweep_map(tweep_df, jitter, ggplotly, ...)

  return(output)
}
