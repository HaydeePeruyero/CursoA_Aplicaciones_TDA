# install from GitHub
remotes::install_github("rrrlw/ggtda", vignettes = TRUE)

# install development version
devtools::install_github("rrrlw/ripserr")

# install from CRAN
#install.packages("ripserr")
library(ripserr)
library(ggtda)

#-----
# Crear dataframe con las coordenadas del tríangulo
triangulo <- data.frame(
  x = c(0,1,1/2),
  y = c(0,0,sqrt(3)/2)
)

# Definir el valor del radio para la filtración
radio = 0.51

# Crear puntos con los círculos de radio dado
p_d <- ggplot(triangulo, aes(x = x, y = y)) +
  theme_bw() +
  coord_fixed() +
  stat_disk(radius = radio, fill = "aquamarine3") +
  geom_point()

# Crear complejo simplicial al radio dato
p_sc <- ggplot(triangulo, aes(x = x, y = y)) +
  theme_bw() +
  coord_fixed() +
  stat_vietoris2(diameter = radio*2, fill = "darkgoldenrod") +
  stat_vietoris1(diameter = radio*2, alpha = .25) +
  stat_vietoris0()

# Combinar los plots
gridExtra::grid.arrange(
  p_d, p_sc,
  layout_matrix = matrix(c(1, 2), nrow = 1)
)



