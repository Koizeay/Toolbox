import 'package:http/http.dart' as http;

Future<http.Response> httpGet(String url, Map<String, String> params) async {
  String urlWithParams = url;
  if (params.isNotEmpty) {
    urlWithParams += "?";
    params.forEach((key, value) {
      key = Uri.encodeComponent(key);
      value = Uri.encodeComponent(value);
      urlWithParams += "$key=$value&";
    });
    urlWithParams = urlWithParams.substring(0, urlWithParams.length - 1);
  }
  return await http.get(Uri.parse(urlWithParams));
}