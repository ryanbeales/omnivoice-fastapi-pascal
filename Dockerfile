FROM diogod2r/omnivoice-fastapi:latest

# Reinstall PyTorch, torchvision, and torchaudio with CUDA 12.1 wheel which supports compute capability 6.1 (Pascal)
# Also upgrade typing_extensions to avoid ImportError on startup (required by newer pydantic versions)
RUN pip install --no-cache-dir torch torchvision torchaudio --force-reinstall --index-url https://download.pytorch.org/whl/cu121 \
 && pip install --no-cache-dir --upgrade typing_extensions
