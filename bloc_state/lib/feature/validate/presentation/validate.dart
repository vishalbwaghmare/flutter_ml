import 'package:bloc_state/feature/validate/presentation/bloc/validate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateScreen extends StatelessWidget {
  const ValidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ValidateBloc();
      },
      child: ValidateScreenContent(),
    );
  }
}

class ValidateScreenContent extends StatefulWidget {
  const ValidateScreenContent({super.key});

  @override
  State<ValidateScreenContent> createState() => _ValidateScreenContentState();
}

class _ValidateScreenContentState extends State<ValidateScreenContent> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BLoc state management")),
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
          child: BlocBuilder<ValidateBloc, ValidateState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      state.isValid!
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: state.iconColor,
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
                        context.read<ValidateBloc>().add(CheckForValidationEvent(email: _controller.text));
                      },
                      child: Text(
                        "Check for validation",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    state.validateMessage ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: state.isValid! ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
