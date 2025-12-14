# 📝 Exam Demo - 線上考試系統

一款基於 Flutter 開發的跨平台線上考試應用，支援 **Web、Android、iOS、Linux、Windows、macOS** 等多個平台。

## 🎯 核心功能

- ✅ **用戶認證系統** - 登入/註冊功能（支援用戶身份驗證）
- ✅ **考試選擇** - 瀏覽並選擇不同的考試科目
- ✅ **題目展示** - 實時加載和顯示考試題目
- ✅ **統計分析** - 查看考試成績統計和分析
- ✅ **本地數據存儲** - 題目和用戶數據的 DAO 層

## 📦 項目結構

```
lib/
├── main.dart                    # 應用入口點
├── screens/                     # 所有頁面
│   ├── login_screen.dart       # 登入頁面
│   ├── exam_selection_screen.dart  # 考試選擇頁面
│   ├── question_screen.dart    # 題目頁面
│   └── stats_screen.dart       # 統計頁面
├── controllers/                 # 業務邏輯控制器
│   └── exam_controller.dart    # 考試控制器
├── services/                    # 服務層
│   └── auth_service.dart       # 認證服務
├── dao/                         # 數據訪問層
│   └── question_dao.dart       # 題目 DAO
├── models/                      # 數據模型
│   ├── user.dart               # 用戶模型
│   └── question.dart           # 題目模型
└── components/                  # 可復用組件
    └── question_widget.dart    # 題目組件
```

## 🚀 快速開始

### 環境要求

- **Flutter SDK**: 3.5.0 或更高版本
- **Dart**: 自動與 Flutter 一起安裝

### 🔧 環境搭建 (Linux / Dev Container)

如果您是在全新的 Linux 環境或 Dev Container 中開發，請按照以下步驟安裝 Flutter 環境：

1. **安裝系統依賴**
   ```bash
   sudo apt-get update
   sudo apt-get install -y git curl unzip xz-utils zip libglu1-mesa
   # 如果需要編譯 Linux 桌面版，還需安裝：
   sudo apt-get install -y build-essential cmake ninja-build libgtk-3-dev
   ```

2. **安裝 Flutter SDK**
   ```bash
   cd ~
   git clone https://github.com/flutter/flutter.git -b stable
   ```

3. **配置環境變量**
   ```bash
   export PATH="$HOME/flutter/bin:$PATH"
   # 建議將此行添加到您的 shell 配置文件中 (.bashrc 或 .zshrc)
   ```

4. **啟用 Web 支持**
   ```bash
   flutter config --enable-web
   ```

### 安裝步驟

1. **克隆項目**
   ```bash
   git clone https://github.com/lscoupling/cloumaster-rao.git
   cd cloumaster-rao
   ```

2. **獲取依賴**
   ```bash
   flutter pub get
   ```

3. **運行應用**

   **Web 版本（推薦開發）**
   ```bash
   flutter run -d web
   ```

   **Android 版本**
   ```bash
   flutter run -d android
   ```

   **iOS 版本**
   ```bash
   flutter run -d ios
   ```

   **Linux 桌面版本**
   ```bash
   flutter run -d linux
   ```
