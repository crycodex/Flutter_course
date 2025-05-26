void main() {
  emitNum().listen((value) {
    print("nums: $value");
  });
}

Stream<int> emitNum() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return value;
  }).take(10);
}
