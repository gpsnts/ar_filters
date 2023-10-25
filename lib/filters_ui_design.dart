
import 'package:ar_projectf_flutter/ar_face_view.dart';
import 'package:ar_projectf_flutter/filters.dart';
import 'package:flutter/material.dart';


class FiltersUIDesign extends StatelessWidget
{
  final Filters eachFilter;

  const FiltersUIDesign({super.key, required this.eachFilter,});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: GestureDetector(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (c)=> ARFaceView(filterSelected: eachFilter.image,)));
        },
        child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(

              leading: Image.asset(
                eachFilter.image,
                height: 150,
                width: 150,
              ),

              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    eachFilter.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
