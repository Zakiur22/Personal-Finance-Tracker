# 🔒 Personal Finance Tracker


A simple, secure, and offline-first money manager that keeps you financially vigilant.


<p align="center">
  <img src="https://github.com/AmruthPillai/BeThriftyToday/blob/master/assets/icons/app_icon.png?raw=true" alt="Personal Finance Tracker Icon" width="160" />
</p>


<p align="center">
  <b>Personal Finance Tracker</b> is a privacy-first personal finance dashboard designed to help you regain full control over your money. Built with meticulous attention to detail, high usability, and a beautiful modern user interface, this app works completely air-gapped without requiring intrusive permissions.
</p>


---


## ✨ Key Product Features & Usage Guide


### 💵 Comprehensive Income & Expense Ledger

* **Fast Inputs:** Log transactions in under three seconds with an intuitive custom numeric calculation pad.
* **Vibrant Categorization:** Choose from a wide selection of colorful categories backed by custom material icons.
* **Gestures & Swipe Actions:** Delete items effortlessly with a swift right-to-left swipe, or edit details by holding down on any ledger card.
* **🔍 How to Access & Use:** 
  1. On the home dashboard, tap the floating action button (`+`) in the bottom right corner.
  2. Choose either **Income** or **Expense** tab at the top.
  3. Enter the transaction amount using the numeric keypad.
  4. Select a category (e.g., Food, Travel, Salary, Entertainment).
  5. Tap the checkmark icon to save. To delete a transaction, simply swipe left on its card inside the ledger view.


### 🛡️ Secure & Completely Offline-First

* **Air-Gapped Privacy:** No cloud sign-ins required, no social networking feeds, and no background network syncing. Your financial data is yours alone.
* **Zero Intrusive Permissions:** The application does *not* request access to your SMS, storage, or contacts.
* **Local Biometrics:** Set up TouchID, FaceID, or Fingerprint lock on the settings menu to encrypt application entry at the device level.
* **🔍 How to Access & Use:** 
  1. Open the drawer menu by tapping the top-left menu icon or swiping from the left edge.
  2. Navigate to **Settings**.
  3. Toggle **Enable Biometric Lock** to register your fingerprint or face authentication for secure app startup.


### 🎨 Personalization & Themes

* **Dynamic Styling:** Pick from multiple carefully designed themes, including Light, Dark, and high-contrast AMOLED Black.
* **Accent Color Palettes:** Personalize the main UI layout with a variety of vibrant accent colors.
* **Custom Categories & Currencies:** Create, edit, delete, or reset expense categories and enter your custom currency symbols instantly.
* **🔍 How to Access & Use:**
  1. Open **Settings** from the main menu drawer.
  2. Tap on **Theme Options** to toggle between light, dark, and black modes.
  3. Tap on **Accent Color** to select your custom palette.
  4. Tap on **Currency Configurations** to customize currency formatting or specify a custom sign (e.g. `$`, `€`, `£`, `৳`).


---


## 🚀 Premium Feature: Clean Architecture Local Transaction Exporter


We have engineered a high-quality, local transaction export suite following strict **Clean Architecture** patterns:


> [!TIP]
> **Privacy First:** Exporters generate files entirely on-device, meaning your private financial ledgers never leave your local phone filesystem.


### 📊 Exporter Methods Supported

| Format | Output | Layout Styling | RFC Standard | Primary Use Case |
|---|---|---|---|---|
| **PDF Document** | `*.pdf` | Rich typography, net balance cards, styled charts, and transaction grids | PDF 1.7 | Formal accounting, printing, physical archiving |
| **CSV Sheet** | `*.csv` | Plain tabular text separated by commas | RFC 4180 | Excel, Google Sheets, custom analytical software |
| **JSON Payload** | `*.json` | Structured database mapping representation | JSON Standard | External backup, custom developer tooling |


### 🔍 How to Access & Use the Exporter:
1. Tap on the **Settings** item in the navigation drawer.
2. Under the *Data Management* section, tap **Export Transactions**.
3. Choose your desired output format (**PDF**, **CSV**, or **JSON**).
4. Tap **Export Now**. A native sharing and file-saving dialog will appear, allowing you to save the generated file directly to your device storage or share it securely via email or local messaging.


### 🏗️ S.O.L.I.D. Architectural Layering
The export suite is cleanly decoupled under `lib/features/transaction_export/`:

```
lib/features/transaction_export/
├── domain/
│   ├── models/           # Pure immutable data models mapping transaction records
│   └── repositories/     # Abstract repository contracts specifying export actions
├── data/
│   ├── datasources/      # PDF document builders and CSV row formatter adapters
│   └── repositories/     # Concrete repository implementations invoking file-saving pipelines
└── presentation/
    ├── controllers/      # Exporter logic state controller triggers
    └── widgets/          # Beautiful Bottom Sheet selector dialog with custom animations
```


---


## 🔐 Security & AES-256 Encryption


We protect your records using robust local encryption. Sensitive transaction properties are fully encrypted locally on the device prior to any database state modification using a secure, local **AES-256 keying wrapper**.


> [!NOTE]
> Even if a bad actor manages to extract your device's raw database file, your transaction details will appear as unreadable, randomized cipher hashes.


---


## 🔄 Project Directory & File Guide


```
Personal Finance Tracker/
├── lib/
│   ├── features/
│   │   └── transaction_export/   # Clean Architecture export feature
│   ├── models/                  # Core finance models (Category, Transaction)
│   ├── providers/               # Provider state management controllers
│   ├── screens/                 # Dashboard, ledger, and settings pages
│   └── main.dart                # Application entry point
├── android/                     # Android build files and manifests
├── ios/                         # iOS build configurations
└── pubspec.yaml                 # Dependencies and asset declarations
```


---


## 🛠️ Developer Setup & Guidelines


### Requirements
* **Flutter SDK:** `>= 3.19.0`
* **Dart SDK:** `>= 3.3.0`


### Step-by-Step Installation

1. Navigate to the project directory:
   ```bash
   cd "Personal Finance Tracker"
   ```

2. Retrieve the required dependencies:
   ```bash
   flutter pub get
   ```

3. Run the linter to verify code cleanliness:
   ```bash
   flutter analyze
   ```

4. Build a pristine production release APK:
   ```bash
   flutter build apk --release
   ```


---


## 🙏 Acknowledgements & Attribution


We would like to express our sincere gratitude to the original creators and maintainers of the original [AmruthPillai/BeThriftyToday](https://github.com/AmruthPillai/BeThriftyToday) repository, which served as the foundation of this work.


> [!NOTE]
> This repository represents an **extensive, premium upgrade** from the original codebase. It introduces strict Clean Architecture boundaries, full state management refactoring, upgraded Modern SDK compatibility, and high-fidelity feature extensions such as Local Transaction Exporters and PDF layouts.


---


## 📄 License & Open-Source


**Personal Finance Tracker** is open-source software licensed under the **Apache License 2.0**.
Feel free to read the [LICENSE](LICENSE) file for additional terms. Contributions and Pull Requests are welcome!
