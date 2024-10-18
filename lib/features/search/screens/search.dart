import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:monipoint_challenge/core/utils/spacer.dart';
import 'package:monipoint_challenge/core/widgets/map_cluster.dart';
import 'package:monipoint_challenge/core/widgets/textfields.dart';
import 'package:monipoint_challenge/features/search/screens/widget.dart';
import 'package:monipoint_challenge/resources/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Set<Marker> _markers = Set();
  final Set<Marker> _iconMarkers = Set();
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;
  bool _showOverlay = false;
  bool _showIconMarker = false;
  @override
  void initState() {
    overlayState = Overlay.of(context);
    _initMarkers();
    super.initState();
  }

  void _initMarkers() async {
    for (LatLng markerLocation in MapControllers().markerLocations) {
      _markers
          .addLabelMarker(LabelMarker(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            label: "10min p",
            markerId: MarkerId(markerLocation.toString()),
            position: markerLocation,
            backgroundColor: AppColors.primaryColor,
          ))
          .then((_) => setState(() {}));
      _iconMarkers.addLabelMarker(LabelMarker(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        label: "",
        markerId: MarkerId(markerLocation.toString()),
        position: markerLocation,
        backgroundColor: AppColors.primaryColor,
      ));
    }
  }

  Future<void> _mamController(GoogleMapController controller) async {
    MapControllers().controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SearchNavigators(
        showOverlay: () {
          if (_showOverlay) {
            overlayEntry!.remove();
            _showOverlay = false;
          } else {
            overlayEntry = OverlayEntry(
              builder: (context) => Positioned(
                bottom: 130.sp,
                left: 20.sp,
                child: Container(
                  height: 200.sp,
                  width: 200.sp,
                  decoration: BoxDecoration(
                    color: AppColors.skyWhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_box_sharp,
                              size: 18.sp,
                            ),
                            XMargin(8),
                            Text(
                              'Casy areas',
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.card_travel,
                                size: 18.sp, color: AppColors.primaryColor),
                            XMargin(8),
                            Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.blinds_closed_outlined, size: 18.sp),
                            XMargin(8),
                            Text(
                              'Infrastructure',
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            _showIconMarker = !_showIconMarker;
                            overlayEntry!.remove();
                            _showOverlay = false;
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Icon(Icons.layers, size: 18.sp),
                              XMargin(8),
                              Text(
                                _showIconMarker
                                    ? 'With layer'
                                    : 'Without any layer',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().scale(duration: Duration(milliseconds: 100)),
              ),
            );

            overlayState!.insert(overlayEntry!);
            _showOverlay = true;
          }
        },
      ).animate().scale(duration: Duration(seconds: 1)),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        },
        body: GestureDetector(
          onTap: () {
            if (_showOverlay) {
              overlayEntry!.remove();
              _showOverlay = false;
            }
          },
          child: Stack(
            children: [
              GoogleMap(
                markers: !_showIconMarker ? _markers : _iconMarkers,
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                initialCameraPosition: MapControllers().cameraPosition,
                onMapCreated: _mamController,
                onCameraMove: (position) {
                  if (_showOverlay) {
                    overlayEntry!.remove();
                    _showOverlay = false;
                  }
                },
                onLongPress: (argument) {
                  if (_showOverlay) {
                    overlayEntry!.remove();
                    _showOverlay = false;
                  }
                },
                onTap: (argument) {
                  if (_showOverlay) {
                    overlayEntry!.remove();
                    _showOverlay = false;
                  }
                },
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                ].toSet(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 60.sp,
                ),
                child: Row(children: [
                  Flexible(
                    child: PrimaryInputField(
                      context: context,
                      hintText: 'saint petersburg',
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.pureBlack,
                      ),
                    ).animate().scale(
                          duration: Duration(seconds: 1),
                        ),
                  ),
                  XMargin(20),
                  Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.skyWhite,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list_sharp,
                        color: AppColors.pureBlack,
                      ),
                    ),
                  ).animate().scale(duration: Duration(seconds: 1)),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
