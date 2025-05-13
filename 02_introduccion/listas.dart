void main(){
  
  final fibonacci = [1, 2, 3, 5, 8, 13];
    
  print("Lista: $fibonacci");
  print("Longitud: ${fibonacci.length}");
  print("Posicion 4: ${fibonacci[4]}");
  print("Primero: ${fibonacci.first}");
  print("Reversa: ${fibonacci.reversed}");
  print("Ultimo: ${fibonacci.reversed.first}");
  
  
  //iterable -> numeros pares
  final mayor5 = fibonacci.where((num){
    return num > 5; //true
  });
  
  print("mayor a 8: ${mayor5}");
  mayor5.toSet();
  print("Set: ${mayor5.toSet()}");
    print("Lista Set: $fibonacci");

  
  
  
}