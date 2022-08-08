// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/categoriesModel.dart';

import 'package:wallpaperapp/widget/widget.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<CategoriesModel> categories = [];
  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "search wallpaper",
                    ),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoriesTile(
                    imgUrl: categories[index].ImageUrl,
                    title: categories[index].categoriesName);
              })
        ],
      )),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String? imgUrl, title;
  CategoriesTile({
    Key? key,
    required this.imgUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Container(
          child: Image.network(imgUrl!),
        ),
        Container(
          child: Text(title!),
        )
      ]),
    );
  }
}
