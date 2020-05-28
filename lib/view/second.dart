import 'package:final_proyect_data_strucures/view/fade_out.dart';
import 'package:flutter/material.dart';

import 'city_description.dart';

class Principal extends StatelessWidget {
  // This widget is the root of your application.
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
                    child: DropDownStates(),
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
                      child: DropDownStates(),),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CityDescription()),
                      );
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
      Cities(4, "Alicante"),
      Cities(5, "Barcelona"),
      Cities(6, "Malaga"),
      Cities(7, "Melilla"),
      Cities(8, "Sevilla"),
    ];
  }
}

class DropDownStates extends StatefulWidget {
  @override
  _DropDownStatesState createState() => _DropDownStatesState();
}

class _DropDownStatesState extends State<DropDownStates> {
  List<Cities> _companies = Cities.getCities();
  List<DropdownMenuItem<Cities>> _dropdownMenuItems;
  Cities _selectedCompany;
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
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

  onChangeDropdownItem(Cities selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedCompany,
      items: _dropdownMenuItems,
      onChanged: onChangeDropdownItem,
    );
  }
}
