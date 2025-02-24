import 'dart:core';
import 'package:flutter/material.dart';

class AreaCalculatorShape {
  final String name;
  final Map<String, String> inputs;
  final Function(dynamic) calculateArea;

  AreaCalculatorShape({required this.name, required this.inputs, required this.calculateArea});
}