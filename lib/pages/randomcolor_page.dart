import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';

class RandomColorPage extends StatefulWidget {
  const RandomColorPage({ Key? key }) : super(key: key);
  @override
  State<RandomColorPage> createState() => _RandomColorPage();
}

class _RandomColorPage extends State<RandomColorPage> {
  Color _color = const Color(0xFFFFFFFF);

  @override
  void initState() {
    changeColor();
    super.initState();
  }

  void changeColor() {
    setState(() {
      // Random color
      _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic.app_name} - ${t.tools.randomcolor.title}"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(t.tools.randomcolor.hint, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        changeColor();
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          color: _color,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: "#${_color.value.toRadixString(16).toUpperCase().substring(2)}"));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(t.tools.randomcolor.copied_to_clipboard)),
                    );
                  },
                  child: Text(
                    "#${_color.value.toRadixString(16).toUpperCase().substring(2)}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}