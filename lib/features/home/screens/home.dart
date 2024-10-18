import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monipoint_challenge/core/utils/spacer.dart';
import 'package:monipoint_challenge/core/widgets/slidable_button.dart';
import 'package:monipoint_challenge/core/widgets/sliver_app_bar_delegate.dart';
import 'package:monipoint_challenge/resources/colors.dart';
import 'package:monipoint_challenge/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppColors.sampleColor2.withOpacity(0.1),
            AppColors.sampleColor14,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                floating: true,
                snap: true,
                pinned: false,
                title: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.skyWhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.skyWhite,
                              offset: Offset(2, 2),
                              blurRadius: 12,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: AppColors.sampleColor20,
                            ),
                            XMargin(10),
                            Text(
                              'Saint Petersburg',
                              style: TextStyle(color: AppColors.sampleColor20),
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fade(
                          begin: 0.0,
                          end: 1.0,
                          duration: Duration(seconds: 2),
                        )
                        .slideX(
                          duration: Duration(seconds: 2),
                        ),
                    Spacer(),
                    CircleAvatar(
                      radius: 20,
                      // backgroundColor: AppColors.sampleColor12,
                      backgroundImage: AssetImage(
                        Images.profile,
                      ),
                    ).animate().scale(duration: Duration(seconds: 2)),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  maxHeight: 370.sp,
                  minHeight: 370.sp,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YMargin(30),
                        Text(
                          'Hi Marina',
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: AppColors.sampleColor11,
                          ),
                        ).animate().fade(duration: Duration(seconds: 2)),
                        Text(
                          'Let\'s select your\nperfect place',
                          style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                            .animate()
                            .fade(duration: Duration(seconds: 2))
                            .slideY(begin: 0.5, duration: Duration(seconds: 2)),
                        YMargin(25),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Container(
                                height: 180.sp,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Buy',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: AppColors.skyWhite,
                                        ),
                                      ),
                                      YMargin(20),
                                      Column(
                                        children: [
                                          TweenAnimationBuilder<int>(
                                            tween:
                                                IntTween(begin: 1, end: 1024),
                                            duration: Duration(seconds: 2),
                                            builder: (context, value, child) {
                                              return Text(
                                                '$value',
                                                style: TextStyle(
                                                    fontSize: 45,
                                                    color: AppColors.skyWhite,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              );
                                            },
                                          ),
                                          Text(
                                            'offers',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: AppColors.skyWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animate().scale(duration: Duration(seconds: 2)),
                            XMargin(12),
                            Expanded(
                              flex: 10,
                              child: Container(
                                height: 180.sp,
                                decoration: BoxDecoration(
                                    color: AppColors.skyWhite,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Rent',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: AppColors.sampleColor10,
                                        ),
                                      ),
                                      YMargin(20),
                                      Column(
                                        children: [
                                          TweenAnimationBuilder<int>(
                                            tween:
                                                IntTween(begin: 1, end: 2212),
                                            duration: Duration(seconds: 2),
                                            builder: (context, value, child) {
                                              return Text(
                                                '$value',
                                                style: TextStyle(
                                                    fontSize: 45.sp,
                                                    color:
                                                        AppColors.sampleColor10,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              );
                                            },
                                          ),
                                          Text(
                                            'offers',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: AppColors.sampleColor10,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animate().scale(duration: Duration(seconds: 2)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: AppColors.skyWhite,
            ),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: _cardTile,
            ),
          )
              .animate()
              .slideY(begin: 1.0, end: 0.0, duration: Duration(seconds: 2)),
        ),
      ),
    );
  }
}

//List of Cards with size
List<StaggeredGridTile> _cardTile = [
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(),
  ),
];

class BackGroundTile extends StatelessWidget {
  const BackGroundTile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              width: double.infinity,
              height: double.infinity,
              Images.imageBg,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: Animate()
                .custom(
                  delay: Duration(seconds: 2),
                  duration: 2.seconds,
                  begin: 2,
                  end: 0,
                  builder: (_, value, __) => SliderButton(
                    buttonSize: 42.sp,
                    height: 45.sp,
                    action: () async {
                      return null;
                    },
                    label: Text(
                      "Glatdkotiv 23k",
                      style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    )
                        .animate(
                          delay: Duration(seconds: 4),
                        )
                        .fadeIn(delay: 500.ms),
                    icon: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                )
                .scaleX()
                .slideX(),
          ),
        ],
      ),
    );
  }
}
