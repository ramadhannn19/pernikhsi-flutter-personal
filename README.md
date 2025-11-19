# 📱 Pernik HSI Flutter

Pernik HSI Flutter is a mobile application built with **Flutter** following a modular and scalable architecture.  
The project is structured around `core`, `features`, and `app` layers, making it easy to maintain, test, and extend.

---

## 🚀 Key Features

- 🔑 **Authentication** (login, register, session management)  
- 🏠 **Home dashboard** with modular widgets  
- ⚙️ **Settings** with preferences and localization  
- 🌐 **API integration** with network layer and error handling  
- 📦 **Dependency injection** using service locator pattern  
- 🌍 **Internationalization (i10n)** support with ARB & generated localization files  
- 🛠 **Clean Architecture**: separation of concerns between `core`, `features`, and `app`  

---

## 📂 Project Structure

```bash
lib/
├── app/                # App-level configuration
│   ├── app.dart        # Root app widget
│   ├── config.dart     # App configuration and constants
│   ├── locator.dart    # Dependency injection setup
│   └── modules.dart    # Module registration
├── core/               # Core layer (shared logic & infrastructure)
│   ├── component/      # Reusable UI components
│   ├── data/           # Data sources and repositories
│   ├── exception/      # Custom exceptions
│   ├── extension/      # Dart/Flutter extensions
│   ├── failure/        # Failure handling (error abstraction)
│   ├── helper/         # Utility helpers
│   ├── module/         # Core modules
│   ├── network/        # API client, interceptors, network handling
│   ├── preference/     # Local storage and shared preferences
│   ├── usecase/        # Business logic use cases
│   ├── utils/          # Utility functions and constants
│   └── core.dart       # Entry for core exports
├── features/           # Feature layer (grouped by domain)
│   ├── auth/           # Authentication (login, register, session)
│   ├── home/           # Home/dashboard feature
│   └── setting/        # Settings & preferences
├── l10n/               # Localization
│   ├── arb/            # ARB files with translations
│   ├── generated/      # Generated localization code
│   └── l10n.dart       # Localization setup
└── main.dart           # Application entry point
```

---

## ⚙️ Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/donisaputradev/pernikhsi-flutter.git
cd pernikhsi-flutter
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the Application
```bash
flutter run
```

### 4. Build APK / iOS
```bash
flutter build apk   # Android
flutter build ios   # iOS
```

---

## 📦 Main Dependencies

Some key dependencies you may find in `pubspec.yaml` (to be updated based on the actual file):

- `dio` → REST API integration  
- `flutter_bloc` → State management  
- `get_it` → Dependency injection (service locator)  
- `hive` → Local storage  
- `intl` → Internationalization support  
- `flutter_localizations` → Flutter localization utilities  

---

## 🧪 Testing

Run all unit & widget tests:
```bash
flutter test
```

---

## 🏗 Architecture Notes

This project follows **Clean Architecture** principles:

- **Presentation layer (features)** → UI, state management, and user interactions  
- **Domain layer (core/usecase)** → Business logic in form of use cases  
- **Data layer (core/data, core/network, core/preference)** → Repository pattern with API & local storage  

This makes the app modular, testable, and maintainable.

---

## 🤝 Contributing

1. Fork this repository  
2. Create a new branch: `git checkout -b feature/your-feature`  
3. Commit your changes: `git commit -m 'Add some feature'`  
4. Push to the branch: `git push origin feature/your-feature`  
5. Open a Pull Request  

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this project with attribution.

