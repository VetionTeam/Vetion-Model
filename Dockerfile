# Gunakan image dasar dari TensorFlow Serving
FROM tensorflow/serving:latest

# Buat direktori untuk model
RUN mkdir -p /models/MyModel/1

# Salin model ke dalam image Docker
COPY MyModel.h5 /models/MyModel/1/model.h5

# Tentukan variabel lingkungan untuk TensorFlow Serving
ENV MODEL_NAME=MyModel

# Jalankan TensorFlow Serving
CMD ["tensorflow_model_server", "--rest_api_port=8501", "--model_name=${MODEL_NAME}", "--model_base_path=/models/${MODEL_NAME}"]
