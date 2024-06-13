# 五子棋 (Gomoku) Flutter 應用程式

這是一個使用 Flutter 開發的五子棋遊戲應用程式。該應用包含一個 19x19 的棋盤，支援兩個玩家交替下棋，當有五個相同的棋子連成一線時，遊戲結束並高亮顯示獲勝的五個格子。

## 功能
- 19x19 的棋盤
- 玩家交替下棋
- 棋子顏色區分：玩家1（藍色）、玩家2（綠色）
- 棋子高亮顯示：獲勝的五個棋子（黃色）
- 重置遊戲

## 依賴

- Flutter SDK
- provider: ^6.0.0

## 安裝

1. **安裝 Flutter 環境**：請參考 [Flutter 官網](https://flutter.dev/docs/get-started/install) 進行安裝。

2. **克隆專案**：
    ```sh
    git clone https://github.com/lolo162501/gomoku.git
    cd gomoku
    ```

3. **安裝依賴**：
    ```sh
    flutter pub get
    ```

## 執行

1. **連接設備**：
    - **Android 設備**：確保手機已啟用開發者選項和 USB 調試，並使用 USB 線將手機連接到電腦。
    - **iOS 設備**：需要使用 macOS，並且 iPhone 已啟用開發者模式。連接設備並信任開發者證書。

2. **執行應用程式**：
    ```sh
    flutter run
    ```

    這將構建應用程式並將其部署到連接的設備上。如果有多個設備連接，Flutter 會提示你選擇要部署的設備。

## 主要文件說明

### `main.dart`

這是應用程式的入口文件，負責設置提供者和初始化應用程式。

### `view_model.dart`

這是遊戲的狀態管理文件，使用 `ChangeNotifier` 管理棋盤狀態、當前玩家、獲勝狀態以及獲勝格子。

## UI 組件

### `GomokuGame`

主遊戲界面，包含棋盤、當前玩家顯示和重置按鈕。

### `GomokuCell`

棋盤格子組件，根據狀態顯示不同顏色，並處理點擊事件。