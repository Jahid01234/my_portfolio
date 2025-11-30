import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/assets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart';
import 'dart:ui_web' as ui;
import '../models/project_data.dart';
import '../models/skill_data.dart';
import '../models/social_data.dart';

class PortfolioViewModel extends ChangeNotifier {
  bool _isProjectViewLimited = true;

  List<SocialData> socialData = [
    SocialData(
      socialLink: "https://www.facebook.com/md.jahid.hasan.765409/",
      iconPath: Assets.facebookIcon,
      color: Colors.white,
    ),
    SocialData(
      socialLink: "https://www.linkedin.com/in/md-jahid-hasan-2a42492b2/",
      iconPath: Assets.linkedInIcon,
      color: Colors.white,
    ),
    SocialData(
      socialLink: "https://github.com/Jahid01234",
      iconPath: Assets.githubIcon,
      color: Colors.white,
    ),
  ];

  List<SkillData> skillData = [
    SkillData(skillName: "Flutter", skillIcons: Assets.flutterIcon),
    SkillData(skillName: "Android", skillIcons: Assets.androidIcon),
    SkillData(skillName: "Dart", skillIcons: Assets.dartIcon),
    SkillData(skillName: "Firebase", skillIcons: Assets.firebaseIcon),
    SkillData(skillName: "Getx", skillIcons: Assets.getxIcon),
    SkillData(skillName: "Rest API", skillIcons: Assets.restApiIcon),
    SkillData(skillName: "SQLite", skillIcons: Assets.sqliteIcon),
    SkillData(skillName: "Git", skillIcons: Assets.githubIcon),
    SkillData(skillName: "MySQL", skillIcons: Assets.mysqlIcon),
  ];

  List<ProjectData> projectData = [
    ProjectData(
      projectName: "Crafty Bays",
      projectDescription:
          "Crafty Bay is a modern e-commerce app built with Flutter, utilizing REST API, GetX for state management, and SharedPreferences for local storage."
          "The Crafty Bay E-commerce App is a full-featured online shopping application built with Flutter,"
          " designed to provide a seamless and engaging shopping experience. It allows users to browse "
          "products, add them to their cart, make secure payments, track orders, and manage their accounts"
          " effortlessly.",
      projectLink: "https://github.com/Jahid01234/Crafty-Bay",
      projectPicture: Assets.craftyBay,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
        Assets.restApiIcon,
        Assets.getxIcon,
      ],
    ),
    ProjectData(
      projectName: "Chat App",
      projectDescription:
          "A real-time chat application built with Flutter, Firebase, and Provider,"
          " allowing users to send and receive messages instantly. The app includes"
          " secure authentication, message management, and user moderation features "
          "for a seamless chatting experience.",
      projectLink: "https://github.com/Jahid01234/Chat-App",
      projectPicture: Assets.chatApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
        Assets.firebaseIcon,
      ],
    ),
    ProjectData(
      projectName: "Task Manager",
      projectDescription:
          "A Task Manager App helps users efficiently organize, track, and manage"
          " their daily tasks and projects. Built with Flutter, it uses REST API,"
          " and SharedPreferences for local storage.",
      projectLink: "https://github.com/Jahid01234/task_manager_project",
      projectPicture: Assets.taskManagerApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
        Assets.restApiIcon,
      ],
    ),
    ProjectData(
      projectName: "Currency Exchange ",
      projectDescription:
          "A Currency Exchange App helps users convert one currency to another using "
          "real-time exchange rates. It is useful for travelers, forex traders, and "
          "businesses dealing with multiple currencies.",
      projectLink: "https://github.com/Jahid01234/money_ex",
      projectPicture: Assets.currencyExchangeApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
        Assets.restApiIcon,
      ],
    ),
    ProjectData(
      projectName: "E-commerce App",
      projectDescription:
          "An E-commerce App enables users to browse, purchase, and manage products "
          "online seamlessly. It allows users to explore a wide range of products, "
          "add them to their shopping cart, and securely make payments directly from "
          "their mobile device. The app provides features such as user authentication, "
          "real-time order tracking, product search, and personalized recommendations "
          "to enhance the shopping experience.",
      projectLink:
          "https://github.com/Jahid01234/ecommerce_shopping_app_ui_design",
      projectPicture: Assets.ecommerceApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
    ProjectData(
      projectName: "Coffee App",
      projectDescription:
          "A Coffee App allows users to explore a variety of coffee options,"
          " place orders, and enjoy a seamless shopping experience.It offers a "
          "user-friendly interface and customizable features for a tailored experience."
          "Includes profile settings and notification options to enhance user convenience.",
      projectLink: "https://github.com/Jahid01234/Coffee_App",
      projectPicture: Assets.coffeeApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
    ProjectData(
      projectName: "Plants App",
      projectDescription:
          "A Plants App is a one-stop solution for plant enthusiasts of all levels, "
          "designed to enhance your plant care experience and help you cultivate "
          "a thriving garden or indoor space. This app offers a range of features "
          "to ensure your plants receive the best care possible, such as: plant identification,"
          "personalized care plans,plant health tracker,care tips & articles",
      projectLink: "https://github.com/Jahid01234/Plants_App",
      projectPicture: Assets.plantsApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
    ProjectData(
      projectName: "Financial E-commerce App",
      projectDescription:
          "A Financial E-commerce App provides users with a platform to buy, sell, and"
          " manage financial products and services (such as stocks, insurance, and "
          "investment products) while ensuring a responsive design for seamless use"
          " on all devices (phones, tablets, and desktops).",
      projectLink: "https://github.com/Jahid01234/Response_Dashboard_Design",
      projectPicture: Assets.financialEcommerceApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
    ProjectData(
      projectName: "Flappy Bird",
      projectDescription:
          "A Flappy Bird  App is a gaming app where players control a bird by tapping"
          " the screen to navigate through obstacles. It falls under the arcade game"
          " category, known for its simple mechanics but challenging gameplay.",
      projectLink: "https://github.com/Jahid01234/Flappy_Bird",
      projectPicture: Assets.flappyBirdApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
    ProjectData(
      projectName: "Notes App",
      projectDescription:
          "A Notes App built using SQLite allows users to create, edit, store, and organize"
          " their notes on their device, offering offline storage and easy access to important information.",
      projectLink: "https://github.com/Jahid01234/Notes_App",
      projectPicture: Assets.notesApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
    ProjectData(
      projectName: "BMI Calculator",
      projectDescription:
          "A BMI Calculator App helps users determine their Body Mass Index (BMI)"
          " based on their weight and height. It provides an indication of whether"
          " a person is underweight, normal weight, overweight, or obese according "
          "to standard BMI categories.",
      projectLink: "https://github.com/Jahid01234/bmi_calculator_app",
      projectPicture: Assets.bmiCalculatorApp,
      projectTechStacks: [
        Assets.flutterIcon,
        Assets.dartIcon,
      ],
    ),
  ];

  bool get isProjectViewLimited => _isProjectViewLimited;

  set setIsProjectViewLimited(bool value) {
    _isProjectViewLimited = value;
    notifyListeners();
  }

  void setSocialContainerColor(Color color, int index) {
    socialData[index].color = color;
    notifyListeners();
  }

  void downloadResume() {
    HTMLAnchorElement()
      ..href = ui.AssetManager().getAssetUrl(Assets.myResume)
      ..download = "Resume.pdf"
      ..click();
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }
}
