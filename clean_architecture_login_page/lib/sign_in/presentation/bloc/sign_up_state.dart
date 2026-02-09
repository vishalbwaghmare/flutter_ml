part of 'sign_up_bloc.dart';

class SignInState extends Equatable {
  final bool isLoggedIn;
  final String email;

  const SignInState({
    required this.isLoggedIn,
    required this.email,
  });

  factory SignInState.initial(){
    return SignInState(
      isLoggedIn: false, 
      email: ""
      );
  }

  SignInState copyWith({
    bool? isLoggedIn,
    String? email,
  }){
    return SignInState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn, 
      email: email ?? this.email,
      );
  }
  
  @override
  List<Object?> get props => [
    isLoggedIn,
    email,
  ];
}

