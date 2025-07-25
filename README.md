🔐 Flutter E-commerce App – Modern UI & Full Flow 🚀
Welcome to the Flutter E-commerce App, a beautifully designed and fully functional app made with ❤️ using Flutter. From splash to login to navigating products, it delivers a complete user experience with validation, modern UI, and smooth transitions.

---

## ✨ Features at a Glance

✅ **Splash + Onboarding Screens**  
✅ **Sign Up / Login / OTP Verification**  
✅ **Input Validations with Regex**  
✅ **Password Confirmation Checks**  
✅ **Persistent Bottom Navigation Bar**  
✅ **Home Page with Meal Products**  
✅ **Settings Page with Theme Switch**  
✅ **Polished UX & Beautiful UI**

---

## 📸 Screens Overview

<table> 
  <tr> 
    <td align="center"><strong>🧭 Splash</strong><br><img src="https://github.com/user-attachments/assets/ddb07c0f-e614-4010-9bf3-9ab03afd8aad" width="250"/></td> 
    <td align="center"><strong>🚀 Onboarding</strong><br><img src="https://github.com/user-attachments/assets/8ff2ea37-0a61-41d4-b5f1-0605187ecd11" width="250"/></td> 
  </tr>
</table>

<table> 
  <tr> 
    <td align="center"><strong>🔐 Login</strong><br><img src="https://github.com/user-attachments/assets/faaf7a09-3bf8-45f4-8e4b-106209b423c1" width="250"/></td> 
    <td align="center"><strong>📝 Sign Up</strong><br><img src="https://github.com/user-attachments/assets/34f76d28-da3b-4600-bae5-1656acb70766" width="250"/></td> 
  </tr>
</table>

<table> 
  <tr> 
    <td align="center"><strong>🔢 OTP Verification</strong><br><img src="https://github.com/user-attachments/assets/17fd9084-2e42-4107-9557-2ed1ce54b909" width="250"/></td>
    <td align="center"><strong>⚠️ Invalid Email</strong><br><img src="https://github.com/user-attachments/assets/83e42681-b14e-42a8-9866-52d9c50964ca" width="250"/></td>
  </tr>
  <tr>
    <td align="center"><strong>❗ Passwords Don't Match</strong><br><img src="https://github.com/user-attachments/assets/d0ef9866-72f1-4097-b053-1c7723884086" width="250"/></td>
    <td align="center"><strong>✅ Success Login</strong><br><img src="https://github.com/user-attachments/assets/ceeab5e6-ac66-4b01-8141-037abf3d62b3" width="250"/></td>
  </tr>
</table>

<table>
  <tr>
    <td align="center"><strong>🏠 Home Page</strong><br><img src="https://github.com/user-attachments/assets/f5dc3f42-4907-45e7-8146-7c53d9fbf5a4" width="250"/></td>
    <td align="center"><strong>⚙️ Settings Page</strong><br><img src="https://github.com/user-attachments/assets/ae782157-967a-4f95-8d66-41b9427f1c68" width="250"/></td>
  </tr>
</table>

---

## 💻 Tech Highlights

- 🔤 **Regex Validation for Email Format**
  ```dart
  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') // Simple but effective!
🔁 Password Match Check

🎛 Theme Toggle Switch in Settings

🧭 Stateful Bottom Navigation with tab persistence

🔐 Navigator.push / pushReplacement based routing

🧩 Built using modular Flutter widgets
 ## 📂 Project Structure
 ```css
lib/
├── core/
│   ├── utils/                # Common utilities (validators, constants)
│   └── widgets/              # Reusable global widgets
│
├── features/
│   ├── Auth feature/
│   │   ├── data/             # Auth APIs, models, data sources
│   │   └── presentation/
│   │       ├── manager/      # BLoC / Cubit / State Management
│   │       └── views/
│   │           ├── widgets/  # Auth-related UI components
│   │           ├── login_view.dart
│   │           ├── otp_view.dart
│   │           ├── sign_up_view.dart
│   │           └── splash_view.dart
│   │
│   └── Home feature/
│       ├── data/             # Home data, models, APIs
│       └── presentation/
│           └── views/
|                    ├── home_view.dart
|                    ├── setting_view.dart
|                    ├── widgets/    # Home-related UI components   
│
├── app.dart                  # Main app widget (routing, theme, etc.)
└── main.dart                 # App entry point

