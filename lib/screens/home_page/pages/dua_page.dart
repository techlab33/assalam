import 'package:flutter/material.dart';

class DuaPage extends StatelessWidget {
  const DuaPage({super.key});

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dua', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [

                SizedBox(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: screenSize.width / 45,
                    mainAxisSpacing: screenSize.height / 98.5,
                    shrinkWrap: true,
                    childAspectRatio: 1.4,
                    physics:const NeverScrollableScrollPhysics(),
                    children: [

                      DuaContainerCard(
                        title: 'All',
                        subtitle: '123 Chapters',
                        color: Colors.grey.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Morning & Evening',
                        subtitle: '13 Chapters',
                        color: Colors.blue.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Prayer',
                        subtitle: '13 Chapters',
                        color: Colors.amber.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Praising Allah',
                        subtitle: '13 Chapters',
                        color: Colors.orange.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Morning & Evening',
                        subtitle: '13 Chapters',
                        color: Colors.blue.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Nature',
                        subtitle: '13 Chapters',
                        color: Colors.blue.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Morning & Evening',
                        subtitle: '13 Chapters',
                        color: Colors.cyan.shade200,
                      ),

                      DuaContainerCard(
                        title: 'Nature',
                        subtitle: '13 Chapters',
                        color: Colors.blue.shade200,
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DuaContainerCard extends StatelessWidget {
   DuaContainerCard({
    super.key,
     required this.title,
     required this.subtitle,
     required this.color,
  });

  String title;
  String subtitle;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(subtitle, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54)),
        ],
      ),
    );
  }
}
