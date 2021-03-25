import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List displayedItems = [
    {
      "name":"Haris",
      "subject":"English",
      "rating":01,
      "image":"assets/l1.jpg"
    },
    {
      "name":"Muhammad",
      "subject":"Sales",
      "rating":02,
      "image":"assets/l2.jpg"
    },
    {
      "name":"Muhammad",
      "subject":"Sales and Mangement",
      "rating":03,
      "image":"assets/l3.jpg"
    },{
      "name":"Hunain",
      "subject":"Computer Science",
      "rating":04,
      "image":"assets/l4.jpg"
    },{
      "name":"Mubashir",
      "subject":"English",
      "rating":05,
      "image":"assets/l5.jpg"
    },{
      "name":"Shahroz",
      "subject":"Sales",
      "rating":06,
      "image":"assets/l6.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0,top: 40.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Discover',style: TextStyle(
                    fontSize: 37.0,fontWeight: FontWeight.bold,color: Colors.black
                ),),
                SizedBox(width: 100.0,),
                Icon(Icons.message_sharp),
                SizedBox(width: 20.0,),
                CircleAvatar(radius: 28.0,
                  backgroundColor: Colors.deepOrange,
                  child: CircleAvatar(backgroundImage: AssetImage('assets/p4.png'),radius: 25.0,
                  ),
                )],
            ),
            // SizedBox(height: 5,),
            Text('Available tutors in your area',style: TextStyle(
                fontSize: 17.0,color: Colors.black
            ),),
            SizedBox(height: 30.0,),

            Container(
              height: 340.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: displayedItems.length,
                shrinkWrap: true ,
                itemBuilder: (BuildContext context, int index){
                  return _buildCard(index);
                },
              ),
            ),
            ListTile(
              title: Text('Your Languages',style: TextStyle(
                  fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black
              )),
              subtitle: Text('Define preferences in settings page',style: TextStyle(
                  fontSize: 17.0,color: Colors.black
              ),),
              trailing: Icon(Icons.add_circle_outlined,size:30.0,color: Colors.black12,),
              onTap: () {
                print('horse');
              },
              selected: false,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://cdn.countryflags.com/thumbs/united-states-of-america/flag-round-250.png'),
              ),
              title: Text('English'),
              subtitle: Text('128 tutors'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('camel');
              },
              enabled: false,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://cdn.countryflags.com/thumbs/germany/flag-round-250.png'),
              ),
              title: Text('German'),
              subtitle: Text('128 tutors'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('camel');
              },
              enabled: false,
            ),

          ],

        ),
      ),

    );
  }
  _buildCard(index) {
    print('in build');
    return  Stack(
      children: <Widget>[
        Card(
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 20.0,
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(displayedItems[index]['image']),
          ),

        ),
        Positioned(top: -5,
            left: 30.0,
            child: Icon(Icons.bookmark,color: Colors.deepOrange,size: 40.0,)),
        Positioned(
            bottom: 30.0,
            left: 30.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.white,),
                    SizedBox(width: 10.0,),
                    Text(displayedItems[index]['rating'].toString(),style: TextStyle(color: Colors.white),),
                    SizedBox(width: 30.0),

                  ],
                ),
                Text(displayedItems[index]['name'].toString(),style: TextStyle(color: Colors.white,fontSize: 30.0),),
                Text(displayedItems[index]['subject'].toString(),style: TextStyle(color: Colors.white),),
              ],
            )
        ),
        Positioned(
          bottom: 30.0,
          right: 30.0,
          child: RaisedButton(color: Colors.deepOrange,
            elevation: 30.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),),
            onPressed: (){},
            child: Text('Contact',
              style: TextStyle(fontSize: 15.0,color: Colors.white),
            ),
          ),
        ),
      ],
    );


  }

}

