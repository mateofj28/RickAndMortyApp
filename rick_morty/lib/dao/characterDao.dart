import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rick_morty/model/character.dart';

class CharactersDao {

  Future<dynamic> getData() async {
    var url = 'https://rickandmortyapi.com/api/character';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Character.fromJson(jsonDecode(response.body));
    } else {
      print('ocurrió un error');
    }
  }

  Future<dynamic> getCharacterById(id) async {
    print(id);
    var url = 'https://rickandmortyapi.com/api/character/$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Character.fromJsonById(jsonDecode(response.body));
    } else {
      print('error ocurred');
    }
  }
}
