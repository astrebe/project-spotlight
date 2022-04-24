import "package:flutter/material.dart";
import "RecalledProduct.dart";

class SpotlightViewFrame extends StatefulWidget {
  const SpotlightViewFrame({Key? key}) : super(key: key);

  @override
  _SpotlightViewFrameState createState() => _SpotlightViewFrameState();
}

class _SpotlightViewFrameState extends State<SpotlightViewFrame> {
  final List<RecalledProduct> testData = getTestData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Recall Products"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: const Center(
                  child: Text(
                "Recall Stage",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 15, 10),
                  height: 30,
                  width: 125,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Filter"),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))))),
                ),
                // Container(
                //   margin: const EdgeInsets.fromLTRB(15, 30, 30, 30),
                //   height: 30,
                //   width: 150,
                //   child: ElevatedButton(
                //       onPressed: () {}, child: const Text("Search")),
                // ),
              ],
            ),
            Expanded(
              //TODO: https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate-class.html <- Efficient use of display list
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 8,
                    );
                  },
                  itemCount: testData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: const Icon(Icons.code),
                        title: Text(testData[index].productName),
                        isThreeLine: true,
                        subtitle: Text(testData[index].hazType));
                  }),
            ),
          ],
        ));
  }
}
