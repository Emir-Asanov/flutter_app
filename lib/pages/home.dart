import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String change = '';
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Записная Книга'),
        centerTitle: true,
        actions: [
          IconButton(iconSize: 35 ,icon: Icon(Icons.sticky_note_2), onPressed: () {
          Navigator.pushNamed(context, '/Note');
          })
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(key: Key(todoList[index]),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.teal, Colors.blueGrey])
                    ),
                    child: ListTile(
                        title: Text(todoList[index], style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        trailing: IconButton(icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              todoList.removeAt(index);
                            });
                          },
                        )
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                );
              })
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext) {
            return AlertDialog(
              title: Text('Add Element'),
              content: TextField(
                onChanged: (String value) {
                  setState(() {
                    change = value;
                  });
                },
              ),
              actions: [
                OutlinedButton(onPressed: () {
                  setState(() {
                    todoList.add(change);
                  });
                }
                    , child: Text('Добавить')),
                OutlinedButton(onPressed: () {
                  Navigator.of(context).pop();
                }
                    , child: Text('Закрыть'))
              ],
            );
          });
        },
        child:
        Icon(
          Icons.add_circle_outlined,
          color: Colors.green,
          size: 25,
        ),
      ),
    );
  }
}



