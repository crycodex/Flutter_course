# 🐦 Flutter Cheat Sheet

## 📦 Widgets de Posicionamiento y Agrupación

- **Center**: Centra su hijo en relación al widget padre.
- **Align**: Alinea su hijo dentro de sí mismo.
- **ConstrainedBox**: Impone reglas adicionales de tamaño.
- **Container**: Widget común para pintado, padding y tamaño.
- **Padding**: Añade espacio interno.
- **Transform**: Aplica transformaciones visuales.
- **SizedBox**: Caja de tamaño fijo.

## 🧱 Widgets con Múltiples Hijos

- **Column**: Orden vertical de hijos.
- **Row**: Orden horizontal de hijos.
- **Stack**: Superposición de widgets.
- **GridView**: Cuadrícula de widgets.
- **ListView**: Lista con scroll vertical.
- **Wrap**: Similar a Row/Column pero con envolvimiento.
- **Table**: Disposición en filas y columnas.
- **SingleChildScrollView**: Scroll para un solo hijo.
- **CustomScrollView**: Scroll avanzado con Slivers.

## 🛠 Widgets Comunes

- **AppBar**: Barra superior de herramientas.
- **Buttons**: `ElevatedButton`, `FilledButton`, `OutlinedButton`, `TextButton`.
- **Icon**: Muestra un ícono.
- **Image**: Muestra imágenes desde URL o assets.
- **Scaffold**: Estructura base de pantalla.
- **Text**: Muestra texto.
- **Form / FormField**: Formularios y validaciones.
- **Theme**: Aplicación de temas.

## 📍 Navegación

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondRoute()),
);
```

## 🎛 Gestores de Estado

- **Provider** (recomendado para empezar)
- **Riverpod**
- **InheritedWidget / InheritedModel**
- **BLoC / Cubit**
- **GetX** (muy popular, no recomendado para principiantes)
- **MobX**, **Get_it**

## 🖥️ Comandos CLI útiles

```bash
flutter create .
flutter run
flutter build apk
flutter doctor
flutter clean
```

## 🧠 Conceptos Clave

- `Widget`, `BuildContext`, `StatefulWidget`, `StatelessWidget`
- `HotReload` vs `HotRestart`
- Todo inicia en `main()`
