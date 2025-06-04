import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  int click = 0;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
        // backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.click}",
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.w100),
            ),
            Text(
              "Click${widget.click == 1 ? "" : "s"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.grey[800],
            onPressed: () {
              setState(() {
                widget.click--;
              });
            },
            child: Icon(Icons.remove, color: Colors.white),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.grey[800],
            onPressed: () {
              setState(() {
                widget.click++;
              });
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.grey[800],
            onPressed: () {
              setState(() {
                widget.click = 0;
              });
            },
            child: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
