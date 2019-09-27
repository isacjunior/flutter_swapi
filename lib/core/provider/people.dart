import 'package:flutter/foundation.dart';
import 'package:movies/core/model/people.dart';
import 'package:movies/core/service/people.dart';

class PeopleProvider with ChangeNotifier {
  People _people;
  bool _isLoading = false;
  String search;

  bool get loading => _isLoading;
  People get people => _people;

  void setLoading(bool boolean) {
    _isLoading = boolean;
    notifyListeners();
  }

  void setPeople(People people) {
    _people = people;
  }

  void setSearch(String name) {
    search = name;
    notifyListeners();
  }

  Future getPeople(String id) async {
    setLoading(true);
    People people = await PeopleService.getPeople(id);
    setPeople(people);
    setLoading(false);
  }
}
