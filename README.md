# 🔒 Personal Finance Tracker


A simple, secure, and offline-first money manager that keeps you financially vigilant.


<p align="center">
  <img src="https://images.unsplash.com/photo-1579621970563-ebec7560ff3e?auto=format&fit=crop&w=1200&q=80" alt="Personal Finance Tracker Banner" width="100%" style="border-radius: 8px;" />
</p>


<p align="center">
  <img src="assets/icons/app_icon.png" alt="Personal Finance Tracker Icon" width="160" />
</p>


<p align="center">
  <b>Personal Finance Tracker</b> is a privacy-first personal finance dashboard designed to help you regain full control over your money. Built with meticulous attention to detail, high usability, and a beautiful modern user interface, this app works completely air-gapped without requiring intrusive permissions.
</p>


---


## 📱 Visual Showcase & Screenshots


Here is a visual overview of the clean, modern, and high-fidelity interface of Personal Finance Tracker:


<p align="center">
  <img src="https://bethrifty.today/assets/screenshots/1-splash-screen.png" width="23%" alt="Splash Screen" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/2-profile-setup.png" width="23%" alt="Profile Setup" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/3-currency-selection.png" width="23%" alt="Currency Selection" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/4-dashboard.png" width="23%" alt="Dashboard" />
</p>

<p align="center">
  <img src="https://bethrifty.today/assets/screenshots/5-drawer.png" width="23%" alt="Menu Drawer" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/6-settings.png" width="23%" alt="Settings Panel" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/7-expense.png" width="23%" alt="Add Expense" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/8-income.png" width="23%" alt="Add Income" />
</p>

<p align="center">
  <img src="https://bethrifty.today/assets/screenshots/9-dashboard.png" width="23%" alt="Data Lists" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/10-delete.png" width="23%" alt="Swipe Delete" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/11-dark-mode.png" width="23%" alt="AMOLED Black Theme" />
  &nbsp;
  <img src="https://bethrifty.today/assets/screenshots/12-about.png" width="23%" alt="About Panel" />
</p>


---


## 🚀 Technical Stack & Architecture


This project is built using professional, scalable, and robust development technologies.


### 🛠️ Core Technology Stack

* **Framework:** Flutter SDK (`>= 3.19.0`) & Dart (`>= 3.3.0`)
* **State Management:** Provider State Engine (`provider` package utilizing `MultiProvider` & `ChangeNotifier`)
* **Local Persistence:** Hive DB (High-performance, lightweight NoSQL key-value store on-device) & `shared_preferences` for key-value application states.
* **Security & Encryption:** Local AES-256 secure wrapper for encrypting sensitive fields before write operations.
* **Exporting & Reporting:** Native `pdf` generation engine, `csv` tabular encoders, and `share_plus` for native operating system sharing pipelines.
* **Biometrics:** `local_auth` package integration for biometric FaceID/TouchID checking.


### 🏗️ Architecture & Folder Structure

The application adopts a hybrid **Domain-Driven Design (DDD)** and **Clean Architecture** approach. Features like the Local Exporter are separated into distinct layers to enforce separation of concerns, loose coupling, and high testability:

```
lib/
├── features/
│   └── transaction_export/       # Clean Architecture Export Feature Module
│       ├── domain/
│       │   ├── models/           # Pure, immutable business entities
│       │   └── repositories/     # Abstract interface contracts
│       ├── data/
│       │   ├── datasources/      # Concrete PDF/CSV document generator implementations
│       │   └── repositories/     # Concrete repository adapters saving files
│       └── presentation/
│           ├── controllers/      # UI controllers orchestrating business logic and state
│           └── widgets/          # Responsive Bottom Sheet selectors & UI components
├── models/                       # Core Legacy Models (Category, Transaction, Account)
├── providers/                    # Global Provider State Management Controllers
├── screens/                      # UI Screens (Dashboard, Ledger, Custom Settings)
└── main.dart                     # Main entrypoint initializing Hive & global providers
```


---


## 🛠️ Software Coding & Clean Code Principles


To ensure the code is maintainable, readable, and highly scalable, we adhered to industry-leading development principles:

* **S.O.L.I.D. Principles:**
  * **Single Responsibility (SRP):** Every class has one reason to change. The `PDFExporter` only formats and prints PDF documents, completely separated from state or UI logic.
  * **Open/Closed (OCP):** New export formats (e.g., XML) can be added simply by extending the base abstract repository contract, without changing existing code.
  * **Liskov Substitution (LSP):** Base abstract interfaces can be substituted by any concrete sub-class seamlessly.
  * **Interface Segregation (ISP):** Clients are not forced to depend on interface methods they do not use.
  * **Dependency Inversion (DIP):** High-level controllers depend on abstract interfaces, not concrete classes. Dependencies are injected at runtime.
* **DRY (Don't Repeat Yourself):** Reusable numeric calculations, currency formatting utilities, and UI card frames are modularized into shared widgets and utility helpers.
* **Separation of Concerns:** Business logic is isolated from layout elements. Screens only listen to providers and render widgets; they do not fetch data directly.
* **Immutable State Management:** Transactions are treated as immutable value objects. Modifying transactions triggers copy-with routines and emits deterministic state signals.


---


## ✨ Extensive Features & Subfeatures Guide


### 💵 Comprehensive Income & Expense Ledger

* **Fast Inputs & Calculation Pad:** 
  Log transaction records in under three seconds with an custom built numeric computation pad that supports inline additions or subtractions before submitting.
* **Vibrant Categorization:** 
  Choose from a wide, customizable selection of color-coded income and expense categories (such as Housing, Groceries, Shopping, Travel, Entertainment, and Salary) backed by custom material icons.
* **Gestures & Swipe Actions:** 
  Delete items effortlessly with a swift right-to-left swipe, or edit details by holding down on any ledger card.
* **🔍 How to Access & Use:**
  1. On the home dashboard, tap the floating action button (`+`) in the bottom right corner.
  2. Choose either the **Income** or **Expense** tab at the top.
  3. Enter the transaction amount using the numeric keypad. If needed, perform quick calculations (e.g., `10 + 15`) directly on the keypad.
  4. Select a category (e.g., Food, Travel, Salary, Entertainment).
  5. Select a transaction date (defaults to today).
  6. Tap the checkmark icon to save. To delete a transaction, simply swipe left on its card inside the ledger view.


### 🛡️ Secure & Completely Offline-First Privacy

* **Air-Gapped Privacy:** 
  No cloud sign-ins required, no social networking feeds, and no background network syncing. Your financial data is yours alone and stays securely on your device.
* **Zero Intrusive Permissions:** 
  The application does *not* request access to your SMS, storage, contacts, or network capabilities.
* **Local Biometrics:** 
  Set up TouchID, FaceID, or Fingerprint lock on the settings menu to encrypt application entry at the device level.
* **🔍 How to Access & Use:**
  1. Open the drawer menu by tapping the top-left menu icon or swiping from the left edge of the screen.
  2. Navigate to **Settings**.
  3. Toggle **Enable Biometric Lock** to register your fingerprint or face authentication for secure app startup.


### 🎨 Personalization & Themes

* **Dynamic Styling:** 
  Pick from multiple carefully designed themes, including Light, Dark, and high-contrast AMOLED Black.
* **Accent Color Palettes:** 
  Personalize the main UI layout with a variety of vibrant accent colors.
* **Custom Categories & Currencies:** 
  Create, edit, delete, or reset expense categories and enter your custom currency symbols instantly.
* **🔍 How to Access & Use:**
  1. Open **Settings** from the main menu drawer.
  2. Tap on **Theme Options** to toggle between light, dark, and black modes.
  3. Tap on **Accent Color** to select your custom palette.
  4. Tap on **Currency Configurations** to customize currency formatting or specify a custom sign (e.g. `$`, `€`, `£`, `৳`).


### 📊 Premium Feature: Clean Architecture Local Transaction Exporter

We have engineered a high-quality, local transaction export suite following strict **Clean Architecture** patterns:

* **PDF Document (`*.pdf`):** Generates multi-page reports complete with rich typography, balance overview cards, custom charts, and tabular transaction lists.
* **CSV Sheet (`*.csv`):** Standard comma-separated values layout, ideal for Excel, Google Sheets, or advanced accounting tools.
* **JSON Payload (`*.json`):** Clean database schema representation, perfect for developers wanting to import their data elsewhere.
* **🔍 How to Access & Use:**
  1. Tap on the **Settings** item in the navigation drawer.
  2. Under the *Data Management* section, tap **Export Transactions**.
  3. Choose your desired output format (**PDF**, **CSV**, or **JSON**).
  4. Tap **Export Now**. A native sharing and file-saving dialog will appear, allowing you to save the generated file directly to your device storage or share it securely via email or local messaging.


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


We would like to express our sincere gratitude to the original creators and maintainers of the [AmruthPillai/BeThriftyToday](https://github.com/AmruthPillai/BeThriftyToday) repository, which served as the foundation of this work.


> [!NOTE]
> We have extensively worked on their original codebase, refactored the underlying logic, updated legacy dependencies, resolved complex build and runtime errors, and introduced many advanced modern enhancements. These upgrades include strict Clean Architecture boundaries, full state management overhauls, biometric protection, and high-fidelity features like Local Transaction Exporters (supporting customized PDF, CSV, and JSON outputs) to create a highly optimized, secure, and production-ready portfolio application.


---


## 📄 License & Open-Source


**Personal Finance Tracker** is open-source software licensed under the **Apache License 2.0**.
Feel free to read the [LICENSE](LICENSE) file for additional terms. Contributions and Pull Requests are welcome!
