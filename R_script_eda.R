# Carga de librerías
library(tidyverse)
library(lubridate)
library(janitor)
library(ggplot2)     # Para visualizaciones
library(dplyr)       # Para operaciones de manipulación de datos


# Carga y combinacion de datos
ruta <- "C:/Users/empaq/OneDrive/Documentos/Documentos_LACS/R PROJECTS/case_study_bikes/2024_2025"


archivos <- list.files(path = ruta, pattern = "*.csv",full.names=TRUE)
divvy_data <- archivos %>%
  map_dfr(~ read_csv(.x, show_col_types = FALSE) %>% clean_names())


# Exploración y resumen estadístico

glimpse(divvy_data) # Columnas y tipo de dato
summary(divvy_data) # Resumen numérico
colSums(is.na(divvy_data)) # Conteo de valores faltantes

# Eliminacion de filas con data faltante

divvy_data_clean <- divvy_data %>%
  filter(!is.na(start_station_name) & !is.na(end_station_name))

# Creacion de columna con duración en minutos
divvy_data_clean <- divvy_data_clean %>%
  mutate(ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")))


#️ Extraemos y creamos columnas de fecha para análisis por tiempo
divvy_data_clean <- divvy_data_clean %>%
  mutate(
    date = as.Date(started_at),                          # Fecha (aaaa-mm-dd)
    month = format(date, "%m"),                          # Mes (número)
    day = format(date, "%d"),                            # Día del mes
    year = format(date, "%Y"),                           # Año
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE)  # Día de la semana con nombre completo
  )

# Filtramos viajes con duración negativa (datos erróneos o fuera de circulación)
divvy_data_clean <- divvy_data_clean %>%
  filter(ride_length >= 0)

# Ordenamos los dias de la semana
divvy_data_clean$day_of_week <- ordered(
  divvy_data_clean$day_of_week,
  levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
)


# Creamos un resumen por tipo de usuario y día de la semana
ride_summary <- divvy_data_clean %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    average_ride_length = mean(ride_length, na.rm = TRUE),
    number_of_rides = n()
  ) %>%
  arrange(member_casual, day_of_week)


# Revisión final del conjunto limpio
glimpse(divvy_data_clean)              # Verificamos estructura final
colSums(is.na(divvy_data_clean))       # Revisamos que casi no haya NAs
unique(divvy_data_clean$member_casual) # Vemos categorías únicas de usuarios






str(divvy_data_clean$started_at)




library(lubridate)

divvy_data_clean <- divvy_data_clean %>%
  mutate(day_of_week = wday(started_at, label = TRUE, abbr = FALSE))



divvy_data_clean$day_of_week <- ordered(
  divvy_data_clean$day_of_week,
  levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
)


table(divvy_data_clean$day_of_week, useNA = "always")

wday(divvy_data_clean$started_at[1], label = TRUE, abbr = FALSE)


divvy_data_clean <- divvy_data_clean %>%
  mutate(started_at = ymd_hms(as.character(started_at)))

divvy_data_clean <- divvy_data_clean %>%
  mutate(day_of_week = wday(started_at, label = TRUE, abbr = FALSE))



table(divvy_data_clean$day_of_week, useNA = "always")

head(divvy_data_clean$started_at)
class(divvy_data_clean$started_at)

#  visualizacion Promedio de duracion de viaje por dia y tipo de usuario

library(ggplot2)

divvy_data_clean %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    average_ride_length = mean(ride_length, na.rm = TRUE),
    number_of_rides = n(),
    .groups = "drop"
  ) %>%
  ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Número de viajes por tipo de usuario y día de la semana",
    x = "Día de la semana",
    y = "Número de viajes",
    fill = "Tipo de usuario"
  ) +
  theme_minimal()

# Visualización de duracion de viaje por día y tipo de usuario

divvy_data_clean %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    average_ride_length = mean(ride_length, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  ggplot(aes(x = day_of_week, y = average_ride_length, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Duración promedio de viaje por día y tipo de usuario",
    x = "Día de la semana",
    y = "Duración promedio (minutos)",
    fill = "Tipo de usuario"
  ) +
  theme_minimal()


getwd()


