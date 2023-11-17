import 'package:flutter/material.dart';
import 'package:foody/models/recipe.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final Recipe recipe;

  const DetailsPage({super.key, required this.recipe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Icon(Icons.restaurant_menu, color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
                image: NetworkImage(widget.recipe.images),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              height: 100,
              child: Center(
                child: Text(
                  widget.recipe.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        SizedBox(width: 7),
                        Text(
                          widget.recipe.rating.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        SizedBox(width: 7),
                        Text(
                          widget.recipe.totalTime,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: buttonStyle,
            onPressed: () async {
              final url = Uri.parse(widget.recipe.url);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Text(
              'Check Recipe',
              style: TextStyle(
                  letterSpacing: 1, color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(327, 50),
  backgroundColor: Colors.teal,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
);
