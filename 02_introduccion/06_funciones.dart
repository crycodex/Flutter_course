void main() {
  print(holaMundo());
  print("suma: ${suma(3, 2)}");
  print("Opcional: ${sumaOpcional(1)}");
}

//funciones
String holaMundo() => "Hello World!";

int suma(int a, int b) => a + b;

int sumaOpcional(int a, [int? b]) {
  b = b ?? 0;

  return a + b;
}