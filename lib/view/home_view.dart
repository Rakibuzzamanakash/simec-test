import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semic/model_view/testdata_model_view.dart';

import '../data/response/status.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TestDataController testDataController = Get.put(TestDataController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              onChanged: (value) => testDataController.testDataSearchApi(value),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            Obx(() {
              switch (testDataController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(
                    child: Text('Searching data'),
                  );
                case Status.ERROR:
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                case Status.COMPLETED:
                  return testDataController.searchDataList.value.items!.isEmpty
                      ? const Center(child: Text("No data found"),)
                      : Expanded(
                      child: ListView.builder(
                           itemCount:testDataController.searchDataList.value.items!.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              title: Text(testDataController.searchDataList.value.items![index].name.toString()),
                              subtitle: Text(testDataController.searchDataList.value.items![index].fullName.toString()),
                            );
                          }
                      ));
              }
            })
          ],
        ),
      ),
    );
  }
}
