import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      home: MainPage()
  ));
}

class MainPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.lightBlue,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
             child:Center(
            child: MaterialButton(
              color: Colors.white,
              shape: CircleBorder(),
              height: 150 ,
              minWidth: 150,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePage()));
              },
              child: Text("START"),
              ),
             )
          ),
          Container(
            color: Colors.pinkAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child:Center(
            child: MaterialButton(
              color: Colors.white,
              shape: CircleBorder(),
              height: 150 ,
              minWidth: 150,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePage()));

              },
              child: Text("START"),
              ),
          )
      )],
      ),
    );
  }

}

class GamePage extends StatefulWidget
{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight=0;
  double pinkCardHeight=0;

  int Player1score=0;
  int Player2score=0;

  bool initialize=false;

  @override
  Widget build(BuildContext context) {
    if(!initialize)
    {
    blueCardHeight=MediaQuery.of(context).size.height/2;
    pinkCardHeight=MediaQuery.of(context).size.height/2;
    initialize=true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton
          (onPressed:() {
            setState(() {
              blueCardHeight=blueCardHeight+30;
              pinkCardHeight=pinkCardHeight-30; 
              Player1score=Player1score+5;                   
            });

            double maxheight=MediaQuery.of(context).size.height-60;

            if(blueCardHeight>maxheight)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(Player1score,"1")));
              }
          },
          padding: EdgeInsets.zero,
            child: Container(
              height:blueCardHeight,
              width: double.infinity,
              color: Colors.lightBlue,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: Text("Player 1",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))), Text(Player1score.toString()) 
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
              pinkCardHeight=pinkCardHeight+30;                    
              blueCardHeight=blueCardHeight-30;
              Player2score=Player2score+5; 
              
            });

            double screenheight=MediaQuery.of(context).size.height;
            double maxheight=MediaQuery.of(context).size.height-60;

            if(pinkCardHeight>maxheight)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(Player2score,"2")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: pinkCardHeight,
              width: double.infinity,
              color: Colors.pinkAccent,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: Text("Player 2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))), Text(Player2score.toString()) 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Result extends StatelessWidget
{
  int score=0;
  String player="";
  Result(this.score,this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player=="2" ?Colors.pinkAccent:Colors.lightBlue,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(score.toString(),style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
          Text(player=="1"?"PLAYER 1 WON": "PLAYER 2 WON",style: TextStyle(fontSize: 40),),
          MaterialButton(onPressed:
          (){
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: Colors.white,
          child: Text("Restart Game"),
          )
        ],),
      )
    );
  }

}
