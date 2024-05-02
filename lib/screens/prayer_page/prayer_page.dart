import 'package:assalam/controller/prayer_time_controller.dart';
import 'package:assalam/data/models/prayer_time_models/prayer_time_data_model.dart';
import 'package:assalam/data/services/prayer_times/prayer_time_get_data.dart';
import 'package:assalam/screens/prayer_page/widgets/prayer_container_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PrayerPage extends StatefulWidget {
  PrayerPage({super.key});

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  var controller = Get.put(PrayerTimeController());

  var prayerTimeGetData = PrayerTimeGetData();

  Data data = Data();

  String currentDate = DateFormat('HH:mm').format(DateTime.now());

  @override
  void initState() {
    // controller.prayerTime();
     controller.getCurrentLocation();
    prayerTimeGetData.getPrayerTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayers',
            style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            width: screenSize.width,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white70,
            child: FutureBuilder(
                future: prayerTimeGetData.getPrayerTime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator()); // Show a loading indicator while fetching data
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    data = snapshot.data!;
                    return Column(
                      children: [
                        //
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          padding: EdgeInsets.all(15),
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green,
                            image: DecorationImage(
                              image: AssetImage('assets/images/islam.jpeg'),
                              // Background image from assets
                              fit: BoxFit.cover,
                              // Cover the entire container
                              alignment: Alignment.center, // Align the image
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(data.data?.timings?.fajr != null ? 'Fajr' : data.data?.timings?.dhuhr != null ? 'Dhuhr' : '', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
                                  //Text(currentDate, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text('${controller.currentAddress}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14)),
                                ],
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${data.data?.date?.hijri?.day} ${data.data?.date?.hijri?.month?.en}, ${data.data?.date?.hijri?.year} ${data.data?.date?.hijri?.designation?.abbreviated}',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14)),
                                  Text(data.data?.date?.readable ?? '', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),

                        // Prayer Time
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green,
                            ),
                            child: Column(
                              children: [
                                PrayerContainerCard(
                                  prayerTimeText: 'Fajar',
                                  prayerStartTime: data.data?.timings?.fajr ?? '',
                                  // prayerEndTime: controller.fajrEndTime,
                                ),
                                Divider(),
                                PrayerContainerCard(
                                  prayerTimeText: 'Dhuhr',
                                  prayerStartTime: data.data?.timings?.dhuhr ?? '',
                                  // prayerEndTime: '',
                                ),
                                Divider(),
                                PrayerContainerCard(
                                  prayerTimeText: 'Asr',
                                  prayerStartTime: data.data?.timings?.asr ?? '',
                                  // prayerEndTime: controller.asrEndTime,
                                ),
                                Divider(),
                                PrayerContainerCard(
                                  prayerTimeText: 'Maghrib',
                                  prayerStartTime: data.data?.timings?.maghrib ?? '',
                                  // prayerEndTime: controller.maghribEndTime,
                                ),
                                Divider(),
                                PrayerContainerCard(
                                  prayerTimeText: 'Isha',
                                  prayerStartTime: data.data?.timings?.isha ?? '',
                                  // prayerEndTime: controller.ishaEndTime,
                                ),
                                Divider(),
                                PrayerContainerCard(
                                  prayerTimeText: 'Sunrise',
                                   prayerStartTime: data.data?.timings?.sunrise ?? '',
                                  // prayerEndTime: controller.sunriseTime,
                                ),
                                Divider(),
                                PrayerContainerCard(
                                  prayerTimeText: 'Sunset',
                                   prayerStartTime: data.data?.timings?.sunset ?? '',
                                  // prayerEndTime: controller.sehriEndTime,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
