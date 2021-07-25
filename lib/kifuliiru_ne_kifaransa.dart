import 'package:flutter/material.dart';
import 'igambo.dart';

class KifuliiruNeKifaransa extends StatefulWidget {
  @override
  _KifuliiruNeKifaransaState createState() => _KifuliiruNeKifaransaState();
}

class _KifuliiruNeKifaransaState extends State<KifuliiruNeKifaransa> {
  var _amagambo;
  var igambo;

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
                        onTap: () {},
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
