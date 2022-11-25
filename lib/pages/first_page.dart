import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trytolearn/controller/tap_controller.dart';

import '../model/brand_model.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();

    TapController controller = Get.put(TapController());
    return Scaffold(
      body: GetBuilder<TapController>(builder: (controller) {
        return FutureBuilder(builder: (context, snapshot) {
          return Container(
            child: ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                Brand brand = controller.productList[index];
                return Card(
                  child: ListTile(
                    title: Text(brand.id.toString()),
                    subtitle: Text(brand.name),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                            _nameController.text = brand.name;
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelText: "name"
                                      ),
                                    ),
                                    ElevatedButton(onPressed: () async {
                                      String name = _nameController.text;
                                     await controller.updateBrand(brand.id, jsonEncode({"name":name}));
                                      Navigator.of(context).pop();
                                    }, child: Text("Update"))
                                  ],
                                ),
                              );
                            },);
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: () {
                            controller.deleteBrand(brand.id);
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                );
              },),
          );
        },);
      },),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "name"
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    String name = _nameController.text;
                    controller.save(jsonEncode(<String, dynamic >{"name":name}));
                    Navigator.of(context).pop();
                  }, child: Text("Create"))
                ],
              ),
            );
          },);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
