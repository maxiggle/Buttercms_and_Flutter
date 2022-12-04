import 'package:buttercmslandingpage/widgets/navigation_bar.dart';
import 'package:buttercmslandingpage/widgets/star_bucks_list.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'StarBucks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Center(
            child: SizedBox(
              width: 1000,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                color: const Color(0xffF4F1D6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomNavigationBar(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(height: 200),
                            SizedBox(
                              width: 200,
                              child: Wrap(
                                runSpacing: 20,
                                children: [
                                  Text(
                                      '${apiservice.welcome.data?.fields?.landingPageHero?.heroText}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30)),
                                  const SizedBox(height: 20),
                                  Text(
                                      '${apiservice.welcome.data?.fields?.landingPageHero?.subHeroText}'),
                                  const SizedBox(height: 15),
                                  const Text('Only \$ 9.45'),
                                  const SizedBox(height: 25),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  30)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text('Buy now'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        CircleAvatar(
                          radius: 150,
                          backgroundColor: const Color(0xffFF7043),
                          child: Image.network(
                            '${apiservice.welcome.data?.fields?.landingPageHero?.heroImage}',
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 80),
                        SizedBox(
                          width: 200,
                          child: Wrap(
                            spacing: 30,
                            runSpacing: 20,
                            children: [
                              StarBucksList(
                                apiservice: apiservice,
                                title:
                                    '${apiservice.welcome.data?.fields?.itemList?.itemName}',
                                description:
                                    '${apiservice.welcome.data?.fields?.itemList?.itemDescription}',
                                imgSrc:
                                    '${apiservice.welcome.data?.fields?.itemList?.image1}',
                              ),
                              StarBucksList(
                                apiservice: apiservice,
                                title:
                                    '${apiservice.welcome.data?.fields?.itemList?.itemName3}',
                                description:
                                    ' ${apiservice.welcome.data?.fields?.itemList?.itemDescription3}',
                                imgSrc:
                                    '${apiservice.welcome.data?.fields?.itemList?.image2}',
                              ),
                              StarBucksList(
                                apiservice: apiservice,
                                title:
                                    '${apiservice.welcome.data?.fields?.itemList?.itemName2}',
                                description:
                                    '${apiservice.welcome.data?.fields?.itemList?.itemDescription2}',
                                imgSrc:
                                    '${apiservice.welcome.data?.fields?.itemList?.image3}',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
