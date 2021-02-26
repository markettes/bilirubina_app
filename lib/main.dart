import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilirrubina calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bilirrubina Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime birthDate = DateTime.now();
  TimeOfDay birthTime = TimeOfDay.now();

  DateTime testDate = DateTime.now();
  TimeOfDay testTime = TimeOfDay.now();

  int gw = null;
  double testResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.0, 1.5),
            colors: [
              const Color(0xffee0000),
              const Color(0x50ee0000),
            ],
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 150, 15, 150),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fecha de Nacimiento: ',
                    ),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Text(birthDate.day.toString() +
                            "-" +
                            birthDate.month.toString() +
                            "-" +
                            birthDate.year.toString()),
                        color: Colors.red[200],
                        onPressed: () =>
                            _selectDate(context, birthDate).then((value) {
                              setState(() {
                                birthDate = value;
                              });
                            })),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hora de Nacimiento: ',
                    ),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Text(birthTime.toString().substring(10, 15)),
                        color: Colors.red[200],
                        onPressed: () =>
                            _selectTime(context, birthTime).then((value) {
                              setState(() {
                                birthTime = value;
                              });
                            })),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Semanas de gestación',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fecha del Test: ',
                    ),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Text(testDate.day.toString() +
                            "-" +
                            testDate.month.toString() +
                            "-" +
                            testDate.year.toString()),
                        color: Colors.red[200],
                        onPressed: () =>
                            _selectDate(context, testDate).then((value) {
                              setState(() {
                                testDate = value;
                              });
                            })),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hora del Test: ',
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text(testTime.toString().substring(10, 15)),
                      color: Colors.red[200],
                      onPressed: () => _selectTime(context, testTime)
                          .then((value) => setState(() {
                                testTime = value;
                              })),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Resultado del Test',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          onPressed: () => {},
                          color: Colors.red[200],
                          child: Text("Obtener tratamiento"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context, DateTime date) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date) return picked;
  }

  _selectTime(BuildContext context, TimeOfDay time) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) return picked;
  }
}
