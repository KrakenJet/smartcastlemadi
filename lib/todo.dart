import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDo extends StatefulWidget {
  ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> notes = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNotesFromShared();
  }

  Future getNotesFromShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      notes = sp.getStringList('key_notes') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Заметки',
            style: TextStyle(fontSize: 26, color: Colors.white)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.amber,
                          child: SizedBox(
                            height: 150,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Вы точно хотите очистить весь список?',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            SharedPreferences sp =
                                                await SharedPreferences
                                                    .getInstance();

                                            setState(() {
                                              notes.clear();
                                              sp.setStringList(
                                                  'key_notes', notes);

                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text('да')),
                                      SizedBox(width: 30),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('нет'))
                                    ],
                                  )
                                ]),
                          ),
                        );
                      });
                },
                icon: Icon(Icons.delete)),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.amber,
                          child: SizedBox(
                            height: 100,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Вы точно хотите удалить?'),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sp =
                                              await SharedPreferences
                                                  .getInstance();

                                          setState(() {
                                            notes.removeAt(index);

                                            sp.setStringList(
                                                'key_notes', notes);

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration:
                                                        Duration(seconds: 5),
                                                    backgroundColor:
                                                        Colors.amber,
                                                    content: Text(
                                                        'Успешно удалено',
                                                        style: TextStyle(
                                                            fontSize: 20))));

                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text('да')),
                                    SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text('нет')),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        );
                      });
                },
                child: Text(notes[index], style: TextStyle(fontSize: 20))),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 2,
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            textController.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.amber,
                    child: SizedBox(
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(children: [
                          TextField(
                            controller: textController,
                          ),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () async {
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();

                                setState(() {
                                  if (textController.text != '') {
                                    notes.add(textController.text);

                                    sp.setStringList('key_notes', notes);
                                  }
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        action: SnackBarAction(
                                            label: 'Вернуть',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            }),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        duration: Duration(seconds: 5),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.amber,
                                        content: Center(
                                          child: Text('Успешно добавлено',
                                              style: TextStyle(fontSize: 10)),
                                        )));

                                Navigator.pop(context);
                              },
                              child: Text('Добавить')),
                        ]),
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}
