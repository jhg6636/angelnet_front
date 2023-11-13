import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:angelnet/models/file/file_target.dart';

class File {

  final int id;
  final int targetId;
  final FileTarget targetType;
  final String name;
  final Uint8List data;

  const File({required this.id, required this.name, required this.data, required this.targetId, required this.targetType});

}

// todo download, upload api

void download(Uint8List data) async {
  saveByteArrayAsFile(data, 'test3.txt');
}

void saveByteArrayAsFile(Uint8List bytes, String fileName) {
  // uint8list -> blob 객체 -> 다운로드 링크 -> 다운로드
  html.Blob blob = html.Blob([bytes]);

  final url = html.Url.createObjectUrl(blob);
  final anchor = html.AnchorElement(href: url)
    ..target = 'download'
    ..download = fileName;

  html.document.body?.children.add(anchor);
  anchor.click();
  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}

Future<Uint8List> readByteArrayFromFile(html.File file) async {
  html.FileReader reader = html.FileReader();
  Completer<Uint8List> completer = Completer();

  reader.onLoadEnd.listen((event) {
    if (reader.readyState == html.FileReader.DONE) {
      Uint8List uint8list = Uint8List.fromList(reader.result as List<int>);

      completer.complete(uint8list);
    }
  });

  reader.readAsArrayBuffer(file);

  return completer.future;
}