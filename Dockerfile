FROM diogod2r/omnivoice-fastapi:latest

# Reinstall PyTorch, torchvision, and torchaudio with CUDA 12.1 wheel which supports compute capability 6.1 (Pascal)
RUN pip install --no-cache-dir torch torchvision torchaudio --force-reinstall --index-url https://download.pytorch.org/whl/cu121
