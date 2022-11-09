import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_fade_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_scale_check_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_scale_color_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/msh_checkbox_base.dart';
import 'package:msh_checkbox/src/checkboxes/stroke_checkbox.dart';

void main() {
  group("MSHCheckbox", () {
    group("Rendering", () {
      testWidgets("Renders a StrokeCheckbox when style is .stroke",
          (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: false,
          style: MSHCheckboxStyle.stroke,
          onChanged: (bool value) {},
        ));

        final strokeCheckboxFinder = find.byType(StrokeCheckbox);

        expect(strokeCheckboxFinder, findsOneWidget);
      });

      testWidgets(
          "Renders a FillScaleColorCheckbox when style is .fillScaleColor",
          (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: false,
          style: MSHCheckboxStyle.fillScaleColor,
          onChanged: (bool value) {},
        ));

        final strokeCheckboxFinder = find.byType(FillScaleColorCheckbox);

        expect(strokeCheckboxFinder, findsOneWidget);
      });

      testWidgets(
          "Renders a FillScaleCheckCheckbox when style is .fillScaleCheck",
          (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: false,
          style: MSHCheckboxStyle.fillScaleCheck,
          onChanged: (bool value) {},
        ));

        final strokeCheckboxFinder = find.byType(FillScaleCheckCheckbox);

        expect(strokeCheckboxFinder, findsOneWidget);
      });

      testWidgets("Renders a FillFadeCheckbox when style is .fillFade",
          (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: false,
          style: MSHCheckboxStyle.fillFade,
          onChanged: (bool value) {},
        ));

        final strokeCheckboxFinder = find.byType(FillFadeCheckbox);

        expect(strokeCheckboxFinder, findsOneWidget);
      });

      testWidgets("Renders as unchecked if value is 'false'", (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: false,
          style: MSHCheckboxStyle.fillFade,
          onChanged: (bool value) {},
        ));

        final checkboxBase =
            tester.widget<MSHCheckboxBase>(find.byType(MSHCheckboxBase));

        expect(checkboxBase.animation.value, equals(0.0));
      });

      testWidgets("Renders as checked if value is 'true'", (tester) async {
        await tester.pumpWidget(
          MSHCheckbox(
            value: true,
            style: MSHCheckboxStyle.fillFade,
            onChanged: (bool value) {},
          ),
        );

        final checkboxBase =
            tester.widget<MSHCheckboxBase>(find.byType(MSHCheckboxBase));

        expect(checkboxBase.animation.value, equals(1.0));
      });

      testWidgets("Animates correctly in response to value changes",
          (tester) async {
        bool isChecked = false;

        await tester.pumpWidget(
          StatefulBuilder(builder: (context, setState) {
            return MSHCheckbox(
              value: isChecked,
              onChanged: (bool value) {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            );
          }),
        );

        var checkboxBase = tester.widget<MSHCheckboxBase>(
          find.byType(MSHCheckboxBase),
        );

        expect(checkboxBase.animation.value, equals(0.0));

        await tester.tap(find.byType(MSHCheckbox));
        await tester.pumpAndSettle();

        checkboxBase = tester.widget<MSHCheckboxBase>(
          find.byType(MSHCheckboxBase),
        );

        expect(checkboxBase.animation.value, equals(1.0));

        await tester.tap(find.byType(MSHCheckbox));
        await tester.pumpAndSettle();

        checkboxBase = tester.widget<MSHCheckboxBase>(
          find.byType(MSHCheckboxBase),
        );

        expect(checkboxBase.animation.value, equals(0.0));
      });
    });

    group('Behavior', () {
      testWidgets(
          "For unchecked box, onChanged should be passed 'true' when widget is tapped",
          (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: false,
          style: MSHCheckboxStyle.fillFade,
          onChanged: (bool value) {
            expect(value, equals(true));
          },
        ));

        await tester.tap(find.byType(MSHCheckbox));
      });

      testWidgets(
          "For checked box, onChanged should be passed 'false' when widget is tapped",
          (tester) async {
        await tester.pumpWidget(MSHCheckbox(
          value: true,
          style: MSHCheckboxStyle.fillFade,
          onChanged: (bool value) {
            expect(value, equals(false));
          },
        ));

        await tester.tap(find.byType(MSHCheckbox));
      });
    });
  });
}
