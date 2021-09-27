import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_rizaldi/api/Api_Surat.dart';

import 'package:webview_rizaldi/models/M_surat.dart';
import 'package:webview_rizaldi/widget/search_widget.dart';

class SuratAlquran extends StatefulWidget {
  @override
  SuratAlquranState createState() => SuratAlquranState();
}

class SuratAlquranState extends State<SuratAlquran> {
  List<Surat> surats = [];
  String query = '';
  Timer? debouncer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final surats = await SuratApi.getSurats(query);

    setState(() => this.surats = surats);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Surat Al-Quran'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: surats.length,
                itemBuilder: (context, index) {
                  final surat = surats[index];

                  return buildSurat(surat);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Surat',
        onChanged: searchSurat,
      );

  Future searchSurat(String query) async => debounce(() async {
        final surats = await SuratApi.getSurats(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.surats = surats;
        });
      });

  Widget buildSurat(Surat surat) => Card(
        child: ListTile(
          leading: Text(
            surat.asma,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              surat.nama,
              style: TextStyle(
                fontSize: 24,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          subtitle: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              surat.arti,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          trailing: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            child: Icon(Icons.music_note_sharp),
            onPressed: () {},
          ),
        ),
      );
}
