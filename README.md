# Uminer GPU

[English](#english) | [繁體中文](#繁體中文)

## English

Uminer GPU is the official binary release repository for Uminer. The current
release supports BTX through the unified `--coin btx` command line.

### Download

Download the latest Linux package from
[GitHub Releases](https://github.com/UminerDev/UminerGpu/releases/latest):

```bash
wget https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64-cuda13.tar.gz
tar -xzf uminer-linux-x86_64-cuda13.tar.gz
cd uminer
sha256sum -c SHA256SUMS
```

### Quick Start

```bash
./uminer --coin btx --pool <pool-host:port> --worker <btx-address>.<worker-name>
```

Multi-GPU example:

```bash
./uminer --coin btx \
  --pool <pool-host:port> \
  --worker <btx-address>.rig1 \
  --devices 0,1,2,3
```

Run `./uminer --help` for pool failover, monitoring, watchdog, temperature and
performance options. Scan size and the CUDA execution profile are selected
automatically by default.

### Requirements

- Linux x86_64
- NVIDIA GPU and driver 580 or newer
- glibc 2.39 or newer for v0.1.0
- No CUDA Toolkit installation is required at runtime

The package contains CUDA code for `sm_80`, `sm_86`, `sm_89`, `sm_90` and
`sm_120`. RTX 3080 (`sm_86`) and RTX 4090 (`sm_89`) are release-gate tested.
Other listed architectures are included but have not received the same
performance qualification.

### HiveOS

The archive includes HiveOS integration scripts. Use this custom miner URL:

```text
https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64-cuda13.tar.gz
```

The v0.1.0 binary requires glibc 2.39 and therefore does not run on the current
HiveOS 20.04 base image. The scripts are included for newer compatible images
and future lower-glibc builds.

### v0.1.0

- Unified executable: `uminer --coin btx`
- Architecture-aware Ampere and Ada CUDA profiles
- Automatic scan sizing enabled by default
- Multi-GPU, pool failover, local API, watchdog and share verification
- Supports driver-only systems that expose `libcuda.so.1`
- Development fee disabled by default

Release assets include `SHA256SUMS`. Only download binaries from this repository
and verify the checksum before execution.

## 繁體中文

Uminer GPU 是 Uminer 的官方二進位發佈儲存庫。目前版本透過統一命令
`uminer --coin btx` 支援 BTX。

### 下載與校驗

```bash
wget https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64-cuda13.tar.gz
tar -xzf uminer-linux-x86_64-cuda13.tar.gz
cd uminer
sha256sum -c SHA256SUMS
```

### 快速啟動

```bash
./uminer --coin btx --pool <礦池地址:連接埠> --worker <BTX地址>.<礦機名稱>
```

執行環境：Linux x86_64、NVIDIA 580 及以上驅動、glibc 2.39 及以上。
執行時不需要安裝 CUDA Toolkit。RTX 3080 與 RTX 4090 已完成發佈驗收。

預設會自動選擇 CUDA 執行配置和掃描量，一般不需要手動設定
`scan/grid/chunk`。v0.1.0 預設不啟用開發費。

已知限制：v0.1.0 基於 Ubuntu 24.04 建置，需要 glibc 2.39，暫不相容
HiveOS 20.04 等較舊系統。
