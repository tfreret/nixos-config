# System Services

## Llama.cpp Inference Server

The llama-cpp-server provides a local LLM inference service for your desktop. It's disabled by default but can be enabled in the host configuration.

### Usage:

1. **Download a model**: 
   ```bash
   sudo ~/.config/nixos-config/system/services/llama-cpp-download.sh
   ```
   This will download a default 7B parameter model to `/var/lib/llama-cpp-server/model.gguf`

2. **Start the service**:
   ```bash
   sudo systemctl start llama-cpp-server
   ```

3. **Use the API**:
   The server provides an OpenAI-compatible API at http://localhost:8080/v1

   Example curl:
   ```bash
   curl http://localhost:8080/v1/chat/completions \
     -H "Content-Type: application/json" \
     -d '{
       "model": "local-model",
       "messages": [
         {
           "role": "system", 
           "content": "You are a helpful assistant."
         },
         {
           "role": "user", 
           "content": "Hello, who are you?"
         }
       ],
       "temperature": 0.7,
       "max_tokens": 150
     }'
   ```

4. **Customize the model**:
   To use a different model, change the `modelPath` in your configuration or place a different model at `/var/lib/llama-cpp-server/model.gguf`

## Docker

Docker is enabled on both desktop and WSL configurations.

### Docker Compose

Use Docker Compose for running multi-container applications:

```bash
docker-compose up -d
```

### LazyDocker

A simple terminal UI for Docker:

```bash
lazydocker
```