# Cross-Compile Toolchain for ESP32(xtensa)

## Build Image

```bash
docker build -t build-esp32 .
```

## Run

```bash
docker run -it --rm -v $your_project_folder:/project build-esp32:latest
```

## Info

This docker image is basically derived from [Official ESP32 Doc(v4.0)](https://docs.espressif.com/projects/esp-idf/en/v4.0/get-started/index.html)