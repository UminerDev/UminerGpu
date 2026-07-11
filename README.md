# Uminer GPU

[English](#english) | [繁體中文](#繁體中文)

## English

Uminer GPU is the official binary release repository for Uminer. One executable
supports both BTX and CSD through `--coin btx` and `--coin csd`.

### Download

```bash
wget https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64.tar.gz
tar -xzf uminer-linux-x86_64.tar.gz
cd uminer
sha256sum -c SHA256SUMS
```

### Minimal Usage (BTX)

Replace `<BTX_ADDRESS>` with a complete BTX address:

```bash
./uminer --coin btx -o stratum+tcp://global.btxpool.org:23333 -u <BTX_ADDRESS>.rig01 -p x
```

### Minimal Usage (CSD)

Replace the pool endpoint and `<CSD_ADDRESS>` with values supplied by your CSD
pool. The current CSD user-pool transport accepts plaintext Stratum endpoints:

```bash
./uminer --coin csd -o stratum+tcp://<CSD_POOL_HOST>:<PORT> -u <CSD_ADDRESS>.rig01 -p x -d 0
```

Run `./uminer --help` for the general BTX options and
`./uminer --coin csd --help` for CSD options.

### Requirements

- Linux x86_64
- glibc 2.30 or newer
- NVIDIA driver 535 or newer for Turing, Ampere and Ada
- NVIDIA driver 580.95 or newer for Blackwell
- No CUDA Toolkit installation is required at runtime

CSD includes native GPU code for `sm_75`, `sm_80`, `sm_86`, `sm_89` and
`sm_120`, plus driver-compatible PTX fallback paths. Release validation covers
CMP 40HX, CMP 50HX, RTX 3080, RTX 4090 and RTX 5090. BTX regression validation
was completed on RTX 3080.

### HiveOS

Use this custom miner URL:

```text
https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64.tar.gz
```

The package includes HiveOS integration scripts. The default HiveOS template
uses BTX; set `CUSTOM_COIN=csd` when preparing a CSD flight sheet.

### Known Limitations

- CSD user-pool connections do not yet support native TLS URLs.
- CSD currently runs one GPU per process and does not yet provide automatic
  pool failover/reconnect. Use a distinct worker name for each process.
- The v0.1.8 public asset is Linux-only.

Development fee is disabled by default. Release assets include SHA-256
checksums. Only download binaries from this repository and verify them before
execution.

## 繁體中文

Uminer GPU 是 Uminer 的官方二進位發佈儲存庫。單一執行檔透過
`--coin btx` 與 `--coin csd` 同時支援 BTX 和 CSD。

### 下載與校驗

```bash
wget https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64.tar.gz
tar -xzf uminer-linux-x86_64.tar.gz
cd uminer
sha256sum -c SHA256SUMS
```

### 最簡使用方式（BTX）

請將 `<BTX_ADDRESS>` 替換為完整的 BTX 地址：

```bash
./uminer --coin btx -o stratum+tcp://global.btxpool.org:23333 -u <BTX_ADDRESS>.rig01 -p x
```

### 最簡使用方式（CSD）

請使用 CSD 礦池提供的節點，並將 `<CSD_ADDRESS>` 替換為完整地址。
目前 CSD 使用者礦池傳輸接受明文 Stratum 節點：

```bash
./uminer --coin csd -o stratum+tcp://<CSD_POOL_HOST>:<PORT> -u <CSD_ADDRESS>.rig01 -p x -d 0
```

一般 BTX 參數請執行 `./uminer --help`；CSD 參數請執行
`./uminer --coin csd --help`。

### 執行需求

- Linux x86_64
- glibc 2.30 或更新版本
- Turing、Ampere 與 Ada 需 NVIDIA 535 或更新驅動
- Blackwell 需 NVIDIA 580.95 或更新驅動
- 執行時不需安裝 CUDA Toolkit

CSD 包含 `sm_75`、`sm_80`、`sm_86`、`sm_89` 與 `sm_120` 原生 GPU 程式，
並提供與驅動相容的 PTX 備援路徑。發佈驗證已覆蓋 CMP 40HX、
CMP 50HX、RTX 3080、RTX 4090 與 RTX 5090；BTX 已在 RTX 3080 完成回歸驗證。

### HiveOS

```text
https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64.tar.gz
```

壓縮包包含 HiveOS 整合腳本。預設範本使用 BTX；準備 CSD flight sheet
時請設定 `CUSTOM_COIN=csd`。

### 已知限制

- CSD 使用者礦池連線尚不支援原生 TLS URL。
- CSD 目前每個進程使用一張 GPU，尚未提供自動礦池切換/重連。
  每個進程請使用不同的 worker 名稱。
- v0.1.8 公開資產僅提供 Linux 版本。

開發者費用預設為關閉。發佈資產提供 SHA-256 校驗值；請僅從本儲存庫
下載並在執行前完成校驗。
