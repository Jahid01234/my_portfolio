import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/widgets/social_cards_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeWidget extends StatelessWidget {
  final GlobalKey contactMeSectionKey;

  const ContactMeWidget({super.key, required this.contactMeSectionKey});


  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mdjahidhasan790523@gmail.com',
      query: 'subject=Contact from Portfolio&body=Hello Jahid,', // optional
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch $emailUri');
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: '01760790523',
    );
    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch $phoneUri');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: (ResponsiveBreakpoints.of(context).isDesktop) ? 100 : 30,
          vertical: 40),
      child: Column(
        key: contactMeSectionKey,
        children: [
          (ResponsiveBreakpoints.of(context).isDesktop)
              ? Row(
                  children: [
                    Expanded(
                      child: getTextFields(context),
                    ),
                    const Gap(100),
                    Expanded(child: getLabel(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getLabel(context),
                    const Gap(20),
                    getTextFields(context)
                  ],
                )
        ],
      ),
    );
  }

  Widget getLabel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "Let's ",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge),
            TextSpan(
                text: "talk ", style: Theme
                .of(context)
                .textTheme
                .labelLarge),
            TextSpan(
                text: "for\n",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge),
            TextSpan(
                text: "Something special\n",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge),
            const TextSpan(
              text: "\n",
            ),
            TextSpan(
                text:
                "I seek to push the limits of creativity to create high-engaging, user-friendly, and beautiful mobile apps for the users\n",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall),
          ]),
        ),
        GestureDetector(
          onTap: _launchEmail,
          child: Wrap(
            children: [
              const Icon(
                Icons.email,
                size: 27,
              ),
              const Gap(20),
              Text(" mdjahidhasan790523@gmail.com",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium)
            ],
          ),
        ),
        const Gap(10),
        GestureDetector(
          onTap: _launchPhone,
          child: Wrap(
            children: [
              const Icon(
                Icons.phone,
                size: 27,
              ),
              const Gap(20),
              Text(" 01760790523", style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium)
            ],
          ),
        )
      ],
    );
  }

  Widget getTextFields(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final websiteController = TextEditingController();
    final messageController = TextEditingController();

    Future<void> _sendEmail() async {
      final String name = nameController.text.trim();
      final String email = emailController.text.trim();
      final String website = websiteController.text.trim();
      final String message = messageController.text.trim();

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'mdjahidhasan790523@gmail.com',
        query: Uri.encodeFull(
          'subject=New Contact from $name'
              '&body=Name: $name\n'
              'Email: $email\n'
              'Website: $website\n\n'
              'Message:\n$message',
        ),
      );

      if (!await launchUrl(emailUri)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open email client')),
        );
      }
    }

    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: AppStrings.nameFieldHintText,
          ),
        ),
        const Gap(15),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: AppStrings.emailFieldHintText,
          ),
        ),
        const Gap(15),
        TextFormField(
          controller: websiteController,
          decoration: const InputDecoration(
            hintText: AppStrings.websiteFieldHintText,
          ),
        ),
        const Gap(15),
        TextFormField(
          controller: messageController,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: AppStrings.messageFieldHintText,
          ),
        ),
        const Gap(15),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _sendEmail,
                  child: const Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        AppStrings.contactMeButtonText,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(flex: 3, child: SocialCardsWidget())
          ],
        ),
      ],
    );
  }
}
