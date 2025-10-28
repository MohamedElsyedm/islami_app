import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/models/azkar_model.dart';

class AzkarItemList extends StatefulWidget {
  const AzkarItemList({super.key, required this.azkarName});
  final String azkarName;

  @override
  State<AzkarItemList> createState() => _AzkarItemListState();
}

class _AzkarItemListState extends State<AzkarItemList> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(widget.azkarName), centerTitle: true),
      body: FutureBuilder(
        future: AzkarModel.loadAzkarContent(widget.azkarName),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primary),
            );
          } else if (asyncSnapshot.hasError) {
            print(asyncSnapshot.error);
            return Column(
              children: [
                Text(
                  'Something went wrong\n${asyncSnapshot.error}',
                  style: TextStyle(color: AppTheme.white),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      AzkarModel.loadAzkarContent(widget.azkarName);
                    });
                  },
                  child: Text('Retry'),
                ),
              ],
            );
          } else if (asyncSnapshot.hasData) {
            List<AzkarModel> azkar = asyncSnapshot.data!;
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: azkar.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3.3 / 6,
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                return Container(
                  width: 100,
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryOff,
                    border: Border.all(color: AppTheme.brown, width: 5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'التكرار: ${azkar[index].count!.toString()}',
                        style: textTheme.headlineSmall!.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                      Text(
                        azkar[index].content!,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        azkar[index].category!,
                        style: textTheme.titleSmall!.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
