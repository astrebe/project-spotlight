import "package:flutter/material.dart";
import 'package:spotlight_app/ApiService.dart';
import 'package:spotlight_app/SpotlightFilterView.dart';
import 'RecalledProductDatabase.dart';
import 'package:flutter/src/widgets/image.dart' as flutter_image;
import "IndividualProductFrame.dart";
import 'DatabaseStorage.dart';

class SpotlightViewFrame extends StatefulWidget {
  const SpotlightViewFrame({Key? key, this.dbURL, this.barTitle})
      : super(key: key);

  final String? dbURL;
  final String? barTitle;

  @override
  _SpotlightViewFrameState createState() => _SpotlightViewFrameState();
}

class _SpotlightViewFrameState extends State<SpotlightViewFrame> {
  static const double tileHeight = 200;

  //final List<RecalledProduct> testData = getTestData();
  // late Future<List<RecalledProduct>?> _dbFuture;
  // late List<RecalledProduct>? _db = [];
  late Future<RecalledProductDB> _dbFuture;
  late RecalledProductDB? _db = RecalledProductDB();

  @override
  void initState() {
    super.initState();
    _dbFuture = _grabFromCacheOrApi();
  }

  Future<RecalledProductDB> _grabFromCacheOrApi() async {
    if (widget.dbURL != null) {
      return ApiService().getProductsFromURL(widget.dbURL!);
    } else if (await DatabaseStorage().dbCacheExists()) {
      return DatabaseStorage().readFileIfUpdated();
    } else {
      return ApiService().getProducts();
    }
  }

  String? _titleFormatting(int index) {
    String? title;

    if (_db?.prodList[index].title!.contains(" Due to ")) {
      title = _db?.prodList[index].title!.split(" Due to ")[0];
      if (title!.contains(" (Recall Alert)")) {
        title = title.split(" (Recall Alert)")[0];
      }
    }

    if (title == null) {
      if (_db?.prodList[index].title!.contains(" (Recall Alert)")) {
        title = _db?.prodList[index].title!.split(" (Recall Alert)")[0];
      }
    }

    return title;
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
            //Navigator.pushNamed(context, "/filter");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SpotlightFilterView(
                          hazards: _db!.uniqueHazards,
                          categories: _db!.uniqueCategories,
                        )));
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
    return ListView.builder(
        // separatorBuilder: (BuildContext context, int index) {
        //   return Container(
        //     height: 8,
        //   );
        // },
        itemCount: _db?.prodList.length,
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
                          mainAxisAlignment: MainAxisAlignment.start,
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
    return (_db?.prodList.isEmpty == false &&
            _db?.prodList[index].images != null)
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: flutter_image.Image.network(
              _db?.prodList[index].images![0].url!,
              height: tileHeight,
              width: 120,
            ),
          )
        : const Text("[Image not Provided]");
  }

  Widget _dbListViewTitleText(int index) {
    String? title = _titleFormatting(index);

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          (title != null) ? title : _db?.prodList[index].title!,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ),
    );
  }

  Widget _dbListViewDescText(int index) {
    String? dueTo;
    if (_db?.prodList[index].title!.contains(" Due to ")) {
      dueTo = _db?.prodList[index].title!.split(" Due to ")[1];
      if (dueTo!.contains(" (Recall Alert)")) {
        dueTo = dueTo.split(" (Recall Alert)")[0];
      }
    }

    if (dueTo != null && dueTo.contains("; ")) {
      dueTo = dueTo.split("; ")[0];
    }

    return Flexible(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.grey),
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Due to: ",
                    ),
                    TextSpan(
                      text: (dueTo != null)
                          ? dueTo
                          : _db?.prodList[index].hazards![0].name!,
                    )
                  ]),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            )
            //Text((dueTo != null) ? dueTo : _db.prodList[index].hazards![0].name!)
            ));
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
                            IndividualProductFrame(_db?.prodList[index])));
              }),
        ],
      ),
    );
  }

  Widget _viewFrame(bool data) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 0, 0),
          title: widget.barTitle == null ? const Text("All Recall Products") : Text(widget.barTitle!),
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
                child: data ? _dbListView() : const Text("No results")
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecalledProductDB?>(
        future: _dbFuture,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              _db = snapshot.data;
              if (_db!.length != 0) {
                return _viewFrame(true);
              } else {
                return _viewFrame(false);
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
