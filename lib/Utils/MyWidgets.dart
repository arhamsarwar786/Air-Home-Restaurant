import 'package:air_home_retaurant/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyWidget {
  MyWidget();

  Widget myAppBar(String text, Function() clickListener) {
    return new AppBar(
      centerTitle: true,
      backgroundColor: Colors.red,
      leading: GestureDetector(
        onTap: clickListener,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset("assets/images/left-arrow.png"),
        )),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget btnMain(String text, Function() clickListener) {
    return GestureDetector(
      onTap: () {
        clickListener();
      },
      child: Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/right-chevron.png"),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget selectCategory(String text, Function() clickListener) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                text,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 30.0,
            width: 100.0,
            child: GestureDetector(
              onTap: () {
                clickListener();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFF7878),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      Constants.SELECT,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget myTextInput(
      TextEditingController controller, int lines, String hintText) {
    return TextField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: lines,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget myText(String text, double fontSize, FontWeight weight, int lines,
      Color colorVal , [overflow]) {
    return Text(
      
      text,
      maxLines: lines,
      style: TextStyle(
        overflow: overflow,
        color: colorVal,
        fontSize: fontSize,
        fontWeight: weight,
      ),
    );
  }

  Widget btnCancelable(String text, Function() clickListener) {
    return Container(
      height: 30.0,
      width: 120.0,
      child: GestureDetector(
        onTap: () {
          clickListener();
        },
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFFF7878),
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  Container(
                    width: 20.0,
                    child: Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/delete.png")),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget selectValue(Function() add, int number, Function() minus) {
    return new Container(
      width: 90.0,
      height: 30.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black38)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                add();
              },
              child: Container(
                // height: 20,
                // width: 20,
                // color: Colors.red,
                child: Icon(Icons.add, color: Colors.red),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // height: 20,
              // width: 20,
              child: Center(
                  child:
                      myText("$number", 12, FontWeight.bold, 1, Colors.black)),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (number > 0) {
                  minus();
                }
              },
              child: Container(
                // height: 20,
                // width: 20,
                // color: Colors.green,
                child: Icon(Icons.indeterminate_check_box_sharp,
                    color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dataColumn(String label, String val) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: myText(label, 12, FontWeight.bold, 1, Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: myText(val, 10, FontWeight.bold, 1, Colors.black38),
          ),
        )
      ],
    );
  }

  void allergiesIntorancesBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: ListView(
              children: [
                new ListTile(
                    // leading: new Icon(Icons.music_note),
                    title: Container(
                      height: 30.0,
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Allergies and intolerances",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              // child: myText("Allergies and intolerances", 15.0,
                              //     FontWeight.bold, 1, Colors.red),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: Image.asset("assets/images/delete.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => {}),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText(
                      "Arachidi", 15.0, FontWeight.normal, 1, Colors.black38),
                  onTap: () => {},
                ),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText(
                      "Solfiti", 15.0, FontWeight.normal, 1, Colors.black38),
                  onTap: () => {},
                ),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText("Metasolfiti e bisolfiti", 15.0,
                      FontWeight.normal, 1, Colors.black38),
                  onTap: () => {},
                ),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText(
                      "Celiachia", 15.0, FontWeight.normal, 1, Colors.black38),
                  onTap: () => {},
                ),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText(
                      "Lieviti", 15.0, FontWeight.normal, 1, Colors.black38),
                  onTap: () => {},
                ),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText(
                      "Lattosio", 15.0, FontWeight.normal, 1, Colors.black38),
                  onTap: () => {},
                ),
                Divider(),
                new ListTile(
                  // leading: new Icon(Icons.videocam),
                  title: myText("Frutta e verdura", 15.0, FontWeight.normal, 1,
                      Colors.black38),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  Widget myRadioButton({int value,int groupValue, Function onChanged}) {
    return Radio(
      value: value,
      activeColor: Colors.red,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: Wrap(
          children: [
            Container(
              height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(color: Colors.pink,)),
          ],
        ),
      ),
    );
    return showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
      return alert;
      },
    );
  }
//CustomRadio
  /*Widget myRadio(bool myCheckbox1, Function() val) {
    return Container(
      child: InkWell(
        onTap: () {
          setState(() {
            val();
            this.myCheckbox1 = !this.myCheckbox1;
            print("$myCheckbox1");
          });
        },
        child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                Border.all(color: Colors.black38) color: Colors.blue),
            child: this.myCheckbox1
                ? Center(
              child: Container(
                height: 15.0,
                width: 15.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              ),
            )
                : Container()
          Icon(
                  Icons.check_box_outline_blank,
                  size: 30.0,
                  color: Colors.blue,
                ),
        ),
      ),
    );
  }*/
}
