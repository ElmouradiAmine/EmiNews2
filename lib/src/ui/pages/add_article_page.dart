import 'package:flutter/material.dart';
import 'package:emi_news/src/resources/firestore_provider.dart';

class AddArticle extends StatefulWidget {
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  TextEditingController title;
  TextEditingController description;
  TextEditingController author;
  TextEditingController imgUrl;
  TextEditingController texte;
  FirestoreProvider _firestoreProvider = FirestoreProvider();

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    description = TextEditingController();
    author = TextEditingController();
    imgUrl = TextEditingController();
    texte = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajout d\'un article'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[
            TextField(
              controller: title,
              maxLength: 30,
              decoration: InputDecoration(

                hintText: "Titre",
              ),
            ),
            TextField(
              controller: description,
              maxLength: 30,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            TextField(
              controller: imgUrl,
              decoration: InputDecoration(
                hintText: "Thumbnail Image URL",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: texte,
              maxLines: 50,
              decoration: InputDecoration(
                hintText: "Texte",
                border: OutlineInputBorder()
              ),
            ),
            RaisedButton(
              onPressed: (){
                _firestoreProvider.uploadArticle(title.text, description.text,texte.text,author.text,imgUrl.text);
                Navigator.pop(context);
              },
              color: Colors.black,
              child: Text('Enregistrer',style: TextStyle(
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}
