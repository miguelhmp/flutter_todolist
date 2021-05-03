import 'package:flutter/material.dart';
import 'package:todo_flutter/utils/Constants.dart';
import 'package:todo_flutter/utils/widgets/CategoryListBuilder.dart';
import 'package:todo_flutter/utils/widgets/MyFAB.dart';

class MenuScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgHomeColor,
      floatingActionButton: MyFAB(
        typeOfFAB: 'multi',
      ),
      body: SafeArea(
        child: Container(
          // width: double.maxFinite,
          // height: double.maxFinite,
          padding: EdgeInsets.only(
            top: 15,
            right: 10,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.menu,
                      color: kTextTitleColor,
                      size: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'List',
                        style: TextStyle(
                          color: kTextTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CategoryListBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
