import 'dart:convert';

import 'package:bus_reservation/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:book_my_seat/book_my_seat.dart';

class BusList extends StatefulWidget {
  const BusList({Key? key, required this.from, required this.to,required this.dt}) : super(key: key);
  final String from;
  final String to;
  final DateTime dt;
  @override
  State<BusList> createState() => _BusListState(from,to,dt);
}

class _BusListState extends State<BusList> {
  String from;
  String to;
  DateTime dt;
  _BusListState(this.from,this.to,this.dt);

  var url = 'http://localhost:8080/api/buses/search';
  List<dynamic> futureBus=[];
  @override
  void initState(){
    getBuses(from, to);
  }

  Widget label(String state,String label){
    return  Container(
      // color: Colors.yellow,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(state,width: 20,height: 20,),
          Text(label)
        ],
      ),
    );
  }
  Widget busTileEx(String busName,String busNumber,String busType,String from,String to,int seats) {
    print(seats);
    bool isExpanded = false;
    return ExpansionTile(

      // collapsedBackgroundColor: Colors.grey,
      childrenPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
      initiallyExpanded: isExpanded,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.3,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 8,
              height: 75,
              child: Image.asset(
                'bus_.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(busName),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(from),
                    Icon(Icons.swap_horiz),
                    Text(to),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total seats"),
                Text('$seats'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text("View Seats"),
            )
          ],
        ),
      ),
      children: [
        // Your seat view content here
        // 1 2 3 4 5 6 7 8 9 0
        // 1 2
        // Icon(Icons.car_repair),
        Container(
          // color: Colors.red,
          height: 100,
          width: 650,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.circle_outlined),
              SizedBox(width: 20,),
              Center(
                child: SeatLayoutWidget(
                  onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                    print("tapped $rowIndex $colIndex $updatedSeatState");
                  },
                  stateModel:const SeatLayoutStateModel(
                    rows: 2,
                    cols: 10,
                    seatSvgSize: 30,
                    pathUnSelectedSeat: 'svg_unselected_bus_seat.svg',
                    pathSelectedSeat: 'svg_selected_bus_seats.svg',
                    pathSoldSeat: 'svg_sold_bus_seat.svg',
                    pathDisabledSeat: 'svg_disabled_bus_seat.svg',
                    currentSeatsState: [
                      [
                        SeatState.selected,
                        SeatState.unselected,
                        SeatState.selected,
                        SeatState.selected,
                        SeatState.unselected,
                        SeatState.selected,
                        SeatState.selected,
                        SeatState.selected,
                        SeatState.empty,
                        SeatState.selected,
                      ],[
                        SeatState.empty,
                        SeatState.selected,
                        SeatState.unselected,
                        SeatState.selected,
                        SeatState.empty,
                        SeatState.selected,
                        SeatState.selected,
                        SeatState.unselected,
                        SeatState.selected,
                        SeatState.sold,
                      ],
                    ],
                  ),
                ),
              ),
              SizedBox(width: 50,),
              Column(
                children: [
                  label('svg_selected_bus_seats.svg', 'Selected Seat'),
                  label('svg_sold_bus_seat.svg', 'Sold'),
                  label('svg_unselected_bus_seat.svg', 'Unselected Seat'),
                  label('svg_disabled_bus_seat.svg', 'Disabled'),
                ],
              )
            ],
          )
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            SizedBox(width: 100,),
            Center(
              child: SeatLayoutWidget(
                onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                  print("tapped $rowIndex $colIndex $updatedSeatState");
                },
                stateModel:const SeatLayoutStateModel(
                  rows: 1,
                  cols: 10,
                  seatSvgSize: 30,
                  pathUnSelectedSeat: 'svg_unselected_bus_seat.svg',
                  pathSelectedSeat: 'svg_selected_bus_seats.svg',
                  pathSoldSeat: 'svg_sold_bus_seat.svg',
                  pathDisabledSeat: 'svg_disabled_bus_seat.svg',
                  currentSeatsState: [
                    [
                      SeatState.selected,
                      SeatState.unselected,
                      SeatState.selected,
                      SeatState.selected,
                      SeatState.unselected,
                      SeatState.selected,
                      SeatState.selected,
                      SeatState.selected,
                      SeatState.empty,
                      SeatState.selected,
                    ],
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }



  Widget busTile(String busName,String busNumber,String busType,String from,String to){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 0.5)
      ),
      margin: EdgeInsets.all(10),

      width: MediaQuery.of(context).size.width/1.3,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: MediaQuery.of(context).size.width/8,
              height: 75,
              child: Image.asset('bus_.png',fit: BoxFit.fill,)
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$busName( $busType )'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(from),
                  Icon(Icons.swap_horiz),
                  Text(to),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total seats"),
              Text("45"),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> getBuses(String from,String to) async {
    String cusUrl = '$url?fromCity=$from&toCity=$to';
    print(cusUrl);
    var feedback = await http.get(Uri.parse(cusUrl),
        headers:<String,String> {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if(feedback.statusCode==200){
      print("ok");
      if (jsonDecode(feedback.body).isEmpty){

      }else{
        setState(() {
          futureBus.addAll(
              jsonDecode(feedback.body)
          );
        });
      }
    }else{
      setState(() {
        futureBus=[];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Available Buses"),
              Text("On"),
              Text(getFormattedDate(dt)),
            ],
          ),
        ),
        body:Center(
          child: Column(
              children: (futureBus.length==0)?
              [
               const Center(
                  child: Text("No buses available "),
                )
              ]:
              [Expanded(
                child: Center(
                  child: ListView.builder(
                      itemCount: futureBus.length,
                      itemBuilder: (context,index){
                        // print(futureBus.length);
                        return busTileEx(
                          futureBus[index]['busName'],
                          futureBus[index]['busNumber'],
                          futureBus[index]['busType'],
                          futureBus[index]['fromCity'],
                          futureBus[index]['toCity'],
                          futureBus[index]['seats']
                        );
                      }),
                ),
              )
              ]
          ),
        )
    );
  }
}
