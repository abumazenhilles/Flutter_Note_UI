import 'package:flutter/material.dart';
import 'addNote.dart';
import 'sqldb.dart';
import 'editNote.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeDBState();
}

class _HomeDBState extends State<Home> {
  sqflitedb sqldb = sqflitedb();
  bool isLoading = true;
  List notes = [];

  Future readData() async {
    List<Map> response = await sqldb.readData("SELECT * FROM notes");
    notes.addAll(response);
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }
  

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App in sqflite')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addNote");
        },
        child: Icon(Icons.add),
      ),
      body: isLoading == true
          ? Center(child: Text('Loading'))

          : Container(
              child: ListView(
                children: [
                  MaterialButton(
                    onPressed: ()  {
                   //   await sqldb.mydeleteDatabase();
                    },
                    child: const Text("Delete DataBase"),
                  ),
                  ListView.builder(
                      itemCount: notes.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Card(
                            child: ListTile(
                                title: Text("${notes[i]['title']}"),
                                subtitle: Text("${notes[i]['note']}"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          int response = await sqldb.deleteData(
                                              "DELETE FROM notes WHERE id = ${notes[i]['id']}");
                                          if (response > 0) {
                                            notes.removeWhere((element) =>
                                                element['id'] ==
                                                notes[i]['id']);
                                            setState(() {});
                                          }
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red)),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => EditNote(
                                                desc: notes[i]['desc'],
                                                note: notes[i]['note'],
                                                title: notes[i]['title'],
                                                id: notes[i]['id'],
                                              )),
                                            );
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.blue)),
                                  ],
                                )));
                      })
                ],
              ),
            ),
    );
  }
}
