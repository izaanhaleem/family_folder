import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis/Controller/ProfileController.dart';
import 'package:flutter_apis/Model_Response/ProfileResponse.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CompleteProfile extends StatefulWidget {
  final Widget? child;
   CompleteProfile({Key? key, this.child}) : super(key: key);
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final controller = ScrollController();
  final completeProfilecontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: 10.0,),
            DocumentInformation(),
          SizedBox(height: 10.0,),
          PrefrenceInformation()
        ],
      ),
    );
  }
  Widget DocumentInformation(){
    return Container(
      child:  Obx((){
        if (completeProfilecontroller.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
       /*       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0.9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisExtent: 300),*/
              controller: controller,
              shrinkWrap: true,
              itemCount: completeProfilecontroller.DocumnetList.length,
              itemBuilder: (BuildContext context, int index) {
                return completeDocument(index, completeProfilecontroller.DocumnetList);
              }
          );
      })
    );
  }

  Widget PrefrenceInformation(){
    return Container(
        child:  Obx((){
          if (completeProfilecontroller.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else
            return ListView.builder(
             /*   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.9,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisExtent: 300),*/
                controller: controller,
                shrinkWrap: true,
                itemCount: completeProfilecontroller.PrefrenceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return completeprefrence(index, completeProfilecontroller.PrefrenceList);
                }
            );
        })
    );
  }
  // Show Prefrence List;
  Widget completeprefrence(int indx, List<DoctorPreference> documentList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Container(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "District Name: " + completeProfilecontroller.PrefrenceList[indx].districtName.toString(),
                style: TextStyle(fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Show Document List;
  Widget completeDocument(int indx, List<DoctorDocument> documentList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Container(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Document Name: " + completeProfilecontroller.DocumnetList[indx].documentName.toString(),
                style: TextStyle(fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Document Type: " + completeProfilecontroller.DocumnetList[indx].filePath.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
