calc_kappa <- function(eachshapefile){
  
  print(eachshapefile)
  
  wetland.name <- str_split(eachshapefile, "/") %>% 
    unlist %>% 
    .[6] %>% 
    str_split(.,"_") %>% 
    unlist %>% 
    .[1]
  
  this.shapefile  <- st_read(eachshapefile)
  
  names.shp <- names(this.shapefile)
  
  if(length(names.shp)==11)
  {
    decade.names <- c("MAX_GRID_C", "MAX_GRID_1", "MAX_GRID_2", "MAX_GRID_3", "MAX_GRID_4")
    decade.label <- c("50","60","70","80","90")
    
  }
  
  if(length(names.shp)==10)
  {
    decade.names <- c("MAX_GRID_C", "MAX_GRID_1", "MAX_GRID_2", "MAX_GRID_3")
    decade.label <- c("50","60","70","80")
    
  }
    
  for(layerno in 1:length(decade.names)) {
    
    this.layer <- decade.names[layerno]
    this.label <- decade.label[layerno]
      
    this.raster <- st_rasterize(this.shapefile %>% dplyr::select(all_of(this.layer), geometry)) %>% 
      as(.,"Raster")
    
    writeRaster(this.raster, filename = here("rasters",paste(wetland.name, this.label,"raster" , sep = "_")), format = "ascii", overwrite = TRUE)
  }
  
kappa.ras <- raster.change(this.raster.ras, this.raster.ras.2, stat = "kappa", mask = TRUE)
  
}
  