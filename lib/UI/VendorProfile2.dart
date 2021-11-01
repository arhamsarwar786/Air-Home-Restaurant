import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorProfile2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VendorProfile2();
}

class _VendorProfile2 extends State<VendorProfile2> {
  MyWidget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
  }




     //////////////
    //  TEXT EDITING CONTROLLER
    var campanyController = TextEditingController();
    var vatController = TextEditingController();
    var taxCodeController = TextEditingController();
    var legalAddressController = TextEditingController();
    var ownerNameController = TextEditingController();
    var pecController = TextEditingController();
    var sdiController = TextEditingController();
    var websiteURLController = TextEditingController();
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.VENDOR_PROFILE2_TITLE, () {
        // Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width + 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.height / 7),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.height / 7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 20.0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 150.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red, width: 1.0),
                                  color: Colors.black38,
                                  shape: BoxShape.circle),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ImageIcon(
                                  AssetImage("assets/images/camera.png"),
                                  color: Colors.red,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: _myWidget.myText("First Name", 20.0,
                                  FontWeight.bold, 1, Colors.black),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: _myWidget.myText(
                                  Constants.VENDOR_PROFILE2_TEXT2,
                                  15.0,
                                  FontWeight.bold,
                                  1,
                                  Colors.red),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: _myWidget.myText(
                                  Constants.VENDOR_PROFILE2_TEXT3,
                                  20.0,
                                  FontWeight.bold,
                                  1,
                                  Colors.black),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  Constants.VENDOR_PROFILE2_TEXT4,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                     
                            child: TextField(
                            autofocus: false,
                            controller: campanyController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD1_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                    ),
                  ),
                ),
                flex: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          
                                child: TextField(
                            autofocus: false,
                            controller: vatController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD2_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        
                                child: TextField(
                            autofocus: false,
                            controller: taxCodeController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD3_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        
                                child: TextField(
                            autofocus: false,
                            controller: legalAddressController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD4_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          
                                child: TextField(
                            autofocus: false,
                            controller: ownerNameController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD5_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        
                                child: TextField(
                            autofocus: false,
                            controller: pecController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD6_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                         
                                child: TextField(
                            autofocus: false,
                            controller: sdiController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD7_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      
                            child: TextField(
                            autofocus: false,
                            controller: websiteURLController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Constants.VENDOR_PROFILE2_TEXT_FIELD8_HINT,
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                    ),
                  ),
                ),
                flex: 1,
              ),
            ),
            InkWell(
              onTap: (){
                print("CLICKED on SAVe"); 
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        Constants.VENDOR_PROFILE2_BUTTON_MAIN,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
