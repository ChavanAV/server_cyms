import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:server_cyms/utils/colors.dart';
import 'package:server_cyms/utils/my_app_bar.dart';
import 'package:server_cyms/widgets/button.dart';

import '../model/api.dart';
import '../utils/toast_msg.dart';

class SendInfoScreen extends StatefulWidget {
  final String? currentName;
  final String fromDirectScreen;
  const SendInfoScreen(
      {Key? key, this.currentName, required this.fromDirectScreen})
      : super(key: key);
  @override
  State<SendInfoScreen> createState() => _SendInfoScreenState();
}

class _SendInfoScreenState extends State<SendInfoScreen> {
  final TextEditingController areaController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var selectedValue;
  var domainName;
  bool isUploaded = true;
  bool isNameFetched = true;
  bool check = false;
  List names = [];
  List<String> domain = [
    'vegetable_info',
    'orchard_info',
    'pulses_info',
    'flower_info',
  ];

  Future<void> sendTableName(String domainName) async {
    setState(() {
      isNameFetched = false;
    });
    try {
      final response = await http.post(Uri.parse(API.getNamesApiPath), body: {
        'domainName': domainName,
      });
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        setState(() {
          names = res;
          selectedValue = null;
          isNameFetched = true;
        });
      }
    } catch (e) {
      Timer(const Duration(seconds: 10), () {
        Utils().toastMsg('Connection issue try some time later!');
        nav();
      });
      setState(() {
        isNameFetched = false;
      });
    }
  }

  void nav() {
    Navigator.pop(context);
  }

  Future<void> insertData(
      String name, String rate, String area, String tableName) async {
    String newTableName = "";
    if (tableName == "vegetable_info") {
      setState(() {
        newTableName = "vegetable_entry";
      });
    } else if (tableName == "orchard_info") {
      setState(() {
        newTableName = "orchard_entry";
      });
    } else if (tableName == "pulses_info") {
      setState(() {
        newTableName = "pulses_entry";
      });
    } else {
      setState(() {
        newTableName = "flower_entry";
      });
    }
    if (formkey.currentState!.validate()) {
      setState(() {
        isUploaded = false;
      });
      final response = await http.post(Uri.parse(API.addInfoApiPath), body: {
        'name': name,
        'rate': rate,
        'area': area,
        'tableName': newTableName,
      });
      if (response.statusCode == 200) {
        Utils().toastMsg("Upload successful");
        setState(() {
          areaController.clear();
          rateController.clear();
          selectedValue = null;
          isUploaded = true;
        });
      } else {
        setState(() {
          isUploaded = false;
        });
        Utils().toastMsg("Upload failed try again!");
      }
    } else {
      return Utils().toastMsg("Fill all places");
    }
  }

  @override
  void dispose() {
    rateController.dispose();
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myAppBar(
            widget.fromDirectScreen == 'yes' ? "पाठवा" : widget.currentName!),
        backgroundColor: bgclr,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                widget.fromDirectScreen == 'yes'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              " Domain निवडा",
                              style: infoCardTextStyle,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: detailCardborderclr)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  elevation: 9,
                                  dropdownColor: Colors.white.withOpacity(.9),
                                  icon: const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.black54,
                                  ),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black87),
                                  value: domainName,
                                  items: domain.map((name) {
                                    return DropdownMenuItem<String>(
                                        value: name,
                                        child: Text(name.toString()));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      domainName = newValue;
                                      selectedValue = null;
                                      names = [];
                                    });
                                    sendTableName(domainName);
                                    // getNames();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(
                      child: Text(
                        " पिक निवडा",
                        style: infoCardTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(color: detailCardborderclr)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<dynamic>(
                            elevation: 9,
                            dropdownColor: Colors.white.withOpacity(.9),
                            icon: const Icon(Icons.arrow_downward,
                                color: Colors.black54),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black87),
                            value: selectedValue,
                            hint: isNameFetched
                                ? const Text("Select name")
                                : const SizedBox(
                                    width: 100,
                                    child: LinearProgressIndicator(
                                      color: Colors.green,
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                  ),
                            items: names.map((dynamic name) {
                              return DropdownMenuItem<dynamic>(
                                  value: name['marathi_name'],
                                  child: Text(name['marathi_name'].toString()));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue = newValue;
                                check = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text("पिकाचे क्षेत्रफळ भरा",
                                style: infoCardTextStyle),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: areaController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "क्षेत्रफळ भरा",
                                labelStyle: labelTextStyle,
                              ),
                              validator: (val) {
                                if (val!.isEmpty &&
                                    !RegExp(r'^[1-9]').hasMatch(val)) {
                                  return "क्षेत्रफळ भरा";
                                } else {
                                  return null;
                                }
                              },
                              cursorHeight: 25,
                              cursorColor: Colors.green,
                            ),
                            // child: DataInput(
                            //   controller: areaController,
                            //   labelText: "क्षेत्रफळ भरा",
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text("पिकाचा सध्याचा दर भरा",
                                style: infoCardTextStyle),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: rateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "रुपए",
                                labelStyle: labelTextStyle,
                              ),
                              validator: (val) {
                                if (val!.isEmpty &&
                                    !RegExp(r'^[1-9]').hasMatch(val)) {
                                  return "दर भरा";
                                } else {
                                  return null;
                                }
                              },
                              cursorHeight: 25,
                              cursorColor: Colors.green,
                            ),
                            // child: DataInput(
                            //   controller: rateController,
                            //   labelText: "रुपए",
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      (check || widget.fromDirectScreen == 'no')
                          ? MyElevatedButton(
                              btnName: isUploaded
                                  ? const Text(
                                      "पाठवा",
                                      style: TextStyle(fontSize: 22),
                                    )
                                  : const CircularProgressIndicator(),
                              press: () => insertData(
                                widget.fromDirectScreen == 'yes'
                                    ? selectedValue.toString()
                                    : widget.currentName!,
                                rateController.text.toString(),
                                areaController.text.toString(),
                                domainName,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
