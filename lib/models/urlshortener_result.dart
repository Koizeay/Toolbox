import 'dart:core';

class UrlShortenerResult {
  String shortUrl;
  String qrBase64;
  String shortPath;
  String managementPassword;

  UrlShortenerResult({
    required this.shortUrl,
    required this.qrBase64,
    required this.shortPath,
    required this.managementPassword,
  });
}