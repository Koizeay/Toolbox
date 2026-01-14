import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/widgets/baseconverter_keyboard.dart';
import 'package:toolbox/widgets/generic_customkeyboard.dart';

class BaseConverterPage extends StatefulWidget {
  const BaseConverterPage({ super.key });
  @override
  State<BaseConverterPage> createState() => _BaseConverterPage();
}

class _BaseConverterPage extends State<BaseConverterPage> {
  String currentBase = 'DEC';
  List<String> listBases = ['BIN', 'OCT', 'DEC', 'HEX'];
  Map<String, String> inputLabel = {
    'BIN': t.tools.baseconverter.enter_a_bin_number,
    'OCT': t.tools.baseconverter.enter_a_oct_number,
    'DEC': t.tools.baseconverter.enter_a_dec_number,
    'HEX': t.tools.baseconverter.enter_a_hex_number,
  };
  Map<String, String> outputLabel = {
    'BIN': t.tools.baseconverter.binary,
    'OCT': t.tools.baseconverter.octal,
    'DEC': t.tools.baseconverter.decimal,
    'HEX': t.tools.baseconverter.hexadecimal,
  };

  final TextEditingController _controller = TextEditingController();

  void _onKeyTap(String key) {
    switch (key) {
      case GenericCustomKeyboard.backspaceButton:
        if (_controller.text.isNotEmpty) {
          if (mounted) {
            setState(() {
              _controller.text =
                  _controller.text.substring(0, _controller.text.length - 1);
            });
          }
        }
        break;
      case GenericCustomKeyboard.clearButton:
        if (mounted) {
          setState(() {
            _controller.text = '';
            _controller.clear();
          });
        }
        break;
      default:
        final int? parsedValue = int.tryParse(
            _controller.text + key, radix: _getRadix(currentBase));
        if (parsedValue == null && _controller.text.isNotEmpty) {
          showOkTextDialog(
              context,
              t.tools.baseconverter.too_big_number,
              t.tools.baseconverter
                  .the_number_you_entered_is_too_big_to_be_abble_to_convert_it,
              barrierDismissible: false
          );
        } else {
          if (mounted) {
            setState(() {
              _controller.text += key;
            });
          }
        }
        break;
    }
  }

  int _getRadix(String mode) {
    switch (mode) {
      case 'BIN':
        return 2;
      case 'OCT':
        return 8;
      case 'HEX':
        return 16;
      case 'DEC':
      default:
        return 10;
    }
  }

  String _getConvertedValue(String mode) {
    final int? parsedValue = int.tryParse(
        _controller.text, radix: _getRadix(currentBase));
    if (parsedValue == null) return ''; // Return empty string if parsing fails

    switch (mode) {
      case 'HEX':
        return parsedValue.toRadixString(16).toUpperCase();
      case 'BIN':
        return parsedValue.toRadixString(2);
      case 'OCT':
        return parsedValue.toRadixString(8);
      case 'DEC':
        return parsedValue.toString();
      default:
        return '';
    }
  }

  void checkInputIsValid(String? base) {
    if (_controller.text.isNotEmpty) {
      final int? parsedValue = int.tryParse(
          _controller.text, radix: _getRadix(base ?? 'DEC'));
      if (parsedValue == null) {
        showCustomActionOkTextDialog(
            context,
            t.tools.baseconverter.incompatible_number,
            t.tools.baseconverter
                .the_number_you_entered_is_not_a_valid_x_number(
                base: (outputLabel[base] ?? t.tools.baseconverter.decimal)
                    .toLowerCase()),
                () {
              if (mounted) {
                setState(() {
                  _controller.text = '';
                  _controller.clear();
                });
              }
            },
            barrierDismissible: false
        );
      }
    }
    if (mounted) {
      setState(() {
        currentBase = base ?? 'DEC';
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget inputTextBaseDropdown(ColorScheme colorScheme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Input",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    readOnly: true,
                    onChanged: _onKeyTap,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: inputLabel[currentBase],
                      filled: true,
                      fillColor: colorScheme.surfaceVariant,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                DropdownMenu(
                  initialSelection: currentBase,
                  dropdownMenuEntries: listBases.map((String mode) {
                    return DropdownMenuEntry(
                      value: mode,
                      label: mode,
                    );
                  }).toList(),
                  onSelected: checkInputIsValid,
                  enableFilter: false,
                  enableSearch: false,
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget outputTextBaseList(ColorScheme colorScheme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Results",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            ...outputLabel.entries.map((entry) {
              final mode = entry.key;
              final title = entry.value;
              if (currentBase != mode) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _getConvertedValue(mode),
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }

  Widget baseConverterKeyboard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: 400,
          child: BaseConverterKeyboard(
            inputMode: currentBase,
            onKeyTap: _onKeyTap,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(t.tools.baseconverter.title),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        inputTextBaseDropdown(colorScheme),
                        const SizedBox(height: 16),
                        outputTextBaseList(colorScheme),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                baseConverterKeyboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}