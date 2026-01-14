
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:toolbox/gen/strings.g.dart';

class TimestampConverterPage extends StatefulWidget {
  const TimestampConverterPage({ super.key });
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
      builder: (BuildContext context) {
        return AlertDialog(
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
          ],
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
        if (mounted) {
          showTimePicker(
            context: context,
            initialTime: const TimeOfDay(hour: 0, minute: 0),
          ).then((TimeOfDay? time) async {
            if (time != null) {
              int seconds = await showSecondsPickerDialog();
              DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
                  .parse(
                  "${date.year}-${date.month}-${date.day} ${time.hour}:${time
                      .minute}:$seconds",
                  pickUtc
              );
              if (mounted) {
                setState(() {
                  updateTime(dateTime.millisecondsSinceEpoch ~/ 1000);
                });
              }
            }
          });
        }
      }
    });
  }

  Future<int> showSecondsPickerDialog() async {
    int seconds = 0;
    if (mounted) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t.tools.timestampconverter.select_seconds),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      NumberPicker(
                        value: seconds,
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (value) {
                          if (mounted) {
                            setState(() {
                              seconds = value;
                            });
                          }
                        },
                        axis: Axis.horizontal,
                        infiniteLoop: true,
                      ),
                    ],
                  ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.generic.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(t.generic.ok),
              ),
            ],
          );
        },
      );
    }
    return seconds;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.timestampconverter.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          actions: [
            IconButton(
              icon: const Icon(Icons.access_time),
              onPressed: () {
                setState(() {
                  updateTime(DateTime.now().millisecondsSinceEpoch ~/ 1000);
                });
              },
              tooltip: t.tools.timestampconverter.now_tooltip,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Input Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              t.tools.timestampconverter.unix_timestamp,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: unixTimestampController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: t.tools.timestampconverter.unix_timestamp,
                                  filled: true,
                                  fillColor: colorScheme.surfaceVariant,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            FilledButton.icon(
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text("Convert"),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                if (unixTimestampController.text.isNotEmpty) {
                                  int? timestamp = int.tryParse(unixTimestampController.text);
                                  if (timestamp != null &&
                                      timestamp < 8640000000000 &&
                                      timestamp > -8640000000000) {
                                    setState(() {
                                      updateTime(timestamp);
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Result Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      showLocalOrUtcDialog().then((value) {
                        if (mounted && value != null) {
                          showDateTimePicker(value);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today, color: colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                "Date & Time",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // UTC Time
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "UTC",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  humanReadableDateUtc.replaceAll(" (${t.tools.timestampconverter.utc})", ""),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Local Time
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  t.tools.timestampconverter.local,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  humanReadableDateLocal.replaceAll(" (${t.tools.timestampconverter.local})", ""),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, size: 16, color: colorScheme.onSurfaceVariant),
                              const SizedBox(width: 4),
                              Text(
                                t.tools.timestampconverter.tap_the_date_to_change_it,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}