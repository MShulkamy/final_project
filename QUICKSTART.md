# Fashion Store - Quick Start Guide

## 🚀 Get Started in 5 Minutes

### Step 1: Prerequisites ✅
- Flutter SDK installed
- Firebase account created
- IDE ready (VS Code or Android Studio)

### Step 2: Setup Firebase 🔥

1. **Create Firebase Project:**
   - Go to https://console.firebase.google.com/
   - Click "Add project" → Name it "Fashion Store"
   - Disable Google Analytics → Create

2. **Enable Authentication:**
   - Authentication → Get Started
   - Sign-in method → Email/Password → Enable

3. **Create Firestore:**
   - Firestore Database → Create database
   - Start in test mode → Enable

4. **Add Your App:**
   
   **Quick Method (Recommended):**
   ```bash
   dart pub global activate flutterfire_cli
   cd fashion_store
   flutterfire configure
   ```
   
   **Manual Method:**
   - Download `google-services.json` → Place in `android/app/`
   - Download `GoogleService-Info.plist` → Place in `ios/Runner/`

### Step 3: Install & Run 🏃

```bash
# Navigate to project
cd fashion_store

# Get dependencies
flutter pub get

# Run on connected device
flutter run
```

### Step 4: Test the App 🧪

1. **Create Account:**
   - Launch app → "Create Account"
   - Enter: John, Doe, john@test.com, password123
   - Should redirect to Home

2. **Browse Products:**
   - Products load automatically
   - Click any product for details

3. **Shopping:**
   - Click "Add to Cart" button
   - Check Cart tab (badge appears)
   - Adjust quantities

4. **Theme:**
   - Toggle dark/light mode (top-right icon)
   - Preference saves automatically

## 📱 Test Credentials

For quick testing:
- Email: test@example.com
- Password: test123

Or create your own account!

## 🎨 Color Scheme

- Primary: #8E6CEF (Purple)
- Light Mode: White background
- Dark Mode: Pure black background

## 🔧 Common Commands

```bash
# Clean build
flutter clean && flutter pub get

# Run in release mode
flutter run --release

# Build APK
flutter build apk

# Run tests
flutter test
```

## 📦 What's Included

✅ Authentication (Login/Signup)
✅ Product Catalog (20 items from API)
✅ Shopping Cart (Add/Remove/Quantity)
✅ Dark/Light Theme Toggle
✅ User Profile with Firestore
✅ Material Design 3
✅ Clean Architecture
✅ Provider State Management

## 🆘 Quick Troubleshooting

**Firebase not initialized?**
```bash
flutter clean
flutter pub get
flutter run
```

**Products not loading?**
- Check internet connection
- API: https://fakestoreapi.com/products

**Login issues?**
- Verify Email/Password enabled in Firebase
- Check Firebase Auth console for errors

## 📚 Documentation

- Full Setup: `SETUP_GUIDE.md`
- Architecture: `PROJECT_STRUCTURE.md`
- Features: `README.md`

## 💡 Tips

1. Use hot reload (press `r`) for quick changes
2. Use hot restart (press `R`) for state reset
3. Check logs for any Firebase errors
4. Test on both light and dark themes

## 🎯 Next Steps

1. Customize colors in `lib/core/app_colors.dart`
2. Add your logo to `assets/`
3. Customize Firebase rules for production
4. Add more products or use your own API
5. Implement payment gateway

## 🤝 Need Help?

- Check `SETUP_GUIDE.md` for detailed instructions
- Review `PROJECT_STRUCTURE.md` for code organization
- Visit Flutter docs: https://flutter.dev
- Visit Firebase docs: https://firebase.google.com/docs

---

**Ready to code? Let's build something amazing! 🚀**
