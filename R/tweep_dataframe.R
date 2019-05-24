
#' Create dataframe of tweeps, either followers or people that you follow
#' @export
#' @param user_id character. Twitter id to query.
#' @param followers TRUE/FALSE depending on whether you want your followers or people you follow.
#' @import ggplot2
#' @import twitteR
tweep_dataframe <- function(user_id, followers = TRUE){

  user <- twitteR::getUser(user_id)
  if(followers){
    user_follower_IDs <- user$getFollowers(retryOnRateLimit = 180)
  } else {
    user_follower_IDs <- user$getFriends(retryOnRateLimit = 180)
  }

  user_followers <- dplyr::bind_rows(lapply(user_follower_IDs, as.data.frame), .id = "column_label")

  lat_long = lapply(user_followers$location, ggmap::geocode)

  lat_long_df <- dplyr::bind_rows(lat_long, .id = "column_label")

  user_loc <- dplyr::bind_cols(user_followers, lat_long_df[,-1])

  return(user_loc)
}






