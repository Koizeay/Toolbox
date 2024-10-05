
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:toolbox/gen/strings.g.dart';

class YouTubeThumbnailPage extends StatefulWidget {
  const YouTubeThumbnailPage({ super.key });
  @override
  State<YouTubeThumbnailPage> createState() => _YouTubeThumbnailPage();
}

class _YouTubeThumbnailPage extends State<YouTubeThumbnailPage> {
  String videoId = "";

  Future<void> saveThumbnailToDisk() async {
    String url = "https://i3.ytimg.com/vi/$videoId/maxresdefault.jpg";

    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();

    if (response.statusCode != 200) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.youtubethumbnail.error.failed_to_download)
          )
        );
      }
      return;
    }

    Uint8List bytes = await consolidateHttpClientResponseBytes(response);

    final params = SaveFileDialogParams(data: bytes, fileName: "$videoId.jpg");
    final filePath = await FlutterFileDialog.saveFile(params: params);

    if (filePath != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.tools.youtubethumbnail.saved)
          )
        );
      }
    }

    httpClient.close();
  }

  String extractVideoIdFromYoutubeUrl(String url) {
    url = url.trim();
    try {
      Uri uri = Uri.parse(url);
      if (uri.host.contains("youtu.be")) {
        return uri.pathSegments.first;
      } else if (uri.host.contains("youtube.com")) {
        String? videoId = uri.queryParameters["v"];
        if (videoId != null) {
          return videoId;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.youtubethumbnail.title),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                              "https://i3.ytimg.com/vi/$videoId/maxresdefault.jpg",
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Theme.of(context).colorScheme.secondary,
                                  child: Center(
                                      child: Text(
                                        t.tools.youtubethumbnail.error.please_enter_a_video_id,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        )
                                      )
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.tools.youtubethumbnail.youtube_video_id,
                          ),
                          onChanged: (value) {
                            setState(() {
                              videoId = extractVideoIdFromYoutubeUrl(value);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              saveThumbnailToDisk();
                            },
                            child: Text(
                              t.tools.youtubethumbnail.save_thumbnail,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ),
                      )
                    ]
                )
            ),
          )
      ),
    );
  }
}