import 'package:flutter/material.dart';
import 'package:gdg_sample_app/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_screen/responsive_screen.dart';

class GDGDashboard extends StatefulWidget {
  GDGDashboard({Key key}) : super(key: key);

  @override
  _GDGDashboardState createState() => _GDGDashboardState();
}

class _GDGDashboardState extends State<GDGDashboard> {
  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp;
    final hp = Screen(context).hp;
    return Scaffold(
      backgroundColor: gdgGrey,
          body: Container(
         child: Column(
          
           children: <Widget>[
            Container(
          
              height: hp(25),
              width:double.infinity,
              decoration: BoxDecoration(
                color: gdgPurple,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30, ), bottomLeft: Radius.circular(30, ) ),
                gradient: LinearGradient(colors: [gdgPurple,gdgBlue],
                begin: Alignment.topRight,
                end:Alignment.bottomRight
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top:20, left:10),
                alignment: Alignment.topLeft,
                child: IconButton(icon: Icon(Icons.menu, color:gdgWhite), onPressed: null),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -50),
                          child: Container(
                // color:Colors.red,
                height: hp(30),
                width: wp(600),
                child: ListView(
                  padding: EdgeInsets.only(left:20),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildCard('Naira Wallet', "N500,000,000"),
                    _buildCard("Dollar Wallet", "\$ 500,000,000"),
                    _buildCard("EuroWallet", "\u20AC 500,000,000") 
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:30,right:30),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 110,
                    width: wp(600),
                    margin: EdgeInsets.only(left:20, right:5),
                    child: Row(
                    children: <Widget>[
                      _dashboadMenu("assets/images/send.png", "Send", "Money"),
                      SizedBox(width: 30,),
                      _dashboadMenu("assets/images/piggy.png", "Fund", "Wallet"),
                    ],
                    ),
                  ),
                  
                  
                ],
              ),
            ),
            SizedBox(height: 20,), 
            Container(
              margin: EdgeInsets.only(left:30,right:30),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 110,
                    width: wp(600),
                    margin: EdgeInsets.only(left:20, right:5),
                    child: Row(
                    children: <Widget>[
                      _dashboadMenu("assets/images/banks.png", "Bank", "Withdrawal"),
                      SizedBox(width: 30,),
                      _dashboadMenu("assets/images/exchange.png", "Fund", "Exchange"),
                    ],
                    ),
                  ),
                  
                  
                ],
              ),
            )
           ],
         ),
      ),
    );
  }
  // Section B cards
  Widget _buildCard(walletHeading, walletBalance ){
    return Container(
      height: 170,
      width: 220,
      margin: EdgeInsets.only(right:20),
      decoration: BoxDecoration(
        color:gdgWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350],
            offset: Offset(3,0),
            blurRadius: 1
          )
        ]
      ),
      child: Container(
        margin: EdgeInsets.only(top:22,left:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child:Text(walletHeading,
              
              )
            ),

            SizedBox(height: 35,),
             Container(
              child: Text('Current Balance',
              style: GoogleFonts.cabin(
                color:gdgFaintBlack,
                fontSize: smallTextFont,
                fontWeight: FontWeight.w400
              ),
              ),
            ),
              SizedBox(height: 10,),
            Container(
              child: Text(walletBalance,
              style:GoogleFonts.cabin(
                color: Colors.black,
                fontSize: largeTextFont,
                fontWeight: FontWeight.w500
              ) ,),
            ),

            SizedBox(height:35),
            Row(
             children: <Widget>[
               Container(
                 child: Text('Veiw Statement',
                 style: GoogleFonts.cabin(
                   fontSize: smallTextFont,
                   color:gdgPurple
                 ),
                 ),
               ),
               Icon(Icons.arrow_forward_ios, color: gdgPurple, size: smallTextFont,)
             ],
            )
          ],
        ),
      ),
    );
  }
  // building block for the menu buttons- this method of creating widget 
  //help you not to repeat yourself and makes your code neat
  Widget _dashboadMenu(image, firstText, secondText){
    return Container(
      width:138,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color:Colors.white,
            blurRadius: 12,
            offset: Offset(5, 10)
          )
        ] 
      ),
      child: Container(
        margin: EdgeInsets.only(left:20, right:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           SizedBox(height: 10,),
           Container(
             //this is to confine the image to a small sized
             height: 20,
             width: 20,
            child: Image.asset('$image'),
           ),
           SizedBox(height: 20,),
           Expanded(child: Text('$firstText \n$secondText',
           style: GoogleFonts.cabin(
             color:Colors.black,
             fontSize: smallTextFont,
             fontWeight: FontWeight.w700
           ),
            ))
         ],
      ),
    )
    );
  }
}