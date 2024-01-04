import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_api/constants/screenUtils.dart';

import '../constants/colors.dart';
import '../model/api_model.dart';
import '../services/api_services.dart';
import '../widgets/myText.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Temperatures? model;

  @override
  void initState(){
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async{
    try {
      Temperatures fetchedModel = await WeatherData.fetchData();
      setState(() {
        model = fetchedModel;
      });
      print('country :${model?.location.country}');
    } catch(e) {
      print('error fetching data: $e');
    }
  }
  Widget build(BuildContext context) {
    double width = ScreenUtil.screenWidth(context);
    double height = ScreenUtil.screenWidth(context);

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Container(
          height:  MediaQuery.of(context).size.height,
          width: width,
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  MyText(
                    text: model?.location.name,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(text:'Today'),

              Image.network(
                  "http:"+model!.current.condition.icon,
              width: 80,
                height: 80,fit: BoxFit.cover,
              ),
              SizedBox(height: 30,),
              Text(
                model!.current.feelslikeC.toString(),
                style: GoogleFonts.notoSans(
                  fontSize: 30, fontWeight: FontWeight.bold),
              ),

              Text(model!.current.condition.text, style: GoogleFonts.notoSans(fontSize: 30),),
              SizedBox(height: 25,),
              Text('wind',style:GoogleFonts.notoSans()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/wind.png',
                  width: 35,height: 40,),
                  SizedBox(
                    width: 20,
                  ),
                  Text(model!.current.gustKph.toString()+'kph'),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}

