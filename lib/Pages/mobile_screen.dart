import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harish_portfolio/constant.dart';
import 'package:harish_portfolio/Utils/resume_helper.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:harish_portfolio/Components/auto_scroll_list.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final ScrollController _scrollController = ScrollController();
  // final ScrollController _animationController = ScrollController(); // Removed
  // Timer? _timer; // Removed

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey technlogiesKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchMailURL() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'harishpanneerselvam5@gmail.com',
    );

    try {
      if (!await launchUrl(emailLaunchUri)) {
        throw 'Could not launch email';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // void _startAutoScroll() { ... } // Removed logic

  List<Map<String, dynamic>> techStacks = [
    {
      'imagePath': 'assets/svg/flutter-icon.svg',
      'text': 'Flutter',
      'color': Colors.blue,
    },
    {
      'imagePath': 'assets/svg/dart-icon.svg',
      'text': 'Dart',
      'color': Colors.cyanAccent,
    },
    {
      'imagePath': 'assets/svg/git-icon.svg',
      'text': 'Git',
      'color': Colors.red,
    },
    {
      'imagePath': 'assets/svg/github-icon.svg',
      'text': 'GitHub',
      'color': Colors.blue,
    },
    {
      'imagePath': 'assets/svg/database.svg',
      'text': 'Sqflite',
      'color': Colors.greenAccent,
    },
    {
      'imagePath': 'assets/svg/firebase-icon.svg',
      'text': 'Firebase',
      'color': Colors.orange,
    },
    {
      'imagePath': 'assets/svg/provider-icon.svg',
      'text': 'Provider',
      'color': Colors.yellow,
    },
    {
      'imagePath': 'assets/svg/razorpay-icon.svg',
      'text': 'Razorpay',
      'color': Colors.blue,
    },
  ];
  @override
  void initState() {
    // _startAutoScroll(); // Removed
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // _animationController.dispose(); // Removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff11071F),
      drawer: Drawer(
        backgroundColor: const Color(0xff1A0B2E),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 40,
              children: [
                const Text(
                  'Portfolio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Preahvihear',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade400,
                ),
                InkWell(
                  onTap: () {
                    scrollToSection(homeKey);
                    Navigator.pop(context);
                  },
                  child: const AutoSizeText(
                    'Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Preahvihear',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToSection(experienceKey);
                    Navigator.pop(context);
                  },
                  child: const AutoSizeText(
                    'Work Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Preahvihear',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToSection(technlogiesKey);
                    Navigator.pop(context);
                  },
                  child: const AutoSizeText(
                    'Skills',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Preahvihear',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToSection(projectKey);
                    Navigator.pop(context);
                  },
                  child: const AutoSizeText(
                    'Projects',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Preahvihear',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToSection(aboutKey);
                    Navigator.pop(context);
                  },
                  child: const AutoSizeText(
                    'Contact',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Preahvihear',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            pinned: true,
            backgroundColor: const Color(0xff1A0B2E),
            leading: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.sort_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                );
              },
            ),
            centerTitle: true,
            title: const AutoSizeText(
              'Harish Panneerselvam',
              style: TextStyle(
                fontFamily: 'Preahvihear',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                child: Column(
                  key: homeKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            colors: [
                              Colors.white,
                              Color(0xff38215B),
                              Color(0xff230F44),
                              Color(0xff11071F),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(400),
                          child: Image.asset(
                            'assets/png/profile.jpg',
                            fit: BoxFit.contain,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const AutoSizeText(
                      'A Developer who',
                      style: TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 15),
                    const AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'builds cross-platform mobile applications with\n',
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'smooth experiences using ',
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Flutter and Dart',
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xff7127BA),
                            ),
                          ),
                          TextSpan(
                            text: '...',
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AutoSizeText(
                      'One codebase, every platform, delivering smooth apps everywhere you go!',
                      style: TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const AutoSizeText(
                      "I am a Flutter Developer with over 2 years of experience. I focus on crafting meaningful digital products that balance user needs with business goals, specializing in user-friendly, responsive, and high-performance applications.",
                      style: TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      key: experienceKey,
                    ),
                    const AutoSizeText(
                      'Work Experience',
                      style: TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      spacing: 20,
                      children: [
                        Container(
                          width: globalWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff130428),
                                Color(0xff251043),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/png/company-image.png',
                                  height: 25,
                                ),
                                const SizedBox(width: 15),

                                // Left text
                                const Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      AutoSizeText(
                                        'Flutter Developer at Lentera Technologies Private Limited',
                                        style: TextStyle(
                                          fontFamily: 'poppins-medium',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      AutoSizeText(
                                        '- Sept 2024 - Present',
                                        style: TextStyle(
                                          fontFamily: 'poppins-medium',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // // Pushes the date to the right
                                // const Spacer(),

                                // // Right text
                                // const Flexible(
                                //   flex: 2,
                                //   child: AutoSizeText(
                                //     'Sept 2024 - Present',
                                //     style: TextStyle(
                                //       fontFamily: 'poppins-medium',
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w500,
                                //       overflow: TextOverflow.visible,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        experienceContainer(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff130428),
                                Color(0xff251043),
                                Color(0xff38126D),
                                // Color(0xff38126D),
                                // Color(0xff261045),
                                // Color(0xff190634),
                              ],
                            ),
                            image: 'assets/png/responsive-image.png',
                            text:
                                'Developed and maintained cross-platform mobile applications using Flutter and Dart.'),
                        experienceContainer(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff130428),
                                Color(0xff251043),
                                Color(0xff38126D),
                              ],
                            ),
                            image: 'assets/png/api-image.png',
                            text:
                                'Implemented REST API integrations to support real-time data flow and enhance app responsiveness.'),
                        experienceContainer(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff130428),
                                Color(0xff251043),
                                Color(0xff38126D),
                              ],
                            ),
                            image: 'assets/png/notification-image.png',
                            text:
                                'Integrated FCM (Firebase Cloud Messaging) for push notifications and real-time alerts.'),
                        experienceContainer(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff130428),
                                Color(0xff251043),
                                Color(0xff38126D),
                              ],
                            ),
                            image: 'assets/png/optimize-image.png',
                            text:
                                'Focused on performance optimization, error handling, and smooth UI transitions.'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const AutoSizeText(
                      'Education',
                      style: TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: globalWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff130428),
                            Color(0xff251043),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/png/college-image.png',
                              height: 25,
                            ),
                            const SizedBox(width: 15),

                            // Left text
                            const Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  AutoSizeText(
                                    'SRM Valliammai Engineering College B.E Computer Science and Engineering',
                                    style: TextStyle(
                                      fontFamily: 'poppins-medium',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  AutoSizeText(
                                    '- July 2019 - May 2023',
                                    style: TextStyle(
                                      fontFamily: 'poppins-medium',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // // Pushes the date to the right
                            // const Spacer(),

                            // // Right text
                            // const Flexible(
                            //   flex: 2,
                            //   child: AutoSizeText(
                            //     'July 2019 - May 2023',
                            //     style: TextStyle(
                            //       fontFamily: 'poppins-medium',
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w500,
                            //       overflow: TextOverflow.visible,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      key: technlogiesKey,
                    ),
                    const AutoSizeText(
                      'Tech Stack',
                      style: TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 120,
                      child: AutoScrollList(
                        itemCount: techStacks.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            spacing: 20,
                            children: [
                              techStack(
                                imagePath: techStacks[index]['imagePath'],
                                title: techStacks[index]['text'],
                                color: techStacks[index]['color'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      key: projectKey,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              'Project',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xff7127BA),
                              ),
                            ),
                            const AutoSizeText(
                              'IoT Based Solar Panel Application',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            projectContainer(
                                technologiesText:
                                    'Flutter, Dart, REST API, FCM, Razorpay (Payment Gateway).',
                                text:
                                    'Built a responsive design for Android and iOS applications for both customer and installer platforms using the Flutter framework. Implemented REST API integrations to support real-time data flow and improve app responsiveness. Integrated Firebase Cloud Messaging (FCM) for push notifications and real-time alerts. Focused on performance optimization, error handling, and ensuring smooth UI transitions.'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const AutoSizeText(
                              'Project',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xff7127BA),
                              ),
                            ),
                            const AutoSizeText(
                              'Henkel Digital Presenter Application',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            projectContainer(
                              width: globalWidth,
                              projectImage: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff2B0B3A),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30.0, top: 30.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                        'assets/png/zetstron.png',
                                        height: 300),
                                  ),
                                ),
                              ),
                              technologiesText:
                                  'Flutter, Dart, REST API, Provider(State Management), MVVM, Animations.',
                              text:
                                  'Developed a digital application for sales and merchandising teams to view, manage, and present Henkel Beauty Care products across GCC retail stores. The app includes product details, brand visuals, features, benefits, barcodes, and must-stock lists, helping teams ensure brand consistency, planogram compliance, and effective in-store execution. It serves as a reference and presentation tool, enhancing efficiency and accuracy during store visits. The application is live on both Android and iOS.',
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              'Project',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xff7127BA),
                              ),
                            ),
                            const AutoSizeText(
                              'Zuvonne (Website)',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            projectContainer(
                              liveOnTap: () async {
                                final Uri url =
                                    Uri.parse('https://zuvonne.com/');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              liveUrl: 'zuvonne website',
                              technologiesText: 'Flutter, Dart',
                              text:
                                  'Built a responsive website for desktop, tablet, and mobile using the Flutter framework. With an email sending feature, users can easily reach out for inquiries or support. The website is designed to provide a seamless user experience across all devices, ensuring accessibility and engagement for all visitors.',
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                    AutoSizeText(
                      key: aboutKey,
                      'Contact',
                      style: const TextStyle(
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _launchMailURL();
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Image.asset(
                            'assets/png/mail.png',
                            color: Colors.white,
                            height: 16,
                          ),
                          const AutoSizeText(
                            'harishpanneerselvam5@gmail.com',
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 20,
                      children: [
                        socialIcon(
                          tooltipMessage: 'GitHub',
                          image: 'assets/png/github.png',
                          onTap: () => _launchURL('https://github.com/harshq0'),
                        ),
                        socialIcon(
                          tooltipMessage: 'LinkedIn',
                          image: 'assets/png/linkedin.png',
                          onTap: () => _launchURL(
                              'https://www.linkedin.com/in/harish-panneer/'),
                        ),
                        socialIcon(
                          tooltipMessage: 'Resume',
                          image: 'assets/png/resume.png',
                          onTap: () => downloadResume(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget experienceContainer(
      {required String text,
      required String image,
      required Gradient? gradient}) {
    return Container(
      width: globalWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: gradient,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          spacing: 15,
          children: [
            Image.asset(
              image,
              height: 25,
            ),
            Expanded(
              flex: 3,
              child: AutoSizeText(
                text,
                style: const TextStyle(
                  fontFamily: 'poppins-medium',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectContainer({
    required String text,
    required String technologiesText,
    double? width,
    Widget? projectImage,
    String? liveUrl,
    String? liveUrlIos,
    void Function()? liveOnTap,
    void Function()? liveOnTapIos,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                AutoSizeText(
                  text,
                  style: const TextStyle(
                    fontFamily: 'poppins-medium',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'poppins-medium',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Technologies Used : $technologiesText ',
                        style: const TextStyle(
                          fontFamily: 'poppins-medium',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset(
                          'assets/png/arrow_point.png',
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  spacing: 5,
                  children: [
                    liveUrl != null
                        ? Row(
                            spacing: 15,
                            children: [
                              const AutoSizeText(
                                'Live :',
                                style: TextStyle(
                                  fontFamily: 'poppins-medium',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              InkWell(
                                onTap: liveOnTap,
                                child: AutoSizeText(liveUrl,
                                    style: const TextStyle(
                                      fontFamily: 'poppins-medium',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.visible,
                                      decoration: TextDecoration.underline,
                                    )),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    liveUrlIos != null
                        ? Row(
                            spacing: 15,
                            children: [
                              const AutoSizeText(
                                'Live :',
                                style: TextStyle(
                                  fontFamily: 'poppins-medium',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              InkWell(
                                onTap: liveOnTapIos,
                                child: AutoSizeText(liveUrlIos,
                                    style: const TextStyle(
                                      fontFamily: 'poppins-medium',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.visible,
                                      decoration: TextDecoration.underline,
                                    )),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialIcon(
      {required String image,
      required void Function()? onTap,
      required String tooltipMessage}) {
    return Tooltip(
      message: tooltipMessage,
      textStyle: const TextStyle(
        fontFamily: 'Preahvihear',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Colors.black,
      ),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          image,
          height: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget techStack(
    {required String imagePath, required String title, Color? color}) {
  return Column(
    spacing: 10,
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(96, 200, 200, 200)),
          color: const Color.fromARGB(255, 176, 176, 176).withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            color: color,
            height: 25,
          ),
        ),
      ),
      Text(title,
          style: const TextStyle(
            fontFamily: 'poppins-medium',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.visible,
          )),
    ],
  );
}
