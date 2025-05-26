void main() async {
  print("run app");

  try {
    final resp = await http(
      "https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3",
    );
    print(resp);
  } on Exception{
    print("Excepcion encontrada");
  } catch (e) {
    print("Error $e");
  } finally {
    print("End TryCatch");
  }

  print("end app");
}

Future<String> http(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  
  //throw Exception ("Sin parametros");
  return url;
}
