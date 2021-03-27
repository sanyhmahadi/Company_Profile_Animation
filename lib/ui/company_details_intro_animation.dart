import 'package:flutter/widgets.dart';

class CompanyDetailsIntroAnimation {
  CompanyDetailsIntroAnimation(this.controller)
      : bgdroupOpacity = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.0, 0.5, curve: Curves.ease))),
        bgdroupBlur = Tween(begin: 0.0, end: 3.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.5, 1.0, curve: Curves.ease))),
        avatarSize = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.0, 1.0, curve: Curves.elasticInOut))),
        nameOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.35, 0.45, curve: Curves.easeIn))),
        locationOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.35, 0.45, curve: Curves.easeInExpo))),
        dividerWidth = Tween(begin: 0.0, end: 225.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.65, 0.75,
                curve: Curves.fastLinearToSlowEaseIn))),
        aboutOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: new Interval(0.5, 0.9, curve: Curves.easeInOutCirc))),
        courseScrollerXTranslation = Tween(begin: 60.0, end: 0.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: new Interval(0.830, 1.00, curve: Curves.ease))),
        courseScrollerOpacity = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: new Interval(0.85, 1.0, curve: Curves.fastOutSlowIn)));

  final AnimationController controller;
  final Animation<double> bgdroupOpacity;
  final Animation<double> bgdroupBlur;
  final Animation<double> avatarSize;
  final Animation<double> nameOpacity;
  final Animation<double> locationOpacity;
  final Animation<double> dividerWidth;
  final Animation<double> aboutOpacity;
  final Animation<double> courseScrollerXTranslation;
  final Animation<double> courseScrollerOpacity;
}
