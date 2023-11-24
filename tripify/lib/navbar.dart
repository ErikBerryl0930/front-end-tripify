  import 'package:flutter/material.dart';

    void main(){
      runApp(
        MaterialApp(
          title: "Tripify", 
          
          debugShowCheckedModeBanner: false, 
          home: HomePage(),
        )
      );
    }
    
    class HomePage extends StatefulWidget {
      const HomePage({ Key? key }) : super(key: key);
    
      @override
      _HomePageState createState() => _HomePageState();
    }
    
    class _HomePageState extends State<HomePage> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Tripify"),
          ),
          body: Center(
            child: Text(
              "Ini halaman utama, kalian bebas memberikan widget"
              
            ),
          ),
          //memberikan button garis tiga disebelah kiri appbar
          //jika ditekan akan menjalankan widget builddrawer
          drawer: _buildDrawer(), 
        );
       


      }
    }

    
    //widget ini adalah isi dari sidebar atau drawer
    Widget _buildDrawer() {
      return SizedBox(
        //membuat menu drawer
        child: Drawer(
          //membuat list, 
          //list digunakan untuk melakukan scrolling jika datanya terlalu panjang
          child: ListView(
            padding: EdgeInsets.zero,
            //di dalam listview ini terdapat beberapa widget drawable
            children: [
              UserAccountsDrawerHeader(
                //membuat gambar profil
                currentAccountPicture: Image(
                  image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                ),
                //membuat nama akun
                accountName: Text("Ganteng Ganteng"), 
                //membuat nama email
                accountEmail: Text("Ganteng@gmail.com"),
                //memberikan background

                decoration: BoxDecoration(
                  image: DecorationImage(
                   image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    fit: BoxFit.cover
                    
                  )
                ),
              ), 
              //membuat list menu
              ListTile( leading: Icon(Icons.people), title: Text("Edit Profile"), onTap: (){},),
              ListTile( leading: Icon(Icons.settings), title: Text("Settings"), onTap: (){},), 
              ListTile( leading: Icon(Icons.security), title: Text("Security"), onTap: (){},), 
              
              ListTile( leading: Icon(Icons.history), title: Text("Transaction History"), onTap: (){},), 
              ListTile( leading: Icon(Icons.lock), title: Text("Logout"), onTap: (){},), 
            ],
          ),
        ),
      );
    }