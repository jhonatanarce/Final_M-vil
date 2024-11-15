import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static Future<double> getTemperature(double latitude, double longitude) async {
    final Uri apiUrl = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature');

    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["current"]["temperature"].toDouble();
      } else {
        throw Exception('Error al obtener la temperatura.');
      }
    } catch (e) {
      return 17.0;
    }
  }
}