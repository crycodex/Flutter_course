void main() {
  
  final Map<String, dynamic> papeleria = {
    "nombre": "Papeleria Rosita",
    "productos": 20,
    "empleados": 2,
    "isopen": true,
    "monedas": 200.5,
    // ignore: equal_keys_in_map
    "productos": {
      1: "lapiz",
      2: "esfero",
      3: "hojas",
      4: true
    },
  };
  
  print(papeleria);

}