import 'package:flutter/material.dart';
import 'package:emi_news/src/resources/firestore_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'dart:io';
class AddArticle extends StatefulWidget {
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  TextEditingController title;
  TextEditingController description;
  TextEditingController author;
  TextEditingController texte;
  FirestoreProvider _firestoreProvider = FirestoreProvider();
  File galleryFile;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    description = TextEditingController();
    author = TextEditingController();
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
            GestureDetector(
              onTap: imageSelectorGallery,
              child: Container(
              height: 200,
              child: galleryFile == null ? Icon(Icons.image,size: 100,) : Image.file(galleryFile,fit: BoxFit.fill,) ,
              width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
        ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: title,
              maxLength: 40,
              decoration: InputDecoration(

                hintText: "Titre",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: description,
              maxLength: 40,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: texte,
              maxLines: 30,
              decoration: InputDecoration(
                hintText: "Texte",
                border: OutlineInputBorder()
              ),
            ),
            loading == false ? RaisedButton(
              onPressed: () async {
                if (isValid()){
                  setState(() {
                    loading = true;
                  });
                  final StorageReference storageRef =
                  FirebaseStorage.instance.ref().child("images/" + DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(10000).toString() + ".png"  );
                  final StorageUploadTask uploadTask = storageRef.putFile(
                    File(galleryFile.path),

                  );
                  final StorageTaskSnapshot downloadUrl =
                  (await uploadTask.onComplete);
                  final String url = (await downloadUrl.ref.getDownloadURL());
                  print('URL Is $url');

                  _firestoreProvider.uploadArticle(title.text, description.text,texte.text,author.text,url);
                  Navigator.pop(context);
                }

              },
              color: Colors.black,
              child: Text('Enregistrer',style: TextStyle(
                color: Colors.white
              ),),
            ) : Container(child: CircularProgressIndicator(),),
          ],
        ),
      ),
    );
  }

  imageSelectorGallery() async{
    galleryFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }

  bool isValid(){
    if ( galleryFile == null || title.text == ""  || description.text == "" || texte.text == "" || author.text == ""  ){
      return false;
    }
    return true;
  }
}
