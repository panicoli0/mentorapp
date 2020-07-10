import 'package:flutter/material.dart';
import 'package:flutter_reactive_button/flutter_reactive_button.dart';

void main() => runApp(PartyScreen());

class PartyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StackOfContainers(),
    );
  }
}

class StackOfContainers extends StatefulWidget {
  @override
  _StackOfContainersState createState() => _StackOfContainersState();
}

class _StackOfContainersState extends State<StackOfContainers> {
  bool liked = false;
  String facebook;

  List<Offset> draggablePositions = [
    Offset(0, 0),
    Offset(30, 30),
    Offset(60, 60),
    Offset(90, 90), // Si agregas mas Offset se agregan mas Bubbles
  ];

  List<GlobalKey> draggableKeys = [
    //Tenes que agregar tantos GlobalKeys como Offset(Bubbles)
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  List<Widget> stackOfContainers = [];

  List<ReactiveIconDefinition> _facebook = <ReactiveIconDefinition>[
    ReactiveIconDefinition(
      assetIcon: 'images/like.gif',
      code: 'like',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/haha.gif',
      code: 'haha',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/love.gif',
      code: 'love',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/sad.gif',
      code: 'sad',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/wow.gif',
      code: 'wow',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/angry.gif',
      code: 'angry',
    ),
  ];

  void moveToTop(Key key) {
    setState(() {
      for (var i = 0; i < stackOfContainers.length; i++) {
        Widget container = stackOfContainers[i];
        if (key == container.key) {
          stackOfContainers.remove(container);
          stackOfContainers.add(container);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    stackOfContainers = [
      Positioned(
        key: draggableKeys[1],
        top: draggablePositions[1].dy,
        left: draggablePositions[1].dx,
        child: GestureDetector(
          onTap: () {
            setState(() {
              moveToTop(draggableKeys[1]);
            });
          },
          child: Draggable(
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                draggablePositions[1] = offset;
              });
            },
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/Def2fd22f1f3bd91b4f2012a05cbd25b7"),
              child: Container(
                height: 100,
                width: 100,
              ),
            ),
            feedback: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/Def2fd22f1f3bd91b4f2012a05cbd25b7"),
              child: Container(
                height: 100,
                width: 100,
              ),
            ),
            childWhenDragging: Container(),
          ),
        ),
      ), //Castaña box
      Positioned(
        key: draggableKeys[2],
        top: draggablePositions[2].dy,
        left: draggablePositions[2].dx,
        child: GestureDetector(
          onTap: () {
            setState(() {
              moveToTop(draggableKeys[2]);
            });
          },
          child: Draggable(
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                draggablePositions[2] = offset;
              });
            },
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/D419cd98fe1cce13969c37bca82dfe677"),
              child: Container(
                height: 100,
                width: 100,
              ),
            ),
            feedback: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/D419cd98fe1cce13969c37bca82dfe677"),
              child: Container(
                height: 100,
                width: 100,
              ),
            ),
            childWhenDragging: Container(),
          ),
        ),
      ), //Rubia box
      Positioned(
        key: draggableKeys[0],
        top: draggablePositions[0].dy,
        left: draggablePositions[0].dx,
        child: GestureDetector(
          onTap: () {
            print('TAP');
            setState(() {
              moveToTop(draggableKeys[0]);
            });
          },
          child: Draggable(
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                draggablePositions[0] = offset;
              });
            },
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/D419cd98fe1cce13969c37bca82dfe677"),
              child: ReactiveButton(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                  ),
                  width: 80.0,
                  height: 40.0,
                  child: Center(
                    child: facebook == null
                        ? Text('TAP')
                        : Image.asset(
                            'images/$facebook.gif',
                            width: 32.0,
                            height: 32.0,
                          ),
                  ),
                ),
                icons: _facebook, //_flags,
                onTap: () {
                  print('TAP');
                },
                onSelected: (ReactiveIconDefinition button) {
                  setState(() {
                    facebook = button.code;
                  });
                },
                iconWidth: 32.0,
              ),
            ),
            feedback: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/D419cd98fe1cce13969c37bca82dfe677"),
              child: Container(
                height: 100,
                width: 100,
              ),
            ), //Aca estan las reactions
            childWhenDragging: Container(),
          ),
        ),
      ), //Rubia0 (Tiene la posta) box
      Positioned(
        key: draggableKeys[3],
        top: draggablePositions[3].dy,
        left: draggablePositions[3].dx,
        child: GestureDetector(
          onTap: () {
            print('TAP');
            setState(() {
              moveToTop(draggableKeys[3]);
            });
          },
          child: Draggable(
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                draggablePositions[3] = offset;
              });
            },
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/D11b7a9632ceee5e501f7b5e16dbd837f"),
              child: ReactiveButton(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                  ),
                  width: 80.0,
                  height: 40.0,
                  child: Center(
                    child: facebook == null
                        ? Text('TAP')
                        : Image.asset(
                            'images/$facebook.gif',
                            width: 32.0,
                            height: 32.0,
                          ),
                  ),
                ),
                icons: _facebook, //_flags,
                onTap: () {
                  print('TAP');
                },
                onSelected: (ReactiveIconDefinition button) {
                  setState(() {
                    facebook = button.code;
                  });
                },
                iconWidth: 32.0,
              ),
            ),
            feedback: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/assets.mockflow.com/app/wireframepro/company/C2b4ab64beb5f40e3b63b301297e7e006/projects/Mcaf7608d301dc9a0d898e35143c1d1831571841083372/images/thumbnails/D11b7a9632ceee5e501f7b5e16dbd837f"),
              child: Container(
                height: 100,
                width: 100,
              ),
            ), //Aca estan las reactions
            childWhenDragging: Container(),
          ),
        ),
      ), //el tipo con Lentes
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: stackOfContainers,
        ),
      ),
    );
  }
}
