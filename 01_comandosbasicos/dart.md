# 🎯 Dart Cheat Sheet

## 🧵 Strings y Variables

- Interpolación: `'${3 + 2}'`, `"Hola $nombre"`
- Null-safety: `int? a = null;`
- Operadores nulos: `??`, `??=`, `?.`

## 🧰 Colecciones

```dart
final list = [1, 2, 3];
final set = {'a', 'b'};
final map = {'clave': 'valor'};
final constantList = const [1, 2];
```

- Operador Spread: `[...otraLista]`
- Condiciones en listas: `[if (activo) 'Promo']`
- Iterables: `list.where(...)`, `list.map(...)`

## 🔁 Funciones y Métodos

```dart
int sum(int a, int b) => a + b;

void saludar(String nombre, {String? apellido}) {
  print('Hola $nombre $apellido');
}
```

- Parámetros opcionales por posición o nombre.
- `required`, `default = value`

## 🧱 Clases y Constructores

```dart
class Persona {
  final String nombre;
  Persona(this.nombre);
}
```

- Constructores con nombre: `Persona.algo()`
- Factory constructors: `factory Shape.fromTypeName(...)`
- Inicialización tardía: `late`

## 🎯 Getters y Setters

```dart
int get edad => _edad;
set edad(int value) {
  if (value > 0) _edad = value;
}
```

## 🔥 Excepciones

```dart
try {
  algo();
} on FormatException catch (e) {
  print(e);
} finally {
  limpiar();
}
```

## 🌀 Asincronía

- `Future`, `async`, `await`, `then()`, `catchError()`
- `Stream`, `await for`, `listen()`
- `async*` y `yield` para Streams

## 🧠 Conceptos Clave

- `final` vs `const`
- `late`: inicialización tardía
- `Iterable`, `Future`, `Stream`
- Operadores: `+`, `-`, `??`, `!`, `..`, `as`, `is`, `await`
