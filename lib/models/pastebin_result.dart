import 'dart:core';

class PastebinResult {
  String shortUrl;
  String qrBase64;
  String shortPath;
  String managementPassword;

  PastebinResult({
    required this.shortUrl,
    required this.qrBase64,
    required this.shortPath,
    required this.managementPassword,
  });
}