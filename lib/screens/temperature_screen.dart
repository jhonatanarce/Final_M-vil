import 'package:flutter/material.dart';
import '../widgets/temperature_input.dart';
import '../widgets/temperature_display.dart';
import '../services/weather_service.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  double? _temperature;

  Future<void> _fetchTemperature(double latitude, double longitude) async {
    double temp = await WeatherService.getTemperature(latitude, longitude);
    setState(() {
      _temperature = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Temperatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TemperatureInput(onFetchTemperature: _fetchTemperature),
            SizedBox(height: 20),
            TemperatureDisplay(temperature: _temperature),
          ],
        ),
      ),
    );
  }
}