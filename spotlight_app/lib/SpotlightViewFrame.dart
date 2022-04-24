import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "RecalledProduct.dart";

class SpotlightViewFrame extends StatefulWidget {
  const SpotlightViewFrame({Key? key}) : super(key: key);

  @override
  _SpotlightViewFrameState createState() => _SpotlightViewFrameState();
}

class _SpotlightViewFrameState extends State<SpotlightViewFrame> {
  static const double TILE_HEIGHT = 150;

  final List<RecalledProduct> testData = getTestData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 0, 0),
          title: const Text("All Recall Products"),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 204),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 35, 65, 8),
                    child: const Text(
                      "(0) New Recalls",
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 15, 10),
                  height: 30,
                  width: 130,
                  child: ElevatedButton(
                      onPressed: () {},
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))))),
                ),
              ],
            ),
            Expanded(
              //TODO: https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate-class.html <- Efficient use of display list use once Database
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 8,
                    );
                  },
                  itemCount: testData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 249),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 6)
                                  ]),
                              height: TILE_HEIGHT,
                              child: Row(
                                children: <Widget>[
                                  (testData[index].imgLoc != null)
                                      ? Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            testData[index].imgLoc!,
                                            height: TILE_HEIGHT,
                                            width: 120,
                                          ))
                                      : const Text("[Image not Provided]"),
                                  Expanded(
                                      child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        child: Text(
                                          testData[index].productName,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Flexible(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: Text(
                                                testData[index].hazType,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                              )))
                                    ],
                                  )),
                                  SizedBox(
                                    width: 30,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromARGB(255, 153, 0, 0),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )));
                  }),
            ),
          ],
        ));
  }
}
