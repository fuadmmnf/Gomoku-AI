import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class CustomDialog extends StatelessWidget {
  final String message;
  final String imageName;

  CustomDialog({@required this.message, @required this.imageName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 15.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.4 ),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                message,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text('back',style: TextStyle(fontSize: 16.0),),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height*0.4 - 82,
            left: Consts.padding,
            right: Consts.padding,
            child: Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      width: Consts.avatarRadius * 2.4,
                      height: Consts.avatarRadius * 2.4,
                      decoration: new BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(image: AssetImage(imageName))
                      )),
                ],
              ),
            )),
      ],
    );
  }
}
