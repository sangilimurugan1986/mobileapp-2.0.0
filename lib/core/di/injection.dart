import 'package:ez/core/ApiClient/ApiService.dart';
import 'package:ez/features/folder/view_model/viewmodelfolderlist.dart';
import 'package:ez/features/login/repository/loginrepo.dart';
import 'package:ez/features/login/repository/loginrepoimpl.dart';
import 'package:ez/features/login/viewmodel/loginviewmodel.dart';
import 'package:ez/features/workflow/repository/repo_impl.dart';
import 'package:ez/features/workflow/repository/repository.dart';

import 'package:ez/features/workflow/view_model/viewmodel.dart';
import 'package:ez/features/workflowinitiate/repository/repo_impl.dart';
import 'package:ez/features/workflowinitiate/repository/repository.dart';
import 'package:ez/features/workflowinitiate/viewmodel/viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/dashboard/repository/repo_impl.dart';
import '../../features/dashboard/repository/repository.dart';
import '../../features/dashboard/view_model/viewmodedashboard.dart';
import '../../features/folder/repository/repo_impl.dart';
import '../../features/folder/repository/repository.dart';
import '../../features/workflow/repository/repolist_impl.dart';
import '../../features/workflow/repository/repositorylist.dart';
import '../../features/workflow/view_model/viewmodeworkflowlist.dart';

final sl = GetIt.asNewInstance();

setupLazySingleton() {
  //Workflow Component
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FileManager>(() => FileManager(sl()));
  sl.registerLazySingleton<ApiManager>(() => ApiManager(sl()));
  sl.registerLazySingleton<WorkflowRepo>(() => WorkflowRepoImpl(sl()));
  sl.registerLazySingleton<WorkflowViewModel>(() => WorkflowViewModel(sl()));
  sl.registerLazySingleton<WorkflowInitiateRepo>(() => WorkflowInitiateRepoImpl(sl()));
  sl.registerLazySingleton<WorkflowInitiateViewModel>(() => WorkflowInitiateViewModel(sl()));
  sl.registerLazySingleton<LoginReposity>(() => LoginRepoImpl(sl()));
  sl.registerLazySingleton<LoginViewModel>(() => LoginViewModel(sl()));

  //Dashboard
  sl.registerLazySingleton<DashboardRepo>(() => DashboardRepoImpl(sl()));
  sl.registerLazySingleton<DashboardViewModel>(() => DashboardViewModel(sl()));

  //Workflow List
  sl.registerLazySingleton<WorkflowListRepo>(() => WorkflowListRepoImpl(sl()));
  sl.registerLazySingleton<WorkflowListViewModel>(() => WorkflowListViewModel(sl()));

  //folder
  sl.registerLazySingleton<FolderListRepo>(() => FolderListRepoImpl(sl()));
  sl.registerLazySingleton<FolderListViewModel>(() => FolderListViewModel(sl()));
}
