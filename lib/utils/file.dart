import 'dart:io';

import 'package:path_provider/path_provider.dart';

// 파일 루트 경로 가져오기
Future<String> _localPath() async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

// 파일 위치 선정
Future<File> _localFile(String fileName) async {
  final path = await _localPath();
  return File("$path/$fileName");
}

// 파일 쓰기
Future<File> writeFile(String fileName, String content) async {
  final file = await _localFile(fileName);

  return file.writeAsString(content);
}

// 파일 읽기
Future<int> readFile(String fileName) async {
  try {
    final file = await _localFile(fileName);

    // Read the file.
    String contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0.
    return 0;
  }
}
