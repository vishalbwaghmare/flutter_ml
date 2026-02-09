part of 'sign_up_bloc.dart';

sealed class SigInEvent extends Equatable {}

class SignInEvent extends SigInEvent{
  final String email;
  SignInEvent({required this.email});
  @override
  List<Object?> get props => [email];
  
}

