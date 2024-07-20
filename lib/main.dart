import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 176, 176, 176)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = " ";
  var backcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var scaffold = Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:Text('MY_BMI'),
      ),
      body: Container(
      color: backcolor,
        
      
        child: Center(
             child: Container(
                width: 350,
                
             
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                Text('BMI', style: TextStyle(
                     fontSize: 40,fontWeight: FontWeight.w800,),
                   
                ),
                SizedBox(height: 30,),
               TextField(
                   controller:wtcontroller,
                   decoration: InputDecoration(
                    label: Text('Enter you weight in KG'),
                    prefixIcon: Icon(Icons.line_weight)
                   ), 
                    keyboardType: TextInputType.number,
                ),
        
                SizedBox(height: 15,),
               
                
                TextField(
                    
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your height in FT'),
                    prefixIcon: Icon(Icons.height)
                  ),
                    keyboardType: TextInputType.number,
            
                ),
                SizedBox(height: 15,),
        
                TextField(
                  
                  
                  controller: inchcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter the height in inch'),
                    prefixIcon: Icon(Icons.height),
                    
                  ),
                  
                  keyboardType: TextInputType.number,
        
                ),
            
            SizedBox(height: 15,),
        
        
           ElevatedButton(onPressed:(){
        
            var wt = wtcontroller.text.toString();
            var ft = ftcontroller.text.toString();
            var inch = inchcontroller.text.toString();
        
            if(wt!="" && ft!="" && inch!=""){
        
        
              var iWt = int.parse(wt);
              var iFt = int.parse(ft);
              var iInch = int.parse(inch);
                
                var tInch = (iFt*12 ) + iInch ;
                
                var tCm = tInch*2.54;
        
                var tM = tCm/100;
        
                var bmi = iWt/(tM*tM);
        
                var msg = " ";

               
                setState(() {
                  
                
                if(bmi>25){
                   backcolor = Color.fromARGB(255, 246, 68, 55);
                  msg = "You are Overweight!!!";
                 
                } else if(bmi<18){
                   backcolor = Color.fromARGB(255, 255, 137, 3);
        
                  msg = "You are underweight!!!";
                 
                } else{
                  backcolor = Color.fromARGB(255, 95, 255, 98);
        
                  msg = "You are Healthy!!!";
                  
              
                  
                };

                });
        
                setState(() {
        
                  result = "$msg \n Your bmi is: ${bmi.toStringAsFixed(2)}" ;
        
                });
        
                
              
            
        
            } else {
              setState(() { 
                result = "Please fill all the required blanks!!!";
              });
            }
        
            
        
          
        
        
        
        
           }, child:Text('CALCULATE'),
              
           
            ),
            
                SizedBox(width: 20,),
        
                Text(result, style: TextStyle(fontSize: 20),),
        
            
              ],
            
               
            
            
                ),
            
            
            ),
          ),
      ),
      
      
  
             
      

      );
    return scaffold;   
    
  }
}
