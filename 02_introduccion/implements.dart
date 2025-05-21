void main() {
  final cobrador = PeajeEspecifico(
    nombre: "Juan",
    cantidad: 0,
    type: Categorias.carro,
  );

  cobrador.cantidadVendida(34.6);
  cobrador.cantidadVendida(0.4);
  print("Total Dia: ${cobrador.cantidad} para: ${cobrador.nombre}");
}

enum Categorias { moto, carro, bus }

//abstracta
abstract class Peaje {
  String get nombre;
  double get cantidad;
  Categorias get type;
}

//extendida
class PeajeEspecifico implements Peaje {
  @override
  String nombre;

  @override
  double cantidad;

  @override
  Categorias type;

  PeajeEspecifico({
    required this.nombre,
    required this.cantidad,
    required this.type,
  });

  void cantidadVendida(double cant) {
    cantidad += cant;
    print("Cantidad total: $cant");
  }
}
