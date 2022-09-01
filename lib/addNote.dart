import 'package:flutter/material.dart';
import 'home.dart';
import 'sqldb.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  sqflitedb sqldb = sqflitedb();

  GlobalKey<FormState> form = GlobalKey();

  TextEditingController note =  TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add notes')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Form(
                  key: form,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: note,
                        decoration: const InputDecoration(
                          hintText: "note",
                        ),
                      ),
                      TextFormField(
                        controller: title,
                        decoration: const InputDecoration(
                          hintText: "title",
                        ),
                      ),
                      TextFormField(
                        controller: desc,
                        decoration: const InputDecoration(
                          hintText: "desc",
                        ),
                      ),
                      Container(height: 20),
                      MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          int response = await sqldb.insertData(
                            '''
                          INSERT INTO notes (`note`, `title`, `desc`) 
                          VALUES ("${note.text}", "${title.text}", "${desc.text}")
                          ''');
                          if (response > 0) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Home()),
                                (route) => false);
                          }
                        },
                        child: const Text("Add Note"),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
