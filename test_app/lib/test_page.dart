import 'package:flutter/material.dart';
import 'package:test_app/second_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.title});

  final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with WidgetsBindingObserver{

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('App life cycle : $state');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: 20,
            itemBuilder: (context,index){
              return Container(
                //height: 70,
                width: double.infinity,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,style: BorderStyle.solid, width: 2),
                ),
                child: Image.asset("assets/images/my_image.jpg",fit: BoxFit.cover,),
              );
            }),
        /*child: ListView.builder(
          itemCount: 20,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black12)
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          //backgroundImage: AssetImage("/assets/images/my_images.jpg"),
                          child: Icon(Icons.supervised_user_circle),
                        ),
                        SizedBox(width: 6,),
                        Text("Data ${index+1}", textAlign: TextAlign.start, style: TextStyle(color: Colors.black),),
                      ],
                    )),
              );
            }
        ),*/
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 30,bottom: 30),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
              backgroundColor: Colors.black,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondPage()));
              },
              child: Text('Next',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}