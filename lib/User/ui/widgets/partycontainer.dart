import 'package:afterparty/User/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:afterparty/global.dart';

class PartyContainer extends StatelessWidget {
  final int index;

  const PartyContainer({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            index: index,
          ),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 5.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          partys[index]['party_banner'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 11,
                    bottom: 0,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.grey,
                              offset: Offset(0, 5)),
                        ],
                      ),
                      child: CircleAvatar(
                        maxRadius: 25.0,
                        backgroundImage:
                            NetworkImage(partys[index]['author_img']),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "${partys[index]['title']}",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  "An event by ${partys[index]['author']}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .apply(color: partys[index]['color']),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Currently Playing:",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .apply(color: partys[index]['color']),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
            SizedBox(
              height: 11.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.supervised_user_circle,
                  color: partys[index]['color'],
                ),
                Text("${partys[index]['user_count']} Active Users"),
                Spacer(),
                Icon(
                  Icons.play_arrow,
                  color: partys[index]['color'],
                ),
                Text("${partys[index]['playing']}"),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: partys[index]['color'],
                      borderRadius: BorderRadius.circular(15.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    "${partys[index]['cat']}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
