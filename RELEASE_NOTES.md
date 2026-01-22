# Release v1.0.0 - Initial Release & Monitoring Dashboard

## 🚀 Overview
This is the first stable release of the Scube Flutter Assignment application. It includes the complete **Authentication**, **Dashboard (Page 1)**, and **Monitoring Details (Page 2)** features, refined with a premium UI and robust architecture.

## ✨ Key Features

### 🖥️ Monitoring Dashboard
-   **Page 1 (Home)**: Real-time system stats, Weather widget, and Inverter lists.
-   **Page 2 (Details)**: Detailed monitoring view with:
    -   **Interactive Charts**: Donut chart for power metrics.
    -   **Tab Navigation**: Summary / SLD / Data views.
    -   **Source/Load Toggle**: Switch between power source and load views.

### 🎨 Premium UI/UX
-   **Navigation**: Smooth "Slide + Fade" transitions (400ms) for a native app feel.
-   **Custom Widgets**:
    -   `GradientScrollbar`: Custom linear gradient scrollbar (`#4E91FD` -> `#080B7F`).
    -   `CustomAppBar`: Unified App Bar with notification support and fixed scroll elevation.
    -   `PageNavigator`: Standardized navigation buttons.

### 🛠️ Technical Highlights
-   **Architecture**: Clean Architecture with BLoC state management over `flutter_bloc`.
-   **Routing**: `GoRouter` with centralized route constants and custom page builders.
-   **Responsiveness**: `flutter_screenutil` integration for pixel-perfect standard scaling.

## 📦 Version
-   **Version**: `1.0.0`
-   **Build Number**: `1`

---
*Release created manually by Antigravity*
