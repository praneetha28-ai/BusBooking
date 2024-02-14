//
// import 'package:flutter/material.dart';
// final ExpansionTileController controller = ExpansionTileController();
// class BusTemp extends StatelessWidget {
//    BusTemp({Key? key}) : super(key: key);
//
//
//
//   Widget busTile(BuildContext context){
//     return ExpansionTile(
//       controller: controller,
//       title: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.black,width: 0.5)
//         ),
//         margin: EdgeInsets.all(10),
//
//         width: MediaQuery.of(context).size.width/1.3,
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width/8,
//                 height: 75,
//                 child: Image.asset('bus_.png',fit: BoxFit.fill,)
//             ),
//             const Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("BUS NAME"),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text("From"),
//                     Icon(Icons.swap_horiz),
//                     Text("To"),
//                   ],
//                 )
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Total seats"),
//                 Text("45"),
//               ],
//             ),
//             ElevatedButton(onPressed: (){
//               if (controller.isExpanded){
//                 controller.collapse();
//               }if(!controller.isExpanded){
//                 controller.expand();
//               }
//             },
//                 child: Text("View Seats")
//             )
//           ],
//         ),
//       ),
//       children: [
//         Text("Hurry")
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       // backgroundColor: Colors.red[200],
//       appBar: AppBar(title: Center(child: Text("Available Buses"),),elevation: 5,),
//       body:  Container(
//         // color: Colors.red[200],
//         margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/8),
//         child: SingleChildScrollView(
//           physics: ScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               busTile(context),
//               busTile(context),
//               busTile(context),
//               busTile(context),
//               busTile(context),
//               busTile(context),
//               busTile(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BusTemp extends StatelessWidget {
  BusTemp({Key? key, required this.controller}) : super(key: key);

  final ExpansionTileController controller;

  Widget busTile(BuildContext context) {
    return ExpansionTile(
      controller: controller,
      title: Container(
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("BUS NAME"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("From"),
                    Icon(Icons.swap_horiz),
                    Text("To"),
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
            ElevatedButton(
                onPressed: (){
              if (controller.isExpanded){
                controller.collapse();
              }if(!controller.isExpanded){
                controller.expand();
              }
            },
                child: Text("View Seats")
            )
          ],
        ),
      ),
      children: [
        Text("Hurrayy")
      ],
      // Your ExpansionTile content
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        busTile(context),
        // Add more busTile widgets as needed
      ],
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final ExpansionTileController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpansionTileController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Available Buses")),
        elevation: 5,
      ),
      body: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              BusTemp(controller: controller),
              // BusTemp(controller: controller),
              // BusTemp(controller: controller),
              // Add more BusTemp widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
