import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';
import 'package:kawarini_ketsudan/view/theme/my_text_style.dart';
import 'package:marquee_widget/marquee_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColor.amber, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _decisionHistory(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => debugPrint('決断'),
                  child: const Text('決断'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _decisionHistory() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '〜　今までの決断(10)　〜',
            style: MyTextStyle.black16,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => debugPrint('decision'),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyColor.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('aiueo', style: MyTextStyle.white20),
                        ),
                        _closeButton(onPressed: () => debugPrint('close')),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Marquee(
                        pauseDuration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiueo',
                              'aiue',
                            ].map((e) {
                              return Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: MyColor.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    color: MyColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _closeButton({required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.close),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
