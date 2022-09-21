import 'package:http/http.dart' as http;


class EpisodeDao {

  void getData() async {
    var url = 'https://rickandmortyapi.com/api/episode';
    final response = await http.get(Uri.parse(url)); 
    if(response.statusCode == 200){
      print('tenemos data epi');
    }else {
      print('ocurrió un error');
    }
  }

}