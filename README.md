# omnivoice-fastapi-pascal

This repository builds a custom Docker image for **OmniVoice-FastAPI** with support for older NVIDIA GPUs based on the **Pascal architecture** (compute capability 6.1, such as the GTX 1050, 1050 Ti, 1060, 1070, and 1080 series).

## Source
This project builds on top of the excellent wrapper by **diogod2r**:
* **Upstream Repository**: [diogod2r/OmniVoice-FastAPI](https://github.com/diogod2r/OmniVoice-FastAPI)
* **Base Image**: `diogod2r/omnivoice-fastapi:latest`

## Why this repository exists
The precompiled PyTorch library in the upstream container's GPU image is compiled only for compute capabilities `7.5` and newer (Turing, Ampere, Ada Lovelace, etc.). As a result, running the official image on Pascal cards causes PyTorch to crash with a compute capability mismatch warning:
```
UserWarning: Found GPU0 NVIDIA GeForce GTX 1050 Ti which is of compute capability (CC) 6.1.
The following list shows the CCs this version of PyTorch was built for and the hardware CCs it supports:
- 7.5, 8.0, 8.6, 9.0, 10.0, 12.0
```

To resolve this without cloning the entire upstream project, this repository:
1. Starts `FROM` the official upstream image.
2. Force-reinstalls the official PyTorch CUDA 12.1 pip wheels, which include native support for compute capability `6.1`.
3. Auto-builds the image via GitHub Actions and publishes it to the GitHub Container Registry (GHCR) at `ghcr.io/ryanbeales/omnivoice-fastapi-pascal:latest`.
