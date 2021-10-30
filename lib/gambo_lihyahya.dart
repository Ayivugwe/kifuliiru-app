import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';

class GamboLihyahya extends StatelessWidget {
  get database => null;

  @override
  Widget build(BuildContext ctxt) {
    final _formKey = GlobalKey<FormState>();
    final txtControllerKifuliiru = TextEditingController(),
        txtControllerKifuliiruKifuliiru = TextEditingController(),
        txtControllerKifuliiruKiswahili = TextEditingController(),
        txtControllerKifuliiruKifaransa = TextEditingController(),
        txtControllerKifuliiruKingereza = TextEditingController();

    Database database;
    String table = "Magambo_ge_Kifuliiru";

    Igambo igambo;
    var listOfLanguages = <String>['1', '2', '3', '4'];
    List<Igambo> listeMagmbo = [];
    String gamboMuKifuliiru,
        gamboKifuliiruKifuliiru,
        gamboKifuliiruKiswahili,
        gamboKifuliiruKifaransa,
        gamboKifuliiruKingereza;

    //['Kifuliiru', 'Kiswahili', 'Kifaransa', 'Kingereza']

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gambo lihyahya"),
      ),
      body: new Center(
        child: Column(children: [
          Card(
            child: Text(
                'Muyegerere! Mugweti igambo lihyahya kwandi li isobaanuro? Mutumenyeese hano ku namuyeeholo witu.'),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 5,
                  controller: txtControllerKifuliiru,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 5,
                  autocorrect: false,
                  expands: true,
                  showCursor: true,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  controller: txtControllerKifuliiruKifuliiru,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 5,
                  autocorrect: false,
                  expands: true,
                  showCursor: true,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  controller: txtControllerKifuliiruKiswahili,
                ),
                TextField(
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    autocorrect: false,
                    expands: true,
                    showCursor: true,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    controller: txtControllerKifuliiruKifaransa),
                TextField(
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    autocorrect: false,
                    expands: true,
                    showCursor: true,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    controller: txtControllerKifuliiruKingereza),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      /* var db =
                          await openDatabase('assets/database/kifuliiru.db');

                      await db.close(); */

                      // Get a location using getDatabasesPath
                      var databasesPath = await getDatabasesPath();
                      String path =
                          join(databasesPath, 'assets/database/kifuliiru.db');

                      // Delete the database
                      await deleteDatabase(path);

                      // open the database
                      database = await openDatabase(path, version: 1,
                          onCreate: (Database db, int version) async {
                        // When creating the db, create the table
                        await db.execute(
                            'CREATE TABLE Magambo_ge_Kifuliiru (id INTEGER PRIMARY KEY, kifuliiru TEXT, kifuliiru_kifuliiru TEXT, kifuliiru_kiswahili TEXT, kifuliiru_kifaransa TEXT, kifuliiru_kingereza TEXT)');
                      });

                      gamboMuKifuliiru = txtControllerKifuliiru.text;
                      gamboKifuliiruKifuliiru =
                          txtControllerKifuliiruKifuliiru.text;
                      gamboKifuliiruKiswahili =
                          txtControllerKifuliiruKiswahili.text;
                      gamboKifuliiruKifaransa =
                          txtControllerKifuliiruKifaransa.text;
                      gamboKifuliiruKingereza =
                          txtControllerKifuliiruKingereza.text;

                      igambo = new Igambo(
                          id: 1.toString(),
                          igamboMuKifuliiru: gamboMuKifuliiru,
                          sobanuuroYalyoMuKifuliiru: gamboKifuliiruKifuliiru,
                          sobanuuroYalyoMuKiswahili: gamboKifuliiruKiswahili,
                          sobanuuroYalyoMuKifaransa: gamboKifuliiruKifaransa,
                          sobanuuroYalyoMuKingereza: gamboKifuliiruKingereza);

                      insertData(
                          gamboMuKifuliiru,
                          gamboKifuliiruKifuliiru,
                          gamboKifuliiruKiswahili,
                          gamboKifuliiruKifaransa,
                          gamboKifuliiruKingereza);

                      listeMagmbo.add(igambo);

                      // Close the database
                      await database.close();
                    },
                    child: Text('Bika'))
              ],
            ),
          )
        ]),
      ),
    );
  }

  insertData(
      String kifuliiru,
      String kifuliiruKifuliiru,
      String kifuliiruKiswahili,
      String kifuliiruKifaransa,
      String kifuliiruKingereza) async {
    // Insert some records in a transaction
    await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Magambo_ge_Kifuliiru(kifuliiru, kifuliiru_kifuliiru, kifuliiru_kiswahili, kifuliiru_kifaransa, kifuliiru_kingereza) VALUES($kifuliiru, $kifuliiruKifuliiru, $kifuliiruKiswahili,$kifuliiruKifaransa,$kifuliiruKingereza)');
      print('inserted1: $id');
    });
  }

  updateData(int id, String kifuliiru, String kifKif, String kifKiswah,
      String kifKifar, String kifKinge) async {
// Update some record
    int count = await database.rawUpdate(
        'UPDATE Magambo_ge_Kifuliiru SET kifuliiru = ?, kifuliiru_kifuliiru = ?, kifuliiru_kiswahili = ?, kifuliiru_kifaransa = ?, kifuliiru_kingereza = ?  WHERE id = ?',
        ['$kifuliiru', '$kifKif', '$kifKiswah', '$kifKifar', '$kifKinge']);
    print('updated: $count');
  }

  getRecords() async {
// Get the records
    List<Map> list =
        await database.rawQuery('SELECT * FROM Magambo_ge_Kifuliiru');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);
    assert(const DeepCollectionEquality().equals(list, expectedList));
  }

  countValue() async {
// Count the records
    int count = Sqflite.firstIntValue(
        await database.rawQuery('SELECT COUNT(*) FROM Magambo_ge_Kifuliiru'));
    assert(count == 2);
  }

  deleteData() async {
// Delete a record
    int count = await database.rawDelete(
        'DELETE FROM Magambo_ge_Kifuliiru WHERE name = ?', ['another name']);
    assert(count == 1);
  }
}
