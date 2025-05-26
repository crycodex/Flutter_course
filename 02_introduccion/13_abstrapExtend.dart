void main() {
  final cobrador = PeajeEspecifico(
    nombre: "Juan",
    cantidad: 0,
    type: Categorias.carro,
  );

  cobrador.cantidadVendida(34.6);
  cobrador.cantidadVendida(0.4);
  print("Total Dia: ${cobrador.cantidad}");
}

enum Categorias { moto, carro, bus }

//abstracta
abstract class Peaje {
  String nombre;
  double cantidad;
  Categorias type;

  Peaje({required this.nombre, required this.cantidad, required this.type});
}

//extendida
class PeajeEspecifico extends Peaje {
  PeajeEspecifico({
    required String nombre,
    required double cantidad,
    required Categorias type,
  }) : super(nombre: nombre, cantidad: cantidad, type: type);

  void cantidadVendida(double cant) {
    cantidad += cant;
    print("Cantidad total: $cant");
  }
}
