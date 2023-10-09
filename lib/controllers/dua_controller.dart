import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as axios;
import '../models/model_dua.dart';

class duaController extends GetxController {
  static final duaController _instace =
  duaController._internal();

  factory duaController (){
    return _instace;
  }

  duaController._internal();

  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<ModelDua> listdua = RxList<ModelDua>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value == true;
      var res = await axios.get(Uri.parse(
          'https://mocki.io/v1/3ca9bbae-c017-4202-9f6e-2326db7c3d9f'));

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);

        for (Map<String, dynamic> i in content) {
          listdua.add(ModelDua.fromJson(i));
          print(listdua.length);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}