// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/balance.dart';
import 'models/goal.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6017257863110588144),
      name: 'Goal',
      lastPropertyId: const IdUid(7, 1405500867075772122),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7787558946005060867),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5712789131823863557),
            name: 'day',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5097214383897646396),
            name: 'amount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8540762049911146765),
            name: 'isAchieved',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7441744702984948797),
            name: 'studyType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4476582672742408963),
            name: 'subjectID',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1405500867075772122),
            name: 'lecture',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5071725802063829537),
      name: 'Balance',
      lastPropertyId: const IdUid(4, 4523739771003017917),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4295230154017521657),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 1914322203483712368),
            name: 'earnedBalance',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4523739771003017917),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 5071725802063829537),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [8202684997176013464],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Goal: EntityDefinition<Goal>(
        model: _entities[0],
        toOneRelations: (Goal object) => [],
        toManyRelations: (Goal object) => {},
        getId: (Goal object) => object.id,
        setId: (Goal object, int id) {
          object.id = id;
        },
        objectToFB: (Goal object, fb.Builder fbb) {
          final studyTypeOffset = fbb.writeString(object.studyType);
          final lectureOffset = fbb.writeString(object.lecture);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.day.millisecondsSinceEpoch);
          fbb.addInt64(2, object.amount);
          fbb.addBool(3, object.isAchieved);
          fbb.addOffset(4, studyTypeOffset);
          fbb.addInt64(5, object.subjectID);
          fbb.addOffset(6, lectureOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Goal(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              day: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)),
              studyType: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              amount: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              subjectID: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              isAchieved: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 10, false),
              lecture: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''));

          return object;
        }),
    Balance: EntityDefinition<Balance>(
        model: _entities[1],
        toOneRelations: (Balance object) => [],
        toManyRelations: (Balance object) => {},
        getId: (Balance object) => object.id,
        setId: (Balance object, int id) {
          object.id = id;
        },
        objectToFB: (Balance object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addFloat64(2, object.earnedBalance);
          fbb.addInt64(3, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Balance(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              earnedBalance:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0),
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Goal] entity fields to define ObjectBox queries.
class Goal_ {
  /// see [Goal.id]
  static final id = QueryIntegerProperty<Goal>(_entities[0].properties[0]);

  /// see [Goal.day]
  static final day = QueryIntegerProperty<Goal>(_entities[0].properties[1]);

  /// see [Goal.amount]
  static final amount = QueryIntegerProperty<Goal>(_entities[0].properties[2]);

  /// see [Goal.isAchieved]
  static final isAchieved =
      QueryBooleanProperty<Goal>(_entities[0].properties[3]);

  /// see [Goal.studyType]
  static final studyType =
      QueryStringProperty<Goal>(_entities[0].properties[4]);

  /// see [Goal.subjectID]
  static final subjectID =
      QueryIntegerProperty<Goal>(_entities[0].properties[5]);

  /// see [Goal.lecture]
  static final lecture = QueryStringProperty<Goal>(_entities[0].properties[6]);
}

/// [Balance] entity fields to define ObjectBox queries.
class Balance_ {
  /// see [Balance.id]
  static final id = QueryIntegerProperty<Balance>(_entities[1].properties[0]);

  /// see [Balance.earnedBalance]
  static final earnedBalance =
      QueryDoubleProperty<Balance>(_entities[1].properties[1]);

  /// see [Balance.date]
  static final date = QueryIntegerProperty<Balance>(_entities[1].properties[2]);
}