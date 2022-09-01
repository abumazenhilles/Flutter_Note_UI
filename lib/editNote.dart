import 'package:flutter/material.dart';
import 'home.dart';
import 'sqldb.dart';

class EditNote extends StatefulWidget {
  final note;
  final title;
  final id;
  final desc;
  const EditNote({Key? key, this.note, this.title, this.id, this.desc})
      : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  sqflitedb sqldb = sqflitedb();

  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  void initState() {
    note.text = widget.note;
    title.text = widget.title;
    desc.text = widget.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit notes')),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: note,
                        decoration: InputDecoration(
                          hintText: "note",
                        ),
                      ),
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          hintText: "title",
                        ),
                      ),
                      TextFormField(
                        controller: desc,
                        decoration: InputDecoration(
                          hintText: "desc",
                        ),
                      ),
                      Container(height: 20),
                      MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          int response = await sqldb.updateData('''
                            UPDATE notes SET 
                            note = "${note.text}", 
                            title = "${title.text}", 
                            color = "${desc.text}"
                            WHERE id = ${widget.id}
                              ''');
                          if (response > 0) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Home()),
                                (route) => false);
                          }
                        },
                        child: Text("Add Note"),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
