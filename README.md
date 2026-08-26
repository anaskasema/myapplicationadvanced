# My Application Advanced

A feature-rich Flutter application focusing on News and Product management, integrated with Firebase for authentication and Google Sign-In.

## 🚀 Features

- **Authentication**:
    - Email and Password Login/Signup.
    - Google Sign-In integration.
    - Secure Logout functionality.
- **News Module**:
    - Browse news by categories.
    - General news feed.
    - Detailed view for specific news items.
- **Product Management**:
    - List products.
    - Add new products with validation.
- **Advanced Architecture**:
    - State Management using **Flutter BLoC/Cubit**.
    - Dependency Injection using **GetIt**.
    - Centralized Routing system with `onGenerateRoute`.
    - Repository pattern for clean data access.

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend**: Firebase (Authentication)
- **State Management**: BLoC & Cubit
- **Networking**: Dio
- **Dependency Injection**: GetIt
- **Local Storage**: Shared Preferences (Singleton)

## 📁 Project Structure

```
lib/
├── auth/                 # Authentication logic (Login/Signup)
├── core/                 # Core utilities, services, and shared widgets
│   ├── routing/          # Centralized navigation logic
│   ├── services/         # API, GetIt, and SharedPreferences services
│   └── widgets/          # Shared custom UI components
├── features/             # Feature-based modules
│   ├── categories_news/  # News categorization feature
│   ├── genral_news/      # Main news feed feature
│   ├── news_details/     # Detailed news view
│   └── products/         # Product listing and creation
├── models/               # Global data models
└── widgets/              # Reusable UI widgets
```

## ⚙️ Setup and Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Firebase Configuration**:
    - This project requires Firebase. Ensure you have your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in the appropriate directories.
    - Enable Email/Password and Google Sign-In in your Firebase Console.
4.  **Run the app**:
    ```bash
    flutter run
    ```

## 📝 Important Notes

- **Naming Conventions**: The project uses some custom naming styles for specific legacy widgets (e.g., `CustomButton.dart`, `custom_circule_progressIndicator.dart`) to maintain consistency with the original codebase.
- **Routing**: Use `RoutesName` and `AppRoutes` for any navigation changes.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
