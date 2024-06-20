import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ease/app/modules/auth/controllers/auth_controller.dart';
import 'package:test_ease/app/modules/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
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
