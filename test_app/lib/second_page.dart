import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController usernameController = TextEditingController();
  String displayTest = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
  }

  void _resetText(){
    setState(() {
      usernameController.clear();
      displayTest = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: (){
                _resetText();
              },
              icon: Icon(Icons.sync))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'assets/images/my_image.jpg',
                  //scale: 0.2,
                  fit: BoxFit.cover,
                ),
              ),*/
              Opacity(
                opacity: 1.0,
                child: Image.network(
                  'https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?cs=srgb&dl=clouds-country-daylight-371633.jpg&fm=jpg',
                  loadingBuilder: (context, child, event){
                    if(event == null){
                      return child;
                    }else{
                      return CircularProgressIndicator();
                    }
                },
                ),
              ),
              /*Image.memory(
                base64Decode("")
              ),*/
              const SizedBox(height: 10,),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text("Enter email ID"),
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please provide email ID";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value){
                    print('User searched : $value');
                  },
                ),
              ),
              SizedBox(height: 10,),
              IconButton(onPressed: (){
                _formKey.currentState?.validate();
                _formKey.currentState?.save();
                setState(() {
                  displayTest = usernameController.text;
                });
              }, icon: Icon(Icons.add)),
              SizedBox(height: 10,),
              Text(
                displayTest,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
              )
            ],
          ),
        )
      ),
    );
  }
}
