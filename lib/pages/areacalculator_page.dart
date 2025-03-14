
import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/areacalculator_shape.dart';
import 'dart:math';

class AreaCalculatorPage extends StatefulWidget {
  const AreaCalculatorPage({super.key});

  @override
  State<AreaCalculatorPage> createState() => _AreaCalculatorPage();
}

class _AreaCalculatorPage extends State<AreaCalculatorPage> {

  double calculatedArea = 0.0;

  AreaCalculatorShape defaultShape = AreaCalculatorShape(
    name: t.tools.areacalculator.select_a_shape,
    inputs: {},
    calculateArea: (dynamic inputs) => 0,
  );

  late AreaCalculatorShape selectedShape;

  List<AreaCalculatorShape> shapes = [
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.circle,
      inputs: {t.tools.areacalculator.inputs.radius: ""},
      calculateArea: (dynamic inputs) => (pi * inputs[0] * inputs[0]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.ellipse,
      inputs: {t.tools.areacalculator.inputs.major_axis: "", t.tools.areacalculator.inputs.minor_axis: ""},
      calculateArea: (dynamic inputs) => (pi * inputs[0] * inputs[1]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.equilateral_triangle,
      inputs: {t.tools.areacalculator.inputs.side: ""},
      calculateArea: (dynamic inputs) => (sqrt(3) / 4 * inputs[0] * inputs[0]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.kite,
      inputs: {t.tools.areacalculator.inputs.diagonal_1: "", t.tools.areacalculator.inputs.diagonal_2: ""},
      calculateArea: (dynamic inputs) => (0.5 * inputs[0] * inputs[1]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.parallelogram,
      inputs: {t.tools.areacalculator.inputs.base: "", t.tools.areacalculator.inputs.height: ""},
      calculateArea: (dynamic inputs) => (inputs[0] * inputs[1]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.rectangle,
      inputs: {t.tools.areacalculator.inputs.length: "", t.tools.areacalculator.inputs.width: ""},
      calculateArea: (dynamic inputs) => (inputs[0] * inputs[1]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.rhombus,
      inputs: {t.tools.areacalculator.inputs.diagonal_1: "", t.tools.areacalculator.inputs.diagonal_2: ""},
      calculateArea: (dynamic inputs) => (0.5 * inputs[0] * inputs[1]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.regular_hexagon,
      inputs: {t.tools.areacalculator.inputs.side: ""},
      calculateArea: (dynamic inputs) =>
      (3 * sqrt(3) / 2 * inputs[0] * inputs[0]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.regular_octagon,
      inputs: {t.tools.areacalculator.inputs.side: ""},
      calculateArea: (dynamic inputs) =>
      (2 * (1 + sqrt(2)) * inputs[0] * inputs[0]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.regular_pentagon,
      inputs: {t.tools.areacalculator.inputs.side: ""},
      calculateArea: (dynamic inputs) =>
      (0.25 * sqrt(5 * (5 + 2 * sqrt(5))) * inputs[0] * inputs[0]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.regular_polygon,
      inputs: {t.tools.areacalculator.inputs.number_of_sides: "", t.tools.areacalculator.inputs.side_length: "", t.tools.areacalculator.inputs.apothem: ""},
      calculateArea: (dynamic inputs) =>
      (0.5 * inputs[0] * inputs[1] * inputs[2]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.square,
      inputs: {t.tools.areacalculator.inputs.side: ""},
      calculateArea: (dynamic inputs) => (inputs[0] * inputs[0]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.trapezoid,
      inputs: {t.tools.areacalculator.inputs.base_1: "", t.tools.areacalculator.inputs.base_2: "", t.tools.areacalculator.inputs.height: ""},
      calculateArea: (dynamic inputs) =>
      (0.5 * (inputs[0] + inputs[1]) * inputs[2]),
    ),
    AreaCalculatorShape(
      name: t.tools.areacalculator.shapes.triangle,
      inputs: {t.tools.areacalculator.inputs.base: "", t.tools.areacalculator.inputs.height: ""},
      calculateArea: (dynamic inputs) => (0.5 * inputs[0] * inputs[1]),
    ),
  ];

  @override
  void initState() {
    super.initState();
    selectedShape = defaultShape;
    shapes.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  void calculateButtonPressed() {
    List<double> inputs = [];
    double area;
    for (int i = 0; i < (selectedShape.inputs.length); i++) {
      double? input;
      String inputValue = selectedShape.inputs.entries
          .elementAt(i)
          .value;
      if (inputValue.isEmpty) {
        showOkTextDialog(
            context,
            t.tools.areacalculator.error.invalid_input,
            "${t.tools.areacalculator.error.please_enter_a_value_for} \"${selectedShape.inputs.entries
                .elementAt(i)
                .key
                .toLowerCase()}\""
        );
        return;
      }
      try {
        input = double.parse(inputValue);
      } catch (e) {
        showOkTextDialog(
            context,
            t.tools.areacalculator.error.invalid_input,
            "${t.tools.areacalculator.error.please_enter_a_valid_number_for} \"${selectedShape.inputs.entries
                .elementAt(i)
                .key
                .toLowerCase()}\""
        );
        return;
      }
      if (input < 0) {
        showOkTextDialog(
            context,
            t.tools.areacalculator.error.invalid_input,
            "${t.tools.areacalculator.error.please_enter_a_positive_number_for} \"${selectedShape.inputs
                .entries
                .elementAt(i)
                .key
                .toLowerCase()}\""
        );
        return;
      }
      inputs.add(input);
    }
    try {
      area = selectedShape.calculateArea(inputs) ?? 0;
    } catch (e) {
      showOkTextDialog(
          context,
          t.tools.areacalculator.error.invalid_input,
          t.tools.areacalculator.error.please_try_again_with_different_values
      );
      return;
    }
    if (area.isInfinite || area.isNaN) {
      showOkTextDialog(
          context,
          t.tools.areacalculator.error.invalid_input,
          t.tools.areacalculator.error.please_try_again_with_different_values
      );
      return;
    }
    if (area == 0) {
      showOkTextDialog(
          context,
          t.tools.areacalculator.error.invalid_input,
          t.tools.areacalculator.error.the_area_of_the_shape_is_zero
      );
      return;
    }
    setState(() {
      calculatedArea = area;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.areacalculator.title),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownMenu<AreaCalculatorShape>(
                        initialSelection: selectedShape,
                        dropdownMenuEntries: List<
                            DropdownMenuEntry<AreaCalculatorShape>>.generate(
                            shapes.length,
                                (index) =>
                                DropdownMenuEntry(
                                    value: shapes[index],
                                    label: shapes[index].name
                                )
                        )..insert(0, DropdownMenuEntry(
                            value: defaultShape,
                            label: defaultShape.name,
                          )),
                        width: MediaQuery.of(context).size.width - 32 - MediaQuery.of(context).padding.left - MediaQuery.of(context).padding.right,
                        enableSearch: false,
                        menuHeight: 300,
                        onSelected: (value) {
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();
                            calculatedArea = 0;
                            selectedShape = value ?? defaultShape;
                          });
                        },
                      ),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < (selectedShape.inputs.length); i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: TextField(
                              controller: TextEditingController(
                                  text: selectedShape.inputs.entries
                                      .elementAt(i)
                                      .value
                              ),
                              decoration: InputDecoration(
                                labelText: selectedShape.inputs.entries
                                    .elementAt(i)
                                    .key,
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              onChanged: (value) {
                                selectedShape.inputs[selectedShape.inputs.entries.elementAt(i).key] = value;
                              },
                            ),
                          ),
                        selectedShape == defaultShape
                            ? const SizedBox()
                            : SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilledButton(
                              child: Text(t.tools.areacalculator.calculate),
                              onPressed: () {
                                calculateButtonPressed();
                              },
                            ),
                          ),
                        ),
                        (selectedShape == defaultShape || calculatedArea == 0)
                            ? const SizedBox()
                            : Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Text(
                              "${t.tools.areacalculator.area}\n${calculatedArea.toStringAsFixed(2)}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}