# Scube Flutter Assignment

A premium Flutter application demonstrating a **Monitoring Dashboard System**. Built with a focus on scalable architecture, pixel-perfect responsive UI, and smooth animations.

## 📱 Features

-   **Dashboard (Page 1)**: Real-time monitoring stats, Solar/Battery/Grid metrics, and Weather widget.
-   **Monitoring Details (Page 2)**:
    -   Interactive Power Charts.
    -   Source/Load toggles and Tabbed data views.
    -   Custom **Gradient Scrollbar** (`#4E91FD` -> `#080B7F`).
-   **Premium Navigation**: Custom **Slide + Fade** transitions (400ms) for a polished user experience.
-   **Responsive Design**: precise scaling using `flutter_screenutil`.

## 🏗️ Architecture

The project follows **Clean Architecture** principles to ensure separation of concerns and testability.

### Layered Structure
1.  **Presentation Layer**:
    -   **BLoC**: State management using `flutter_bloc`. Handles UI events and state emission.
    -   **Pages/Widgets**: Dumb UI components that listen to BLoC states.
2.  **Domain Layer** (Inner Layer):
    -   **Entities**: Pure Dart classes representing core business objects.
    -   **Repositories**: Abstract interfaces defining data operations.
    -   **UseCases**: Encapsulate single business actions (optional but recommended).
3.  **Data Layer** (Outer Layer):
    -   **Models**: DTOs (Data Transfer Objects) handling JSON serialization/deserialization.
    -   **Data Sources**: Implementations for API/Local data fetching.
    -   **Repositories**: Concrete implementations of Domain repositories.

### Dependency Injection
We use `get_it` as a Service Locator to manage dependencies efficiently.

## 🛠️ Tech Stack & Packages

-   **State Management**: `flutter_bloc`
-   **Routing**: `go_router` (Type-safe, URL-based routing)
-   **Dependency Injection**: `get_it`
-   **Value Equality**: `equatable`
-   **Functional Programming**: `dartz` (Either type for error handling)
-   **UI Responsiveness**: `flutter_screenutil`
-   **Icons**: `font_awesome_flutter` & `cupertino_icons`
-   **Network**: `internet_connection_checker`

## 📂 Project Structure

```
lib/
├── core/                   # Shared resources
│   ├── constants/          # AppStrings, AppSizes, AssetManager
│   ├── error/              # Failures & Exceptions
│   ├── network/            # NetworkInfo checker
│   ├── routes/             # AppRouter configuration
│   ├── theme/              # AppColors, Themes
│   └── widgets/            # Reusable widgets (CustomAppBar, PageNavigator)
├── features/               # Feature-based modular structure
│   ├── auth/               # Login & Authentication
│   ├── monitoring/         # Dashboard & Details features
│   │   ├── data/           # Models & Data Sources
│   │   ├── domain/         # Entities & Repositories
│   │   └── presentation/   # BLoC & Pages
│   └── splash/             # Splash Screen
├── injection_container.dart # DI Setup
└── main.dart               # Entry point
```

## 🚀 Getting Started

1.  **Prerequisites**: Ensure you have Flutter installed (`flutter doctor`).
2.  **Clone the repository**:
    ```bash
    git clone https://github.com/azizur-rahaman/scube-flutter-assignment.git
    ```
3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

## 🖌️ Design System

-   **Typography**: Google Fonts (`Inter` / `Roboto`).
-   **Colors**: Centralized in `AppColors`. Primary Brand: **Blue** (`#0096FC`) & **Cyan** (`#00C0E8`).
-   **Assets**: Managed via `AssetManager` for string safety.

---
*Maintained by Azizur Rahaman*
