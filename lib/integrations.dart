import 'dart:ffi';

import 'package:agent_dart/agent_dart.dart';
import 'init.dart';

final RecordClass course = IDL.Record({
  'id': IDL.Text,
  'title': IDL.Text,
  'creator': IDL.Principal,
  'creator_fullname': IDL.Text,
  'applicants': IDL.Vec(IDL.Principal),
});

final RecordClass jobs = IDL.Record({
  'id': IDL.Text,
  'title': IDL.Text,
  'creator': IDL.Principal,
  'creator_fullname': IDL.Text,
  'applicants': IDL.Vec(IDL.Principal),
});

final VariantClass roles = IDL.Variant({
  'TRAINEE': IDL.Null,
  'TRAINER': IDL.Null,
  'ADMIN': IDL.Null,
  'EMPLOYER': IDL.Null,
});

final RecordClass profile = IDL.Record({
  'id': IDL.Text,
  'principal_id': IDL.Principal,
  'occupation': IDL.Text,
  'resume': IDL.Vec(IDL.Nat8),
  'role': roles,
  'description': IDL.Text,
  'email': IDL.Text,
  'fullname': IDL.Text,
  'keywords': IDL.Vec(IDL.Text),
  'organization': IDL.Text,
  'skills': IDL.Vec(IDL.Text),
  'location': IDL.Text,
  'token_ids': IDL.Vec(IDL.Nat),
});

final CheckUser = IDL.Record({
  'user': IDL.Principal,
});

// NFT related types

final VariantClass genericValue = IDL.Variant(
  {
    'Nat64Content': IDL.Nat64,
    'Nat32Content': IDL.Nat32,
    'BoolContent': IDL.Bool,
    'Nat8Content': IDL.Nat8,
    'Int64Content': IDL.Int64,
    'IntContent': IDL.Int,
    'NatContent': IDL.Nat,
    'Nat16Content': IDL.Nat16,
    'Int32Content': IDL.Int32,
    'Int8Content': IDL.Int8,
    'FloatContent': IDL.Float64,
    'Int16Content': IDL.Int16,
    'BlobContent': IDL.Vec(IDL.Nat8),
    // 'NestedContent': IDL.Vec(genericValue),
    'Principal': IDL.Principal,
    'TextContent': IDL.Text,
  },
);

final VariantClass nftError = IDL.Variant({
  'UnauthorizedOwner': IDL.Null,
  'UnauthorizedOperator': IDL.Null,
  'OwnerNotFound': IDL.Null,
  'OperatorNotFound': IDL.Null,
  'TokenNotFound': IDL.Null,
  'ExistedNFT': IDL.Null,
  'SelfApprove': IDL.Null,
  'SelfTransfer': IDL.Null,
});

final TokenMetadata = IDL.Record({
  'id': IDL.Nat,
  'owner': IDL.Principal,
  'operator': IDL.Principal,
  'metadata': IDL.Vec(IDL.Nat8),
});

final RecordClass tokenMetadata = IDL.Record({
  'transferred_at': IDL.Opt(IDL.Nat64),
  'transferred_by': IDL.Opt(IDL.Principal),
  'owner': IDL.Opt(IDL.Principal),
  'operator': IDL.Opt(IDL.Principal),
  'approved_at': IDL.Opt(IDL.Nat64),
  'approved_by': IDL.Opt(IDL.Principal),
  'properties': IDL.Vec(genericValue),
  'is_burned': IDL.Bool,
  'token_identifier': IDL.Nat,
  'burned_at': IDL.Opt(IDL.Nat64),
  'burned_by': IDL.Opt(IDL.Principal),
  'minted_at': IDL.Nat64,
  'minted_by': IDL.Principal,
});

final VariantClass result = IDL.Variant({
  'Ok': IDL.Nat,
  'Err': nftError,
});

final VariantClass manualReply = IDL.Variant({
  'Ok': tokenMetadata,
  'Err': nftError,
});

final VariantClass manualReply2 = IDL.Variant({
  'Ok': IDL.Vec(tokenMetadata),
  'Err': nftError,
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
  static const getAllCourse = 'getAllCourses';
  static const getAllJobs = 'getAllJobs';
  static const getCourse = 'getCourse';
  static const getSelf = 'getSelf';
  static const search = 'search';
  static const update = 'update';
  static const getRole = 'getRole';
  static const getFullName = 'getFullName';
  static const getCourseByCreator = 'getCoursesByCreator';
  static const getJobsByCreator = 'getJobsByCreator';
  static const checkAppliedJob = 'checkAppliedJob';
  static const checkAppliedCourse = 'checkAppliedCourse';
  static const getJobsAppliedCount = 'getJobsAppliedCount';
  static const getCoursesRegisteredByUser = 'getCoursesRegisteredByUser';
  static const getCourseApplicants = 'getCourseApplicants';
  static const getJobApplicants = 'getJobApplicants';
  static const getAllFreelancers = 'getAllFreelancers';
  static const getUserNFTInfo = 'get_user_nft_info';
  static const mintCertificate = 'mint_certificate';
  static const getOwnerMetadata = 'get_owner_token_metadata';
  static const dip721OwnerMetadata = 'dip721_owner_token_metadata';

  static final ServiceClass idl = IDL.Service(
    {
      FieldsMethod.applyCourse: IDL.Func([IDL.Text], [], []),
      FieldsMethod.applyJobs: IDL.Func([IDL.Text], [], []),
      FieldsMethod.checkUser: IDL.Func([], [IDL.Bool], []),
      FieldsMethod.createCourse: IDL.Func([IDL.Text], [course], []),
      FieldsMethod.createJob: IDL.Func([IDL.Text], [jobs], []),
      FieldsMethod.createUser:
          IDL.Func([IDL.Text, IDL.Text, IDL.Text], [profile], []),
      FieldsMethod.get: IDL.Func([IDL.Text], [profile], ['query']),
      FieldsMethod.getAllCourse: IDL.Func([], [IDL.Vec(course)], ['query']),
      FieldsMethod.getAllJobs: IDL.Func([], [IDL.Vec(jobs)], ['query']),
      FieldsMethod.getCourse: IDL.Func([IDL.Text], [jobs], ['query']),
      FieldsMethod.getSelf: IDL.Func([], [profile], ['query']),
      FieldsMethod.search: IDL.Func([IDL.Text], [IDL.Opt(profile)], ['query']),
      FieldsMethod.update: IDL.Func([profile], [], []),
      FieldsMethod.getRole: IDL.Func([], [IDL.Text], ['query']),
      FieldsMethod.getFullName: IDL.Func([], [IDL.Text], ['query']),
      FieldsMethod.getCourseByCreator: IDL.Func([], [IDL.Vec(course)], []),
      FieldsMethod.getJobsByCreator: IDL.Func([], [IDL.Vec(jobs)], []),
      FieldsMethod.checkAppliedJob: IDL.Func([IDL.Text], [IDL.Bool], ['query']),
      FieldsMethod.checkAppliedCourse:
          IDL.Func([IDL.Text], [IDL.Bool], ['query']),
      FieldsMethod.getJobsAppliedCount: IDL.Func([], [IDL.Nat32], ['query']),
      FieldsMethod.getCoursesRegisteredByUser:
          IDL.Func([], [IDL.Vec(course)], []),
      FieldsMethod.getCourseApplicants:
          IDL.Func([IDL.Text], [IDL.Vec(profile)], ['query']),
      FieldsMethod.getJobApplicants:
          IDL.Func([IDL.Text], [IDL.Vec(profile)], ['query']),
      FieldsMethod.getAllFreelancers:
          IDL.Func([], [IDL.Vec(profile)], ['query']),
      FieldsMethod.getUserNFTInfo:
          IDL.Func([IDL.Text], [manualReply], ['query']),
      FieldsMethod.mintCertificate: IDL.Func(
          [IDL.Text, IDL.Text, IDL.Text, IDL.Text, IDL.Text, IDL.Text],
          [result],
          []),
      FieldsMethod.getOwnerMetadata: IDL.Func([], [manualReply2], ['query']),
      FieldsMethod.dip721OwnerMetadata:
          IDL.Func([IDL.Principal], [manualReply2], ['query']),
    },
  );
}

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

  Future<Record> createUser(
      {fullname = String, email = String, role = String}) async {
    final res =
        await actor.getFunc(FieldsMethod.createUser)!([fullname, email, role]);
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
