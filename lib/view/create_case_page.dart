import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}


class _SecondRouteState extends State<SecondRoute> {


 final _formKey = GlobalKey<FormBuilderState>();

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Second Route')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: FormBuilderTextField(
              name: 'text',
              decoration: const InputDecoration(labelText: 'Votre message'),
              onChanged: (val) => print(val),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Go back!'),
          ),
        ],
      ),
    ),
  );
}

}
