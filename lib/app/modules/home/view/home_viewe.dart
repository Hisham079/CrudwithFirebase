import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/app/modules/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  authController.signOut();
                },
                icon: Icon(Icons.login))
          ],
        ),
        body: Obx(
          () {
            final data = controller.productList;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                    child: ListTile(
                  title: Text(data[index].name),
                ));
              },
            );
          },
        ));
  }
}
