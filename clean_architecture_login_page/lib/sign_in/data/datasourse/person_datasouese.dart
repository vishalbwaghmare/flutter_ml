import 'package:clean_architecture_login_page/sign_in/data/dto/person.dart';

abstract class PersonDatasource {
  PersonDTO getPerson({String? email});
}

class PersonDatasoueseImpl implements  PersonDatasource {
  PersonDatasoueseImpl();
  @override
  PersonDTO getPerson({String? email}) {
    return PersonDTO.fromJson({"email": email ?? ""});
  }
  
}