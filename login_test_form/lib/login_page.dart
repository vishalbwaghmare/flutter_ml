import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _isShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email == null ||
                                  email.isEmpty ||
                                  !email.contains('@')) {
                                return "Please enter valid email address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              errorStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: !isShowPassword,
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return "Please enter valid password";
                              }
                              if (password.length < 6) {
                                return 'Please enter strong password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              errorStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => _isShowPassword(),
                                icon: Icon(
                                  isShowPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState?.save();
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("Forget password?"),
                  SizedBox(height: 8,),
                  Text("Don't have account? create account")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
