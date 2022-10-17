import 'package:e_commerce_assignment8/core/constants/color_constants.dart';
import 'package:e_commerce_assignment8/core/constants/constant_data.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: ColorConstants.scaffoldBackgroundColor,
      child: ListView.builder(
        itemCount: Plants.filterList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorConstants.plantsSoldTextColor),
                color: (Plants.filterList[index].isSelected)
                    ? ColorConstants.plantsSoldTextColor
                    : ColorConstants.scaffoldBackgroundColor,
              ),
              child: Center(
                child: Text(
                  Plants.filterList[index].filterName,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: (Plants.filterList[index].isSelected)
                          ? Colors.white
                          : Colors.green),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
