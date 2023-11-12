#!/bin/sh

mkdir -p bin/
rm -rf bin/*

root_dir=$(pwd)

# 1. Build and copy Go binary
echo "Building and copying Go binary..."
cd go/
go build -ldflags="-s -w" -o ../bin/tinierfetch-go main.go
cd $root_dir

# 2. Build and copy Nim binary
echo "Building and copying Nim binaries..."
cd nim/
nimble speed --silent
cd $root_dir

# 3. Build and copy Rust binary
echo "Building and copying Rust binary..."
cd rs/
cargo build --release
cp target/release/tinierfetch-rs ../bin/ -vf
cd $root_dir

# 4. Build and copy C++ binaries
echo "Building and copying C++ binaries..."
cd cpp/
make clean && make all &&
cp fetch_size fetch_speed ../bin/ -vf
cd $root_dir

# 5. Copy Python script
# echo "Copying Python script"
# cd py/
# cp tinierfetch-py.py ../bin/ -vf
# chmod +x ../bin/tinierfetch-py.py
# cd $root_dir

# 6. Display binary sizes
echo "Binary/Script Sizes:"
ls -lh bin/*

# 7. Benchmark binary speeds
echo "Benchmarking binary speeds..."
s1=""
cd bin/
rm markdown.md
for file in *; do
if [ -f "$file" ]; then
s1=$s1$' bin/'$bins$file
fi
done
cd ..
echo $s1
hyperfine -N --warmup 10000 $s1 --export-markdown markdown.md
