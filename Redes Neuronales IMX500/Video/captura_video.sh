
# script llamado capturar.sh
# para ejecutar directamente llamar a bash capturar.sh
# tiene un argumento (temporal)

INPUT_PATH="Video/raw/Video.mp4"
OUTPUT_PATH="Video/prediccion/VideoAnalizado.mp4"

# Captura una imagen (ejemplo usando ffmpeg)

rm Imagenes/prediccion/*.mp4
rm Imagenes/raw/*.mp4


rpicam-hello --roi 0.45,0.45,0.55,0.55 --preview 7
rpicam-vid --roi 0.45,0.45,0.55,0.55  -t 10s -o "$INPUT_PATH" 


python3 clasificacion_video.py "$INPUT_PATH" "$OUTPUT_PATH"





# Si quiero eliminar las imagenes: 