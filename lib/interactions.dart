// import 'package:agent_dart/agent_dart.dart';
import 'package:flutter/material.dart';
import 'init.dart';
import 'integrations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loading = false;

  Fields? _fields;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loading(true);
  }

  // Future<void> initFields() async {
  //   _fields = (await AgentFactory.create(
  //     // the canister id and url for local testing
  //
  //     canisterId: 'd6g4o-amaaa-aaaaa-qaaoq-cai',
  //     url: 'http://127.0.0.1:4943/',
  //     // For Android emulator, please use 10.0.2.2 as endpoint
  //     idl: idl,
  //   ))
  //       .hook(Fields());
  // }

  void loading(bool state) {
    setState(() {
      _loading = state;
    });
  }

  // Future<void> createUser() async {
  //   if (_fields == null) {
  //     await initFields();
  //   }
  //   await _fields!.createUser();
  //   loading(false);
  // }

  Future<void> getSelf() async {
    loading(true);
    await _fields!.getSelf();
  }

  Future<void> get() async {
    loading(true);
    await _fields!.get();
  }

  Future<void> update() async {
    loading(true);
    await _fields!.update();
  }

  Future<void> search() async {
    loading(true);
    await _fields!.search();
  }

  Future<void> createCourse() async {
    loading(true);
    await _fields!.createCourse();
  }

  Future<void> getCourse() async {
    loading(true);
    await _fields!.getCourse();
  }

  Future<void> getAllCourse() async {
    loading(true);
    await _fields!.getAllCourse();
  }

  Future<void> applyCourse() async {
    loading(true);
    await _fields!.applyCourse();
  }

  Future<void> createJob() async {
    loading(true);
    await _fields!.createJob();
  }

  Future<void> getAllJobs() async {
    loading(true);
    await _fields!.getAllJobs();
  }

  Future<void> applyJobs() async {
    loading(true);
    await _fields!.applyJobs();
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Container(
              height: 200,
              width: 100,
              color:  Colors.yellow,
        ),
      ),
    );
  }

}

