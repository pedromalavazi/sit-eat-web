// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sit_eat_web/app/controller/menu_controller.dart';
// import 'package:sit_eat_web/pages/admin/adminpages/default_page.dart';
// import 'package:sit_eat_web/utils/app_model.dart';
// import 'package:sit_eat_web/utils/constants.dart';

// class TestPage extends GetView<MenuController> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: menuWidht,
//       color: Colors.grey[300],
//       child: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return Material(
//             color: Colors.transparent,
//             child: InkWell(
//               hoverColor: Colors.red[200],
//               splashColor: Colors.red,
//               onTap: () {
//                 AppModel app = Provider.of<AppModel>(context, listen: false);
//                 app.push(PageInfo('Home', DefaultPage()), replace: true);
//                 //chamar pagina
//               },
//               child: ListTile(
//                 leading: Icon(
//                   FontAwesomeIcons.home,
//                   color: Colors.red[400],
//                 ),
//                 title: Text(
//                   'Home',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
