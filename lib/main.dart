import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/users.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> _users;
  Future<List<Data>> _getUsers() async {
    try {
      List<Data> listUsers = List();
      final response = await http.get(
        'https://tkhausgebraut.com.br/restful/users',
        headers: {HttpHeaders.authorizationHeader: "Basic 123"}
      );

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson['data'].forEach((item) => listUsers.add(Data.fromJson(item)));
        return listUsers;
      } else {
        print('Erro ao carregar lista de usuários');
        return null;
      }
    } catch (e) {
      print('Excessão: ' + e.toString());
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _getUsers().then((map) {
      _users = map;
      final usersCount = _users != null ? _users.length : 0;
      print(usersCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersCount = _users != null ? _users.length : 0;
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: usersCount,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                color: Colors.blue,
                child: Text(_users[index].name),
              )
            );
          }
        )
      ),
    );
  }
}