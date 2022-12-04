import 'package:flutter/material.dart';

import '../api_service.dart';

class NavigationItem extends StatelessWidget {
  final String title;

  const NavigationItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final apiservice = ApiService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await apiservice.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            '${apiservice.welcome.data?.fields?.landingPageHero?.webIcon}',
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          const Spacer(),
          const NavigationItem(title: 'Home'),
          const NavigationItem(title: 'About'),
          const NavigationItem(title: 'Contact'),
        ],
      ),
    );
  }
}
