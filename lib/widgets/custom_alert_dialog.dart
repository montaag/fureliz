import 'package:flutter/material.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';

void showCustomDialog(BuildContext context, bool barrierDismissible, CustomAlert customEventDialog) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return customEventDialog;
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

enum CustomAlertType { fail, success, custom, info }

class CustomAlert extends StatefulWidget {
  final String? title;
  final String description;
  final CustomAlertType type;
  Widget? header;
  String? buttonText;
  Color? buttonTextColor;
  Color? buttonColor;
  Function()? onPressed;
  bool closeSign;
  String? infoTextYes;
  Color? colorYes;
  String? infoTextNo;
  Color? colorNo;

  // Icon? icon;
  // Image? image;
  //Color? color;

  CustomAlert(
      {Key? key,
      this.title,
      required this.description,
      required this.type,
      this.header,
      this.buttonText,
      this.buttonTextColor,
      this.buttonColor,
      this.onPressed,
      this.closeSign = true,
      this.infoTextYes,
      this.infoTextNo,
      this.colorNo,
      this.colorYes})
      : super(key: key);

  @override
  CustomAlertState createState() => new CustomAlertState();
}

class CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  widget.type == CustomAlertType.info
                      ? Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.info,
                            color: Palette.grayColor,
                            size: 50,
                          ),
                        )
                      : widget.type == CustomAlertType.success
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.done,
                                color: Palette.successColor,
                                size: 50,
                              ),
                            )
                          : widget.type == CustomAlertType.fail
                              ? Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red[300],
                                    size: 30,
                                  ),
                                )
                              : Stack(
                                  children: [
                                    Padding(
                                      padding: widget.closeSign ? EdgeInsets.all(0) : const EdgeInsets.only(top: 20.0),
                                      child: Center(child: widget.header!),
                                    ),
                                    widget.closeSign
                                        ? Positioned(
                                            right: 0,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Palette.grayColor,
                                                )))
                                        : Container(),
                                  ],
                                ),
                  Container(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      widget.type == CustomAlertType.info
                          ? "Bilgilendirme"
                          : widget.type == CustomAlertType.fail
                              ? "Başarısız"
                              : widget.type == CustomAlertType.success
                                  ? "Başarılı"
                                  : widget.title!,
                      style: CustomTheme.headline5(context, color: Colors.black),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(widget.description, textAlign: TextAlign.center, style: CustomTheme.body(context, color: Palette.grayColor)),
                    Container(height: 10),
                    widget.type == CustomAlertType.info
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(widget.colorNo)),
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(widget.infoTextNo!)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(widget.colorYes)),
                                    onPressed: widget.onPressed,
                                    child: Text(widget.infoTextYes!)),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: widget.type == CustomAlertType.fail
                                  ? Colors.red[300]
                                  : widget.type == CustomAlertType.success
                                      ? Colors.lightGreen[500]
                                      : widget.buttonColor,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0)),
                            ),
                            child: Text(
                                widget.type == CustomAlertType.fail
                                    ? "Tekrar Dene"
                                    : widget.type == CustomAlertType.success
                                        ? "Tamam"
                                        : widget.buttonText!,
                                style: CustomTheme.subtitle(context, color: widget.buttonTextColor)),
                            onPressed: widget.onPressed ??
                                () {
                                  Navigator.pop(context);
                                },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
