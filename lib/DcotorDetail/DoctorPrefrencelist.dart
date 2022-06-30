import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis/Controller/ProfileController.dart';
import 'package:flutter_apis/Model_Response/ProfileResponse.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PrefrenceInformation extends StatefulWidget {

  @override
  _PrefrenceInformationState createState() => _PrefrenceInformationState();
}

class _PrefrenceInformationState extends State<PrefrenceInformation> {
  final controller = ScrollController();
  final prefrencecontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Profile Information"),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),

        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (prefrencecontroller.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0.9,
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          mainAxisExtent: 300),
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: prefrencecontroller.PrefrenceList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNumber(index, prefrencecontroller.PrefrenceList);
                      }
                  );
              }),
            ),
          ],
        )
    );
  }
  Widget buildNumber(int indx, List<DoctorPreference> documentList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Container(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Document Name: " + prefrencecontroller.PrefrenceList[indx].districtCode.toString(),
                style: TextStyle(fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Document Type: " + prefrencecontroller.PrefrenceList[indx].districtName.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
