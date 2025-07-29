
# script llamado capturar.sh
# para ejecutar directamente llamar a bash capturar.sh
# tiene un argumento (temporal)

INPUT_PATH="Imagenes/raw/Test.jpg"
OUTPUT_PATH="Imagenes/prediccion/Test.jpg"

# Captura una imagen (ejemplo usando ffmpeg)
rpicam-still --output "$INPUT¡PUT_PATH"
rpicam-hello --timeout 10

# Llama al script de predicción
python3 clasificacion_imagen.py  "$INPUT_PATH" "$OUTPUT_PATH"


# Si quiero que se ejecute un n numero de veces/Para siempre: 
#for i in {1..10} / while true
#do
#    python3 mi_script.py
#    sleep 1
#done


# Si quiero eliminar las imagenes: 
# rm Imagenes/prediccion/*.jpg
