import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator')),
      body: Center(
        child: Column(
          children: [
            Text('Circular Progress Indicator'),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.white,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text('Circular Progress Controlado'),
            _ProgressIndicator(porcentaje: 0.7),
            SizedBox(height: 20),
            Text('Linear Progress Indicator'),
            SizedBox(height: 20),
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text('Linear Progress Controlado'),
            SizedBox(height: 20),
            _ProgressIndicatorLinear(porcentaje: 0.7),
          ],
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({required this.porcentaje});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('${(porcentaje * 100).toStringAsFixed(2)}%'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.white,
            color: Colors.blue,
            value: porcentaje,
          ),
        ],
      ),
    );
  }
}

class _ProgressIndicatorLinear extends StatelessWidget {
  const _ProgressIndicatorLinear({required this.porcentaje});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('${(porcentaje * 100).toStringAsFixed(2)}%'),
          LinearProgressIndicator(
            value: porcentaje,
            backgroundColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
