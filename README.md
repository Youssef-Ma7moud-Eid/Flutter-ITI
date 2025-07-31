# 🔐 Flutter E-commerce App – Modern UI & Full Flow 🚀

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

## 🎬 Demo Video

[![Watch Demo](https://img.shields.io/badge/Watch-Demo-red?logo=youtube&style=for-the-badge)](https://github.com/user-attachments/assets/86725fa5-5cb2-4da2-8acd-92c9a230980e)

---

## 📸 Screens Overview

<table> 
  <tr> 
    <td align="center"><strong>🧭 Splash</strong><br><img src="https://github.com/user-attachments/assets/e6a8f87f-b367-4ee3-b18c-4d4794248793" width="250"/></td> 
    <td align="center"><strong>🚀 Onboarding</strong><br><img src="https://github.com/user-attachments/assets/f1c834cb-14c5-40f6-9343-7ad6a9f8248d" width="250"/></td> 
  </tr>
</table>

<table> 
  <tr> 
    <td align="center"><strong>🔐 Login</strong><br><img src="https://github.com/user-attachments/assets/afff6774-2a6f-4393-97db-3b8ac958534f" width="250"/></td> 
    <td align="center"><strong>📝 Sign Up</strong><br><img src="https://github.com/user-attachments/assets/430c151c-6759-427d-9b1a-ba1ba0e51fd7" width="250"/></td> 
  </tr>
</table>

<table> 
  <tr> 
    <td align="center"><strong>🔢 OTP Verification</strong><br><img src="https://github.com/user-attachments/assets/25fecf25-975e-412a-b826-a34416325068" width="250"/></td>
    <td align="center"><strong>⚠️ Invalid Email</strong><br><img src="https://github.com/user-attachments/assets/39be66b1-386d-4bfd-88f7-f347c94c7eeb" width="250"/></td>
  </tr>
  <tr>
    <td align="center"><strong>❗ Passwords Don't Match</strong><br><img src="https://github.com/user-attachments/assets/0755faef-ec17-4173-8ebb-eb43fd85b7f2" width="250"/></td>
    <td align="center"><strong>✅ Success Auth</strong><br><img src="https://github.com/user-attachments/assets/4768ba27-cd2d-4f51-88ec-1848a5b4d48b" width="250"/></td>
  </tr>
</table>

<table>
  <tr>
    <td align="center"><strong>🏠 Home Page</strong><br><img src="https://github.com/user-attachments/assets/990b8d6b-bcb8-41f6-9f1b-039b8e03d9fa" width="250"/></td>
    <td align="center"><strong>⚙️ Settings Page</strong><br><img src="https://github.com/user-attachments/assets/120abe33-98cc-4a17-ad22-a252fb042b43" width="250"/></td>
  </tr>
   <tr>
    <td align="center"><strong>🛍️ Shopping Page</strong><br><img  src="https://github.com/user-attachments/assets/e7c743ef-1a3e-4621-8fc3-f547d7f68bbd"  width="250"/></td>
  </tr>
</table>

---

## 💻 Tech Highlights

- 🔤 **Regex Validation for Email Format**
  ```dart
  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
❗ Password Match Check

🎛 Theme Toggle Switch (Dark/Light) using Cubit

📦 Local Storage using SharedPreferences

🧭 Persistent Bottom Navigation Bar

🧱 Modular Flutter Widgets

🔁 Smooth Transitions using animate_do package

🔐 Routing with Navigator.push & pushReplacement
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

