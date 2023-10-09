import 'dart:convert';
import 'package:get/get.dart';
import 'package:projectbarujihan/models/model_satu.dart';
import 'package:http/http.dart' as http;

class SatuController extends GetxController {

  RxBool isloading = false.obs;

  Rx<List<ModelSatu>> listsatu = Rx<List<ModelSatu>>([]);


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isloading.value = true;
      var response = await http.get(Uri.parse('https://mocki.io/v1/d08be6d1-e803-40f6-876a-c93e0425c2dc'));

      if (response.statusCode == 200) {
        isloading.value = false;
        final content = jsonDecode(response.body);

        for (Map<String, dynamic> i in content) {
          listsatu.value.add(ModelSatu.fromJson(i));
          print(listsatu.value.length);
        }
      } else {
        isloading.value = false;
        print('ada kesalahan');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
