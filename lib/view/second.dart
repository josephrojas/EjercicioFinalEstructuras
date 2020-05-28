import 'package:final_proyect_data_strucures/model/Graph.dart';
import 'package:final_proyect_data_strucures/view/fade_out.dart';
import 'package:flutter/material.dart';

import 'city_description.dart';

class Principal extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  int _originCity = 0;
  int _destCity = 0;
  List<Cities> _companies = Cities.getCities();
  List<DropdownMenuItem<Cities>> _dropdownMenuItems;
  Cities _selectedCompany;
  Cities _selectedCompany2;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    _selectedCompany2=_dropdownMenuItems[0].value;
    super.initState();
  }

  onChangeDropdownItem(Cities selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      _originCity=selectedCompany.id;
    });
  }
  onChangeDropdownItem2(Cities selectedCompany) {
    setState(() {
      _selectedCompany2 = selectedCompany;
      _destCity=selectedCompany.id;
    });
  }

  List<DropdownMenuItem<Cities>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Cities>> items = List();
    for (Cities company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  Center(
                    child: Column(
                      children: [
                        Image(
                          width: 183,
                          height: 145,
                          image: AssetImage('assets/img/logo.png'),
                        ),
                        Text(
                          "¿Para dónde vamos?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: DropdownButton(
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged:onChangeDropdownItem
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeOut(
                    3,
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.gettyimages.es/gi-resources/images/500px/983794168.jpg')),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: DropdownButton(
                        value: _selectedCompany2,
                        items: _dropdownMenuItems,
                        onChanged: onChangeDropdownItem2
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        Graph graph = new Graph();
                        List<int> citiesId =
                        graph.dijkistra(_originCity, _destCity);
                        print(citiesId.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityDescription(
                                cityId: citiesId,
                              )),
                        );
                      });
                    },
                    child: Icon(Icons.chevron_right, size: 100.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cities {
  int id;
  String name;
  Cities(this.id, this.name);
  static List<Cities> getCities() {
    return <Cities>[
      Cities(0, "--Seleccione una ciudad--"),
      Cities(1, "Oviedo"),
      Cities(2, "Bilbao"),
      Cities(3, "Madrid"),
      Cities(8, "Sevilla"),
      Cities(4, "Alicante"),
      Cities(5, "Barcelona"),
      Cities(6, "Malaga"),
      Cities(7, "Melilla"),
    ];
  }
}
