import 'package:afterparty/Partys/ui/screens/party_screen.dart';
import 'package:afterparty/global.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int index;

  const DetailsScreen({Key key, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 50,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 150,
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              color: partys[index]['color'],
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.only(
                                        left: 5.0,
                                        top: 50.0,
                                        right: 5.0,
                                        bottom: 50.0),
                                    icon: Icon(Icons.arrow_back,
                                        color: Colors.white),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  Text(
                                    "${partys[index]['cat']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .apply(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${partys[index]['price']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .apply(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 15,
                            child: Container(
                              margin: EdgeInsets.all(25.0),
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
                            height: 70,
                            width: 70,
                            bottom: 15,
                            right: 35,
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
                                backgroundImage:
                                    NetworkImage(partys[index]['author_img']),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Event by: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .apply(
                                            color: partys[index]['color'],
                                          ),
                                    ),
                                    TextSpan(
                                      text: "${partys[index]['author']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .apply(
                                            color: partys[index]['color'],
                                            fontWeightDelta: 2,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Currently Playing: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .apply(
                                            color: partys[index]['color'],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.supervised_user_circle,
                                color: partys[index]['color'],
                              ),
                              Text(
                                  "${partys[index]['user_count']} Active Users"),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                child: Text(
                                  "${partys[index]['cat']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(height: 9.0),
                          Text(
                            "${partys[index]['description']}",
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .apply(color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50,
              child: RaisedButton(
                color: partys[index]['color'],
                child: Text(
                  "Join Party",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Esto te va a llevar a la Party en cuestion
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PartyScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
