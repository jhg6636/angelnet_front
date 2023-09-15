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

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // 숫자만 허용
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.length > 4) {
      // 첫 4자리와 그 다음의 2자리 사이에 - 추가
      newText = '${newText.substring(0, 4)}-${newText.substring(4)}';
    }
    if (newText.length > 7) {
      // 6자리와 그 다음의 2자리 사이에 - 추가
      newText = '${newText.substring(0, 7)}-${newText.substring(7)}';
    }
    if (newText.length > 10) {
      // 10자리를 넘어가는 경우 잘라냄
      newText = newText.substring(0, 10);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}