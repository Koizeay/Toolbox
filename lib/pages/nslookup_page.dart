
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class NslookupPage extends StatefulWidget {
  const NslookupPage({ super.key });
  @override
  State<NslookupPage> createState() => _NslookupPage();
}

class _NslookupPage extends State<NslookupPage> {
  bool loading = false;
  List<String> _ipAddresses = [];
  final TextEditingController _domainController = TextEditingController();

  Future<List<String>> getIpAddresses(String domain) async {
    List<String> ipAddresses = (await InternetAddress.lookup(domain)).map((
        e) => e.address).toList();
    return ipAddresses;
  }

  @override
  void initState() {
    super.initState();
  }

  void lookup() {
    if (_domainController.text.isEmpty) {
      showOkTextDialog(context, t.generic.error, t.tools.nslookup.error.please_enter_a_domain_name);
      return;
    }
    setState(() {
      loading = true;
      _ipAddresses.clear();
    });
    getIpAddresses(_domainController.text).then((value) {
      setState(() {
        _ipAddresses = value;
        loading = false;
      });
    }).catchError((error) {
      setState(() {
        loading = false;
      });
      showOkTextDialog(context, t.generic.error, t.tools.nslookup.error.no_address_associated_with_domain);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(t.tools.nslookup.title),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: t.tools.nslookup.enter_a_domain_name
                      ),
                      controller: _domainController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          child: Text(t.tools.nslookup.lookup),
                          onPressed: () {
                            lookup();
                          }
                      ),
                    ),
                  ),
                  loading ? const Center(child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  )) :
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _ipAddresses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_ipAddresses[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}