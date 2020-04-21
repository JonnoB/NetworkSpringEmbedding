#' Remove small components
#' 
#' keep only maximum component of graph
#' 
#' As SETSe only works on connected components this function removes all but the largest component. 
#' This is a helper function to quickly project a network with SETSe.
#' 
#' @param g An igraph object of the graph to embed.
#' 
#' @export
#' 

remove_small_components <- function(g){
  
  components_info <- components(g)
  max_comp <- which.max(components_info$csize)
  
  g <- delete.vertices(g, components_info$membership != max_comp)
  
  return(g)
  
}
