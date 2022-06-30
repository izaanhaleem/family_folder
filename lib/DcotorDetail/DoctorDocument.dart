import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis/Controller/ProfileController.dart';
import 'package:flutter_apis/Model_Response/ProfileResponse.dart';
import 'package:get/get.dart';

class DocumentInformation extends StatefulWidget {

  @override
  _DocumentInformationState createState() => _DocumentInformationState();
}

class _DocumentInformationState extends State<DocumentInformation> {
  final controller = ScrollController();
  final documentcontroller = Get.put(ProfileController());

  @override
  void initState() {
  }
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
            if (documentcontroller.isLoading.value)
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
                itemCount: documentcontroller.DocumnetList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildNumber(index, documentcontroller.DocumnetList);
                  }
              );
            }),
          ),
        ],
      )
    );
  }
  Widget buildNumber(int indx, List<DoctorDocument> documentList) {
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
                "Document Name: " + documentcontroller.DocumnetList[indx].documentName.toString(),
                style: TextStyle(fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Document Type: " + documentcontroller.DocumnetList[indx].filePath.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




