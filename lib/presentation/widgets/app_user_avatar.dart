import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/theme/app_typography.dart';

class AppUserAvatar extends StatelessWidget {
  const AppUserAvatar({
    Key? key,
    required this.url,
    this.withNicname = true,
    this.width = 32,
    this.height = 32,
    this.action,
    required this.userName,
  }) : super(key: key);

  final String? url;
  final String userName;
  final bool withNicname;
  final double width;
  final double height;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: action,
      child: Row(
        children: [
          if (url != null)
            CachedNetworkImage(
              imageUrl: url!,
              fit: BoxFit.cover,
            )
          else
            SizedBox(
              width: 32,
              height: 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: ColoredBox(
                  color: ColorName.grey,
                  child: Center(
                    child: Text(
                      userName[0].toUpperCase(),
                      style: AppTypography.sf.w500.s18.black,
                    ),
                  ),
                ),
              ),
            ),
          if (withNicname) ...[
            const SizedBox(width: 8),
            Text(
              userName,
              style: AppTypography.sf.w500.s18.black,
            ),
          ],
        ],
      ),
    );
  }
}
