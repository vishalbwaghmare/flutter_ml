import 'package:clean_architecture_login_page/sign_in/presentation/sign_up_page.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;
  const WelcomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello, $name!",  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),
            Text("Want to join Us!",  style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500,),),
            const SizedBox(height: 16,),
            SizedBox(
              width: 200,
              height: 40,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  )
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
                }, child: Text("Sign Up", style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      )
    );
  }
}