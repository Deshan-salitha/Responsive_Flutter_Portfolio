import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_profile/models/repo.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/screens/main/components/project_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';
import '../../../models/Project.dart';

class MyProjects extends StatelessWidget {
  // final Future<All> futureRepo;
  const MyProjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<All> futureRepo = fetchRepos();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Projects",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        // Responsive(
        //   mobile: ProjectGridView(
        //     crossAxisCount: 1,
        //     childAspectRatio: 1.7,
        //   ),
        //   mobileLarge: ProjectGridView(
        //     crossAxisCount: 2,
        //     // childAspectRatio: 1.5,
        //   ),
        //   tablet: ProjectGridView(
        //     childAspectRatio: 1.1,
        //   ),
        //   // desktop: ProjectGridView(),
        //   desktop:
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder<All>(
              future: futureRepo,
              builder: (BuildContext context, AsyncSnapshot<All> snapshot) {
                print(snapshot.hasData);
                if (snapshot.hasData) {
                  List<Repo> repos = <Repo>[];
                  for (var i = 0; i < snapshot.data!.repos.length; i++) {
                    repos.add(Repo(
                        name: snapshot.data!.repos[i].name,
                        htmlUrl: snapshot.data!.repos[i].htmlUrl,
                        staegazersCount:
                            snapshot.data!.repos[i].staegazersCount,
                        description: snapshot.data!.repos[i].description));
                  }
                  return ListView(
                    children: repos
                        .map((r) => Card(
                              child: Column(
                                children: [
                                  Text(r.name),
                                  Text(r.description),
                                  Text(r.htmlUrl),
                                  Text(r.staegazersCount.toString()),
                                ],
                              ),
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // return Text('data');
              },
            ),
          ),
        ),
        // )
      ],
    );
  }
}

class ProjectGridView extends StatelessWidget {
  const ProjectGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: demo_projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: defaultPadding),
        itemBuilder: ((context, index) => ProjectCard(
              project: demo_projects[index],
            )));
  }
}

Future<All> fetchRepos() async {
  final response = await http
      .get(Uri.parse('https://api.github.com/users/deshan-salitha/repos'));

  if (response.statusCode == 200) {
    print("fetched");
    // print(response.body);
    return All.fromJson(json.decode(response.body));
  } else {
    throw Exception('Faild to fetch repos!');
  }
}
