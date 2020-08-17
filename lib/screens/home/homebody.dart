import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:vapos/screens/home/newfeed.dart';
import 'package:vapos/screens/home/social.dart';
import 'package:vapos/screens/home/rewards.dart';
import 'package:vapos/screens/home/leaderboard.dart';
import 'package:vapos/screens/home/health.dart';
import 'package:vapos/screens/home/plan.dart';
import 'package:vapos/screens/home/chat.dart';
import 'package:vapos/screens/Vapors/user_list.dart';
import 'package:vapos/screens/home/settings_form.dart';
import 'package:vapos/screens/home/updateplan.dart';



class Homebody extends StatelessWidget {
  @override
  List<String> pagenames = ['News','Social','Help','Assessment','Chat','Rewards','Leaderboard','Plan'];
    List<IconData> pageicons = [Icons.language,Icons.people ,Icons.info,Icons.assessment,Icons.chat_bubble_outline,Icons.card_giftcard,Icons.multiline_chart,Icons.schedule];


  
  Widget build(BuildContext context) {

  void _showSettingsPanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
      );
    });
  }

  Future navigateToSubPage(context, index) async {
    print('The value of the index is: $index');
    if (index == 0)
      { 
        Navigator.push(context, MaterialPageRoute(builder: (context) => Newsfeed()));
    } else if (index == 1)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => UserList() ));
    } else if (index == 2)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Social() ));
    }  else if (index == 3)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Health () ));
    } else if (index == 4)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Chat() ));
    }  else if (index == 5)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Rewards() ));
    } else if (index == 6)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => LeaderHomePage() ));
    }  else if (index == 7)
    {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Plan() ));
      //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsForm() ));
        Navigator.push(context, MaterialPageRoute(builder: (context) => Updateplan() ));
      // \\Navigator.push(context, MaterialPageRoute(builder: (context) => _showSettingsPanel() ));
    }

}



    return  Container( //margin: EdgeInsets.all(20),
      child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 6 widgets that display their index in the List.
                children: List.generate(8, (index) {
                  return Container( margin: EdgeInsets.all(40),
                    //width: 20,
                    //height: 20,
                    child:            FlatButton(
                      onPressed: () {
                       navigateToSubPage(context, index);
                       },
                      child: Column(
                        children: <Widget>[
                          Icon(pageicons[index], color: Colors.blue[400],size: 100.0),
                      Text(pagenames[index]), 
                        ],
                      ),         
                      //icon: Icon(pageicons[index], color: Colors.blue[400],size: 60.0),
                      //label: Text(pagenames[index]),
                      //label: Text(''),
                      // label: Text('Page $index'),
                      shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      color: Colors.white70,
                      splashColor: Colors.lightGreen,
                      //padding: EdgeInsets.all(20.0),
                    ),
                  );
                }),
              ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/vaposbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          );
  }



}