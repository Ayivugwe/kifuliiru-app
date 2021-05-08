import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:search_page/search_page.dart';

class KifuliiruNeKifuliiru extends StatefulWidget {
  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  var _amagambo = List<Igambo>();
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
                  color: Colors.white,
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

    igambo = new Igambo(
        0,
        'Mundu',
        'Umundu ali mundu 0 Umundu ali mundu 0 Umundu ali mundu 0 Umundu ali mundu 0 Umundu ali mundu 0',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        1,
        'Mundu',
        'Umundu ali mundu 1',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        2,
        'Mundu',
        'Umundu ali mundu 2',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        3,
        'Mundu',
        'Umundu ali mundu 3',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        4,
        'Mundu',
        'Umundu ali mundu 4',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        5,
        'Mundu',
        'Umundu ali mundu 4',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        6,
        'Mundu',
        'Umundu ali mundu 5',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);
    igambo = new Igambo(
        7,
        'Mundu',
        'Umundu ali mundu 6',
        'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
        '---',
        '---');
    _amagambo.add(igambo);

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 100.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Loza igambo mu Kifuliiru naho",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    'icons/flags/png/cd.png',
                    package: 'country_icons',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Center(
            child:
             Container(
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
