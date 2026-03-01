import 'package:flutter/material.dart';
import 'package:humidity_pro/models/task.dart';
import 'package:humidity_pro/services/database_service.dart';

class HomePasge extends StatefulWidget {
  const HomePasge({super.key});

  @override 
  State<HomePasge> createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePasge> {
  final DatabaseService _databaseService = DatabaseService.instance;


  String? _task = null;
  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
     
      floatingActionButton: _addTaskButton(),
      body:Column(
        children: [
          _createDiagnosticButton(),
          Expanded(child: _tasksList())
        ],
      )
     
    );
  }

  Widget _createDiagnosticButton(){
    return TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: () { },
  child: Text(''),
);
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context, 
          builder: (_) => AlertDialog(
            title: const Text('add task'),
            content : Column(
              mainAxisSize: MainAxisSize.min,
              children:
               [TextField(
                onChanged: (value)
                {
                  setState(() {
                    _task = value;
                  });
                },
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Trying Out",
                ),
               ),
                MaterialButton(
                color: Theme.of(context).colorScheme.primary, 
                onPressed: () {
                  if(_task == null || _task == "") return;
                  _databaseService.addTask(_task!);
                  setState(() {
                    _task=null;

                  });
                  Navigator.pop(context,
                  );
                },
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white
                   )
                  ),
                ),
              ],
            )
          ),
        );
      },
      child : const Icon(
        Icons.add,
        )
      );
  }
    Widget _tasksList(){
      return FutureBuilder(
      future: _databaseService.getTask(), 
      builder:(context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            Task task = snapshot.data![index];
            return ListTile(
              title: Text(
                task.content,
              )
            );
          },

        );
      }
    );
  }
}

