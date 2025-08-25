import 'package:test_app/doctordata.dart';
import 'package:test_app/DoctorsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}
String query = "";

class _Page1State extends State<Page1> {

  List<Map<String, dynamic>> filter =[];
  @override
  void initState() {
    super.initState();
    filter = doctors; // يبدأ بكل الدكاترة
  }
  void filterupdate(String value) {
    setState(() {
      query = value;
      filter = doctors.where((doc) {
        final name = doc['name'].toString().toLowerCase();
        final specialization = doc['specialization'].toString().toLowerCase();
        final searchLower = query.toLowerCase();
        return name.contains(searchLower) || specialization.contains(searchLower);
      }).toList();
    });
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(

          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 65,horizontal: 30),


              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      margin: EdgeInsetsGeometry.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children:[            Text("Hello,",style:TextStyle(fontSize: 16,color: Colors.black54),),
                              Text("Hi James",style: TextStyle(fontFamily: 'Poppins',fontSize: 20,fontWeight: FontWeight.w700),),],
                          ),


                          Container(
                            height: 55,
                            width: 55,
                            child: Transform.rotate(


                              angle:-0.19,
                              child: Container(

                                margin: EdgeInsetsGeometry.only(left: 12,top: 5),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,

                                ), child: Column(
                                children: [
                                  Text('.  .',style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text('```',style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),

                                ],
                              ),

                              ),
                            ),

                            decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle
                            ),
                            clipBehavior: Clip.hardEdge,
                          ),

                        ],
                      ),

                    ),
                    Card(margin: EdgeInsetsGeometry.symmetric(vertical: 25),
                      color: Colors.blue,
                      elevation: 3,
                      child: Padding(


                        padding: EdgeInsetsGeometry.symmetric(horizontal: 15,vertical: 20),

                        child: Column(

                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(
                                    "https://tse3.mm.bing.net/th/id/OIP.PBPYVES_vO2MW-UMqpAXQgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
                                  ),
                                ),

                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Text("Dr. Imran Syahir",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),

                                      Text("General Doctor",style: TextStyle(color: Colors.white54,),),


                                    ]),
                                IconButton(onPressed: (){print("clicked");},icon:Icon(Icons.keyboard_arrow_right_rounded,color: Colors.white,size: 30,))


                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(

                              color: Colors.white24,
                              thickness: 1,
                              indent: 0,
                              endIndent: 10,
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [

                                    Icon(Icons.calendar_month, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text("Sunday, 12 June",
                                        style: TextStyle(color: Colors.white, fontSize: 14)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text("11:00 - 12:00 AM",
                                        style: TextStyle(color: Colors.white, fontSize: 14)),
                                  ],
                                ),

                              ],
                            ),

                          ],
                        ),


                      ),

                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                        child:   TextField(
                          keyboardType: TextInputType.text,
                          onChanged:filterupdate,

                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.search, color: Colors.grey),

                            hintText: "Search doctor or health issue",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                          ),
                        )

                    ),
                    Container(
                      margin: EdgeInsetsGeometry.symmetric(vertical: 25),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child: IconButton(onPressed: (){print("icon");}, icon:Icon(Icons.sunny,color: Colors.blueAccent,)),

                                decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.black.withOpacity(0.05),
                                ),



                              ),
                              const SizedBox(height: 9,),
                              Text('Covid 19',style: TextStyle(color: Colors.black54),),  ],
                          ),

                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child: IconButton(onPressed: (){
                                  Navigator.push(

                                      context,


                                      MaterialPageRoute(builder: (context)=>DoctorsPage())
                                  );

                                }, icon:Icon(Icons.person_add_alt_1_rounded,color: Colors.blueAccent,)),

                                decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.black.withOpacity(0.05),
                                ),



                              ),
                              const SizedBox(height: 9,),
                              Text('Doctor',style: TextStyle(color: Colors.black54),),   ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child: IconButton(onPressed: (){print("icon");}, icon:Icon(Icons.link,color: Colors.blueAccent,)),

                                decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.black.withOpacity(0.05),
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text('Medicine',style: TextStyle(color: Colors.black54),),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child: IconButton(onPressed: (){print("icon");}, icon:Icon(Icons.local_hospital,color: Colors.blueAccent,)),

                                decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.black.withOpacity(0.05),
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text('Hospital',style: TextStyle(color: Colors.black54),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (doctors.isNotEmpty)
                      Container(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [


                          Container(margin: EdgeInsetsGeometry.only(top: 20),
                            child: Text('Near Doctor', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,)
                            ),
                          ),SizedBox(height: 0),

                          Container(margin: EdgeInsetsGeometry.only(top: 30),
                            child: ListView.builder(
                              padding: EdgeInsetsGeometry.symmetric(vertical: 0),
                              physics: NeverScrollableScrollPhysics(),

                              shrinkWrap: true,
                              itemCount: filter.length,
                              itemBuilder: (context, index) {
                                final doc = filter[index];
                                return

                                  Container(margin: EdgeInsetsGeometry.only(bottom: 20),
                                    padding: EdgeInsetsGeometry.symmetric(horizontal: 15,vertical: 20),
                                    height: 148,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.07),
                                          blurRadius: 10,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children:[
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: NetworkImage(doc['image']),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsetsGeometry.only(left: 15,top: 5),
                                                  child: Text(doc['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black87),),
                                                ),
                                                Container(
                                                  margin: EdgeInsetsGeometry.only(left: 15,top: 5),
                                                  child: Text(doc['specialization'],style: TextStyle(fontSize: 14,color: Colors.black54),),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_outlined,color: Colors.grey,size: 18,),
                                                Text(doc['distance'],style: TextStyle(fontSize: 14,color: Colors.black54),),
                                              ],
                                            ),
                                          ],
                                        ),SizedBox(height: 15,),
                                        Divider(
                                          color: Colors.black12,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 10,
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[

                                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.watch_later_outlined, color: Colors.orange, size: 24),
                                                Text(" ${doc['rate']} ", style: TextStyle(fontSize: 14, color: Colors.orange)),
                                                Text("(${doc['reviews']} reviews)", style: TextStyle(fontSize: 14, color: Colors.orange)),

                                              ],
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Icon(Icons.schedule, color: Colors.blueAccent, size: 24),
                                                Text("open at ${doc['startTime']}", style: TextStyle(fontSize: 14, color: Colors.blueAccent)),

                                              ],
                                            ),


                                          ],
                                        ),

                                      ],
                                    ),



                                  );

                              },
                            ),
                          ),

                        ],
                      ),),













                  ] ),
            ),
          ),
        ),

      );
    }
  }

