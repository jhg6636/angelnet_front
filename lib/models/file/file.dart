import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:angelnet/utils/StringUtils.dart';
import 'package:file_picker/file_picker.dart';
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
    print(json);
    return File(
      id: json['id'],
      targetId: json['targetId'],
      targetType: FileTarget.fromEnglish(json['targetType']),
      name: json['fileName']
    );
  }

}

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

Future<http.StreamedResponse> uploadByteArray(Uint8List data, String name) async {
  var request = http.MultipartRequest("POST", StringUtils().stringToUri('/file'));
  request.files.add(http.MultipartFile(
    'file',
    http.ByteStream.fromBytes(data),
    data.length,
    filename: name,
  ));

  return await request.send();
}

Future<http.Response> postMetadata(File file) async {
  return await http.post(
    StringUtils().stringToUri('/file/meta'),
    body: jsonEncode({
      "id": file.id.toString(),
      "targetId": file.targetId.toString(),
      "targetType": file.targetType.english,
      "fileName": file.name,
    }),
    // headers: await StringUtils().header()
    headers: StringUtils.noAuthHeader
  );
}

void download(int id, String title) async {
  var metadata = await getMetadata(id);
  var ext = metadata.name.split(".").last;
  saveByteArrayAsFile(await downloadByteArray(id), "$title.$ext");
}

void upload(Uint8List bytes, File file) async {
  var response = await uploadByteArray(bytes, file.name);
  print(response.stream.bytesToString());
  print(response.statusCode);
  if (response.statusCode == 200) {
    var response2 = await postMetadata(file);
    print(response2.body);
  }
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

Future<File> getRecentFileMetadata(int documentId, FileTarget type) async {
  var response = await http.get(
      StringUtils().stringToUri("/document", params: {"documentId": documentId.toString(), "type": type.english}),
      headers: await StringUtils().header()
  );

  return File.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<File> getTemplateFileMetadata(int documentId) async {
  print(documentId);
  var response = await http.get(
      StringUtils().stringToUri("/document/template", params: {"documentId": documentId.toString()}),
      headers: await StringUtils().header()
  );

  print(response.body);

  return File.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<File> getSubmissionFileMetadata(int submissionId) async {
  var response = await http.get(
    StringUtils().stringToUri("/fund/document/submission/file", params: {"submissionId": submissionId.toString()}),
    headers: await StringUtils().header()
  );

  return File.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}