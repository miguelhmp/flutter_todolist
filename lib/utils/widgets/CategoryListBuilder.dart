import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/CategoryData.dart';
import 'buildCard.dart';

class CategoryListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final tasks = Provider.of<TaskData>(context);
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) {
        return Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // crossAxisCount: 2,
              maxCrossAxisExtent: 200,
              // mainAxisExtent: 200,
              childAspectRatio: 1.1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemCount: categoryData.categories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = categoryData.categories[index];

              return BuildCard(
                icon: category.icon,
                iconColor: category.iconColor,
                title: category.title,
                tasks: '',
                // tasks: category.tasks,
                onPress: () {
                  Navigator.pushNamed(context, category.navUrl, arguments: {
                    'bgColor': category.iconColor,
                    'icon': category.icon,
                    'title': category.title,
                  });
                },
              );
            },
          ),
        );
      },
    );
  }
}
