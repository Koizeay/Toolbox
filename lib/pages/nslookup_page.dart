
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class NslookupPage extends StatefulWidget {
  const NslookupPage({ Key? key }) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${t.generic.app_name} - ${t.tools.nslookup.title}"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: t.tools.nslookup.enter_a_domain_name
                    ),
                    controller: _domainController,
                  ),
                ),
                ElevatedButton(
                    child: Text(t.tools.nslookup.lookup),
                    onPressed: () {
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
    );
  }
}