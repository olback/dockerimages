# Rust/C/C++ for Cortex-M devices

```
docker run --volume=$(pwd):/home/circleci/project olback/cortex-m:latest <your-build-command>
```

With custom cargo target:
```
docker run -v=$(pwd):/home/circleci/project -v=$(realpath $CARGO_TARGET_DIR):/home/circleci/.cargo-target -e=CARGO_TARGET_DIR=/home/circleci/.cargo-target olback/cortex-m:latest <your-build-command>
```
