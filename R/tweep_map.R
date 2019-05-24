

#' Create global map of tweeps from output of tweep_dataframe
#' @export
#' @param tweep_df dataframe from \code{tweep_dataframe}
#' @param jitter numeric. How much to jitter the dots so they don't stack up on eachother.
#' @param ggplotly TRUE/FALSE depending on whether you want interactive output from ggplotly or not.
tweep_map <- function(tweep_df, jitter = 2, ggplotly = TRUE, ...){

  mapWorld <- ggplot2::borders("world", colour="gray50", fill="white")

  mp <- ggplot() + mapWorld + geom_jitter(data = tweep_df, aes(x = lon, y = lat, text = paste(name, screenName)), width = jitter, height = jitter, ...)

  if(ggplotly){
    mp <- plotly::ggplotly(mp, tooltip = "text")
  }

  return(mp)

}
