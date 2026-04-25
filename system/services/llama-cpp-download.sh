#!/usr/bin/env bash
# Script to download a GGUF model for llama.cpp

MODEL_PATH="/var/lib/llama-cpp-server"
MODEL_URL="https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q4_K_M.gguf"
MODEL_FILE="model.gguf"

# Create the directory if it doesn't exist
mkdir -p "$MODEL_PATH"

# Check if the model already exists
if [ -f "$MODEL_PATH/$MODEL_FILE" ]; then
    echo "Model already exists at $MODEL_PATH/$MODEL_FILE"
    echo "To download a new model, delete the existing one first."
    exit 0
fi

# Download the model
echo "Downloading model from $MODEL_URL to $MODEL_PATH/$MODEL_FILE"
curl -L "$MODEL_URL" -o "$MODEL_PATH/$MODEL_FILE"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Model downloaded successfully"
    echo "You can now start the llama-cpp-server service"
else
    echo "Error downloading model"
    exit 1
fi