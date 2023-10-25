import 'package:ar_projectf_flutter/filters_data_model.dart';
import 'package:ar_projectf_flutter/filters_ui_design.dart';
import 'package:flutter/material.dart';


class FaceFiltersScreen extends StatefulWidget
{
  const FaceFiltersScreen({super.key});

  @override
  State<FaceFiltersScreen> createState() => _FaceFiltersScreenState();
}


class _FaceFiltersScreenState extends State<FaceFiltersScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Custom Filters",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 5,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: FiltersDataModel.listOfFilters.length,
        itemBuilder: (context, index)
        {
          return FiltersUIDesign(
            eachFilter: FiltersDataModel.listOfFilters[index],
          );
        },
      ),
    );
  }
}
