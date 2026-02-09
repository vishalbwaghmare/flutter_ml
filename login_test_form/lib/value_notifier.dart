import 'package:flutter/material.dart';

class ValueNotifierDemo extends StatefulWidget {
  const ValueNotifierDemo({super.key});

  @override
  State<ValueNotifierDemo> createState() => _ValueNotifierDemoState();
}

class _ValueNotifierDemoState extends State<ValueNotifierDemo> {
  final ValueNotifier<int> _counterChanged = ValueNotifier<int>(0);


@override
  void dispose() {
    _counterChanged.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Value notifier demo"),
          actions: [
            IconButton(onPressed: (){
              _counterChanged.value = 0;
            }, icon: Icon(Icons.sync))
          ],
        ),
        body: Center(
          //child: Text("$_counter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          child: ValueListenableBuilder<int>(
            valueListenable: _counterChanged, 
            builder: (context ,value, child){
              return Text("Counter = $value", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
            })
            ,
        ),
        floatingActionButton: IconButton(
          onPressed: (){
            _counterChanged.value++;
          },
          icon: Icon(Icons.add),
          ),
      ),
    );
  }
}