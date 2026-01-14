
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.areacalculator.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.tools.areacalculator.select_a_shape,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        DropdownMenu<AreaCalculatorShape>(
                          initialSelection: selectedShape,
                          dropdownMenuEntries: List<
                              DropdownMenuEntry<AreaCalculatorShape>>.generate(
                              shapes.length,
                                  (index) => DropdownMenuEntry(
                                      value: shapes[index],
                                      label: shapes[index].name
                                  )
                          )..insert(0, DropdownMenuEntry(
                              value: defaultShape,
                              label: defaultShape.name,
                            )),
                          width: MediaQuery.of(context).size.width - 64,
                          enableSearch: false,
                          menuHeight: 300,
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: colorScheme.surfaceVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onSelected: (value) {
                            setState(() {
                              FocusManager.instance.primaryFocus?.unfocus();
                              calculatedArea = 0;
                              selectedShape = value ?? defaultShape;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (selectedShape != defaultShape) ...[
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dimensions",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 12),
                          for (int i = 0; i < selectedShape.inputs.length; i++)
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: i < selectedShape.inputs.length - 1 ? 12 : 0,
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                  text: selectedShape.inputs.entries.elementAt(i).value,
                                ),
                                decoration: InputDecoration(
                                  labelText: selectedShape.inputs.entries.elementAt(i).key,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.straighten,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                onChanged: (value) {
                                  selectedShape.inputs[selectedShape.inputs.entries.elementAt(i).key] = value;
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: calculateButtonPressed,
                    icon: const Icon(Icons.calculate),
                    label: Text(t.tools.areacalculator.calculate),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  if (calculatedArea > 0) ...[
                    const SizedBox(height: 16),
                    Card(
                      elevation: 2,
                      color: colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text(
                              t.tools.areacalculator.area,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              calculatedArea.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}