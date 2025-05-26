void main() {
  
  final Vehiculo toyota = Vehiculo(name: "corola",velocidad: 100);
  
  
  print("Clase vehiculo: ${toyota.toString()}");
  print("Vehiculo: ${toyota.name}, Velocidad: ${toyota.velocidad}");
  
  
}


class Vehiculo{
  String name;
  int velocidad;
  
  Vehiculo({required this.name,  this.velocidad = 10});
  
  @override
  String toString(){
    return "Clase Sobreescrita de Vehiculos para $name Velocidad $velocidad" ;
  }
}