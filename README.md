# MAD Shop UI (Flutter)

Учебное приложение по макету из Figma.  
Реализован интерфейс мобильного магазина с экранами регистрации, входа, списка товаров, избранного и корзины.

---

## Технологии

- Flutter
- Dart
- Material Design
- Работа с ассетами (изображения и иконки из Figma)
- Navigator.push / pushReplacement для навигации между экранами

---

## Запуск проекта

```bash
flutter pub get
flutter run


## Структура
lib/
  main.dart
  models/
    product.dart
  widgets/
    product_card.dart
  screens/
    splash_screen.dart
    signup_screen.dart
    login_screen.dart
    password_screen.dart
    shop_main_screen.dart
    home_screen.dart
    favorites_screen.dart
    cart_screen.dart
