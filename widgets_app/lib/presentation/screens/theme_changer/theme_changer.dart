import 'package:flutter/material.dart';
import '../../../config/theme/app_theme.dart';

class ThemeChangerScreen extends StatefulWidget {
  final Function(int) ontThemeChanged;

  const ThemeChangerScreen({super.key, required this.ontThemeChanged});

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seleciona un color: ', style: TextStyle(fontSize: 20)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      setState(() {
                        selectedColor = index;
                        widget.ontThemeChanged(index);
                      });
                      print("selectedColor: $selectedColor");
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
