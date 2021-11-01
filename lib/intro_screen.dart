import 'package:air_home_retaurant/Utils/MyWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreensHandler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroScreensHandlerState();
}

class _IntroScreensHandlerState extends State<IntroScreensHandler> {
  MyWidget _myWidget;
  List<Widget> pages;
  PageController controller = PageController();
  int _curr = 0;

  @override
  void initState() {
    super.initState();
    _myWidget = new MyWidget();
    pages = [
      _buildPage(
          "HomeRestaurant",
          "Vivi momenti conviviali, unisciti alle usanze culinarie locali!",
          "assets/images/dish.png"),
      Expanded(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(color: Colors.red, width: 10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/destination.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                    child: _myWidget.myText(
                        "Tour Gastronomici", 25.0, FontWeight.bold, null, Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                    child: Text(
                  "Scopri piatti tipici attraverso percorsi di sapore unici!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
              )
            ],
          ),
        ),
      ),

      /*_buildPage(
          "Tour Gastronomici",
          "Scopri piatti tipici attraverso percorsi di sapore unici!",
          "assets/images/destination.png"),*/
      Expanded(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(color: Colors.red, width: 10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/bake.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                    child: _myWidget.myText(
                        "Corsi di cucina", 25.0, FontWeight.bold, null, Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                    child: Text(
                      "Impara i segreti della tavola a participa ai nostri corsi!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      /*_buildPage(
          "Corsi di cucina",
          "Impara i segreti della tavola a participa ai nostri corsi!",
          "assets/images/bake.png"),*/
      Expanded(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(color: Colors.red, width: 10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/chef.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                    child: _myWidget.myText(
                        "Chef a Domicilio", 25.0, FontWeight.bold, null, Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Container(
                    child: Text(
                      "Vuoi organizzare a casa? Ingaggia un nostro chef!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      /*_buildPage(
          "Chef a Domicilio",
          "Vuoi organizzare a casa? Ingaggia un nostro chef!!",
          "assets/images/chef.png")*/
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          child: Stack(
      children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background-pattern.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 20.0, left: 10.0, right: 10.0),
            child: Container(
              width: double.infinity,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset("assets/images/main_logo.png"),
                  ),
                  Container(
                    child: Expanded(
                      child: PageView(
                        children: pages,
                        scrollDirection: Axis.horizontal,
                        // reverse: true,
                        // physics: BouncingScrollPhysics(),
                        controller: controller,
                        onPageChanged: (num) {
                          setState(() {
                            _curr = num;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
        ));
  }

  Widget _buildPage(String label, String text, String uri) {
    return Expanded(
      child: new Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(color: Colors.red, width: 10.0)),
                child: Image.asset(
                  "$uri",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                  child: _myWidget.myText(
                      "$label", 25.0, FontWeight.bold, null, Colors.red)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                  child: Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
