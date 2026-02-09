import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/model/validation_notifier.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValidationNotifier>(
      create: (context) => ValidationNotifier(),
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 500,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.purpleAccent),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Consumer<ValidationNotifier>(
              builder: (context, validationNotifier, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        validationNotifier.isValid ? Icons.check_circle : Icons.check_circle_outline,
                        color: validationNotifier.iconColor,
                        size: 50,
                        ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "email@xyz.com",
                        border: OutlineInputBorder(),
                        ),
                    ),

                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          validationNotifier.checkForValidation(
                            _controller.text,
                          );
                        },
                        child: Text(
                          "Check for validation",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      validationNotifier.validationMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: validationNotifier.isValid
                          ? Colors.green
                          : Colors.red,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
