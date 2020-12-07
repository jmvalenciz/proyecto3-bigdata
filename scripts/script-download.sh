#!/usr/bin/bash

# este archivo es un simple script para obtener datos desde una URL y posteriormente mover los mismos a
# un bucket en S3
# La toma de datos se realiza de forma periódica cada 24 Horas después de la última vez que se toman datos nuevos

mkdir raw

while true; do 
    curl https://www.datos.gov.co/api/views/gt2j-8ykr/rows.csv?accessType=DOWNLOAD --output raw/Casos-COVID_19-Colombia.csv
    aws s3 sync raw/Casos-COVID_19-Colombia.csv s3://covid19-bd-bucket/raw/Casos-COVID_19-Colombia.csv
    sleep 86400
done