# Caso de estudio
Análisis de datos de viajes en bicicleta de Cyclistic usando R. Limpieza, transformación, visualización y generación de insights sobre el comportamiento de miembros y usuarios casuales.

## Introducción: En este caso de estudio trabajaremos con una empresa ficticia de ciclismo, precisamente hablando de una compañía de bicicletas compartidas. Nuestro objetivo será responder una serie de preguntas de negocio, en conjunto con miembros clave de nuestro equipo de trabajo.

## Estructura del proyecto

├── data/ # Carpeta donde se colocan los archivos CSV de viajes
├── script.R # Script principal con el análisis en R
├── output/ # visualizaciones
├── README.md # Documentación del proyecto


---

## ⚙️ Herramientas utilizadas

- **R** (lenguaje de programación)
- **RStudio** (entorno de desarrollo)
- Paquetes principales:
  - `tidyverse`: manipulación, visualización y lectura de datos.
  - `lubridate`: manejo de fechas y horas.
  - `janitor`: limpieza y estandarización de nombres de columnas.
  - `ggplot2`: visualización de datos.
  - `dplyr`: operaciones de transformación de datos.

---

## 🚀 Instrucciones para ejecutar el script

1. **Coloca todos los archivos `.csv`** con los viajes de Cyclistic en la carpeta `data/`.

2. Abre `script.R` en **RStudio**.

3. Asegúrate de tener instalados los paquetes necesarios. Ejecuta:

install.packages(c("tidyverse", "lubridate", "janitor"))
ruta <- "C:/Users/TU_USUARIO/RUTA/AL/PROYECTO/data"

## Análisis realizado
Duración promedio, mínima, máxima y mediana de viajes por tipo de usuario.
Número de viajes por día de la semana y tipo de usuario.
Duración promedio por día de la semana y tipo de usuario.
Visualización de resultados con ggplot2.

El proceso de limpieza incluye:

- Unión de múltiples archivos .csv en un solo DataFrame.
- Conversión de columnas a nombres estandarizados (snake_case).
- Eliminación de filas con datos faltantes en estaciones.
- Cálculo de la duración del viaje (ride_length) en minutos.
- Filtrado de viajes con duración negativa.
- Extracción de componentes de fecha: día, mes, año, y día de la semana.
- Ordenación de los días para facilitar visualización y análisis.

## Visualizaciones

El script genera gráficos comparativos que permiten observar:

- Cantidad de viajes por tipo de usuario y día de la semana.
- Duración promedio de viaje por tipo de usuario y día de la semana.

Estos gráficos permiten identificar diferencias clave en comportamiento entre miembros y usuarios casuales.

![Rplot_numero_viajes](https://github.com/user-attachments/assets/23145a3c-01d0-418c-829f-c26739cb3301)
![Rplot_duracion_viaje](https://github.com/user-attachments/assets/d982f6d3-eb48-4fc0-a6a6-4c95332f79d2)

