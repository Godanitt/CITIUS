import tensorflow as tf
import keras
from keras.layers import Dense, Flatten, Input, Conv2D, MaxPooling2D, Dropout
from keras.models import Sequential
import matplotlib.pyplot as plt
import numpy as np
import sys
import cv2

# Cargar modelo previamente guardado
model = keras.models.load_model("ClasificacionDigitos.keras")

# Leer imagen  (en un futuro desde argumento)
imagen_path_in =  sys.argv[1] # "Imagenes/raw/Prueba.png"  
imagen_path_out = sys.argv[2] # Imagenes/prediccion/Prueba.png" #
imagen = cv2.imread(imagen_path_in, cv2.IMREAD_GRAYSCALE)

# Procesamiento (recorte ejemplo: centrado) -> Posterior
#h, w = imagen.shape
#crop = imagen[h//4:3*h//4, w//4:3*w//4]

# Redimensionar según entrada del modelo (ej: 28x28)
#entrada = cv2.resize(crop,(28, 28))                                 # Si queremos recortarla
entrada = cv2.resize(imagen, (28, 28), interpolation=cv2.INTER_AREA) # Si no queremos recortarla

# Entrada
entrada = entrada.astype("float32") / 255.0
entrada = np.expand_dims(entrada, axis=(0, -1))

# Predicción
prediccion = model.predict(entrada)
clase = np.argmax(prediccion)

# Mostrar imagen con resultado
imagen_color = cv2.cvtColor(imagen, cv2.COLOR_GRAY2BGR)
cv2.putText(imagen_color, str(clase), (5, 10),
            cv2.FONT_HERSHEY_SIMPLEX, 5, (0, 255, 0), 5)
cv2.imshow("Resultado", imagen_color)
cv2.waitKey(2000)  # infinitos segundos

# Guardar la imagen con el output
cv2.imwrite(imagen_path_out, imagen_color)
#print(f"Imagen procesada guardada en: {imagen_path_out}")


