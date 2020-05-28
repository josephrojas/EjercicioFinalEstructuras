import 'dart:math';

import 'package:final_proyect_data_strucures/view/fade_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GraphPage.dart';

class CityDescription extends StatefulWidget {
  @override
  _CityDescriptionState createState() => _CityDescriptionState();
}

class _CityDescriptionState extends State<CityDescription>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  int _actualPosition;
  String _cityName;
  String _cityDescription;
  String _pathImage;
  String _cityValue;
  var cities = new List();

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    cities.add("Madrid");
    cities.add("Barcelona");
    super.initState();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  void getValue(List citiesData)
  {
    switch(citiesData[_actualPosition])
    {
      case "Madrid":
        _cityDescription="Madrid, Spain's central capital, is a city of elegant boulevards and expansive, manicured parks such as the Buen Retiro. It’s renowned for its rich repositories of European art, including the Prado Museum’s works by Goya, Velázquez and other Spanish masters";
        _cityValue="100";
        _cityName="Madrid";
        _pathImage="assets/img/madrid.jpg";
        break;
      case "Oviedo":
        _cityDescription="Oviedo is a town in northwest Spain between the Cantabrian Mountains and the Bay of Biscay. The capital of Asturias, it’s known for its medieval old town, the site of the Gothic Oviedo Cathedral with its 9th-century Holy Chamber. "
            "The Archaeological Museum of Asturias, in a nearby convent, displays regional artifacts. The Fine Arts Museum of Asturias includes 2 palaces and has an expansive Spanish art collection.";
        _cityValue="100";
        _cityName="Oviedo";
        _pathImage="assets/img/oviedo.jpg";
        break;
      case "Bilbao":
        _cityDescription="Bilbao, an industrial port city in northern Spain, is surrounded by green mountains. It’s the de facto capital of Basque Country, with a skyscraper-filled downtown. "
            "It’s famed for the Frank Gehry–designed Guggenheim Museum Bilbao, which sparked revitalization when it opened in 1997. The museum houses prominent modern and contemporary works, but it’s the curvy, titanium-clad building that receives the most attention.";
        _cityValue="50";
        _cityName="Bilbao";
        _pathImage="assets/img/bilbao.jpg";
        break;
      case "Alicante":
        _cityDescription="Alicante is a port city on Spain’s southeastern Costa Blanca, and the capital of the Alicante province. Its old town, Barrio de la Santa Cruz, has narrow streets, colored houses and a nightlife scene."
            " From here, an elevator or a steep climb leads to medieval Castillo de Santa Bárbara, set on a hilltop with sweeping views of the Mediterranean coast.";
        _cityValue="120";
        _cityName="Alicante";
        _pathImage="assets/img/alicante.jpg";
        break;
      case "Barcelona":
        _cityDescription="Barcelona, the cosmopolitan capital of Spain’s Catalonia region, is known for its art and architecture. The fantastical Sagrada Família church and other modernist landmarks designed by Antoni Gaudí dot the city. "
            "Museu Picasso and Fundació Joan Miró feature modern art by their namesakes. City history museum MUHBA, includes several Roman archaeological sites.";
        _cityValue="160";
        _cityName="Barcelona";
        _pathImage="assets/img/barcelona.jpg";
        break;
      case "Malaga":
        _cityDescription="Málaga is a port city on southern Spain’s Costa del Sol, known for its high-rise hotels and resorts jutting up from yellow-sand beaches. Looming over that modern skyline are the city’s 2 massive hilltop citadels, the Alcazaba and ruined Gibralfaro, remnants of Moorish rule. "
            "The city's soaring Renaissance cathedral is nicknamed La Manquita (\"one-armed lady\") because one of its towers was curiously left unbuilt.";
        _cityValue="100";
        _cityName="Malaga";
        _pathImage="assets/img/malaga.jpg";
        break;
      case "Melilla":
        _cityDescription="Melilla is a Spanish autonomous city located on the northwest coast of Africa, sharing a border with Morocco. "
            "It has an area of 12.3 km². Melilla is one of two permanently inhabited Spanish cities in mainland Africa, the other being nearby Ceuta.";
        _cityValue="220";
        _cityName="Melilla";
        _pathImage="assets/img/melilla.jpg";
        break;
      case "Sevilla":
        _cityDescription="Seville is the capital of southern Spain’s Andalusia region. It's famous for flamenco dancing, particularly in its Triana neighborhood. Major landmarks include the ornate Alcázar castle complex, built during the Moorish Almohad dynasty, and the 18th-century Plaza de Toros de la Maestranza bullring. "
            "The Gothic Seville Cathedral is the site of Christopher Columbus’s tomb and a minaret turned bell tower, the Giralda.";
        _cityValue="20";
        _cityName="Sevilla";
        _pathImage="assets/img/sevilla.jpg";
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 90,
          child: FadeOut(
            3,
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(rotationController),
              child: InkWell(
                onTap: () {
                  rotationController.forward(from: 0.0);
                  Future.delayed(const Duration(milliseconds: 700), () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GraphPage()),
                      );
                    });
                  });
                },
                child: Image(image: AssetImage("assets/img/pointers.png")),
              ),
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              FadeOut(
                2,Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage("assets/img/volver.png"),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    InkWell(
                      child: Image(
                        image: AssetImage("assets/img/logo.png"),
                        width: 183,
                        height: 145,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  FadeOut(
                    2.5,Column(
                      children: [
                        Text(
                          _cityName,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          _cityValue,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FadeOut(
                3,Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(_pathImage)),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: 363,
                  height: 226,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeOut(
                4,Text(
                _cityDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  rotationController.forward(from: 0.0);
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      _actualPosition++;
                      getValue(cities);
                    });
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeOut(4,Text("Continuar a Barcelona")),
                    FadeOut(
                      2,Image(
                        image: AssetImage("assets/img/arrow_right.png"),
                        width: 68,
                        height: 68,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
