import 'PersonModel.dart';

class DummyData{
  static final List<PersonModel> _persons = [];

  static List<PersonModel> getData(){
    for(int i = 1; i<=50;i++){
      _persons.add(PersonModel("Nishiket$i"));
    }
    return _persons;
  }
}