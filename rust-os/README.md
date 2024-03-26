# Rust OS

## 编译


```powershell
$proxy='http://127.0.0.1：2334'
$ENV:HTTP_PROXY=$proxy 
$ENV:HTTPS_PROXY=$proxy
rustup target add thumbv7em-none-eabihf
```

cargo build --target thumbv7em-none-eabihf
cargo build --target x86_64-rust_os.json

# Linux
cargo rustc -- -C link-arg=-nostartfiles
# Windows
cargo rustc -- -C link-args="/ENTRY:_start /SUBSYSTEM:console"
# macOS
cargo rustc -- -C link-args="-e __start -static -nostartfiles"


