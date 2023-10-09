import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/dua_controller.dart';

class screenTiga extends StatelessWidget {
  const screenTiga({super.key});

  @override
  Widget build(BuildContext context) {
    duaController screenTiga = Get.put(duaController());
    var show = screenTiga.show.value;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() => screenTiga.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: screenTiga.listdua[show].posts?.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                    "${screenTiga.listdua[show].posts?[i].id}"),
              ),
              title: Text(
                  "${screenTiga.listdua[show].posts?[i].title}"),
              subtitle: Text(
                  "${screenTiga.listdua[show].posts?[i].content}"),
            );
          },
        )),
      ),
    );
  }
}