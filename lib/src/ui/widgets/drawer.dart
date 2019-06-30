import 'package:flutter/material.dart';
import 'package:emi_news/src/blocs/login_bloc_provider.dart';
import 'package:emi_news/src/blocs/login_bloc.dart';
import 'package:emi_news/src/ui/pages/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:emi_news/src/resources/user_provider.dart';
import 'package:emi_news/src/ui/pages/login_page.dart';
import 'package:emi_news/src/ui/pages/add_article_page.dart';

class MyDrawer extends StatelessWidget {


  MyDrawer();


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                CircleAvatar(
//
//                  child: ,
//                  radius: 40,
//                  backgroundColor: Colors.white,
//                ),
              Container(
                width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: (user.status != Status.Authenticated  || user.userModel.imgUrl  == null    )? null : DecorationImage(image: NetworkImage(user.userModel.imgUrl),fit: BoxFit.cover)

              ),child: user.status != Status.Authenticated || user.userModel.imgUrl == null   ? Icon(Icons.person) : Container() ,
            ),
                SizedBox(
                height: 10.0,
                ),
                Text( user.status == Status.Unauthenticated ? "Non connecté(e)" : user.userModel.name ,style: TextStyle(
                  color: Colors.white
                ),),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Visibility(
            visible: (user.status == Status.Authenticated && (user.userModel.isAdmin!= null &&  user.userModel.isAdmin)),
            child: ListTile(
              leading:   Icon(Icons.library_add,color:Colors.purple),
              title: Text('Ajout d\'un article'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddArticle()));
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.library_books,color:Colors.tealAccent),
            title: Text('All News'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.whatshot,color: Colors.orange,),
            title: Text('Trending News'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,color: Colors.red,),
            title: Text('Favorite News'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.brown,),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer,color: Colors.blue,),
            title: Text('Contact Us'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info,color: Colors.green,),
            title: Text("Crédits"),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(),
          Visibility(
            visible: user.status == Status.Unauthenticated,
            child: ListTile(
              leading: Icon(Icons.person_add,color: Colors.blue,),
              title: Text('S\'inscrire'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
            ),
          ),
          Visibility(
            visible: user.status == Status.Unauthenticated,
            child: ListTile(
              leading: Icon(Icons.account_circle,color: Colors.blue,),
              title: Text('Se connecter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
          Visibility(
            visible: user.status != Status.Unauthenticated,
            child: ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.blue,),
              title: Text('Se déconnecter'),
              onTap: () {
                user.signOut();
              },
            ),
          ),

        ],
      ),
    );
  }
}
