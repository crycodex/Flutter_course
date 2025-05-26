void main() async {
  print("run app");

  try {
    final resp = await http(
      "https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3",
    );
    print(resp);
  } catch (e) {
    print("Error $e");
  }

  print("end app");
}

Future<String> http(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  return url;
}
