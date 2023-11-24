import 'package:flutter/material.dart';
    
void main() {
    runApp(const MyApp());
}
    
class MyApp extends StatefulWidget {
    const MyApp({Key? key}) : super(key: key);
    
    @override
    _MyAppState createState() => _MyAppState();
}
    
class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
    
        //menghilangkan debug label
        debugShowCheckedModeBanner: false,
        home: Scaffold(
    
            //membuat appbar dengan background putih dan membuat tulisan di tengah
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: Center(
                    child: Text(
                        "Category",
                        style: TextStyle(
                            color: Colors.black38
                        ),
                    ),
                ),
            ),
            body: ListView.builder(
              // itemcount adalah total panjang data yang ingin ditampilkan
              itemCount: 20,
    
              // itembuilder adalah bentuk widget yang akan ditampilkan, wajib menggunakan 2 parameter.
              itemBuilder: (context, index){
    
                //padding digunakan untuk memberikan jarak bagian atas listtile agar tidak terlalu mepet
                //menggunakan edgeInsets.only untuk membuat jarak hanya pada bagian atas saja
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20, 
                  ),
    
                  //listtile adalah widget yang disediakan flutter berisi 3 properti yang kita pakai
                  //properti: leading, title, dan subtitle. di dalam setiap properti kalian bebas melakukan customisasi
                  child: ListTile(
                    leading: Image.network(
                      "https://cdn.pixabay.com/photo/2018/02/24/23/05/architecture-3179435_960_720.jpg", 
                    ),
                    title: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit", 
                      maxLines: 1, 
                      overflow: TextOverflow.ellipsis, 
                    ),
                    subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }, 
            )
          ),
        );
      }
    }