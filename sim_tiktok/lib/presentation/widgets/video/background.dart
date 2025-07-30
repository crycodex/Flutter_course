import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const Background({
    super.key,
    this.colors = const [Colors.transparent, Colors.black],
    this.stops = const [0.9, 1],
  });
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
