import 'dart:io';

import 'package:flutter/foundation.dart';

Future<void> downloadFile(String url, String filePath) async {
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  var file = File(filePath);
  await file.writeAsBytes(bytes);
}