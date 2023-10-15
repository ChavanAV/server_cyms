import 'package:flutter/material.dart';
import 'package:server_cyms/utils/my_app_bar.dart';

import '../utils/colors.dart';
import '../widgets/detail_screen_widgets/text_info.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String img;
  // final String area;
  // final String rate;
  final String land;
  final String cultivationMethod;
  final String varieties;
  final String supplement;
  final String disease;
  final String yield;
  final int index;
  const DetailScreen({
    Key? key,
    required this.name,
    required this.img,
    // required this.area,
    // required this.rate,
    required this.land,
    required this.cultivationMethod,
    required this.varieties,
    required this.supplement,
    required this.disease,
    required this.yield,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgclr,
        appBar: MyAppBar().myAppBar(name),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 300,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: detailCardborderclr),
                  color: detailCardclr,
                ),
                child: Row(
                  children: [
                    // const Expanded(
                    //   child: MyBarChart(getArea: '12', getRate: '23'),
                    // ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          // height: 200,
                          width: double.maxFinite,
                          color: Colors.transparent,
                          child: Hero(
                            tag: 'heroTag_$index',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: NetworkImage(img),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // SizedBox(
                        //     width: double.maxFinite,
                        //     height: 60,
                        //     child: DirectUploadBtn(
                        //       press: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => SendInfoScreen(
                        //                       fromDirectScreen: 'no',
                        //                       currentName: name,
                        //                     )));
                        //       },
                        //       color: bgclr,
                        //     ))
                      ],
                    )),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // const InfoBar(
              //   itemArea: '12',
              //   itemRate: '23',
              // ),
              const SizedBox(
                height: 30,
              ),
              TextInfo(
                land: land,
                cultivation_method: cultivationMethod,
                varieties: varieties,
                supplement: supplement,
                disease: disease,
                yield: yield,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
