import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectbarujihan/controllers/dua_controller.dart';
import 'package:projectbarujihan/screen_tiga.dart';

class screenDua extends StatelessWidget {
  const screenDua({super.key});

  @override
  Widget build(BuildContext context) {
    duaController screenDua = Get.put(duaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Dua'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          if (screenDua.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: screenDua.listdua.length,
              itemBuilder: (context, index) {
                final model = screenDua.listdua[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${model.firstname}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                  title: TextButton(
                      child: Text(
                        "${screenDua.listdua[index].createdAt}",
                      ),
                      onPressed: () {
                        screenDua.show.value = index;
                        Get.to(const screenTiga());
                      }),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (model.posts != null)
                        for (var post in model.posts!) Text('${post.title}')
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}