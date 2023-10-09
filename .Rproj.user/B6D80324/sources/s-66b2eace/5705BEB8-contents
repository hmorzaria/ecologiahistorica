make_decades <- function(eachshapefile){
  
  print(eachshapefile)
  
  this.shapefile  <- st_read(eachshapefile)
  
  names.shp <- names(this.shapefile)
  
  if(any(names.shp == "MAX_GRID_4")){
    
    shapefile.org <- this.shapefile %>% 
      dplyr::select(Id, XMIN, XMAX, YMIN ,YMAX,MAX_GRID_C, MAX_GRID_1,MAX_GRID_2,MAX_GRID_3,MAX_GRID_4,                        geometry)
    
    shapefile.org.col <- shapefile.org %>% 
      mutate(`50_60` = MAX_GRID_C - MAX_GRID_1) %>% 
      mutate(`60_70` = MAX_GRID_1 - MAX_GRID_2) %>% 
      mutate(`70_80` = MAX_GRID_2 - MAX_GRID_3) %>% 
      mutate(`80_90` = MAX_GRID_3 - MAX_GRID_4) %>% 
      dplyr::rename("vals_1950" = MAX_GRID_C, "vals_1960" = MAX_GRID_1, "vals_1970" =MAX_GRID_2 , "vals_1980" = MAX_GRID_3, "vals_1990" = MAX_GRID_4) %>% 
      #categorical change 50-60
      mutate(change50_60 = if_else(`50_60` > 0,"Decrease",
                                   if_else(`50_60`< 0, "Increase", 
                                           if_else(`50_60` == 0, "No change",NA_character_)))) %>% 
      mutate(change50_60 = if_else(vals_1950==0 & vals_1960 == 0, NA_character_, change50_60)) %>% 
      #categorical change 60-70
      mutate(change60_70 = if_else(`60_70` > 0,"Decrease",
                                   if_else(`60_70`< 0, "Increase", 
                                           if_else(`60_70` == 0, "No change",NA_character_)))) %>% 
      mutate(change60_70 = if_else(vals_1960==0 & vals_1970 == 0, NA_character_, change60_70)) %>% 
      #categorical change 70-80
      mutate(change70_80 = if_else(`70_80` > 0,"Decrease",
                                   if_else(`70_80`< 0, "Increase", 
                                           if_else(`70_80` == 0, "No change",NA_character_)))) %>% 
      mutate(change70_80 = if_else(vals_1970==0 & vals_1980 == 0, NA_character_, change70_80)) %>% 
      #categorical change 80-90
      mutate(change80_90 = if_else(`80_90` > 0,"Decrease",
                                   if_else(`80_90`< 0, "Increase", 
                                           if_else(`80_90` == 0, "No change",NA_character_)))) %>% 
      mutate(change80_90 = if_else(vals_1980==0 & vals_1990 == 0, NA_character_, change80_90)) 
    
  } else if(any(names.shp != "MAX_GRID_4")) {
    
    shapefile.org <- this.shapefile %>% 
      dplyr::select(Id, XMIN, XMAX, YMIN ,YMAX,MAX_GRID_C, MAX_GRID_1,MAX_GRID_2,MAX_GRID_3,geometry)
    
    shapefile.org.col <- shapefile.org %>% 
      mutate(`50_60` = MAX_GRID_C - MAX_GRID_1) %>% 
      mutate(`60_70` = MAX_GRID_1 - MAX_GRID_2) %>% 
      mutate(`70_80` = MAX_GRID_2 - MAX_GRID_3) %>% 
      dplyr::rename("vals_1950" = MAX_GRID_C, "vals_1960" = MAX_GRID_1, "vals_1970" =MAX_GRID_2 , "vals_1980" = MAX_GRID_3) %>% 
      #categorical change 50-60
      mutate(change50_60 = if_else(`50_60` > 0,"Decrease",
                                   if_else(`50_60`< 0, "Increase", 
                                           if_else(`50_60` == 0, "No change",NA_character_)))) %>% 
      mutate(change50_60 = if_else(vals_1950==0 & vals_1960 == 0, NA_character_, change50_60)) %>% 
      #categorical change 60-70
      mutate(change60_70 = if_else(`60_70` > 0,"Decrease",
                                   if_else(`60_70`< 0, "Increase", 
                                           if_else(`60_70` == 0, "No change",NA_character_)))) %>% 
      mutate(change60_70 = if_else(vals_1960==0 & vals_1970 == 0, NA_character_, change60_70)) %>% 
      #categorical change 70-80
      mutate(change70_80 = if_else(`70_80` > 0,"Decrease",
                                   if_else(`70_80`< 0, "Increase", 
                                           if_else(`70_80` == 0, "No change",NA_character_)))) %>% 
      mutate(change70_80 = if_else(vals_1970==0 & vals_1980 == 0, NA_character_, change70_80))
    
  }
  
  new.name <- eachshapefile %>% 
    str_replace("Decades_Spatial","Decades_Spatial_Change")
  
  st_write(shapefile.org.col, new.name, append = FALSE)
  
}