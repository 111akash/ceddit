import 'package:ceddit/features/community/repository/community_repository.dart';
import 'package:ceddit/models/community_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityController {
  final CommunityRepository _communityRepository;

  final Ref _ref;

  CommunityController({
    required CommunityRepository communityRepository,
    required Ref ref,
  })  : _communityRepository = communityRepository,
        _ref = ref;

  void createCommunity(String name, BuildContext context) async {
    Community community = Community(id: name, name: name, banner: Constants.bannerDefault, avatar: avatar, members: members, mods: mods)
  }
}
