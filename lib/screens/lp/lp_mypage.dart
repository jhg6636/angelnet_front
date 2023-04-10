import 'package:flutter/cupertino.dart';

import '../../models/fund.dart';
import '../../widgets/lp/lp_my_page_state.dart';

class LpMyPage extends StatefulWidget {
  final List<Fund> funds;

  const LpMyPage({super.key, required this.funds});

  @override
  State<StatefulWidget> createState() => LpMyPageState();
}