
# script llamado capturar.sh
# para ejecutar directamente llamar a bash capturar.sh
# tiene un argumento (temporal)

INPUT_PATH="Imagenes/raw/Test.jpg"
OUTPUT_PATH="Imagenes/prediccion/Test.jpg"

# Captura una imagen (ejemplo usando ffmpeg)

rm Imagenes/prediccion/*.jpg
rm Imagenes/raw/*.jpg


rpicam-hello --preview 10 &

for i in {1}  # Si quieres que sea infinito → while true; do
do
    # Captura imagen (bloqueante hasta guardar)
    rpicam-still --output "$INPUT_PATH"
    
    # Procesa la imagen capturada
    python3 clasificacion_imagen.py "$INPUT_PATH" "$OUTPUT_PATH"
    
    # Espera 1 segundo
    sleep 1
done

# Esperamos a que termine
wait
echo "Proceso Terminado"



# Si quiero eliminar las imagenes: 