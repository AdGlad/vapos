import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:vapos/screens/home/newfeed.dart';
import 'package:vapos/screens/home/social.dart';
import 'package:vapos/screens/home/rewards.dart';
import 'package:vapos/screens/home/leaderboard.dart';
import 'package:vapos/screens/home/health.dart';
import 'package:vapos/screens/home/plan.dart';
import 'package:vapos/screens/home/chat.dart';


class Homebody extends StatelessWidget {
  @override
  List<String> pagenames = ['News','Social','Help','Assessment','Chat','Rewards','Leaderboard','Plan'];
    List<IconData> pageicons = [Icons.language,Icons.people ,Icons.info,Icons.assessment,Icons.chat_bubble_outline,Icons.card_giftcard,Icons.multiline_chart,Icons.schedule];


  Widget build(BuildContext context) {
    return  Container(
      child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 6 widgets that display their index in the List.
                children: List.generate(8, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    child:            FlatButton.icon(
                      onPressed: () {
                       navigateToSubPage(context, index);
                       },
                      icon: Icon(pageicons[index], color: Colors.blue[400],size: 150.0),
                      label: Text(''),
                      // label: Text('Page $index'),
                      //label: Text(pagenames[index]),
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

  Future navigateToSubPage(context, index) async {
    print('The value of the index is: $index');
    if (index == 0)
      { 
        Navigator.push(context, MaterialPageRoute(builder: (context) => Newsfeed()));
    } else if (index == 1)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Social() ));
    } else if (index == 2)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Social() ));
    }  else if (index == 3)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Health() ));
    } else if (index == 4)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Chat() ));
    }  else if (index == 5)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Rewards() ));
    } else if (index == 6)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Leaderboard() ));
    }  else if (index == 7)
    {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Plan() ));
    }

}

}