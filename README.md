# Stationery Shop

## Introduction
This Flutter application serves as an inventory management system for a stationery shop. It allows users to add, update, and delete items from the inventory, as well as track stock levels and generate reports. The application is built using the Dart language and the Flutter framework, providing a user-friendly interface for easy navigation and management of the stationery shop inventory.

## Features
### 1. User Authentication:
- Implement a secure authentication system to control access to the inventory. 
- Include user roles such as admin, staff, etc.
### 2. Product Management:
- Allow users to add new products with details like name, category, price, and quantity.
- Implement the ability to edit or delete existing products.
### 3. Inventory Tracking:
- Display the current stock levels for each product.
- Set up alerts for low stock levels to avoid running out of essential items.
### 4. Search and Filters:
- Implement a robust search functionality to find products quickly.
- Include filters for categories, suppliers, and other relevant parameters.
### 5. Dashboard:
- Create a user-friendly dashboard displaying key information. 
- Include graphs or charts to visualize inventory trends.
### 6. Reporting:
- Generate reports on sales, stock levels, and other relevant metrics.
- Allow users to export reports in common formats.
### 7. Order Management:
- Provide a feature for creating and managing customer orders.
- Include order status (pending, shipped, delivered) and tracking.
### 8. Supplier Management:
- Keep track of suppliers and their contact information.
- Link products to specific suppliers for easy reordering.

## Getting Started
### Prerequisites
- Flutter SDK - [Install from here](https://docs.flutter.dev/get-started/install/linux)
- Dart - [Install from here](https://dart.dev/get-dart)
- Android Studio or Intellij IDEA or VS Code

### Installation
1. Clone the repository
    ```bash
    git clone https://github.com/grgprarup/stationery_shop.git
    cd stationery_shop
    ```
3. Run the application
    ```bash
    flutter run
    ```


## Extra Commands
- To upgrade the Flutter SDK
    ```bash
    flutter upgrade
    ```
- To check if the Flutter setup is correct
    ```bash
    flutter doctor
    ```
- To get the flutter packages
    ```bash
    flutter pub get
    ```
- To check for outdated packages
    ```bash
    flutter pub outdated
    ```
- To upgrade the flutter packages
    ```bash
    flutter pub upgrade
    ```
- To upgrade the latest version of the flutter packages
    ```bash
    flutter pub outdated --major-versions
    ```
- To see the list of devices connected
    ```bash
    flutter devices
    ```
- To see the list of emulators
    ```bash
    flutter emulators
    ```
- To run the application on a specific emulator
    ```bash
    flutter emulators --launch emulator_id
    ```
- To create a new emulator
    ```bash
    flutter emulators --create [--name xyz]
    ```
- To run the application on a specific device
    ```bash
    flutter run -d device_id
    ```
- To create a new flutter project from CLI
    ```bash
    flutter create project_name
    ```
- To run the tests
    ```bash
    flutter test
    ```
- To check if the Dart setup is correct
    ```bash
    dart --version
    ```

## Learning Resources
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
