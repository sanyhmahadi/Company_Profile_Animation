import 'package:company_profile/model/company.dart';

class RepoData {
  static final Company pbds = Company(
      name: "Premium BD",
      location: "Dhaka,Bangladesh",
      logo: "assets/2.jpg",
      backdropPhoto: "assets/4.jpg",
      about:
          "Our Goal is to provide streaming services subscription to those people who can't purchase for the reason of laciking International payment System.Beside that we also sell computer accessories and also sell World class catagory Choclates.",
      courses: <Course>[
        Course(
            title: "Streaming",
            thumbnail: "assets/2.jpg",
            url: 'https://www.facebook.com/PremiumBDStreaming/'),
        Course(
            title: "Computer Accessories",
            thumbnail:
                "assets/87153652_105794431016871_7873681068052709376_n.png",
            url: 'https://www.plixbd.com'),
        Course(
            title: "Chocolates",
            thumbnail: "assets/4.jpg",
            url: 'https://www.plixbd.com'),
        Course(
            title: "Owner Info-1",
            thumbnail:
                "assets/44323445_294625651146337_6512672649972285440_o.jpg",
            url: 'https://www.facebook.com/sanyhmahadi/'),
      ]);
}
