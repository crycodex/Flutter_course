# 🐦 Flutter Practice Project

Este repositorio contiene ejercicios, ejemplos y buenas prácticas aprendidas durante el curso de Flutter y Dart, siguiendo la guía y material de Fernando Herrera.

## 🚀 Tecnologías usadas

- 🎯 Dart (Null-safe)
- 🧩 Flutter
- 🛠 Flutter CLI
- 📦 Paquetes: `provider`, `get`, `flutter_bloc`, entre otros.

## 📚 Lo que he aprendido

### Dart

- Interpolación de Strings y colecciones tipadas.
- Uso de tipos anulables (null-safety).
- Operadores útiles como `??`, `??=`, `?.`, `!..`.
- Funciones de flecha y cascadas `..`.
- Getters, setters y propiedades computadas.
- Excepciones con `try`, `on`, `catch`, `finally`.
- Constructores: normales, con nombre, `factory`, redireccionados.
- Listas, Sets, Maps y el operador spread `...`, condicionales en colecciones (`if`, `for`).
- Programación asíncrona con `Future`, `Stream`, `async`, `await`, `yield`.

### Flutter

- Widgets principales:
  - Posicionamiento: `Center`, `Align`, `Padding`, `Container`, `Transform`, `SizedBox`.
  - Layout: `Column`, `Row`, `Wrap`, `Stack`, `GridView`, `ListView`, `Table`.
  - Scroll: `SingleChildScrollView`, `CustomScrollView`.
  - UI: `AppBar`, `Scaffold`, `Text`, `Icon`, `Image`, `Buttons`, `Form`.

- Navegación entre pantallas con `Navigator.push`.
- Gestión de estado:
  - Nativo: `setState`, `InheritedWidget`.
  - Externo: `Provider`, `Riverpod`, `GetX`, `BLoC`.
- Ciclo de vida de los `StatelessWidget` y `StatefulWidget`.
- Uso de `BuildContext` para acceder a elementos del árbol de widgets.

## 🧪 Comandos útiles

```bash
flutter create .
flutter run
flutter doctor
flutter build apk
flutter clean
flutter pub get
