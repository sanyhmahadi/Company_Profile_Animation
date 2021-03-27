import 'package:company_profile/model/company.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatelessWidget {
  CourseCard(this.course);

  final Course course;

  BoxDecoration createShadowRoundCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      decoration: createShadowRoundCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 3, child: createThumbnil()),
          Flexible(flex: 2, child: createCourseInfo())
        ],
      ),
    );
  }

  Widget createThumbnil() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          Image.asset(course.thumbnail),
          Positioned(bottom: 12.0, right: 12.0, child: _createLinkButton())
        ],
      ),
    );
  }

  Widget _createLinkButton() {
    return Material(
        color: Colors.white70,
        type: MaterialType.circle,
        child: IconButton(
          icon: Icon(
            Icons.link,
          ),
          onPressed: () async {
            if (await canLaunch(course.url)) {
              await launch(course.url);
            }
          },
        ));
  }

  Widget createCourseInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
      child: Text(
        course.title,
        style: TextStyle(color: Colors.white.withOpacity(.85)),
      ),
    );
  }
}
