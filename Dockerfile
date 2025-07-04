# Use the official Ubuntu image as base
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y git python3 python3-pip && rm -rf /var/lib/apt/lists/*

# Clone text-generation-webui
RUN git clone https://github.com/oobabooga/text-generation-webui.git /app
WORKDIR /app

# Install Python requirements
RUN pip install --no-cache-dir -r requirements.txt

# Expose the standard port
EXPOSE 7860

# Launch the web UI when the container starts
CMD ["python3", "server.py", "--listen", "--port", "7860"]
