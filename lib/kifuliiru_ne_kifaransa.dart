import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class KifuliiruNeKifaransa extends StatefulWidget {
  @override
  _KifuliiruNeKifaransaState createState() => _KifuliiruNeKifaransaState();
}

class _KifuliiruNeKifaransaState extends State<KifuliiruNeKifaransa> {
  var _amagambo;
  var igambo;

  void displayBottomSheet(BuildContext context, int index) {
    showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return Container(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                  )),
              height: 600.0, //MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.network(
                        _amagambo[index].sobanuuroYalyo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Text(
                        _amagambo[index].igamboMuKifuliiru,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        _amagambo[index].sobanuuroYalyo,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {}, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.volume_up), // icon
                              Text("Yuvwa izu"), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _amagambo.clear();

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Kifuliiru - Kifaransa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    'icons/flags/png/fr.png',
                    package: 'country_icons',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Center(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _amagambo.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.blue))),
                          child: Icon(Icons.book, color: Colors.grey),
                        ),
                        title: Text(
                          _amagambo[index].igamboMuKifuliiru,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(_amagambo[index].sobanuuroYalyo,
                                      style: TextStyle(color: Colors.black))),
                            )
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black, size: 30.0),
                        onTap: () {
                          displayBottomSheet(context, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
