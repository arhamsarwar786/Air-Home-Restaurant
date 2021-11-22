import 'dart:developer';
import 'dart:io';
import 'package:air_home_retaurant/Utils/BaseClass.dart';
import 'package:air_home_retaurant/Utils/CustomProgressDilogue.dart';
import 'package:air_home_retaurant/Utils/GlobalState.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:air_home_retaurant/ModelClasses/drop_down_model.dart';
import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VendorProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VendorProfile();
}

class _VendorProfile extends State<VendorProfile> {
  MyWidget _myWidget;
  TextEditingController payoffController,
      videoController,
      infoController,
      IBANController;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
    ListItem(5, "Fifth Item"),
    ListItem(6, "Sixth Item")
  ];

  ProgressDialog _progressDialog = ProgressDialog();


  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;


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
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;

    payoffController = new TextEditingController();
    videoController = new TextEditingController();
    infoController = new TextEditingController();
    IBANController = new TextEditingController();
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              listItem.name,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }




  /// Image Picker
  final picker = ImagePicker();
  File _image;
  bool isImageUploaded = false;
  String downloadUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myWidget.myAppBar(Constants.MY_PROFILE2_TITLE, () {
        Navigator.pop(context);
      }),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.width - 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(MediaQuery.of(context).size.height / 7),
                bottomRight:
                    Radius.circular(MediaQuery.of(context).size.height / 7),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
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
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${downloadUrl == null ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png' : downloadUrl}"),
                                      fit: BoxFit.cover)),                        
                              child: isImageUploaded
                                  ? CircularProgressIndicator(
                                      color: Colors.red,
                                    )
                                  : Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () {
                                          showMyDialogue(context: context);
                                        },
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/camera.png"),
                                          color: Colors.red,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: _myWidget.myText( "${GlobalState.myUser.data.nome}", 20.0,
                            FontWeight.bold, 1, Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: _myWidget.myText("Account Tipology", 18.0,
                            FontWeight.bold, 1, Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black12,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: _myWidget.myTextInput(payoffController, 1,
                                Constants.VENDOR_PROFILE_TEXT_FIELD1_HINT),
                          ),
                        ),
                        Container(
                          child: _myWidget.myText(Constants.VENDOR_PROFILE_TEXT,
                              8, FontWeight.bold, 2, Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: _myWidget.myTextInput(videoController, 1,
                                Constants.VENDOR_PROFILE_TEXT_FIELD2_HINT),
                          ),
                        ),
                        Container(
                          child: _myWidget.myText(
                              Constants.VENDOR_PROFILE_TEXT2,
                              8,
                              FontWeight.bold,
                              2,
                              Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: _myWidget.myTextInput(infoController, 1,
                          Constants.VENDOR_PROFILE_TEXT_FIELD3_HINT),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: _myWidget.myTextInput(IBANController, 1,
                                Constants.VENDOR_PROFILE_TEXT_FIELD4_HINT),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            child: _myWidget.myText(
                                Constants.VENDOR_PROFILE_TEXT3,
                                10,
                                FontWeight.bold,
                                2,
                                Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          child: Checkbox(
                            value: true,
                            activeColor: Colors.red,
                            onChanged: (bool value) {
                              /// manage the state of each value
                              setState(() {

                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: _myWidget.myText(
                                Constants.VENDOR_PROFILE_TEXT4, 12.0, FontWeight.bold, 2, Colors.black),
                            // child: Text(
                            //   title,
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      height: 2,
                      width: 100.0,
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      
                      print(payoffController.text);
                      print(videoController.text);
                      print(infoController.text);
                      print(IBANController.text);
                    },
                    child: Center(
                      child: Container(
                          width: 120.0,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF7878),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Text(
                              Constants.VENDOR_PROFILE_BUTTON1,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )),
                    ),
                  ),
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
                     BaseClass.showSB(
                              msg: Constants.SUCCESSFULLY_UPDATED,
                              context: context,
                              type: Constants.SUCCESS);
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
    );
  }


  
  ///  Upload An IMage
  showMyDialogue({@required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListView(
              shrinkWrap: true,
              children: [
                SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Camera'),
                    ),
                    onPressed: () {
                      selectOrTakePhoto(
                        context: context,
                        imageSource: ImageSource.camera,
                      );
                    }),
                Divider(
                  height: 5,
                ),
                SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Gallery'),
                    ),
                    onPressed: () {
                      selectOrTakePhoto(
                        context: context,
                        imageSource: ImageSource.gallery,
                      );
                    }),
              ],
            ),
          );
        });
  }

  /// Method for sending a selected or taken photo to the DialogBox
  Future selectOrTakePhoto({
    @required BuildContext context,
    @required ImageSource imageSource,
  }) async {
    var storage = FirebaseStorage.instance;
    picker.pickImage(source: imageSource, imageQuality: 10).then((value) async {
      isImageUploaded = true;
      setState(() {});
      Navigator.pop(context);
      // print("value Path = ${value.path}");
      if (value != null)
        _image = File(value.path);
      else {
        isImageUploaded = false;
        setState(() {});
      }
      print("Picture Path = $_image");
      if (_image != null) {
        // _progressDialog.showProgressDialog(context);
        String imageName =
            "AirHomeRestaurantUser_${GlobalState.userId}_Image.jpg";
        TaskSnapshot snapshot = await storage
            .ref()
            .child("${Constants.USER_PHOTOS}$imageName")
            .putFile(_image);
        if (snapshot.state == TaskState.success) {
          // _progressDialog.dismissProgressDialog(context);
          downloadUrl = await snapshot.ref.getDownloadURL();
          snapshot.ref.getMetadata().then((value) => print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& ${value.fullPath}"));
          isImageUploaded = false;
          setState(() {});
          log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%% URL = $downloadUrl');
          if (downloadUrl != null) {
            log('%%%%%%%%%%%%%%%%%%%%%%%%%%%% downloadUrl = $downloadUrl');
            // _progressDialog.dismissProgressDialog(context);

          } else {
            // _progressDialog.dismissProgressDialog(context);

            // _notification.error(
            // message: 'غير قادر على تحميل الصورة المصغرة', context: context);
            Navigator.pop(context);
          }
          // _progressDialog.dismissProgressDialog(context);

        } else {
          _progressDialog.dismissProgressDialog(context);
          Navigator.pop(context);
          print('Error from image repo ${snapshot.state.toString()}');
          throw ('This file is not an image');
        }
      }
    });
  }

}
