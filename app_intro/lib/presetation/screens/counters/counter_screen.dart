import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int click = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
        actions: [
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
                      content: Text(
                        "Este es un contador de clicks que se incrementa y decrementa, \n\nDesarrollado por @isnotcristhianr.dev",
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
            icon: Icon(Icons.info),
          ),
        ],
        // backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$click",
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.w100),
            ),
            Text(
              "Click${click == 1 ? "" : "s"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 10),
          ActionButton(
            icon: Icon(Icons.remove, color: Colors.white),
            onPressed: () {
              setState(() {
                if (click <= 0) return;
                click--;
              });
            },
          ),
          SizedBox(width: 10),
          ActionButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              setState(() {
                click++;
              });
            },
          ),
          SizedBox(width: 10),
          ActionButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                click = 0;
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
