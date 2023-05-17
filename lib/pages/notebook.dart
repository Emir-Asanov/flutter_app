import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}
  String _userText = '';
  TextEditingController _userTextCont = TextEditingController(text: '');
class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Блокнот'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {setState(() {
            _userTextCont = TextEditingController(text: _userText);
          });}, icon: Icon(Icons.save_as))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: TextField(
          controller: _userTextCont,
          expands: true,
          maxLines: null,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          onChanged: (userText) {
            _userText = userText;
          },
        ),
      ),
    );
  }
}
