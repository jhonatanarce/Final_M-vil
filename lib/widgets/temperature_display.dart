import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  final double? temperature;

  TemperatureDisplay({this.temperature});

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature != null ? '${temperature!.toStringAsFixed(1)} °C' : 'Ingrese coordenadas',
      style: TextStyle(fontSize: 24),
    );
  }
}