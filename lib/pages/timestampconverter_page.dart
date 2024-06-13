
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:toolbox/gen/strings.g.dart';

class TimestampConverterPage extends StatefulWidget {
  const TimestampConverterPage({ Key? key }) : super(key: key);
  @override
  State<TimestampConverterPage> createState() => _TimestampConverterPage();
}

class _TimestampConverterPage extends State<TimestampConverterPage> {
  TextEditingController unixTimestampController = TextEditingController();

  int? unixTimestamp;
  String humanReadableDateUtc = "";
  String humanReadableDateLocal = "";

  @override
  void initState() {
    super.initState();
    updateTime(DateTime.now().millisecondsSinceEpoch ~/ 1000);
  }

  void updateTime(int secondTimestamp) {
    unixTimestamp = secondTimestamp;
    unixTimestampController.text = unixTimestamp.toString();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(secondTimestamp * 1000);
    humanReadableDateUtc = "${DateFormat("yyyy-MM-dd HH:mm:ss").format(dateTime.toUtc())} (${t.tools.timestampconverter.utc})";
    humanReadableDateLocal = "${DateFormat("yyyy-MM-dd HH:mm:ss").format(dateTime.toLocal())} (${t.tools.timestampconverter.local})";
  }

  Future<bool?> showLocalOrUtcDialog() async {
    bool? isUtc;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(t.tools.timestampconverter.local_or_utc_dialog_title),
            content: Text(t.tools.timestampconverter.local_or_utc_dialog_message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  isUtc = false;
                },
                child: Text(
                    t.tools.timestampconverter.local,
                    style: const TextStyle(fontWeight: FontWeight.w800)
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  isUtc = true;
                },
                child: Text(
                    t.tools.timestampconverter.utc,
                    style: const TextStyle(fontWeight: FontWeight.w800)
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  isUtc = null;
                },
                child: Text(t.generic.cancel),
              ),
            ],
          ),
        );
      },
    );
    return isUtc;
  }

  void showDateTimePicker(bool pickUtc) {
    showDatePicker(
      context: context,
      initialDate: pickUtc ? DateTime.now().toUtc() : DateTime.now(),
      firstDate: pickUtc ? DateTime(1970).toUtc() : DateTime(1970),
      lastDate: pickUtc ? DateTime(2100).toUtc() : DateTime(2100),
    ).then((DateTime? date) {
      if (date != null) {
        showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 0, minute: 0),
        ).then((TimeOfDay? time) {
          if (time != null) {
            DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse("${date.year}-${date.month}-${date.day} ${time.hour}:${time.minute}:00", pickUtc);
            if (mounted) {
              setState(() {
                updateTime(dateTime.millisecondsSinceEpoch ~/ 1000);
              });
            }
          }
        });
      }
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
            title: Text("${t.generic
                .app_name} - ${t.tools.timestampconverter.title}"),
            actions: [
              Tooltip(
                message: t.tools.timestampconverter.now_tooltip,
                child: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () {
                    setState(() {
                      updateTime(DateTime.now().millisecondsSinceEpoch ~/ 1000);
                    });
                  },
                ),
              )
            ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: unixTimestampController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: t.tools.timestampconverter.unix_timestamp,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Tooltip(
                            message: t.tools.timestampconverter.convert_timestamp_to_date,
                            child: IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: () {
                                if (unixTimestampController.text.isNotEmpty) {
                                  int? timestamp = int.tryParse(unixTimestampController.text);
                                  if (timestamp != null &&
                                      timestamp < 8640000000000 &&
                                      timestamp > -8640000000000) {
                                    setState(() {
                                      updateTime(
                                          timestamp
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      humanReadableDateUtc = t.tools.timestampconverter.error.invalid_timestamp;
                                      humanReadableDateLocal = t.tools.timestampconverter.error.invalid_timestamp;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            humanReadableDateUtc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onTap: () {
                          showLocalOrUtcDialog().then((value) {
                            if (mounted && value != null) {
                              showDateTimePicker(value);
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            humanReadableDateLocal,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onTap: () {
                          showLocalOrUtcDialog().then((value) {
                            if (mounted && value != null) {
                              showDateTimePicker(value);
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t.tools.timestampconverter.tap_the_date_to_change_it,
                        style: const TextStyle(
                        ),
                      ),
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}