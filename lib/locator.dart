import 'package:moni/core/vm/cluster_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => ClusterVM()),
];
