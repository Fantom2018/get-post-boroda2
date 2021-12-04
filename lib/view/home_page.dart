import 'package:flutter/material.dart';
import 'package:http_test_app/domain/DB/api_client.dart';
import 'package:http_test_app/domain/servise/Home_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required String title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final model = HomeWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeModelProvider(
          model: model,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _ReloadButton(),
              const _CreateButton(),
               Expanded(
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _PostWidget(),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => HomeModelProvider.read(context)?.model.reloadJesData(),
      child:  const Text('Reload Posts'),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => HomeModelProvider.read(context)?.model.createJesData(),
      child:  const Text('Create Post'),
    );
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: HomeModelProvider.wach(context)?.model.results.length ?? 0,
        itemBuilder: (BuildContext context, int index){
          return PostRowWidget(index: index);
    });
  }
}

class PostRowWidget extends StatelessWidget {
  final int index;
  const PostRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = HomeModelProvider.read(context)!.model.results[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(result.id.toString()),
        const SizedBox(height: 10),
        Text(result.title),
        const SizedBox(height: 10),
        Text(result.body),
        const SizedBox(height: 50),

      ],
    );
  }
}




