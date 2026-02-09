import 'package:clean_architecture_login_page/sign_in/data/mapper/person_mapper.dart';
import 'package:clean_architecture_login_page/sign_in/domain/entity/person_entity.dart';

abstract class PersonUsecase{
  PersonEntity getPerson({required String email});
}

class PersonUsecaseImpl extends PersonUsecase{
  final PersonMapper _personMapper =PersonMapper();
  @override
  PersonEntity getPerson({required String email}) {
    return _personMapper.getPerson(email: email);
  }
 
}