import 'package:flutter/material.dart';
import 'package:movies/core/provider/people.dart';
import 'package:movies/widgets/input.dart';
import 'package:movies/widgets/loading.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();

  _renderResult(PeopleProvider data) {
    return data?.people == null
        ? Text('Nenhum personagem encontrado ou pesquisado')
        : Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('name: ${data.people.name}'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PeopleProvider>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('SWAPI Api'),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Input(
                  controller: searchController,
                  label: 'Insira o ID',
                ),
                RaisedButton(
                  child: Text('Procurar'),
                  onPressed: () => data.getPeople(searchController.text),
                ),
                data.loading ? Loading() : _renderResult(data)
              ],
            ),
          ),
        );
      },
    );
  }
}
