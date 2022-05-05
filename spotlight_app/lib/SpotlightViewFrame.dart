import "package:flutter/material.dart";
import 'package:spotlight_app/ApiService.dart';
import "RecalledProduct.dart";
import 'package:flutter/src/widgets/image.dart' as flutterImage;
import 'package:spotlight_app/IndividualProductFrame.dart';

class SpotlightViewFrame extends StatefulWidget {
  const SpotlightViewFrame({Key? key}) : super(key: key);

  @override
  _SpotlightViewFrameState createState() => _SpotlightViewFrameState();
}

class _SpotlightViewFrameState extends State<SpotlightViewFrame> {
  static const double tileHeight = 150;

  //final List<RecalledProduct> testData = getTestData();
  late Future<List<RecalledProduct>?> _dbFuture;
  late List<RecalledProduct>? _db = [];

  @override
  void initState() {
    super.initState();
    _dbFuture = ApiService().getProducts();
  }

  Widget _newRecallsText() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 35, 65, 8),
        child: const Text(
          "(0) New Recalls",
          style: TextStyle(fontSize: 18),
        ));
  }

  Widget _filterButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 30, 15, 10),
      height: 30,
      width: 130,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/filter");
          },
          child: Row(children: const <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 33),
                child: Icon(Icons.filter_list)),
            Text(
              "Filter",
              style: TextStyle(fontSize: 15),
            ),
          ]),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 153, 0, 0)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))))),
    );
  }

  Widget _dbListView() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 8,
          );
        },
        itemCount: 10, //TODO: Change to how long list is
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        color: const Color.fromARGB(255, 255, 255, 249),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 6)
                        ]),
                    height: tileHeight,
                    child: Row(
                      children: <Widget>[
                        _dbListViewImg(index),
                        Expanded(
                            child: Column(
                          children: <Widget>[
                            _dbListViewTitleText(index),
                            _dbListViewDescText(index)
                          ],
                        )),
                        _dbListViewArrow(index)
                      ],
                    ),
                  )));
        });
  }

  Widget _dbListViewImg(int index) {
    return (_db!.isEmpty == false && _db![index].images != null)
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: flutterImage.Image.network(
              _db![index].images![0].url!,
              height: tileHeight,
              width: 120,
            ),
          )
        : const Text("[Image not Provided]");
  }

  Widget _dbListViewTitleText(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        _db![index].title!,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _dbListViewDescText(int index) {
    return Flexible(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              _db![index].hazards![0].name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            )));
  }

  Widget _dbListViewArrow(int index) {
    return SizedBox(
      width: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              iconSize: 20,
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(255, 153, 0, 0)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IndividualProductFrame(_db![index])));
              }),
        ],
      ),
    );
  }

  Widget _viewFrame() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 0, 0),
          title: const Text("All Recall Products"),
        ),
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _newRecallsText(),
                _filterButton(),
              ],
            ),
            Expanded(
                //TODO: https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate-class.html <- Efficient use of display list use once Database
                child: _dbListView()),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecalledProduct>?>(
        future: _dbFuture,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              _db = snapshot.data;
              if (_db != null) {
                return _viewFrame();
              } else {
                return Container(width: 60, height: 60, color: Colors.black);
              }
            } else {
              return Container(width: 60, height: 60, color: Colors.black);
            }
          }

          //elseif(snapshot.hasError){}
          else {
            return const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}