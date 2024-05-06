import 'package:flutter/material.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});
  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {

      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Tasbih"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,


      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child:Image.asset("assets/images/tasbih.png") ,
                ),
                GestureDetector(
                  onTap: _incrementCounter,
                  child: Container(
                    margin: EdgeInsets.only(top: 130,left: 80),
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  height: 20,
                  width: 30,

                  margin: EdgeInsets.only(top: 50,left: 100),
                  child: Text(
                    '$_counter',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),
                  ),
                ),
                GestureDetector(
                  onTap: _decrementCounter,
                  child: Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 105,left: 130),
                    color: Colors.transparent,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}