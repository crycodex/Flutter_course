import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_theme.dart';
import '../../providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Seleciona un color: ', style: TextStyle(fontSize: 20)),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: AppTheme.colorList.length,
                itemBuilder: (context, index) {
                  final color = AppTheme.colorList[index];
                  return GestureDetector(
                    onTap: () {
                      ref.read(themeProvider.notifier).state = index;
                      print("selectedColor: $index");
                    },
                    child: _ColorBox(
                      color: color,
                      isSelected: selectedColor == index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const _ColorBox({required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: isSelected
          ? const Icon(Icons.check, size: 40)
          : const SizedBox.shrink(),
    );
  }
}
