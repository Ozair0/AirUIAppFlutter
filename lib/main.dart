import 'package:flutter/material.dart';
import 'CustomShapeClipper.dart';
import 'CustomAppBar.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Your Titile",
    home: HomeScreen(),
  ));
}

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF572C);
List<String> locations = ["Bostan (BOS)", "New York City (JFK)"];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
      children: <Widget>[
          HomeScreenTopPart(),
          HomeScreenBottomPart
      ],
    ),
        ));
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 300.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 16.0)),
                    Icon(
                      Icons.add_location,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    PopupMenuButton(
                      onSelected: (index) {
                        setState(() {
                          selectedLocationIndex = index;
                        });
                      },
                      itemBuilder: (_) => <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(
                                locations[0],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locations[1],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                              value: 1,
                            )
                          ],
                      child: Row(
                        children: <Widget>[
                          Text(
                            locations[selectedLocationIndex],
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 16.0))
                  ],
                ),
                SizedBox(height: 20.0),
                Text("Where would\nyou want to go?", style: TextStyle(fontSize: 20.0,color: Colors.white),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text: locations[1]),
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                        border: InputBorder.none,
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Icon(Icons.search, color: Colors.black,),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        child: ChoiceChip(Icons.flight_takeoff, "Flights", isFlightSelected),
                    onTap: () {
                          setState(() {
                            isFlightSelected =true;
                          });
                    },),
                    SizedBox(width: 20.0,),
                    InkWell(child: ChoiceChip(Icons.hotel, "Hotels", !isFlightSelected),
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final isSelected;

  ChoiceChip(this.icon,this.text,this.isSelected);
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected ?  BoxDecoration(color: Colors.white.withOpacity(0.15),borderRadius: BorderRadius.all(Radius.circular(15.0))) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
              widget.icon,
              size: 20.0,
              color: Colors.white,
          ),
          SizedBox(width: 8.0,),
          Text(widget.text, style: TextStyle(color: Colors.white,fontSize: 16.0),)
        ],
      ),
    );
  }
}

var HomeScreenBottomPart = Column(
  children: <Widget>[
    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Currently Watched Items",
            style: TextStyle(
                color: Colors.black, fontSize: 16.0
            ),
          ),
          Spacer(),
          Text("View All(12)", style: TextStyle(
              color: Color(0xFFF3791A), fontSize: 14.0
          ),)
        ],
      ),
    ),
    Padding(padding: EdgeInsets.only(bottom: 6.0)),
    Container(
      height: 180.0,
      child: ListView(
        scrollDirection: Axis.horizontal,

        children: cityCards,
      ),
    )
  ],
);
List<CityCard> cityCards = [
  CityCard("asset/pic1.jpg", "Keyboard", "Dec 2019", "45", "400", "200"),
  CityCard("asset/pic2.jpg", "Iphone", "Dec 2018", "35", "700", "650"),
  CityCard("asset/pic3.jpg", "Tech", "Dec 2021", "55", "900", "840"),
  CityCard("asset/pic4.jpg", "Mac Code", "Dec 2020", "25", "1000", "940"),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,this.oldPrice,this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0)
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 160.0,
                width: 110.0,
                child: Image.asset(imagePath, fit: BoxFit.cover,),
              ),
              Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  height: 50,
                  width: 110,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                          colors: [
                            Colors.black, Colors.black.withOpacity(0.1)
                          ]
                      )
                    ),
                  )
              ),
              Positioned(
                  left: 1.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cityName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0),),
                          Text(monthYear,style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 10.0))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Text("$discount%", style: TextStyle(fontSize: 10.0, color: Colors.blue),),
                      )
                    ],
                  )
              )
            ],

          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 5.0),
            Text("\$$newPrice", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(width: 8.0),
            Text("(\$$oldPrice)", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),),
          ],
        )
      ],
    ),
    );
  }
}
