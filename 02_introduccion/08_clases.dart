void main() {
  
  final Vehiculo toyota = Vehiculo("corola",100);
  
  print("Vehiculo: ${toyota.name}, Velocidad: ${toyota.velocidad}");
  
  
}


class Vehiculo{
  String name;
  int velocidad;
  
  Vehiculo(String vName, int vVelocidad)
    :this.name = vName,
    this.velocidad = vVelocidad;
}