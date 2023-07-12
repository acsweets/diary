import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'error.dart';
import 'git_api.dart';
import 'dart:async';

import 'loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<GithubRepository>> task;

  final GithubApi api = GithubApi();

  @override
  void initState() {
    super.initState();
    task = api.getRepositoryByUser(username: 'toly1994328');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text('toly1994328 的 github 仓库'),
      ),
      body: FutureBuilder<List<GithubRepository>>(
        future: task,
        builder: buildByState,
      ),
    );
  }

  void refresh() {
    task = api.getRepositoryByUser(username: 'acsweets');
    setState(() {});
  }

  ///根据不同的任务的状态，通过 setState 进行界面的更新。 Flutter 框架中封装了 FutureBuilder 组件，来方便让使用者根据 Future 的状态构建组件
  Widget buildByState(BuildContext context, AsyncSnapshot<List<GithubRepository>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
        break;
      case ConnectionState.waiting:
        return const GithubRepositoryLoadingPanel();
      case ConnectionState.done:
        if (snapshot.hasError) {
          print("${snapshot.error}================");
          return GithubRepositoryErrorPanel(onRefresh: refresh, errorType: snapshot.error as ErrorType);
        }
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return GithubRepositoryPanel(githubRepositories: snapshot.data!);
          }
        }
        break;
    }
    return const SizedBox.shrink();
  }
}

class GithubRepositoryPanel extends StatelessWidget {
  final List<GithubRepository> githubRepositories;

  const GithubRepositoryPanel({Key? key, required this.githubRepositories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: _buildItemByIndex,
        separatorBuilder: (_, index) => Divider(),
        itemCount: githubRepositories.length);
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    GithubRepository repository = githubRepositories[index];
    String info = repository.description.isEmpty ? '暂无简介' : repository.description;
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(repository.userAvatarUrl),
      ),
      title: Row(
        children: [
          Text(repository.name),
          const Spacer(),
          const Icon(
            Icons.star,
            size: 18,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${repository.stargazersCount}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            width: 4,
          ),
          const Icon(
            Icons.cable,
            size: 18,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${repository.forksCount}',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
      subtitle: Text(info),
    );
  }
}

class RepositoryState {
  const RepositoryState();
}

class RepositoryLoadingState extends RepositoryState {
  const RepositoryLoadingState();
}

class RepositoryErrorState extends RepositoryState {
  final ErrorType type;

  const RepositoryErrorState({required this.type});
}

class RepositoryLoadedState extends RepositoryState {
  final List<GithubRepository> data;

  const RepositoryLoadedState({required this.data});
}



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late Stream<ConnectivityResult> netStream;

  @override
  void initState() {
    super.initState();
    netStream = Connectivity().onConnectivityChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('网络状态监听'),),
      body: Center(
        child: StreamBuilder<ConnectivityResult>(
          stream: netStream,
          builder: _buildByStreamState,
        ),
      ),
    );
  }
  Widget _buildByStreamState(
      BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
    if (snapshot.hasError) {
      return const NetErrorPanel();
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.done:
        break;
      case ConnectionState.waiting:
        return const CupertinoActivityIndicator();
      case ConnectionState.active:
        return NetStatePanel(state: snapshot.data);
    }
    return const SizedBox.shrink();
  }}
class NetErrorPanel extends StatelessWidget {
  const NetErrorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('状态获取异常'),
        ),
      ],
    );
  }
}

class NetStatePanel extends StatelessWidget {
  final ConnectivityResult? state;

  const NetStatePanel({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(state == ConnectivityResult.mobile)
          const Icon(
            Icons.network_cell,
            color: Colors.green,
            size: 60,
          ),
        if(state == ConnectivityResult.wifi)
          const Icon(
            Icons.wifi,
            color: Colors.blue,
            size: 60,
          ),
        if(state == ConnectivityResult.none)
          const Icon(
            Icons.network_locked_outlined,
            color: Colors.grey,
            size: 60,
          ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('$state'),
        ),
      ],
    );
  }
}