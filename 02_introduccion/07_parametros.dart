void main() {
  print(holaMundo());
  print("Opcional: ${sumaOpcional(1, [3].first)}");
  print(saludar(name: "Flutter"));
}

//funciones
String holaMundo() => "Hello World!";


int sumaOpcional(int a, [int? b]) {
  b = b ?? 0;

  return a + b;
}

int sumaOpcional2(int a, int c, [int? b]) {
  b = b ?? 0;

  return a + b + c;
}

String saludar({required String name, String message = "Bienvenido: "}) {
  return "$message Name";
}
