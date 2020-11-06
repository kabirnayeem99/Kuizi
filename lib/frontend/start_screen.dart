// import 'package:flutter/material.dart';

// import '../backend/utilities/color_pallette.dart';
// import 'quiz_screen.dart';

// class StartScreen extends StatefulWidget {
//   StartScreen({Key key}) : super(key: key);

//   @override
//   _StartScreenState createState() => _StartScreenState();
// }

// class _StartScreenState extends State<StartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(0xffffffff),
//         child: Center(
//           child: SafeArea(
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Image.asset("assets/images/thinking_girl.jpg"),
//                 ),
//                 FlatButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(90.0),
//                   ),
//                   onPressed: () => {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => QuizScreen(),
//                       ),
//                     ),
//                   },
//                   color: Pallette.attractiveRed,
//                   child: Icon(
//                     Icons.play_arrow,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.all(20.0),
//                     child: Text(
//                       "Have fun. Do Quiz.",
//                       style: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                         color: Pallette.attractiveRed,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
