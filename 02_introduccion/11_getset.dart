void main() {
  final rect = Rectangulo(largo: 10, ancho: 8);
  print("area: ${rect.area()}");
  print("get: ${Rectangulo(largo: 2.5, ancho: 2.5).getArea}");

  //set
  final rect3 = Rectangulo(largo: 5, ancho: 2);
  rect3.largo = 1;
  print("Set aplicado: ${rect3.area()}");
}

class Rectangulo {
  double _largo;
  double _ancho;

  Rectangulo({required double largo, required double ancho})
    : _largo = largo,
      _ancho = ancho;

  //geters
  double get getArea {
    return _largo * _ancho;
  }

  //set
  set largo(double value) {
    print("Set: $value");
    if (value <= 0) throw "el area debe ser mayor a 0";
  }

  double area() {
    return _largo * _ancho;
  }
}
