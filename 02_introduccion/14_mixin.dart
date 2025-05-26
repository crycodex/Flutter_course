void main() {
  
  final pato = Pato();
   print("Pato: ");
  pato.volar();
  pato.caminar();
  pato.nadar();
  
  final tib = Tiburon();
  print("Tiburon: ");
  tib.nadar();

}

abstract class Animal{}

abstract class Mamiferos extends Animal{}

abstract class Pajaros extends Animal{}

abstract class Peces extends Animal{}

mixin class volador{
 void volar() => print("volando, ");
}

mixin class caminador{
 void caminar() => print("caminando, ");
}

mixin class nadador{
 void nadar() => print("nadando, ");
}

class Pato extends Pajaros with nadador, volador, caminador{}
class Tiburon extends Peces with nadador{}
class Gatos extends Mamiferos with caminador{}

