import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:test_project/Bloc/Home/HomeBloc.dart';
import 'package:test_project/Bloc/Home/HomeState.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers : [
        BlocProvider<HomeBloc>(
          create : ( context ) => HomeBloc()
        )
      ],
      child : HomeScreens()
    );
  }
}

class HomeScreens extends StatefulWidget {
  @override
  HomeScreenState createState () => HomeScreenState();
}

class HomeScreenState extends State<HomeScreens> {
  int currentPos = 0;
  int selectedIndex = 0;
  List<String> listPaths = [
    "img_slider.png",
    "img_slider.png",
    "img_slider.png",
    "img_slider.png",
    "img_slider.png"
  ];
  late HomeBloc homeBloc;
  @override
  Widget build(BuildContext context){
    homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocListener<HomeBloc , HomeState>(
      listener : ( context , state ) {

      },
      child : Scaffold(
        body : SafeArea(
            child : Container(
                color : Colors.white,
                width : MediaQuery.of(context).size.width,
                height : MediaQuery.of(context).size.height,
                child : SingleChildScrollView(
                    child : Container(
                        child : Column(
                            crossAxisAlignment : CrossAxisAlignment.center,
                            children : [
                              Image.asset("img.png" , width : MediaQuery.of(context).size.width , height : 150),
                              SizedBox(height : 20),
                              Padding(
                                padding : EdgeInsets.only(left : 5.0 , right : 5.0),
                                child : GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 6,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1,),
                                  itemBuilder: (contxt, indx){
                                    return Column(
                                      children: [
                                        Card(
                                            child : Padding(
                                                padding : EdgeInsets.only(left : 25.0 , right : 25.0 , top : 12.0 , bottom : 12.0),
                                                child : Image.asset("ic_image.png" , width : 50 , height : 50)
                                            )
                                        ),
                                        SizedBox(height : 10),
                                        Text("MENU ${indx}" , style : TextStyle(
                                            color : Colors.black,
                                            fontWeight : FontWeight.w600,
                                            fontSize : 14
                                        ))
                                      ],
                                    );
                                  },
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: listPaths.length,
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          print("INDEX : ${index}");
                                          currentPos = index;
                                        });
                                      }
                                  ),
                                  itemBuilder : ( context , index , i){
                                    return Card(
                                        child : Container(
                                            margin: EdgeInsets.symmetric(horizontal: 6),
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Image.asset(listPaths[index]),
                                            )
                                        )
                                    );
                                  }
                              ),
                              SliderIndicator(
                                length: listPaths.length,
                                activeIndex: currentPos,
                                indicator: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(0, 0, 0, 0.4),
                                  ),
                                ),
                                activeIndicator: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(0, 0, 0, 0.9),
                                  ),
                                ),
                              )
                            ]
                        )
                    )
                )
            )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon : Image.asset("ic_home.png" , width : 35 , height : 35), label : 'HOME'),
            BottomNavigationBarItem(
                icon: Image.asset("ic_calendar.png" , width : 35 , height : 35 ), label : 'ABSENSI'),
            BottomNavigationBarItem(
                icon: Image.asset("ic_user.png" , width : 35 , height : 35), label : 'PROFILE'),
          ],
          currentIndex: selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      )
    );
  }
}