import 'package:flutter/material.dart';

class TemperatureInput extends StatefulWidget {
  final Function(double, double) onFetchTemperature;

  TemperatureInput({required this.onFetchTemperature});

  @override
  _TemperatureInputState createState() => _TemperatureInputState();
}

class _TemperatureInputState extends State<TemperatureInput> {
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  void _submit() {
    final double latitude = double.parse(_latitudeController.text);
    final double longitude = double.parse(_longitudeController.text);
    widget.onFetchTemperature(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _latitudeController,
          decoration: InputDecoration(labelText: 'Latitud'),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        TextField(
          controller: _longitudeController,
          decoration: InputDecoration(labelText: 'Longitud'),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text('Consultar Temperatura'),
        ),
      ],
    );
  }
}