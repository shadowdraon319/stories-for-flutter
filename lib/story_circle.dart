import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stories_for_flutter/full_page_view.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class StoryCircle extends StatelessWidget {
  final List<StoryItem>? story;
  final int? selectedIndex;
  final TextStyle? storyCircleTextStyle;
  final Color? highLightColor;
  final double? circleRadius;
  final double? circlePadding;
  final double? borderThickness;
  final TextStyle? fullPagetitleStyle;
  final Color? paddingColor;

  /// Choose whether progress has to be shown
  final bool? displayProgress;

  /// Color for visited region in progress indicator
  final Color? fullpageVisitedColor;

  /// Color for non visited region in progress indicator
  final Color? fullpageUnvisitedColor;

  /// Horizontal space between stories
  final double? spaceBetweenStories;

  /// Whether image has to be show on top left of the page
  final bool? showThumbnailOnFullPage;

  /// Size of the top left image
  final double? fullpageThumbnailSize;

  /// Whether image has to be show on top left of the page
  final bool? showStoryNameOnFullPage;

  /// Status bar color in full view of story
  final Color? storyStatusBarColor;

  /// Function to run when page changes
  final Function? onPageChanged;

  /// Duration after which next story is displayed
  /// Default value is infinite.
  final Duration? autoPlayDuration;

  /// Show story name on main page
  final bool showStoryName;

  const StoryCircle({
    Key? key,
    this.story,
    this.selectedIndex,
    this.storyCircleTextStyle,
    this.highLightColor,
    this.circleRadius,
    this.circlePadding,
    this.borderThickness,
    this.fullPagetitleStyle,
    this.paddingColor,
    this.displayProgress,
    this.fullpageVisitedColor,
    this.fullpageUnvisitedColor,
    this.spaceBetweenStories,
    this.showThumbnailOnFullPage,
    this.fullpageThumbnailSize,
    this.showStoryNameOnFullPage,
    this.storyStatusBarColor,
    this.onPageChanged,
    this.autoPlayDuration,
    this.showStoryName = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double? altRadius = 27;
    double altPadding;
    if (circleRadius != null) {
      altRadius = circleRadius;
    }
    if (circlePadding != null) {
      altPadding = altRadius! + circlePadding!;
    } else {
      altPadding = altRadius! + 3;
    }
    return Container(
      margin: EdgeInsets.fromLTRB(
        spaceBetweenStories ?? 5,
        0,
        spaceBetweenStories ?? 5,
        10,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 7),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => FullPageView(
                    storiesMapList: story,
                    storyNumber: selectedIndex,
                    fullPagetitleStyle: fullPagetitleStyle,
                    displayProgress: displayProgress,
                    fullpageVisitedColor: fullpageVisitedColor,
                    fullpageUnvisitedColor: fullpageUnvisitedColor,
                    fullpageThumbnailSize: fullpageThumbnailSize,
                    showStoryNameOnFullPage: showStoryNameOnFullPage,
                    showThumbnailOnFullPage: showThumbnailOnFullPage,
                    storyStatusBarColor: storyStatusBarColor,
                    onPageChanged: onPageChanged,
                    autoPlayDuration: autoPlayDuration,
                  ),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width /
                    2, // Specify your desired width
                height: 175, // Specify your desired height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: story![selectedIndex!].thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     padding: EdgeInsets.all(8),
                //     color: Colors.black.withOpacity(
                //         0.5), // Semi-transparent overlay for text visibility
                //     child: Text(
                //       story![selectedIndex!].name,
                //       style: TextStyle(color: Colors.white, fontSize: 12),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          showStoryName
              ? Text(
                  story![selectedIndex!].name,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : const Center()
        ],
      ),
    );
  }
}
