import 'package:assalam/controller/prayer_time_controller.dart';
import 'package:assalam/screens/home_page/pages/al_quran_page.dart';
import 'package:assalam/screens/home_page/pages/dua_page.dart';
import 'package:assalam/screens/home_page/pages/hadith.dart';
import 'package:assalam/screens/home_page/pages/more_page.dart';
import 'package:assalam/screens/home_page/pages/tasbih_page.dart';
import 'package:assalam/screens/home_page/pages/wallpaper_page.dart';
import 'package:assalam/screens/home_page/widgets/gird_view_container_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),

                Stack(
                  children: [
                    Container(
                      height: 180,
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/islam-background.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 100),
                        height: 160,
                        width: screenSize.width / 1.3,
                        decoration: BoxDecoration(
                            // color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Card(
                          elevation: 4,
                          color: Colors.green.shade500,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                // user profile & Get premium
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          child: Image.asset('assets/icons/user.png', height: 25, width: 25),
                                          radius: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text('Ifran Tuhin', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 110,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.deepPurple.shade500,
                                      ),
                                      child: Text('Get Premium', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.yellow)),
                                    )
                                  ],
                                ),

                                // Prayer time & location
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Asr',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
                                        Text('12:45 PM',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
                                        Text('View Time',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
                                      ],
                                    ),

                                    //
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('23 Shawal, 1445 AH',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                                        Text('Dhaka, Bangladesh',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                                        // Text('View Time',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Grid view
                SizedBox(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: screenSize.width / 45,
                    mainAxisSpacing: screenSize.height / 98.5,
                    shrinkWrap: true,
                    childAspectRatio: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GridViewContainerCard(
                        image: 'assets/icons/tasbih.png',
                        text: 'Tasbih',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TasbihPage())),
                      ),
                      GridViewContainerCard(
                        image: 'assets/icons/hadith.png',
                        text: 'Hadith',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HadithPage())),
                      ),
                      GridViewContainerCard(
                        image: 'assets/icons/pray.png',
                        text: 'Dua',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DuaPage())),
                      ),
                      GridViewContainerCard(
                        image: 'assets/icons/quran_colorful.png',
                        text: 'Al-Quran',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AlQuranPage())),
                      ),
                      GridViewContainerCard(
                        image: 'assets/icons/wallpaper.png',
                        text: 'Wallpaper',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WallpaperPage())),
                      ),
                      GridViewContainerCard(
                        image: 'assets/icons/more.png',
                        text: 'More',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MorePage())),
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
