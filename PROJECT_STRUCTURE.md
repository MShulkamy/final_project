# Fashion Store - Project Structure

## 📁 Complete Directory Structure

```
fashion_store/
│
├── android/                          # Android platform files
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── kotlin/              # Kotlin files
│   │   │   ├── res/                 # Resources
│   │   │   └── AndroidManifest.xml
│   │   ├── build.gradle             # App-level Gradle
│   │   └── google-services.json     # Firebase config (add this)
│   ├── gradle/
│   └── build.gradle                 # Project-level Gradle
│
├── ios/                              # iOS platform files
│   ├── Runner/
│   │   ├── Assets.xcassets/
│   │   ├── Info.plist
│   │   └── GoogleService-Info.plist # Firebase config (add this)
│   ├── Podfile
│   └── Runner.xcworkspace
│
├── lib/                              # Main application code
│   │
│   ├── core/                        # Core utilities and constants
│   │   └── app_colors.dart          # App color palette
│   │
│   ├── models/                      # Data models
│   │   ├── product.dart             # Product model
│   │   └── cart_item.dart           # Cart item model
│   │
│   ├── providers/                   # State management (Provider)
│   │   ├── cart_provider.dart       # Shopping cart state
│   │   └── theme_provider.dart      # Theme management
│   │
│   ├── services/                    # Business logic & API services
│   │   ├── auth_service.dart        # Firebase authentication
│   │   └── product_service.dart     # Product API integration
│   │
│   ├── screens/                     # UI screens
│   │   ├── login_screen.dart        # Login page
│   │   ├── signup_screen.dart       # Registration page
│   │   ├── main_wrapper.dart        # Bottom navigation
│   │   ├── home_screen.dart         # Product listing
│   │   ├── cart_screen.dart         # Shopping cart
│   │   ├── profile_screen.dart      # User profile
│   │   └── product_detail_screen.dart # Product details
│   │
│   ├── widgets/                     # Reusable UI components
│   │   ├── custom_button.dart       # Custom button widget
│   │   ├── custom_text_field.dart   # Custom input field
│   │   └── product_card.dart        # Product card component
│   │
│   ├── firebase_options.dart        # Firebase configuration
│   └── main.dart                    # App entry point
│
├── assets/                           # Static assets
│   ├── images/                      # Image files
│   ├── icons/                       # Icon files
│   └── fonts/                       # Custom fonts (if any)
│
├── test/                            # Unit tests
├── integration_test/                # Integration tests
│
├── pubspec.yaml                     # Dependencies & assets
├── README.md                        # Project documentation
├── SETUP_GUIDE.md                   # Setup instructions
└── .gitignore                       # Git ignore rules

```

## 🔍 File Descriptions

### Core Files

| File | Purpose |
|------|---------|
| `lib/main.dart` | Application entry point, Firebase initialization, provider setup |
| `lib/firebase_options.dart` | Firebase configuration for all platforms |
| `pubspec.yaml` | Project dependencies, assets, and metadata |

### Core Layer

| File | Purpose |
|------|---------|
| `core/app_colors.dart` | Centralized color palette and theme colors |

### Models Layer

| File | Purpose |
|------|---------|
| `models/product.dart` | Product data model with Rating sub-model |
| `models/cart_item.dart` | Shopping cart item with quantity management |

### Services Layer

| File | Purpose |
|------|---------|
| `services/auth_service.dart` | Firebase Auth wrapper (signup, login, signout) |
| `services/product_service.dart` | API client for Fake Store API |

### Providers Layer

| File | Purpose |
|------|---------|
| `providers/cart_provider.dart` | Shopping cart state management |
| `providers/theme_provider.dart` | Dark/Light mode with persistence |

### Screens Layer

| File | Purpose |
|------|---------|
| `screens/login_screen.dart` | User authentication screen |
| `screens/signup_screen.dart` | User registration screen |
| `screens/main_wrapper.dart` | Bottom navigation container |
| `screens/home_screen.dart` | Product grid with FutureBuilder |
| `screens/cart_screen.dart` | Shopping cart with summary |
| `screens/profile_screen.dart` | User profile from Firestore |
| `screens/product_detail_screen.dart` | Detailed product view |

### Widgets Layer

| File | Purpose |
|------|---------|
| `widgets/custom_button.dart` | Reusable button component |
| `widgets/custom_text_field.dart` | Reusable input field |
| `widgets/product_card.dart` | Product card for grid display |

## 🎯 Architecture Layers

### Presentation Layer
- **Screens:** UI screens that users interact with
- **Widgets:** Reusable UI components
- **Providers:** State management using Provider pattern

### Domain Layer
- **Models:** Data structures and business entities
- **Core:** App-wide constants and utilities

### Data Layer
- **Services:** API clients and data sources
- **Firebase:** Cloud services integration

## 🔄 Data Flow

```
User Interaction
      ↓
   Screens
      ↓
   Providers (State Management)
      ↓
   Services (Business Logic)
      ↓
   Models (Data Structures)
      ↓
Firebase/API (Data Source)
```

## 📊 State Management Flow

```
User Action (Add to Cart)
      ↓
CartProvider.addItem()
      ↓
Update _items list
      ↓
notifyListeners()
      ↓
UI rebuilds automatically
```

## 🔐 Authentication Flow

```
User enters credentials
      ↓
AuthService.signIn()
      ↓
Firebase Authentication
      ↓
Store user data in Firestore
      ↓
Stream updates in AuthWrapper
      ↓
Navigate to MainWrapper
```

## 🛒 Shopping Flow

```
Browse Products (HomeScreen)
      ↓
View Details (ProductDetailScreen)
      ↓
Select Size & Add to Cart
      ↓
CartProvider updates state
      ↓
View Cart (CartScreen)
      ↓
Adjust quantities
      ↓
Proceed to Checkout
```

## 🎨 Theme Flow

```
User toggles theme
      ↓
ThemeProvider.toggleTheme()
      ↓
Update _isDarkMode
      ↓
Save to SharedPreferences
      ↓
notifyListeners()
      ↓
MaterialApp rebuilds with new theme
```

## 📦 Key Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| provider | ^6.1.1 | State management |
| firebase_core | ^2.24.2 | Firebase initialization |
| firebase_auth | ^4.15.3 | User authentication |
| cloud_firestore | ^4.13.6 | Cloud database |
| http | ^1.1.2 | HTTP requests |
| cached_network_image | ^3.3.1 | Image caching |
| shared_preferences | ^2.2.2 | Local storage |
| google_fonts | ^6.1.0 | Custom fonts |

## 🚀 Features Implemented

✅ Clean Architecture
✅ Provider State Management
✅ Firebase Authentication
✅ Firestore Integration
✅ RESTful API Integration
✅ Dark/Light Theme
✅ Shopping Cart
✅ Product Catalog
✅ User Profile
✅ Responsive Design
✅ Material Design 3
✅ Custom Widgets
✅ Error Handling
✅ Loading States
✅ Form Validation

## 📝 Naming Conventions

- **Files:** snake_case (e.g., `product_card.dart`)
- **Classes:** PascalCase (e.g., `ProductCard`)
- **Variables:** camelCase (e.g., `productList`)
- **Constants:** SCREAMING_SNAKE_CASE or camelCase with const
- **Private:** Prefix with underscore (e.g., `_items`)

## 🎯 Best Practices

1. **Separation of Concerns:** Each layer has a specific responsibility
2. **Reusability:** Custom widgets used across screens
3. **Single Responsibility:** Each file has one clear purpose
4. **DRY Principle:** Don't Repeat Yourself
5. **Error Handling:** Try-catch blocks in async operations
6. **Loading States:** Show feedback during async operations
7. **Form Validation:** Input validation in forms
8. **Theme Awareness:** All widgets respond to theme changes

## 🔄 App Lifecycle

1. **App Start** → main.dart
2. **Initialize Firebase** → Firebase.initializeApp()
3. **Setup Providers** → MultiProvider
4. **Check Auth** → AuthWrapper
5. **Navigate** → LoginScreen or MainWrapper
6. **User Interaction** → Update providers
7. **UI Updates** → Consumers rebuild

---

This structure ensures:
- 📦 Modularity
- 🔄 Maintainability
- 📈 Scalability
- 🧪 Testability
- 🎨 Consistency
