import 'package:bloc/bloc.dart';
import 'package:clean_architecture_login_page/sign_in/domain/entity/person_entity.dart';
import 'package:clean_architecture_login_page/sign_in/domain/usecase/person_usecase.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignInBloc extends Bloc<SigInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
   on<SignInEvent>(_onSignInEvent);
  }

  void _onSignInEvent(SignInEvent event, Emitter<SignInState> emit)async{
    PersonUsecaseImpl personUsecaseImpl = PersonUsecaseImpl();
    PersonEntity person = personUsecaseImpl.getPerson(email: event.email);

    emit(state.copyWith(
      email: person.email,
      isLoggedIn: true,
    ));
  }
}
