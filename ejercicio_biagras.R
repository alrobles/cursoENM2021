angela <- list.files(path = "DATOS/ANGELA_CUERVO_2013/", pattern = ".tif$", full.names = TRUE) %>% read_stars()
bisagra <- function(x){
  (max(x) - x)(max(x)- min(x))
}

bisagra1 <- angela %>%
  select(bio01.tif) %>%
  mutate(bio01.tif  = ifelse(bio01.tif == -9999, NA,bio01.tif )) %>%
  mutate(bio01.tif  = (max(bio01.tif, na.rm = TRUE) - bio01.tif)/(max(bio01.tif, na.rm = TRUE) - min(bio01.tif, na.rm = TRUE)) )


maxwell <- angela %>%
  select(bio01.tif, bio02.tif, bio03.tif, bio04.tif) %>%
  mutate(bio01.tif  = ifelse(bio01.tif == -9999, NA,bio01.tif )) %>%
  mutate(bio02.tif  = ifelse(bio02.tif == -9999, NA,bio02.tif )) %>%
  mutate(bio03.tif  = ifelse(bio03.tif == -9999, NA,bio03.tif )) %>%
  mutate(bio04.tif  = ifelse(bio04.tif == -9999, NA,bio04.tif )) %>%
  mutate(f1  = (max(bio01.tif, na.rm = TRUE) - bio01.tif)/(max(bio01.tif, na.rm = TRUE) - min(bio01.tif, na.rm = TRUE)) ) %>%
  mutate(f2  = (max(bio02.tif, na.rm = TRUE) - bio02.tif)/(max(bio02.tif, na.rm = TRUE) - min(bio02.tif, na.rm = TRUE)) ) %>%
  mutate(f3  = (max(bio03.tif, na.rm = TRUE) - bio03.tif)/(max(bio03.tif, na.rm = TRUE) - min(bio03.tif, na.rm = TRUE)) ) %>%
  mutate(f4  = (max(bio04.tif, na.rm = TRUE) - bio04.tif)/(max(bio04.tif, na.rm = TRUE) - min(bio04.tif, na.rm = TRUE)) )

maxwell <- maxwell  %>%
  mutate(bio =  (bio01.tif*f1 + bio02.tif*f2 + bio03.tif*f3 + bio04.tif*f4)/sum(f1+f2+f3+f4, na.rm = TRUE)) %>%
  select(bio)
plot(maxwell)
