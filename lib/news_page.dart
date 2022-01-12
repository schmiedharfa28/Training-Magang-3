import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_training3/constant.dart';
import 'package:flutter_training3/detailpage.dart';
import 'package:flutter_training3/res_get_berita.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Datum> listBerita = []; //berita = datum

  Future getListBerita() async {
    //menandakannya asyncronuse biasanya untuk ngeload data yg agak lama jadi butuh waktu
    var res = await http
        .get(Uri.parse("http://192.168.10.17/berita_news/getBerita.php"));
    setState(() {
      listBerita = resGetBeritaFromJson(res.body).data!;
    });
    // log('data ${resGetBeritaFromJson(res.body).data!.toList()[0].toJson()}');
    return resGetBeritaFromJson(res.body).data;
  }

  @override
  void initState() {
    getListBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //     body: FutureBuilder(
        //   future: getListBerita(),
        //   builder: (context, snapshoot) {
        //     if (snapshoot.hasError) {
        //       return Center(
        //         child: Text('${snapshoot.error.toString()}'),
        //       );
        //     } else if (snapshoot.hasData) {
        //       return ItemList(list: snapshoot.data ??);
        //     } else {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ));
        body: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
            items: listBerita.map((e) {
              return Image.network('$ImageUrl' + e.gambarBerita!);
            }).toList(),
            options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listBerita.length,
              itemBuilder: (context, index) {
                Datum data = listBerita[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(data)));
                    },
                    title: Text(
                      '${data.judulBerita}',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    subtitle: Text(
                      '${data.isiBerita}',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network('$ImageUrl' + data.gambarBerita!,
                              width: 100, height: 100, fit: BoxFit.cover)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

// class ItemList extends StatelessWidget {
//   final List<Datum>? list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: Text('${list?.toList()[0].toJson()}'),
//     );
//   }
// }
