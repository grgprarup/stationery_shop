# Stationery Shop
<p style="text-align: justify;">
This Flutter application serves as an inventory management system for a stationery shop. It allows users to add, update, and delete items from the inventory, as well as track stock levels and generate reports. The application is built using the Dart language and the Flutter framework, providing a user-friendly interface for easy navigation and management of the stationery shop inventory.
</p>

## Getting Started
### Prerequisites
- Flutter SDK - [Install from here](https://docs.flutter.dev/get-started/install/linux)
- Dart - [Install from here](https://dart.dev/get-dart)
- Android Studio or Intellij IDEA or VS Code

### Installation
#### 1. Clone the repository
    ```bash
    git clone https://github.com/grgprarup/stationery_shop.git
    cd stationery_shop
    ```
#### 2. Get the flutter packages
    ```bash
    flutter pub get
    ```
#### 3. Run the application
   1. To run the android application on an emulator
      - Check for existing emulator
        ```bash
        flutter emulators
        ```
      - If there is no existing emulator then create an emulator
        ```bash
        flutter emulators --create [--name xyz]
        ```
      - Launch the emulator
        ```bash
        flutter emulators --launch emulator_id
        ```
      - Run the application
        ```bash
        flutter run
        ```
   2. To run on the other devices
      - Check for [existing devices](#6-to-see-the-list-of-devices-connected)
      - Run the application using the device id
        ```bash
        flutter run -d device_id
        ```

### Extra Commands
#### 1. To upgrade the Flutter SDK
```bash
flutter upgrade
```
#### 2. To check if the Flutter setup is correct
```bash
flutter doctor
```
#### 3. To check for outdated packages
```bash
flutter pub outdated
```
#### 4. To upgrade the flutter packages
```bash
flutter pub upgrade
```
#### 5. To see the list of devices connected
```bash
flutter devices
```
You will see something like this
```bash
Found 3 connected devices:
  Android SDK built for x86 (mobile) • emulator-5554 • android-x86    • Android 11 (API 30) (emulator)
  Linux (desktop)                    • linux         • linux-x64      • Ubuntu 23.10 6.5.0-17-generic
  Chrome (web)                       • chrome        • web-javascript • Google Chrome 121.0.6167.160
```
Here, the first one is an android emulator `id = emulator-5534`, the second one is a linux desktop `id = linux`, and the third one is a web browser `id = chrome`. You can run the application on any of these devices by using the `id` of the device.
#### 6. To create a new flutter project from CLI
```bash
flutter create project_name
```
#### 7. To run the tests
```bash
flutter test
```
#### 8. To check if the Dart setup is correct
```bash
dart --version
```

## Learning Resources
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
