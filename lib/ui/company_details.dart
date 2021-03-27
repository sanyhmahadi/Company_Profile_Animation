import 'package:company_profile/model/company.dart';
import 'package:company_profile/ui/company_details_intro_animation.dart';
import 'package:company_profile/ui/course_card.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ComapanyDetails extends StatelessWidget {
  ComapanyDetails(
      {@required this.company, @required AnimationController controller})
      : animation = CompanyDetailsIntroAnimation(controller);

  final Company company;
  final CompanyDetailsIntroAnimation animation;

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: animation.bgdroupOpacity.value,
          child: Image.asset(
            company.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: animation.bgdroupBlur.value,
            sigmaY: animation.bgdroupBlur.value,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: createContent(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: animation.controller, builder: _createAnimation));
  }

  Widget createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createLogoAvatar(),
          _createAboutCompany(),
          _createCourseScroller(),
        ],
      ),
    );
  }

  Widget createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.only(top: 32.0, left: 19.0),
        padding: EdgeInsets.all(3.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 25.0,
              child: Image.asset(
                company.logo,
                // width: 150,
                // height: 150,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to Premium BD",
                  style: TextStyle(
                      fontSize: 19 * animation.avatarSize.value + 5.0,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAboutCompany() {
    return Padding(
      padding: EdgeInsets.only(
        top: 14.0,
        left: 14.0,
        right: 14.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company.name,
            style: TextStyle(
                color:
                    Colors.redAccent.withOpacity(animation.nameOpacity.value),
                fontSize: 30 * animation.avatarSize.value + 5.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            company.location,
            style: TextStyle(
                color:
                    Colors.white.withOpacity(animation.locationOpacity.value),
                // fontSize: 10 * animation.avatarSize.value + 8.0,
                fontWeight: FontWeight.w800),
          ),
          Container(
            color: Colors.white.withOpacity(0.8),
            margin: EdgeInsets.symmetric(vertical: 14.0),
            height: 1.0,
            width: animation.dividerWidth.value,
          ),
          Text(
            company.about,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.aboutOpacity.value),
                height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: EdgeInsets.only(top: 14),
      child: Transform(
        transform: Matrix4.translationValues(
            animation.courseScrollerXTranslation.value, 0.0, 0.0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(250),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              itemCount: company.courses.length,
              itemBuilder: (BuildContext context, int index) {
                var course = company.courses[index];
                return new CourseCard(course);
              }),
        ),
      ),
    );
  }
}
