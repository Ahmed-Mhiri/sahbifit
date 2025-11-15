// @dart=3.6
// ignore_for_file: directives_ordering
// build_runner >=2.4.16
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner/src/build_plan/builder_factories.dart' as _i1;
import 'package:auto_route_generator/builder.dart' as _i2;
import 'package:freezed/builder.dart' as _i3;
import 'package:injectable_generator/builder.dart' as _i4;
import 'package:json_serializable/builder.dart' as _i5;
import 'package:source_gen/builder.dart' as _i6;
import 'dart:io' as _i7;
import 'package:build_runner/src/bootstrap/processes.dart' as _i8;

final _builderFactories = _i1.BuilderFactories(
  builderFactories: {
    'auto_route_generator:auto_route_generator': [_i2.autoRouteBuilder],
    'auto_route_generator:auto_router_generator': [_i2.autoRouterBuilder],
    'freezed:freezed': [_i3.freezed],
    'injectable_generator:injectable_builder': [_i4.injectableBuilder],
    'injectable_generator:injectable_config_builder': [
      _i4.injectableConfigBuilder
    ],
    'json_serializable:json_serializable': [_i5.jsonSerializable],
    'source_gen:combining_builder': [_i6.combiningBuilder],
  },
  postProcessBuilderFactories: {'source_gen:part_cleanup': _i6.partCleanup},
);
void main(List<String> args) async {
  _i7.exitCode = await _i8.ChildProcess.run(
    args,
    _builderFactories,
  )!;
}
