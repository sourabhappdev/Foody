import 'package:flutter/material.dart';
import 'package:foody/models/recipe.dart';
import 'package:foody/widgets/recipe_card.dart';
import 'package:foody/backend/api.dart';
import 'package:foody/screens/details.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Recipe> _recipes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe () async{
     _recipes = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
    print(_recipes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu,color: Colors.black),
            SizedBox(width: 10),
            Text('Food Recipes',style: TextStyle(
              color: Colors.black
            )),
          ],
        ),
      ),
      body: isLoading? Center(
        child: CircularProgressIndicator(),
      ): ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(recipe: _recipes[index],),));
          },
          child: RecipeCard(
              title: _recipes[index].name,
              cookTime: _recipes[index].totalTime,
              rating: _recipes[index].rating.toString(),
              thumbnailUrl: _recipes[index].images),
        );
      },),
    );
  }
}

