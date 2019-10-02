import 'package:flutter/foundation.dart';
import 'package:movies/core/model/people.dart';
import 'package:movies/core/service/people.dart';

class PeopleProvider with ChangeNotifier {
  People _people;
  bool _isLoading = false;

  bool get loading => _isLoading;
  People get people => _people;

  void _setLoading(bool boolean) {
    _isLoading = boolean;
    notifyListeners();
  }

  void _setPeople(People people) {
    _people = people;
  }

  Future getPeople(String id) async {
    _setLoading(true);
    People people = await PeopleService.getPeople(id);
    _setPeople(people);
    _setLoading(false);
  }

  Future getLukeSkyWalker() async {
    _setLoading(true);
    People people = await PeopleService.getPeople('1');
    _setPeople(people);
    _setLoading(false);
  }
}
