import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projectbarujihan/controllers/satu_controller.dart';
import 'package:projectbarujihan/screen_dua.dart';

class screenSatu extends StatelessWidget {
  const screenSatu({super.key});

  @override
  Widget build(BuildContext context) {
    SatuController satuController = Get.put(SatuController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Satu'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(const screenDua());
                            },
                            child: const Text('Screen Dua')),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu),
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Obx(() => satuController.isloading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: satuController.listsatu.value.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                      '${satuController.listsatu.value[index].userId}'),
                ),
                title: Text('${satuController.listsatu.value[index].name}'),
                subtitle:
                Text('${satuController.listsatu.value[index].email}'),
              );
            })),
      ),
    );
  }
}
