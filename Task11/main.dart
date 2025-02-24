import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int age=0,weight=0;
  double  height=0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      home: Scaffold(
        backgroundColor: const Color(0xFFFBFBFA),
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
                color: Color(0xFF87B1E3), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(color: const Color(0xFF87B1E3),borderRadius: const BorderRadius.all(Radius.circular(10.0)),border: Border.all(width: 4,color: const Color(0xFFF48C8C))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.male,size: 80,color: Colors.white,),
                          Text("Male",style: TextStyle(fontSize: 30.0,color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xFFF48C8C),borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.female,size: 80,color: Colors.white,),
                          Text("Female",style: TextStyle(fontSize: 30.0,color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),

              ],


              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFF87B1E3),borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Height",style: TextStyle(fontSize: 30.0,color: Colors.white),),
                      Text(height.toStringAsFixed(1),style: const TextStyle(fontSize: 30.0,color: Colors.white),),
                      Slider(
                        activeColor: const Color(0xFFF48C8C),
                        inactiveColor: const Color(0xFF70aae6),
                        min: 0.0,
                          max: 200.0,
                          value: height, onChanged: (val){
                        setState(() {
                          height=val;
                        });

                      })

                    ],

                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Color(0xFF87B1E3),borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Age",style: TextStyle(fontSize: 30.0,color: Colors.white),),
                            Text("$age",style: const TextStyle(fontSize: 30.0,color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(color: Color(0xFFF48C8C),borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                                    child: IconButton(onPressed: (){
                                      setState(() {
                                        if(age<100) {
                                          age++;
                                        }
                                      });
                                    }, icon: const Icon(Icons.add,size: 30,color: Colors.white,)),

                                                            ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(color: Color(0xFFF48C8C),borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                                    child: IconButton(onPressed: (){
                                      setState(() {
                                        if(age>0) {
                                          age--;
                                        }
                                      });
                                    }, icon: const Icon(Icons.remove,size: 30,color: Colors.white,)),

                                  ),
                                )
                              ],
                            )
                          ],


                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Color(0xFF87B1E3),borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Weight",style: TextStyle(fontSize: 30.0,color: Colors.white),),
                            Text("$weight",style: const TextStyle(fontSize: 30.0,color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(color: Color(0xFFF48C8C),borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                                    child: IconButton(onPressed: (){
                                      setState(() {
                                        if(weight<200) {
                                          weight++;
                                        }
                                      });
                                    }, icon: const Icon(Icons.add,size: 30,color: Colors.white,)),


                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(color: Color(0xFFF48C8C),borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                                    child: IconButton(onPressed: (){
                                      setState(() {
                                        if(weight>5) {
                                          weight--;
                                        }
                                      });
                                    }, icon: const Icon(Icons.remove,size: 30,color: Colors.white,)),

                                  ),
                                )
                              ],
                            )
                          ],


                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 70,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                color: const Color(0xFFF48C8C),
                child: const Text(
                  "CALCULATOR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}