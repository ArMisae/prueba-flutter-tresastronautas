import 'package:flutter/material.dart';

class CategoryListWidget extends StatefulWidget {
  final List category;
  const CategoryListWidget({Key? key, required this.category})
      : super(key: key);

  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  int selectdIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectdIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
                color: selectdIndex == index
                    ? const Color.fromRGBO(253, 120, 31, 1)
                    : Colors.white,
              ),
              child: Text(
                widget.category[index],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: selectdIndex == index ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
