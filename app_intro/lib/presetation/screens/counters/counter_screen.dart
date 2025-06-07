import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class SavedCounter {
  String name;
  int value;
  final String date;

  SavedCounter({required this.name, required this.value, required this.date});

  Map<String, dynamic> toJson() => {'name': name, 'value': value, 'date': date};

  factory SavedCounter.fromJson(Map<String, dynamic> json) => SavedCounter(
    name: json['name'],
    value: json['value'],
    date: json['date'],
  );
}

class _CounterScreenState extends State<CounterScreen> {
  int click = 0;
  final String _counterKey = 'counter_value';
  final String _historyKey = 'counter_history';
  late SharedPreferences _prefs;
  List<SavedCounter> _history = [];
  final _nameController = TextEditingController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _loadHistory();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadCounter() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      click = _prefs.getInt(_counterKey) ?? 0;
    });
  }

  Future<void> _saveCounter() async {
    await _prefs.setInt(_counterKey, click);
  }

  Future<void> _loadHistory() async {
    _prefs = await SharedPreferences.getInstance();
    final historyJson = _prefs.getStringList(_historyKey) ?? [];
    setState(() {
      _history =
          historyJson
              .map((item) => SavedCounter.fromJson(json.decode(item)))
              .toList();
    });
  }

  Future<void> _saveToHistory(String name) async {
    final counter = SavedCounter(
      name: name,
      value: click,
      date: DateTime.now().toString(),
    );
    _history.insert(0, counter);
    await _saveHistoryToPrefs();
  }

  Future<void> _saveHistoryToPrefs() async {
    final historyJson =
        _history.map((counter) => json.encode(counter.toJson())).toList();
    await _prefs.setStringList(_historyKey, historyJson);
    setState(() {});
  }

  Future<void> _deleteCounter(int index) async {
    setState(() {
      _history.removeAt(index);
    });
    await _saveHistoryToPrefs();
  }

  Future<void> _editCounter(int index) async {
    _nameController.text = _history[index].name;
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Editar Contador'),
            content: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del contador',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    setState(() {
                      _history[index].name = _nameController.text;
                    });
                    _saveHistoryToPrefs();
                    _nameController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
    );
  }

  Future<void> _showSaveDialog() async {
    _nameController.clear();
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Guardar Contador'),
            content: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del contador',
                hintText: 'Ej: Contador del Lunes',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    _saveToHistory(_nameController.text);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
    );
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.isnotcristhianr.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        title: const Text("Counter"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _showSaveDialog, icon: const Icon(Icons.save)),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text(
                        "Counter App",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800],
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Este es un contador de clicks que se incrementa y decrementa. \n\nDesarrollado por: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: _launchURL,
                            child: Text(
                              "@isnotcristhianr.dev",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Close",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
              );
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: PageView(
          controller: _pageController,
          children: [
            // Página del Contador
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$click",
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    "Click${click == 1 ? "" : "s"}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      const Text(
                        "Navega con flechas o botones",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Página del Historial
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Historial de Contadores",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child:
                      _history.isEmpty
                          ? const Center(
                            child: Text(
                              'No hay contadores guardados',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                          : ListView.builder(
                            itemCount: _history.length,
                            itemBuilder: (context, index) {
                              final counter = _history[index];
                              return Dismissible(
                                key: Key(counter.date),
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed:
                                    (direction) => _deleteCounter(index),
                                child: ListTile(
                                  title: Text(counter.name),
                                  subtitle: Text(
                                    'Fecha: ${counter.date.split('.')[0]}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  trailing: Text(
                                    '${counter.value} clicks',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  leading: const Icon(Icons.history),
                                  onTap: () => _editCounter(index),
                                ),
                              );
                            },
                          ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 10),
          ActionButton(
            icon: const Icon(Icons.remove, color: Colors.white),
            onPressed: () {
              setState(() {
                if (click <= 0) return;
                click--;
                _saveCounter();
              });
            },
          ),
          const SizedBox(width: 10),
          ActionButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              setState(() {
                click++;
                _saveCounter();
              });
            },
          ),
          const SizedBox(width: 10),
          ActionButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                click = 0;
                _saveCounter();
              });
            },
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;

  const ActionButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[800],
      onPressed: onPressed,
      child: icon,
    );
  }
}
