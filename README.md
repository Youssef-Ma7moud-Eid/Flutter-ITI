📱 Auth Screens (Flutter)
These screens are built using Flutter, combining a clean layout (Row, Column, Container, TextField) and smooth navigation for a seamless user experience.

📸 Screens Overview
<table> <tr> <td align="center"><strong>🧭 Splash Screen</strong><br> <img src="https://github.com/user-attachments/assets/ddb07c0f-e614-4010-9bf3-9ab03afd8aad" width="250"/> </td> <td align="center"><strong>🚀 Onboarding Screen</strong><br> <img src="https://github.com/user-attachments/assets/8ff2ea37-0a61-41d4-b5f1-0605187ecd11" width="250"/> </td> </tr> </table> <table> <tr> <td align="center"><strong>🔐 Login Screen</strong><br> <img src="https://github.com/user-attachments/assets/faaf7a09-3bf8-45f4-8e4b-106209b423c1" width="250"/> </td> <td align="center"><strong>📝 Sign Up Screen</strong><br> <img src="https://github.com/user-attachments/assets/34f76d28-da3b-4600-bae5-1656acb70766" width="250"/> </td> </tr> </table> <table> <tr> <td align="center"><strong>🔢 OTP Screen</strong><br> <img src="https://github.com/user-attachments/assets/17fd9084-2e42-4107-9557-2ed1ce54b909" width="250"/> </td> <td align="center"><strong>⚠️ Invalid Email Format</strong><br> <img src="https://github.com/user-attachments/assets/83e42681-b14e-42a8-9866-52d9c50964ca" width="250"/> </td> </tr> <tr> <td align="center"><strong>🔐 Passwords Don't Match</strong><br> <img src="https://github.com/user-attachments/assets/d0ef9866-72f1-4097-b053-1c7723884086" width="250"/> </td> <td align="center"><strong>✅ Valid Credentials</strong><br> <img src="https://github.com/user-attachments/assets/ceeab5e6-ac66-4b01-8141-037abf3d62b3" width="250"/> </td> </tr> </table> <table> <tr> <td align="center"><strong>🍽️ Home (Meal Products)</strong><br> <img src="https://github.com/user-attachments/assets/f5dc3f42-4907-45e7-8146-7c53d9fbf5a4" width="250"/> </td> <td align="center"><strong>⚙️ Settings Page</strong><br> <img src="https://github.com/user-attachments/assets/ae782157-967a-4f95-8d66-41b9427f1c68" width="250"/> </td> </tr> </table>
🧭 Screen Order
🔆 Splash Screen – App entry with branding.

🚀 Onboarding – App intro & walkthrough.

📝 Sign Up – Email, name, password fields with validations.

🔐 Login – Simple login with navigation to OTP or sign-up.

🔢 OTP Verification – 4-6 digit code input using flutter_otp_text_field.

⚠️ Validation Feedback:

❌ Invalid email format

❌ Short password

❌ Mismatched passwords

✅ Success State – Login confirmation with visual feedback.

🍽️ Home – Meal product listing.

⚙️ Settings – Profile image, name, track, and theme toggle.

📍 Bottom Nav – Persistent using persistent_bottom_nav_bar.

✅ Features
Clean Layout: Row, Column, Expanded usage.

Validation Logic: Real-time feedback on forms.

Icons & Styling: Integrated icons (Icons.email, Icons.lock, etc.) and stylish Containers.

Navigation Flow: Smooth Navigator.push/pop between screens.

Stateful Navigation: Maintained across bottom navigation tabs.

Reusability: Screens structured into widgets for reuse and clarity.
