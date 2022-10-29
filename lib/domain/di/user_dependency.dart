import 'package:flutter/cupertino.dart';
import 'package:paint/data/data_sources/core/app_remote_ds.dart';
import 'package:paint/data/data_sources/gallery/local_gallery_ds.dart';
import 'package:paint/domain/services/gallery_service.dart';
import 'package:provider/provider.dart';
import 'package:paint/domain/di/core/app_dependency.dart';
import 'package:paint/domain/di/global_dependency.dart';

class UserDependency implements AppDependency {
  UserDependency(BuildContext context) {
    _globalDependency = context.read<GlobalDependency>();
    final galleryLds = LocalGalleryDataSource();
    _galleryService = GalleryService(
      galleryLds,
      BaseRemoteDataSource(),
      _globalDependency.errorService,
    );
  }

  late final GlobalDependency _globalDependency;
  late final GalleryService _galleryService;

  GalleryService get galleryService => _galleryService;

  @override
  void dispose() {}
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
