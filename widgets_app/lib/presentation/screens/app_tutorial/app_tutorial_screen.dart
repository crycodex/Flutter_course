import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String description;
  final String image;

  SlideInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

final slides = [
  SlideInfo(
    title: 'Bienvenido a la App',
    description: 'Esta es la primera diapositiva de la app tutorial',
    image: 'assets/1.png',
  ),
  SlideInfo(
    title: 'Bienvenido a la App',
    description: 'Esta es la segunda diapositiva de la app tutorial',
    image: 'assets/2.png',
  ),
  SlideInfo(
    title: 'Bienvenido a la App',
    description: 'Esta es la tercera diapositiva de la app tutorial',
    image: 'assets/3.png',
  ),
  SlideInfo(
    title: 'Bienvenido a la App',
    description: 'Esta es la carga de la app',
    image: 'assets/jar.gif',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "app_tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageController;
  bool endView = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (page.floor() == 3) {
        endView = true;
        setState(() {});
      } else {
        endView = false;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Tutorial')),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              ...slides.map(
                (e) => _Slide(
                  title: e.title,
                  description: e.description,
                  image: e.image,
                ),
              ),
            ],
          ),
          endView
              ? Positioned(
                  right: 0,
                  child: TextButton(
                    onPressed: () {
                      //regresar
                      Navigator.of(context).pop();
                    },
                    child: const Text('Salir'),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const _Slide({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: 350, height: 350),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
