void main() {
  print("run app");

  http(
    "https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3",
  ).then((value) => print(value)).catchError((error) => print(error));

  print("end app");
}

Future<String> http(String url) {
  return Future.delayed(const Duration(seconds: 1), () {
    print("run http");
    return url;
  });
}
