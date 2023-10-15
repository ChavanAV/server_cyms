import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:server_cyms/model/api.dart';
import 'package:server_cyms/utils/my_app_bar.dart';
import 'package:server_cyms/utils/toast_msg.dart';

import '../utils/colors.dart';
import '../widgets/grocery_card.dart';
import '../widgets/search_box.dart';

class CropsScreen extends StatefulWidget {
  final int index;
  final String allCropName;
  const CropsScreen({Key? key, required this.index, required this.allCropName})
      : super(key: key);
  @override
  State<CropsScreen> createState() => _CropsScreenState();
}

class _CropsScreenState extends State<CropsScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> cropsList = [];
  List<Map<String, dynamic>> filteredCropsList = [];
  bool hasData = false;

  Future<void> getCropsInfo() async {
    try {
      var res = await http.get(Uri.parse(
        widget.index == 0
            ? API.vegetableInfoApiPath
            : widget.index == 1
                ? API.orchardInfoApiPath
                : widget.index == 2
                    ? API.pulsesInfoApiPath
                    : API.flowerInfoApiPath,
      ));
      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body) as List<dynamic>;
        setState(() {
          cropsList = responseData.cast<Map<String, dynamic>>();
          filteredCropsList.addAll(cropsList);
          hasData = true;
        });
      }
    } catch (e) {
      Timer(const Duration(seconds: 10), () {
        Utils().toastMsg('Connection issue try some time later!');
        setState(() {
          hasData = false;
        });
        Navigator.pop(context);
      });
    }
  }

  void filterData(String searchText) {
    setState(() {
      filteredCropsList = cropsList
          .where((item) => item['marathi_name']
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getCropsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgclr,
          appBar: MyAppBar().myAppBar(widget.allCropName),
          body: Column(
            children: [
              SearchBox(
                searchController: searchController,
                filterData: filterData,
              ),
              hasData
                  ? Expanded(
                      child: GridView.builder(
                          itemCount: filteredCropsList.length,
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 230),
                          itemBuilder: (context, index) {
                            return GroceryCard(
                              img:
                                  '${API.hostConnect}/${filteredCropsList[index]['img_path']}',
                              name: filteredCropsList[index]['marathi_name'],
                              // area: filteredCropsList[index]['total_area'],
                              // rate: filteredCropsList[index]['avg_rate'],
                              land: filteredCropsList[index]['land'],
                              cultivationMethod: filteredCropsList[index]
                                  ['cultivation_method'],
                              varieties: filteredCropsList[index]['varieties'],
                              supplement: filteredCropsList[index]
                                  ['supplement'],
                              disease: filteredCropsList[index]['disease'],
                              yield: filteredCropsList[index]['yield'],
                              index: index,
                            );
                          }),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ],
          )),
    );
  }
}
