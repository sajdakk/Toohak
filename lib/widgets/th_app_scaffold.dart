import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class ThAppScaffold extends StatelessWidget {
  const ThAppScaffold({
    super.key,
    required this.body,
    this.appBarWidget,
    this.appBarTitle,
    this.bottomNavigationBar,
    this.automaticallyImplyLeading = true,
    this.hideAppBar = false,
    this.actionButton,
    this.floatingActionButton,
    this.leadingWidget,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
    this.showBorderLine = false,
    this.backgroundColor = ThColors.backgroundBG0,
  });

  final Widget body;
  final Widget? appBarWidget;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  final bool automaticallyImplyLeading;
  final bool resizeToAvoidBottomInset;
  final bool showBorderLine;
  final bool hideAppBar;
  final Widget? actionButton;
  final Widget? floatingActionButton;
  final Widget? leadingWidget;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      appBar: hideAppBar
          ? null
          : AppBar(
              scrolledUnderElevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.white),
              shape: showBorderLine
                  ? Border(
                      bottom: BorderSide(
                        color: ThColors.ascentAscent.withOpacity(0.15),
                      ),
                    )
                  : null,
              backgroundColor: ThColors.backgroundBG0,
              elevation: 0.0,
              centerTitle: true,
              title: _buildAppBarTitle(),
              leading: _buildLeadingWidget(context),
              actions: <Widget>[
                if (actionButton != null) actionButton!,
              ],
            ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget? _buildLeadingWidget(BuildContext context) {
    if (!automaticallyImplyLeading) {
      return null;
    }

    if (leadingWidget != null) {
      return leadingWidget;
    }

    if (ModalRoute.of(context)?.canPop ?? false) {
      return IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ThColors.textText2,
        ),
        onPressed: () {
          Navigator.maybePop(context);
        },
      );
    } else {
      return null;
    }
  }

  Widget? _buildAppBarTitle() {
    if (appBarWidget != null) {
      return appBarWidget!;
    } else if (appBarTitle != null) {
      return Text(
        appBarTitle!,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.grey,
        ),
      );
    } else {
      return null;
    }
  }
}
