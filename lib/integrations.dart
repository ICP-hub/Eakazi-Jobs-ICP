import 'dart:ffi';
import 'init.dart';
import 'package:agent_dart/agent_dart.dart';

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
  'token_ids': IDL.Vec(IDL.Tuple([IDL.Nat, IDL.Text])),
  'reviews': IDL.Vec(reviews),
});

final RecordClass checkUser = IDL.Record({
  'user': IDL.Principal,
});

final RecordClass reviews = IDL.Record({
  'review' : IDL.Text,
  'title' : IDL.Text,
  'ratings' : IDL.Float64,
  'image' : IDL.Opt(IDL.Text),
  'reviewer_principal' : IDL.Opt(IDL.Principal),
  'reviewer' : IDL.Text,
  'review_time' : IDL.Int64,
});

// NFT related types

final RecordClass initArgs = IDL.Record({
  'cap': IDL.Opt(IDL.Principal),
  'logo': IDL.Opt(IDL.Text),
  'name': IDL.Opt(IDL.Text),
  'custodians': IDL.Opt(IDL.Vec(IDL.Principal)),
  'symbol': IDL.Opt(IDL.Text)
});

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

final RecordClass tokenMetadata = IDL.Record({
  'transferred_at': IDL.Opt(IDL.Nat64),
  'transferred_by': IDL.Opt(IDL.Principal),
  'owner': IDL.Opt(IDL.Principal),
  'operator': IDL.Opt(IDL.Principal),
  'approved_at': IDL.Opt(IDL.Nat64),
  'approved_by': IDL.Opt(IDL.Principal),
  'properties': IDL.Vec(IDL.Tuple([IDL.Text, genericValue])),
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

final VariantClass result1 = IDL.Variant({
  'Ok': IDL.Bool,
  'Err': nftError,
});

final VariantClass result2 = IDL.Variant({
  'Ok': IDL.Opt(IDL.Principal),
  'Err': nftError,
});

final RecordClass manualReply = IDL.Record({
  'logo': IDL.Opt(IDL.Text),
  'name': IDL.Opt(IDL.Text),
  'created_at': IDL.Nat64,
  'upgraded_at': IDL.Nat64,
  'custodians': IDL.Vec(IDL.Principal),
  'symbol': IDL.Opt(IDL.Text),
});

final VariantClass manualReply1 = IDL.Variant({
  'Ok': IDL.Vec(IDL.Nat),
  'Err': nftError,
});

final VariantClass manualReply2 = IDL.Variant({
  'Ok': IDL.Vec(tokenMetadata),
  'Err': nftError,
});

final VariantClass manualReply3 = IDL.Variant({
  'Ok': tokenMetadata,
  'Err': nftError,
});

final RecordClass stats = IDL.Record({
  'cycles': IDL.Nat,
  'total_transactions': IDL.Nat,
  'total_unique_holders': IDL.Nat,
  'total_supply': IDL.Nat,
});

final VariantClass supportedInterface = IDL.Variant({
  'Burn': IDL.Null,
  'Mint': IDL.Null,
  'Approval': IDL.Null,
});

abstract class FieldsMethod {
  // use static const as method name
  static const applyCourse = 'apply_course';
  static const checkUser = 'check_user';
  static const applyJobs = 'apply_jobs';
  static const createCourse = 'create_course';
  static const createJob = 'create_job';
  static const createUser = 'create_user';
  static const get = 'get';
  static const getAllCourse = 'get_all_courses';
  static const getAllJobs = 'get_all_jobs';
  static const getCourse = 'get_course';
  static const getSelf = 'get_self';
  static const search = 'search';
  static const update = 'update';
  static const getRole = 'get_role';
  static const getFullName = 'get_full_name';
  static const getCourseByCreator = 'get_courses_by_creator';
  static const getJobsByCreator = 'get_jobs_by_creator';
  static const checkAppliedJob = 'check_applied_job';
  static const checkAppliedCourse = 'check_applied_course';
  static const getJobsAppliedCount = 'get_jobs_applied_count';
  static const getCoursesRegisteredByUser = 'get_courses_registered_by_user';
  static const getCourseApplicants = 'get_course_applicants';
  static const getJobApplicants = 'get_job_applicants';
  static const getAllFreelancers = 'get_all_freelancers';
  static const mintCertificate = 'mint_certificate';
  static const dip721TokenMetadata = 'dip721_token_metadata';
  static const addReviews = 'add_reviews';
  static const getAllReviews = 'get_all_reviews';
  static const confirmReviewer = 'confirm_reviewer';
  static const confirmReviewed = 'confirm_reviewed';

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
      FieldsMethod.mintCertificate: IDL.Func(
          [IDL.Text, IDL.Text, IDL.Text, IDL.Text, IDL.Text], [result], []),
      FieldsMethod.dip721TokenMetadata:
          IDL.Func([IDL.Nat], [manualReply3], ['query']),
      FieldsMethod.addReviews: IDL.Func(
        [IDL.Float64, IDL.Text, IDL.Text, IDL.Text, IDL.Text, IDL.Int64],
        [reviews],
        []
      ),
      FieldsMethod.getAllReviews: IDL.Func([IDL.Principal], [IDL.Vec(reviews)], []),
      FieldsMethod.confirmReviewer: IDL.Func([IDL.Text], [IDL.Bool], ['query']),
      FieldsMethod.confirmReviewed: IDL.Func([IDL.Principal], [IDL.Bool], ['query']),
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
