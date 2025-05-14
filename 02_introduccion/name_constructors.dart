void main() {
  final Map<String, dynamic> jsonDecode = {
    "name": "lupitas",
    "cantidad": 25,
    "isOpen": false,
  };

  final lupita = libreria(
    name: jsonDecode["name"] ?? "libreria",
    cantidad: jsonDecode["cantidad"] ?? 0,
    isOpen: jsonDecode["isOpen"] ?? false,
  );

  print("libreria: ${lupita.toString()}");
  
  
}

class libreria {
  String name;
  int cantidad;
  bool isOpen;

  libreria({required this.name, required this.cantidad, required this.isOpen});
  
  libreria.fromJson(Map<String, dynamic> json)
    : name = json["name"] ?? "no encontrado",
      cantidad = json["cantidad"] ?? 0,
      isOpen = json["isOpen"] ?? false;
  

  @override
  String toString() {
    return "$name, $cantidad, ${isOpen ? "Abierto" : "Cerrado"}";
  }
}
