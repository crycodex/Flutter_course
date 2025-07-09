enum Who { me, other }

class Msg {
  final String text;
  final Who who;
  final DateTime date;

  Msg({required this.text, required this.who, DateTime? date})
      : date = date ?? DateTime.now();
}
