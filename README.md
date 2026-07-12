# Uminer GPU

[English](#english) | [繁體中文](#繁體中文)

## English

Uminer GPU is the official binary release repository for the proprietary UMINER NVIDIA GPU miner.
One `uminer` executable supports BTX and CSD through `--coin btx` and `--coin csd`.

### Download

```bash
wget https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64.tar.gz
tar -xzf uminer-linux-x86_64.tar.gz
cd uminer
sha256sum -c SHA256SUMS
```

### Minimal Usage

```bash
# BTX
./uminer --coin btx -o stratum+tcp://global.btxpool.org:23333 -u <BTX_ADDRESS>.rig01 -p x

# CSD: transport follows the URL; tcp and tls are both supported.
./uminer --coin csd -o stratum+tls://csd.luckypool.io:443 -u <CSD_ADDRESS>.rig01 -p x
```

Multiple devices may be selected with `-d 0,1,2`. All devices share one user-pool session; UMINER
handles bounded submit routing, reconnect and configured-pool failover at process scope. Run
`./uminer --help` for the complete option list.

### Requirements

- Linux x86_64, glibc 2.30 or newer
- NVIDIA driver 535 or newer for Turing/CMP, Ampere and Ada
- NVIDIA driver 580.95 or newer for Blackwell
- No CUDA Toolkit installation is required at runtime
- Embedded native SASS: `sm_75`, `sm_80`, `sm_86`, `sm_89`, `sm_120`

### Operations

- A console-only whole-rig/per-GPU status block is printed every 120 seconds by default.
- INFO logs report new jobs and share outcomes; detail is rate-limited and aggregated after ten
  events per minute.
- The local `/stats` and `/metrics` API binds to `127.0.0.1` by default.
- Auto-Tune state is bounded, versioned and stored per physical GPU UUID when enabled.
- The package includes HiveOS integration files and SHA-256 checksums.

### Developer Fee

Version 0.1.16 is an active-fee testing release: BTX is 2% and CSD is 3%. The policy is compiled
per coin and cannot be reduced by CLI. A GPU changes to developer work only after a trusted Fee
route has connected, authorized and supplied a valid job; otherwise user mining continues and the
missed window is not recovered. The user-pool session remains connected during a Fee window.

### Current Release Scope

- Linux asset only; Windows is not included.
- BTX and CSD are the commercial algorithms. Pearl remains an experimental workspace path and is
  not part of the release.
- v0.1.16 is published under an explicit testing-stage exception. Long-duration production
  qualification is continuing and is not claimed by this release.

## 繁體中文

Uminer GPU 是閉源 UMINER NVIDIA GPU 礦機的官方二進位發佈儲存庫。單一 `uminer`
執行檔透過 `--coin btx` 與 `--coin csd` 支援 BTX 和 CSD。

### 下載與校驗

```bash
wget https://github.com/UminerDev/UminerGpu/releases/latest/download/uminer-linux-x86_64.tar.gz
tar -xzf uminer-linux-x86_64.tar.gz
cd uminer
sha256sum -c SHA256SUMS
```

### 最簡使用方式

```bash
# BTX
./uminer --coin btx -o stratum+tcp://global.btxpool.org:23333 -u <BTX_ADDRESS>.rig01 -p x

# CSD：傳輸方式完全由 URL 決定，tcp/tls 均可使用。
./uminer --coin csd -o stratum+tls://csd.luckypool.io:443 -u <CSD_ADDRESS>.rig01 -p x
```

可用 `-d 0,1,2` 選擇多張 GPU。全部 GPU 共用一條使用者礦池連線，提交、重連與備援池切換
由進程級 runtime 統一管理。完整參數請執行 `./uminer --help`。

### 執行需求

- Linux x86_64，glibc 2.30 或更新版本
- Turing/CMP、Ampere、Ada 需 NVIDIA 535 或更新驅動
- Blackwell 需 NVIDIA 580.95 或更新驅動
- 執行時不需安裝 CUDA Toolkit
- 內嵌 native SASS：`sm_75`、`sm_80`、`sm_86`、`sm_89`、`sm_120`

### 運維能力

- 預設每 120 秒輸出一次整機/逐卡狀態摘要。
- INFO 級記錄新任務與 share 結果；每分鐘超過 10 條後分類聚合。
- 本機 `/stats` 與 `/metrics` API 預設僅綁定 `127.0.0.1`。
- Auto-Tune 快取按實體 GPU UUID 與版本隔離，並有容量上限。
- 壓縮包含 HiveOS 整合檔與 SHA-256 校驗。

### 開發者費用

v0.1.16 是啟用 Fee 的測試版：BTX 2%、CSD 3%。費率按幣種固化，CLI 無法下調。
只有當受信任 Fee 路由已連線、授權並取得有效任務後，GPU 才會切換；否則使用者挖礦
持續進行，該時間窗不追補。Fee 時間窗內使用者礦池連線保持在線。

### 本版發佈邊界

- 僅提供 Linux，不含 Windows 產物。
- BTX/CSD 為商業支援算法；Pearl 仍是實驗路徑，不進入本發佈。
- v0.1.16 根據測試階段特例直接發佈；生產級長時穩定驗收仍在進行，本版不宣稱已完成。
