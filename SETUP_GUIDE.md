# Fashion Store - Complete Setup Guide

This guide will walk you through setting up the Fashion Store E-Commerce application from scratch.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Project Setup](#project-setup)
3. [Firebase Configuration](#firebase-configuration)
4. [Running the App](#running-the-app)
5. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Required Software

1. **Flutter SDK** (3.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Verify installation: `flutter doctor`

2. **Dart SDK** (Comes with Flutter)
   - Version 3.0 or higher

3. **IDE** (Choose one)
   - Android Studio (Recommended)
   - VS Code with Flutter extension
   - IntelliJ IDEA

4. **Platform-Specific Requirements**
   
   **For Android:**
   - Android Studio
   - Android SDK
   - Android Emulator or Physical Device
   
   **For iOS (macOS only):**
   - Xcode 14 or higher
   - iOS Simulator or Physical Device
   - CocoaPods: `sudo gem install cocoapods`

5. **Git**
   - Download from: https://git-scm.com/downloads

---

## Project Setup

### Step 1: Clone or Extract the Project

If you have the project as a ZIP file:
```bash
# Extract the ZIP file to your desired location
cd path/to/fashion_store
```

If cloning from Git:
```bash
git clone <repository-url>
cd fashion_store
```

### Step 2: Install Dependencies

```bash
# Get all Flutter packages
flutter pub get

# For iOS (macOS only)
cd ios
pod install
cd ..
```

### Step 3: Verify Flutter Installation

```bash
flutter doctor
```

Fix any issues reported by the doctor before proceeding.

---

## Firebase Configuration

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name: "Fashion Store" (or your preferred name)
4. Disable Google Analytics (optional)
5. Click "Create project"

### Step 2: Add Firebase to Your App

#### Option A: Using FlutterFire CLI (Recommended)

1. **Install FlutterFire CLI:**
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. **Configure Firebase:**
   ```bash
   flutterfire configure
   ```

3. **Follow the prompts:**
   - Select your Firebase project
   - Select platforms (iOS, Android, Web)
   - This will automatically generate `firebase_options.dart`

#### Option B: Manual Configuration

##### For Android:

1. In Firebase Console, click "Add app" → Android
2. Register app:
   - Package name: `com.example.fashion_store` (or your package name)
   - App nickname: "Fashion Store Android"
   - Click "Register app"

3. Download `google-services.json`
4. Place it in: `android/app/google-services.json`

5. Update `android/build.gradle`:
   ```gradle
   buildscript {
       dependencies {
           classpath 'com.google.gms:google-services:4.3.15'
       }
   }
   ```

6. Update `android/app/build.gradle`:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   
   android {
       defaultConfig {
           minSdkVersion 21  // Update if needed
       }
   }
   ```

##### For iOS:

1. In Firebase Console, click "Add app" → iOS
2. Register app:
   - Bundle ID: `com.example.fashionStore` (or your bundle ID)
   - App nickname: "Fashion Store iOS"
   - Click "Register app"

3. Download `GoogleService-Info.plist`
4. Add to Xcode:
   - Open `ios/Runner.xcworkspace` in Xcode
   - Drag `GoogleService-Info.plist` into `Runner` folder
   - Ensure "Copy items if needed" is checked

5. Update `ios/Podfile`:
   ```ruby
   platform :ios, '12.0'
   ```

### Step 3: Enable Firebase Services

#### Enable Authentication:

1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Go to "Sign-in method" tab
4. Enable "Email/Password"
5. Click "Save"

#### Create Firestore Database:

1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose "Start in test mode" (for development)
4. Select a location (choose closest to you)
5. Click "Enable"

#### Set Firestore Security Rules:

1. Go to "Firestore Database" → "Rules"
2. Replace with:
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /users/{userId} {
         allow read, write: if request.auth != null && request.auth.uid == userId;
       }
     }
   }
   ```
3. Click "Publish"

---

## Running the App

### Step 1: Connect a Device

**Physical Device:**
```bash
# List connected devices
flutter devices

# Enable USB debugging on Android
# Enable Developer mode on iOS
```

**Emulator/Simulator:**
```bash
# Android Emulator (from Android Studio AVD Manager)
# iOS Simulator
open -a Simulator
```

### Step 2: Run the App

```bash
# Run in debug mode
flutter run

# Run in release mode
flutter run --release

# Run on specific device
flutter run -d <device-id>
```

### Step 3: Test the App

1. **Sign Up Flow:**
   - Launch app
   - Click "Create Account"
   - Fill in: First Name, Last Name, Email, Password
   - Click "Sign Up"
   - Should redirect to Home Screen

2. **Browse Products:**
   - Products should load from Fake Store API
   - Scroll through the grid
   - Click on a product to view details

3. **Add to Cart:**
   - On product detail or card, click "Add to Cart"
   - Badge should appear on Cart tab
   - Navigate to Cart to see items

4. **Theme Toggle:**
   - Click theme icon in top-right of Home
   - App should switch between light/dark mode
   - Preference should persist after restart

5. **Profile:**
   - Navigate to Profile tab
   - Should see user name and email
   - Test Sign Out

---

## Troubleshooting

### Common Issues

#### 1. Firebase Initialization Error

**Error:** "Firebase has not been initialized"

**Solution:**
```bash
# Reinstall dependencies
flutter clean
flutter pub get

# For iOS
cd ios
pod deintegrate
pod install
cd ..
```

#### 2. Google Services Plugin Error (Android)

**Error:** "google-services.json is missing"

**Solution:**
- Ensure `google-services.json` is in `android/app/`
- Check that package name matches in Firebase Console
- Rebuild: `flutter clean && flutter run`

#### 3. Cocoapods Error (iOS)

**Error:** "Unable to find a specification for Firebase"

**Solution:**
```bash
cd ios
pod repo update
pod deintegrate
pod install
cd ..
```

#### 4. Network Request Failed

**Error:** "Failed to load products"

**Solution:**
- Check internet connection
- Verify API endpoint: https://fakestoreapi.com/products
- For iOS, ensure Info.plist allows HTTP (if needed)

#### 5. Firestore Permission Denied

**Error:** "PERMISSION_DENIED"

**Solution:**
- Check Firestore security rules
- Ensure user is authenticated
- Verify rule structure matches collection names

### Build Issues

```bash
# Clean build
flutter clean
flutter pub get

# For Android
cd android
./gradlew clean
cd ..

# For iOS
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..

# Rebuild
flutter run
```

### Hot Reload Not Working

```bash
# Restart app with hot restart
press 'R' in terminal (capital R)

# Or stop and rerun
flutter run
```

---

## Additional Configuration

### App Icon

To change the app icon:
1. Replace `android/app/src/main/res/mipmap-*/ic_launcher.png`
2. Replace `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
3. Or use package: `flutter pub add flutter_launcher_icons`

### App Name

**Android:** Edit `android/app/src/main/AndroidManifest.xml`
```xml
<application android:label="Fashion Store">
```

**iOS:** Edit `ios/Runner/Info.plist`
```xml
<key>CFBundleName</key>
<string>Fashion Store</string>
```

### Package Name

**Android:** 
1. Rename folders in `android/app/src/main/kotlin/`
2. Update `build.gradle` applicationId
3. Update AndroidManifest.xml package

**iOS:**
1. Open in Xcode
2. Change Bundle Identifier in project settings

---

## Production Deployment

### Android (Google Play)

```bash
# Build release APK
flutter build apk --release

# Build App Bundle (recommended)
flutter build appbundle --release
```

### iOS (App Store)

```bash
# Build for release
flutter build ios --release

# Then archive in Xcode
open ios/Runner.xcworkspace
```

---

## Support

For issues or questions:
- Check the [README.md](README.md)
- Visit [Flutter Documentation](https://flutter.dev/docs)
- Check [Firebase Documentation](https://firebase.google.com/docs)

---

**Setup Complete! Happy Coding! 🚀**
