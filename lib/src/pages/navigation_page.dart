import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavigationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _NotificationModel(),
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications'),
        ),
        floatingActionButton: FloatingButton(),

        bottomNavigationBar: BottomNavigation(),
   ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text("Bones") ,
          icon: FaIcon(FontAwesomeIcons.bone)
        ),
        BottomNavigationBarItem(
          title: Text("Notifications") ,
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, size:10, color:Colors.redAccent),
                child: BounceInDown(
                  from: 15,
                  animate: notifications>0,
                  child: Bounce(
                    controller: (controller)=> Provider.of<_NotificationModel>(context).bounceController=controller,
                    from: 15,
                    child: Container(
                      child: Text(
                        '$notifications', 
                        style: TextStyle(color:Colors.white, fontSize: 9),
                      ),
                      alignment: Alignment.center,
                      width:14,
                      height:14,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          title: Text("My Dog") ,
          icon: FaIcon(FontAwesomeIcons.dog)
        ),
      ],
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationsModel = Provider.of<_NotificationModel>(context);
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play) ,
      onPressed: (){
        notificationsModel.numero +=1;
        if(notificationsModel.numero>=2){
          notificationsModel.bounceController.forward(from: 0.0);
        }
      });
  }
}

class _NotificationModel extends ChangeNotifier{
  int _number=0;
  AnimationController _bounceController;

  int get numero => this._number;
  set numero(int value){
    this._number=value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController controller){
    this._bounceController = controller;
  }

}
