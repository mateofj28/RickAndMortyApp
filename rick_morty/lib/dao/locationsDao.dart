import 'package:http/http.dart' as http;


class LocationDao {

  void getLocation() async {
    var url = 'https://rickandmortyapi.com/api/location';
    final response = await http.get(Uri.parse(url)); 
    if(response.statusCode == 200){
      print('tenemos Location loca');
    }else {
      print('ocurrió un error');
    }
  }

  void getLocationById() async {
    var number = 20;
    var url = 'https://rickandmortyapi.com/api/location/$number';
    final response = await http.get(Uri.parse(url)); 
    if(response.statusCode == 200){
      print('tenemos Location 20');
    }else {
      print('ocurrió un error');
    }
  }

}