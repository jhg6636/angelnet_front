import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
      final newText = _format(newValue.text);

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }

  String _format(String s) {
    final n = int.tryParse(s.replaceAll(RegExp(r','), ''));
    return n?.toStringAsFixed(0)?.replaceAllMapped(RegExp(r'(?<=\d)(?=(\d\d\d)+(?!\d))'), (Match m) => ',') ?? '';
  }
}