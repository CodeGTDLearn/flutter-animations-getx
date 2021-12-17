import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  var _counterObs1 = 50.0.obs;
  var _counterObs2 = 50.0.obs;
  String title = "";

  MyHomePage({required this.title});

  void _incrementCounter() {
    _counterObs1.value = _counterObs1.value * 1.25;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const Text('You have pushed the button this many times:'),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _counterObs1.value,
            color: Colors.grey,
            child: Text('AnimatedContainer',
                style: TextStyle(fontSize: 10, color: Colors.yellow)),
          ),
        ),
        const SizedBox(height: 50)
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}