part of './part_of_learn.dart';

class _PartOfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartOfAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Part Of Part"),
      actions: const [
        Icon(Icons.abc_outlined),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
