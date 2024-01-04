import 'package:http/http.dart' as http;
import 'package:weather_api/model/api_model.dart';
class WeatherData{
  static Future<Temperatures> fetchData()async{
    String baseUrl="api.weatherapi.com";
    String key="c4527af374bc4cd3b98115634232411";
    final params={
      'key':"$key",
      "q" : 'kochi'
    };
    var url1=Uri.https(baseUrl,"/v1/current.json",params);
    final response=await http.get(url1);
//print(response.body);
    if (response.statusCode == 200) {
      // print(response.body);
      final model = temperaturesFromJson(response.body);
      print('====country =====: ${model.location.country}');
      return model;
    } else {
      throw Exception('Failed to load data');
    }

  }
}

