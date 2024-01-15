import 'dart:ffi';

import 'package:agent_dart/agent_dart.dart';
import 'init.dart';

final RecordClass course = IDL.Record({
  'id' : IDL.Text,
  'title' : IDL.Text,
  'creator' : IDL.Principal,
  'applicants' : IDL.Vec(IDL.Principal),
});

final RecordClass jobs = IDL.Record({
  'id' : IDL.Text,
  'title' : IDL.Text,
  'creator' : IDL.Principal,
  'applicants' : IDL.Vec(IDL.Principal),
});

final VariantClass roles = IDL.Variant({
  'TRAINEE': IDL.Null,
  'TRAINER': IDL.Null,
  'ADMIN' : IDL.Null,
  'EMPLOYER' : IDL.Null,

});

final RecordClass profile = IDL.Record({
  'id' : IDL.Text,
  'occupation' : IDL.Text,
  'resume' : IDL.Vec(IDL.Nat8),
  'role' : roles,
  'description' : IDL.Text,
  'email' : IDL.Text,
  'fullname' : IDL.Text,
  'keywords' : IDL.Vec(IDL.Text),
  'organization' : IDL.Text,
  'skills' : IDL.Vec(IDL.Text),
  'location' : IDL.Text,

});

final CheckUser = IDL.Record({
  'user' : IDL.Principal,
});

abstract class FieldsMethod {
  /// use staic const as method name
  static const applyCourse = 'applyCourse';
  static const checkUser = 'checkUser';
  static const applyJobs = 'applyJobs';
  static const createCourse = 'createCourse';
  static const createJob = 'createJob';
  static const createUser = 'createUser';
  static const get = 'get';
  static const getAllCourse = 'getAllCourse';
  static const getAllJobs = 'getAllJobs';
  static const getCourse = 'getCourse';
  static const getSelf = 'getSelf';
  static const search = 'search';
  static const update = 'update';
  // define service class

  static final ServiceClass idl = IDL.Service({
    FieldsMethod.applyCourse: IDL.Func([IDL.Text], [], []),

    FieldsMethod.applyJobs: IDL.Func([IDL.Principal], [], []),

    FieldsMethod.checkUser: IDL.Func([], [IDL.Bool], []),

    FieldsMethod.createCourse: IDL.Func([IDL.Text], [course], []),

    FieldsMethod.createJob: IDL.Func([IDL.Text], [jobs], []),

    FieldsMethod.createUser: IDL.Func([IDL.Text,IDL.Text,IDL.Text], [profile], []),

    FieldsMethod.get: IDL.Func([IDL.Text], [profile], ['query']),

    FieldsMethod.getAllCourse: IDL.Func([], [IDL.Vec(IDL.Record({'id': IDL.Text,'jobs': jobs}))], ['query']),

    FieldsMethod.getAllJobs: IDL.Func([], [IDL.Vec(IDL.Record({'id': IDL.Principal,'jobs': jobs}))], ['query']),

    FieldsMethod.getCourse: IDL.Func([IDL.Text], [jobs], ['query']),

    FieldsMethod.getSelf: IDL.Func([], [profile], ['query']),

    FieldsMethod.search: IDL.Func([IDL.Text], [IDL.Opt(profile)], ['query']),

    FieldsMethod.update: IDL.Func([profile], [], []),
  });

}
// define all record and variant class here




class Fields extends ActorHook {
  Fields();

  factory Fields.create(CanisterActor _actor) {
    return Fields()..setActor(_actor);
  }

  void setActor(CanisterActor _actor) {
    actor = _actor;
  }

  Future<Bool> checkUser({id = Principal}) async {
    final res = await actor.getFunc(FieldsMethod.checkUser)!([id]);
    return res as Bool;
  }

  Future<Record> createUser({fullname = String, email = String, role = String}) async {
    final res = await actor.getFunc(FieldsMethod.createUser)!([fullname, email, role]);
    return res as Record;
  }

  Future<Record> getSelf() async {
    final res = await actor.getFunc(FieldsMethod.getSelf)!([]);
    return res as Record;
  }

  Future<Record> get({id = String}) async {
    final res = await actor.getFunc(FieldsMethod.get)!([id]);
    return res as Record;
  }

  Future<void> update({profile = Record}) async {
    await actor.getFunc(FieldsMethod.update)!([profile]);
  }

  Future<Record> search({keywords = String}) async {
    final res = await actor.getFunc(FieldsMethod.search)!([keywords]);
    return res as Record;
  }

  Future<Record> createCourse({title = String}) async {
    final res = await actor.getFunc(FieldsMethod.createCourse)!([title]);
    return res as Record;
  }

  Future<Record> getCourse({id = String}) async {
    final res = await actor.getFunc(FieldsMethod.getCourse)!([id]);
    return res as Record;
  }

  Future<VecClass<Record>> getAllCourse() async {
    final res = await actor.getFunc(FieldsMethod.getAllCourse)!([]);
    return res as VecClass<Record>;
  }

  Future<void> applyCourse({id = String}) async {
    await actor.getFunc(FieldsMethod.applyCourse)!([id]);
  }

  Future<Record> createJob({title = String}) async {
    final res = await actor.getFunc(FieldsMethod.createJob)!([title]);
    return res as Record;
  }

  Future<VecClass<Record>> getAllJobs() async {
    final res = await actor.getFunc(FieldsMethod.getAllJobs)!([]);
    return res as VecClass<Record>;
  }

  Future<void> applyJobs({id = Principal}) async {
    await actor.getFunc(FieldsMethod.applyJobs)!([id]);
  }


}


