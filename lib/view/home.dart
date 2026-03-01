import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humidity_pro/services/network_service.dart';


class Home extends StatelessWidget {
  Home({super.key});
  final NetworkController networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131e38),
      appBar: AppBar(
        backgroundColor: const Color(0xff131e38),
        elevation: 0,
        actions: [
          // On place la diode et le texte dans les actions de l'AppBar
          Obx(() => Row(
                children: [
                  Text(
                    networkController.isOnline.value ? "Online" : "Offline",
                    style: TextStyle(
                      color: networkController.isOnline.value ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildDiode(networkController.isOnline.value),
                  const SizedBox(width: 20), // Marge à droite
                ],
              )),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            fixedSize: const Size(290, 75),
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: const Color.fromARGB(255, 184, 218, 164),
            foregroundColor: Colors.black,
            elevation: 10,
          ),
          child: const Text("Crée un diagnostic"),
        ),
      ),
    );
  }

  // Diode plus petite (10x10)
 Widget _buildDiode(bool online) {
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: online ? Colors.green : Colors.red,
      boxShadow: [
        BoxShadow(
          // On remplace withOpacity(0.5) par withValues(alpha: 0.5)
          color: online 
              ? Colors.green.withValues(alpha: 0.5) 
              : Colors.red.withValues(alpha: 0.5),
          blurRadius: 5,
          spreadRadius: 1,
        ),
      ],
    ),
  );
}
}

