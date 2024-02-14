import 'package:bus_reservation/pages/busTemplate.dart';
import 'package:bus_reservation/pages/bus_list.dart';
import 'package:bus_reservation/utils/constants.dart';
import 'package:bus_reservation/utils/helper_functions.dart';
import 'package:flutter/material.dart';
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//
//   String? fromCity;
//   String? toCity;
//   DateTime? departureDate;
//
//   Key? _formKey;
//
//
//   void _selectDate() async{
//     final selectedDate = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(Duration(days:7))
//     );
//     if(selectedDate!=null){
//       setState(() {
//         departureDate=selectedDate;
//       });
//     }
//   }
//
//   void _search(){
//     if(departureDate==null){
//       showMsg(context, emptyDateErrMessage);
//
//     }
//     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BusList(from: fromCity!, to: toCity!)));
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Bus"),),
//       body: Form(
//         key: _formKey,
//         child: Container(
//           margin: EdgeInsets.all(8),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 // flex: 4,
//                 child: Container(
//                   width: 250,
//                   // height: 100,
//                   // color: Colors.white,
//                   margin: EdgeInsets.all(10),
//                   // width: 200,
//                   child:
//                   DropdownButtonFormField<String>(
//                       value: fromCity,
//                       validator: (value){
//                         if(value==null || value.isEmpty){
//                           return emptyFieldErrMessage;
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           errorStyle:TextStyle(color: Colors.white)
//                       ),
//                       hint: Text("From"),
//                       isExpanded:true,
//                       items: cities.map((city) =>
//                           DropdownMenuItem<String>(
//                             value: city,
//                             child: Text(city),
//                           )
//                       ).toList(),
//                       onChanged: (value){
//                         setState(() {
//                           fromCity=value;
//                         });
//                       }
//                   ),
//                 ),
//               ),
//               Expanded(
//                 // flex: 4,
//                 child: Container(
//                   // color: Colors.white,
//                   width: 250,
//                   // height: 100,
//                   margin: EdgeInsets.all(10),
//                   child:
//                   DropdownButtonFormField<String>(
//                       value: toCity,
//                       validator: (value){
//                         if(value==null || value.isEmpty){
//                           return emptyFieldErrMessage;
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           errorStyle:TextStyle(color: Colors.white)
//                       ),
//                       hint: Text("To"),
//                       isExpanded:true,
//                       items: cities.map((city) =>
//                           DropdownMenuItem<String>(
//                             value: city,
//                             child: Text(city),
//                           )
//                       ).toList(),
//                       onChanged: (value){
//                         setState(() {
//                           toCity=value;
//                         });
//                       }
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10,),
//               Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(departureDate==null?getFormattedDate(DateTime.now()):getFormattedDate(departureDate!)),
//                       IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_month)),
//                     ],
//                   )
//               ),
//               SizedBox(width: 10,),
//               ElevatedButton(
//                   onPressed: _search,
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: Text("Search")
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String? from;
  String? to;
  DateTime? departureDate;


    void _search(){
    if(departureDate==null){
      showMsg(context, emptyDateErrMessage);

    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=>BusList(from: from!, to: to!, dt: departureDate!))
    );

  }
  void _selectDate() async{
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days:7))
    );
    if(selectedDate!=null){
      setState(() {
        departureDate=selectedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
              child: Text("EasyBus",style: TextStyle(color: Colors.white),)
          ),
          const Row(
            children: [
              Text("Login",style: TextStyle(color: Colors.white)),
              SizedBox(width: 30,),
              Text("Register",style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2,
            // color: Colors.blue[100],
            child: Container(
              // padding: EdgeInsets.all(100),
              margin: EdgeInsets.all(100),
              // color: Colors.red,
              // width: MediaQuery.of(context).size.width/1.15,
              // height: 100,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // height: 40,
                    // padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      // border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButton<String>(
                          value: from,
                          hint: Text("From"),
                          // isExpanded:true,
                          items: cities.map((city) =>
                              DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              )
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              from=value;
                            });
                          }
                      ),
                  ),
                 Icon(
                   Icons.swap_vert
                 ),
                 Container(
                    // height: 40,
                    // padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      // border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButton<String>(
                          value: to,
                          hint: Text("To"),
                          // isExpanded:true,
                          items: cities.map((city) =>
                              DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              )
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              to=value;
                            });
                          }
                      ),
                  ),
                  Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(departureDate==null?getFormattedDate(DateTime.now()):getFormattedDate(departureDate!)),
                          SizedBox(width: 50,),
                          IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_month)),
                        ],
                      )
                  ),
                  ElevatedButton(
                      onPressed: _search,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text("Search Buses",style: TextStyle(color: Colors.white),)
                  )
                ],
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bus booking made easy",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),
              Container(
                margin: EdgeInsets.only(top: 50,right: 50),
                width: MediaQuery.of(context).size.width/2.5,
                height: MediaQuery.of(context).size.height/2.5,
                color: Colors.red,
                child: Image.asset('bus_.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
