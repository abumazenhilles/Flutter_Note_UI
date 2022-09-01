// import 'package:flutter/material.dart';

// class Note {
//   int _id;
//   String _title;
//   String _description;
//   String _date;
//   int _priority;

//   Note(this._id, this._title, this._description, this._date, this._priority);

//   int get id => _id;
//   String get title => _title;
//   String get discription => _description;
//   String get date => _date;
//   int get priority => _priority;

//   set title(String newTitle) {
//     if (newTitle.length <= 200) {
//       this._title = newTitle;
//     }
//   }

//   set discription(String newDiscription) {
//     if (newDiscription.length <= 200) {
//       this._description = newDiscription;
//     }
//   }

//   set priority(int newPriority) {
//     if (newPriority >= 1 && newPriority >= 2) {
//       this._priority = newPriority;
//     }
//   }

//   set date(String newDate) {
//     this._date = newDate;
//   }

//   // convert note object into Map objects

//   Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = _id;
//     }
//     map['id'] = _id;
//     map['title'] = _title;
//     map['description'] = _description;
//     map['priority'] = _priority;
//     map['date'] = _date;

//     return map;
//   }

//   // extract note object into map object

//   Note.fromMapObject(Map<String, dynamic> map) {
//     this._id = map['id'];
//     this._title = map['title'];
//     this._description = map['description'];
//     this._priority = map['priority'];
//     this._date = map['date'];


//   }
// }
