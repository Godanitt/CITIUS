import tensorflow as tf
import keras
from keras.models import load_model
import cv2
import numpy as np
import sys

# --- Cargar el modelo ---
model = load_model("ClasificacionDigitos.keras")

# --- Entradas desde terminal ---
video_path_in = sys.argv[1]   # Ej: "entrada.mp4"
video_path_out = sys.argv[2]  # Ej: "salida.mp4"

# --- Abrir video ---
cap = cv2.VideoCapture(video_path_in)
if not cap.isOpened():
    print("No se pudo abrir el video")
    sys.exit()

# --- Obtener propiedades del video original ---
fps = cap.get(cv2.CAP_PROP_FPS)
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

# --- Definir el writer para el video de salida ---
fourcc = cv2.VideoWriter_fourcc(*"mp4v")
out = cv2.VideoWriter(video_path_out, fourcc, fps, (width, height))

while True:
    ret, frame = cap.read()
    if not ret:
        break

    # --- Preprocesar el frame para el modelo ---
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    resized = cv2.resize(gray, (28, 28))
    input_data = resized.reshape(1, 28, 28, 1) / 255.0

    # --- Predicción ---
    pred = model.predict(input_data, verbose=0)
    clase = int(np.argmax(pred))

    # --- Dibujar la predicción en el frame ---
    texto = f"Pred: {clase}"
    cv2.putText(frame, texto, (50, 100),
                cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 255, 0), 3)

    # --- Mostrar en tiempo real ---
    cv2.imshow("Video con predicciones", frame)

    # --- Escribir en el archivo de salida ---
    out.write(frame)

    # Salir si se presiona 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# --- Liberar recursos ---
cap.release()
out.release()
cv2.destroyAllWindows()
print(f"Video procesado guardado en: {video_path_out}")
