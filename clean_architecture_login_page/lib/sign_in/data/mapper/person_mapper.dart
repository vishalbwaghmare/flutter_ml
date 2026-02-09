import 'package:clean_architecture_login_page/sign_in/data/datasourse/person_datasouese.dart';
import 'package:clean_architecture_login_page/sign_in/domain/entity/person_entity.dart';

class PersonMapper {
  final PersonDatasource _personDatasource = PersonDatasoueseImpl();

  PersonEntity getPerson({String? email}) {
    final person = _personDatasource.getPerson(email: email);
    return PersonEntity.fromJson(person.toJson());
  }
}
