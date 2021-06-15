subcuencas_3 <- subcuencas %>% filter(SUBCUENCA %in% c("L. Totolzin", "R. Cazones", "R. Salado")) %>% select(SUBCUENCA)
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sf, stars)
angela <- list.files(path = "DATOS/ANGELA_CUERVO_2013/", pattern = ".tif$", full.names = TRUE) %>% read_stars()
subcuencas <- st_read("DATOS/Vector/Subcuencas_VER.shp") %>%
  filter(SUBCUENCA %in% c("L. Totolzin", "R. Cazones", "R. Salado")) %>%
  select(SUBCUENCA)
bio1 <- angela %>% select(bio01.tif)
subcuencas <- st_transform(subcuencas, st_crs(bio1))
bio1_crop <- st_crop(bio1, subcuencas_3)
rasterization <- st_rasterize(sf = subcuencas_3, bio1_crop)
plot(rasterization)
