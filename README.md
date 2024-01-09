#### Follow this doc to set up flutter-ICP Integration if facing any issue: [Doc Link](https://docs.google.com/document/d/16VyvNnHc3Oh3in9qiF9vf3A0JQ8vGGryaR9VLn5w3h0/edit?addon_store#heading=h.vxd0ze3k3zsm)

# Steps to follow

1. Clone one copy of this repository in WSL ubuntu location and other in your Windows location

2. Set up adb in your device, then run the following commands

    `adb devices`

    `adb reverse tcp:4943 tcp:4943`
     

3. For the repository cloned in WSL run the following commands :

    `cd backend`

    `dfx start --background`

    `dfx deploy`

4. For the repository cloned in your windows follow these commands:

   `flutter pub get`

   `flutter run`

## About the app 👇

# eakazijobs

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.