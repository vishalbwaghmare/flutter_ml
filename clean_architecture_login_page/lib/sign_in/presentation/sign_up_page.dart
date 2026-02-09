import 'package:clean_architecture_login_page/sign_in/presentation/bloc/sign_up_bloc.dart';
import 'package:clean_architecture_login_page/sign_in/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> SignInBloc(), child: SignUpPageContent(),);
  }
}
class SignUpPageContent extends StatefulWidget {
  const SignUpPageContent({super.key});

  @override
  State<SignUpPageContent> createState() => _SignUpPageContentState();
}

class _SignUpPageContentState extends State<SignUpPageContent> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 500,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurStyle: BlurStyle.solid,
                blurRadius: 4
              ),
            ]
          ),
          child: BlocConsumer<SignInBloc,SignInState>(
            listener: (context, state){
              if(state.isLoggedIn){
                Future.delayed(Duration(seconds: 2));
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Login successful!")), );
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WelcomeScreen(name: state.email)));
              }
            },
            builder: (context, state){
              return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.facebook, size: 40, color: Colors.blue,),
                          Icon(FontAwesomeIcons.google,size: 40, color: Colors.red,),
                          Icon(FontAwesomeIcons.linkedin,size: 40, color: Colors.blueAccent,),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (email){
                          if(email == null || !email.contains("@") || !email.contains('.')){
                            return 'Please enter valid email';
                          };
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          errorStyle: TextStyle(color: Colors.red)
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        validator: (password){
                          if(password == null || password.isEmpty || password.length < 6){
                            return 'Please enter valid password';
                          };
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          errorStyle: TextStyle(color: Colors.red)
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          ),
                          onPressed: (){
                           if( _formKey.currentState?.validate() ?? false){
                            _formKey.currentState?.save();
                            context.read<SignInBloc>().add(SignInEvent(email: _emailController.text));
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text("Loggen In successfully"),)
                            // );
                           }
                          }, 
                          child: Text('Sign In', style: TextStyle(fontSize: 16,color: Colors.white),)
                          ),
                      ),
                      const SizedBox(height: 4,),
                      Text("Forget password?", textAlign: TextAlign.center,) 
                    ],
                  ),
                ),
              ),
            );
            },
          ),
        ),
      ),
    );
  }
}
