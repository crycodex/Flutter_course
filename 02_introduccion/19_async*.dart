void main() {
  emitNum().listen((value) {
    print("Stream nums: $value");
  });
}

Stream emitNum() async* {
  final valores = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  for (int i in valores) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
