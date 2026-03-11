import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:humidity_pro/models/client.dart';
import 'package:humidity_pro/services/databases_services.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final _formKey = GlobalKey<FormState>();
  final _emailRegex = "";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String _phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    const myColor = Color.fromARGB(255, 184, 218, 164);

    return Scaffold(
      backgroundColor: const Color(0xff131e38),
      appBar: AppBar(
        title: const Text('Dossier Client', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff131e38),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Theme(
                // Applique le texte blanc et les bordures à tout le formulaire
                data: Theme.of(context).copyWith(
                  textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: myColor)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: myColor, width: 2)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [


                    IntlPhoneField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      dropdownTextStyle: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Numéro .tel',
                        border: OutlineInputBorder(),
                      ),
                      initialCountryCode: 'FR',
                      onChanged: (phone) {
                        _phoneNumber = phone.completeNumber;
                      },
                    ),


                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _nameController,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      maxLength: 40,
                      decoration: const InputDecoration(
                        label: Text("Nom du Client"),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir un nom client";
                        }
                        return null;
                      },
                    ),


                    TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 6) {
                          return "Veuillez saisir un email valide";
                        }
                        if (!RegExp(_emailRegex).hasMatch(value)) {
                          return 'Veuillez saisir un email valide';
                        }
                        
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),


                    FilledButton(
                      onPressed: () async {

                        if  ( _formKey.currentState!.validate()){
                          final newClient = Client(
                            
                            id: DateTime.now().millisecondsSinceEpoch,
                            name: _nameController.text,
                            phone: int.parse(_phoneNumber.replaceAll('+', '')),
                            email : _emailController.text,
  
                            );
                            
                            await DatabaseService.instance.insertClient(newClient);
                            final clients = await DatabaseService.instance.retrieveClients();
                          print("Base de données mise à jour : $clients");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Création du Dossier"))
                          );
                        }
                      },

                      style: FilledButton.styleFrom(
                        backgroundColor: myColor,
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text("Crée un dossier client"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}