// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:server_cyms/provider/api.dart';
// import 'package:server_cyms/utils/toast_msg.dart';
// import 'package:server_cyms/utils/my_app_bar.dart';
// import '../utils/colors.dart';
// import '../widgets/grocery_card.dart';
// import '../widgets/search_box.dart';
//
// class FruitsScreen extends StatefulWidget {
//   const FruitsScreen({Key? key}) : super(key: key);
//   @override
//   State<FruitsScreen> createState() => _FruitsScreenState();
// }
//
// class _FruitsScreenState extends State<FruitsScreen> {
//
//   TextEditingController searchController = TextEditingController();
//   List<Map<String, dynamic>> vegetableList = [];
//   List<Map<String, dynamic>> filteredVegetableList = [];
//   bool hasData = false;
//
//   Future<void> getVegetableInfo() async {
//     try {
//       var res = await http.get(Uri.parse(API.vegetableInfoApiPath));
//       if (res.statusCode == 200) {
//         final responseData = jsonDecode(res.body) as List<dynamic>;
//         setState(() {
//           vegetableList = responseData.cast<Map<String, dynamic>>();
//           filteredVegetableList.addAll(vegetableList);
//           hasData = true;
//         });
//       }
//     } catch (e) {
//       Timer(const Duration(seconds: 10), () {
//         Utils().toastMsg('Connection issue try some time later!');
//         setState(() {
//           hasData = false;
//         });
//         Navigator.pop(context);
//       });
//     }
//   }
//
//   void filterData(String searchText) {
//     setState(() {
//       filteredVegetableList = vegetableList.where((item) =>
//           item['marathi_name'].toLowerCase().contains(searchText.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getVegetableInfo();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: bgclr,
//           appBar: MyAppBar().myAppBar("Vegetables"),
//           body: Column(
//             children: [
//               SearchBox(searchController: searchController,filterData: filterData,),
//               hasData
//                   ? Expanded(
//                 child: GridView.builder(
//                     itemCount: filteredVegetableList.length,
//                     padding: const EdgeInsets.all(8),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         mainAxisExtent: 230),
//                     itemBuilder: (context, index) {
//                       return GroceryCard(
//                         img: '${API.hostConnect}/${filteredVegetableList[index]['img_path']}',
//                         name: filteredVegetableList[index]['marathi_name'],
//                         area: filteredVegetableList[index]['total_area'],
//                         rate: filteredVegetableList[index]['avg_rate'],
//                         land: filteredVegetableList[index]['land'],
//                         cultivationMethod: filteredVegetableList[index]['cultivation_method'],
//                         varieties: filteredVegetableList[index]['varieties'],
//                         supplement: filteredVegetableList[index]['supplement'],
//                         disease: filteredVegetableList[index]['disease'],
//                         yield: filteredVegetableList[index]['yield'],
//                         index: index,
//                       );
//                     }
//                 ),
//               )
//                   : const Center(child: CircularProgressIndicator()),
//             ],
//           )),
//     );
//   }
// }
