subcuencas_3 <- subcuencas %>% filter(SUBCUENCA %in% c("L. Totolzin", "R. Cazones", "R. Salado")) %>% select(SUBCUENCA)
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sf, stars)
angela <- list.files(path = "DATOS/ANGELA_CUERVO_2013/", pattern = ".tif$", full.names = TRUE) %>% read_stars()
subcuencas <- st_read("DATOS/Vector/Subcuencas_VER.shp") %>%
  filter(SUBCUENCA %in% c("L. Totolzin")) %>%
  select(SUBCUENCA)
subcuencas <- st_transform(subcuencas, st_crs(angela))
angela_crop <- st_crop(angela, subcuencas_3)

