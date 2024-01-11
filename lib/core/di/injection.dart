import 'package:ez/core/ApiClient/ApiService.dart';
import 'package:ez/features/login/repository/loginrepo.dart';
import 'package:ez/features/login/repository/loginrepoimpl.dart';
import 'package:ez/features/login/viewmodel/loginviewmodel.dart';
import 'package:ez/features/tasklist/repository/repo_impl.dart';
import 'package:ez/features/tasklist/repository/repository.dart';
import 'package:ez/features/tasklist/viewmodel/viewmodel.dart';
import 'package:ez/features/workflow/repository/repo_impl.dart';
import 'package:ez/features/workflow/repository/repository.dart';
import 'package:ez/features/workflow/view/workflow.dart';
import 'package:ez/features/workflow/view_model/viewmodel.dart';
import 'package:ez/features/workflowinitiate/repository/repo_impl.dart';
import 'package:ez/features/workflowinitiate/repository/repository.dart';
import 'package:ez/features/workflowinitiate/viewmodel/viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.asNewInstance();

setupLazySingleton() {
  //Workflow Component
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FileManager>(() => FileManager(sl()));
  sl.registerLazySingleton<ApiManager>(() => ApiManager(sl()));
  sl.registerLazySingleton<WorkflowRepo>(() => WorkflowRepoImpl(sl()));
  sl.registerLazySingleton<WorkflowViewModel>(() => WorkflowViewModel(sl()));
  sl.registerLazySingleton<WorkflowInitiateRepo>(
      () => WorkflowInitiateRepoImpl(sl()));
  sl.registerLazySingleton<WorkflowInitiateViewModel>(
      () => WorkflowInitiateViewModel(sl()));
  sl.registerLazySingleton<LoginReposity>(() => LoginRepoImpl(sl()));
  sl.registerLazySingleton<LoginViewModel>(() => LoginViewModel(sl()));

  sl.registerLazySingleton<TaskListRepo>(() => TaskListRepoImpl(sl()));
  sl.registerLazySingleton<TaskListViewModel>(() => TaskListViewModel(sl()));
}
