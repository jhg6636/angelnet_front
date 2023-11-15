import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:angelnet/utils/StringUtils.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:angelnet/models/file/file_target.dart';

class File {

  final int id;
  final int targetId;
  final FileTarget targetType;
  final String name;

  const File({required this.id, required this.name, required this.targetId, required this.targetType});

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      id: int.parse(json['id']),
      targetId: int.parse(json['targetId']),
      targetType: FileTarget.fromEnglish(json['targetType']),
      name: json['name']
    );
  }

}

// todo download, upload api
Future<Uint8List> downloadByteArray(int id) async {
  var response = await http.get(
    StringUtils().stringToUri('/file', params: {"fileId": id.toString()}),
    headers: await StringUtils().fileHeader()
  );
  
  return response.bodyBytes;
}

Future<File> getMetadata(int id) async {
  var response = await http.get(
    StringUtils().stringToUri('/file/meta', params: {"fileId": id.toString()}),
    headers: await StringUtils().header()
  );

  return File.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<http.Response> uploadByteArray(Uint8List data) async {
  return await http.post(
    StringUtils().stringToUri('/file', params: {"file": data}),
    headers: await StringUtils().fileHeader()
  );
}

Future<http.Response> postMetadata(File file) async {
  return await http.post(
    StringUtils().stringToUri(
      '/file/meta',
      params: {
        "id": file.id.toString(),
        "targetId": file.targetId.toString(),
        "targetType": file.targetType.english,
        "fileName": file.name,
      }
    )
  );
}

void download(int id) async {
  var metadata = await getMetadata(id);

  saveByteArrayAsFile(await downloadByteArray(id), metadata.name);
}

void upload(Uint8List bytes, File file) async {
  var response = await uploadByteArray(bytes);
  if (response.statusCode == 200) await postMetadata(file);
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