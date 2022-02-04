#' @title Sober theme for ggplot
#'
#' @description Object: Sober theme for ggplot
#' @importFrom ggplot2 element_text 
#'
#' @return
#' @export
#'
#' @examples
#'PLOT_MAIN_Text<-ggplot + theme_LO_sober

#Theme
theme_LO_sober <- ggplot2::theme(plot.title = element_text(size = 13, face="bold", hjust = 0.5))
