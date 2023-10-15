
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) filterData;
  const SearchBox({Key? key, required this.searchController, required this.filterData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: searchController,
        onChanged: filterData,
        decoration: const InputDecoration(
            hintText: "Search Crop",
            prefix: Padding(
                padding: EdgeInsets.only(left: 10, top: 0, bottom: 0)),
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
      ),
    );
  }
}
