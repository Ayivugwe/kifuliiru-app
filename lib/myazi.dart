import 'package:flutter/material.dart';

class Myazi extends StatefulWidget {
  const Myazi({Key? key}) : super(key: key);

  @override
  _MyaziState createState() => _MyaziState();
}

class _MyaziState extends State<Myazi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myazi mu Kifuliiru'),
      ),
      body: Center(
          child: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 300,
              width: MediaQuery.of(context).size.width / 2,
              child: PageView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            top: 20,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/kifuliiru.png'),
                          ),
                          Positioned(
                            bottom: 40,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite),
                                  Icon(Icons.share),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            top: 20,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/kifuliiru.png'),
                          ),
                          Positioned(
                            bottom: 40,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite),
                                  Icon(Icons.share),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            top: 20,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/kifuliiru.png'),
                          ),
                          Positioned(
                            bottom: 40,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite),
                                  Icon(Icons.share),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            top: 20,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/kifuliiru.png'),
                          ),
                          Positioned(
                            bottom: 40,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite),
                                  Icon(Icons.share),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            top: 20,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/kifuliiru.png'),
                          ),
                          Positioned(
                            bottom: 40,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite),
                                  Icon(Icons.share),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            top: 20,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/kifuliiru.png'),
                          ),
                          Positioned(
                            bottom: 40,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.favorite),
                                  Icon(Icons.share),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            trailing: Icon(Icons.details),
            title: Text('Itwe lyo\' mwazi'),
            subtitle: Text('Umwazi munini'),
            dense: true,
            onLongPress: () {},
            onTap: () {},
          )
        ],
      )),
    );
  }
}
