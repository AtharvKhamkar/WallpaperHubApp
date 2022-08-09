// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/categoriesModel.dart';

import 'package:wallpaperapp/widget/widget.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  List<CategoriesModel> categories = [];

  getTrendingWallpapers() async {
    var response = await http.get(
        Uri.https("https://api.pexels.com/v1/curated?per_page=1"),
        headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {});
  }

  @override
  void initState() {
    getTrendingWallpapers();
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
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: const Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "search wallpaper",
                    ),
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                      imgUrl: categories[index].ImageUrl,
                      title: categories[index].categoriesName);
                }),
          )
        ],
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String? imgUrl, title;
  const CategoriesTile({
    Key? key,
    required this.imgUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      child: Stack(children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imgUrl!,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            )),
        Container(
          color: Colors.black12,
          height: 50,
          width: 100,
          alignment: Alignment.center,
          child: Text(
            title!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        )
      ]),
    );
  }
}
