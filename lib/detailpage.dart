import 'package:flutter/material.dart';
import 'package:flutter_training3/constant.dart';
import 'package:flutter_training3/res_get_berita.dart';

class DetailPage extends StatelessWidget {
  final Datum data;
  DetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network('$ImageUrl' + data.gambarBerita!)),
            Text(
              '${data.judulBerita}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('${data.isiBerita}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify)
          ],
        ),
      ),
    );
  }
}
