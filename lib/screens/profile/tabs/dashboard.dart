import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    Future.delayed(Duration.zero).whenComplete(() {
      final userState = context.read(userControllerProvider);
      if (userState is! UserSuccess) {
        context.read(userControllerProvider.notifier).getCurrentUser();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    _buildCard({required String title, required String value}) {
      return Container(
        height: 80,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffE8E8E8), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: textTheme.subtitle1),
            const SizedBox(height: 10),
            Text(value, style: textTheme.headline1),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read(userControllerProvider.notifier).getCurrentUser();
      },
      child: Consumer(
        builder: (context, watch, child) {
          final userController = watch(userControllerProvider);

          if (userController is UserSuccess) {
            final user = userController.user;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: primaryColor,
                      child: Text(
                        user.firstName.substring(0, 1).toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: textTheme.headline2,
                    ),
                    const SizedBox(height: 10),
                    Text(user.email, style: textTheme.subtitle2),
                    const SizedBox(height: 15),
                    const Divider(),
                    const SizedBox(height: 15),
                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        _buildCard(
                          title: "Total orders",
                          value: (user.pendingOrders +
                                  user.deliveredOrders +
                                  user.cancelledOrders)
                              .toString(),
                        ),
                        _buildCard(
                            title: "My Reviews",
                            value: user.reviews.toString()),
                        _buildCard(
                          title: "Total wishlists",
                          value: user.wishlists.toString(),
                        ),
                        _buildCard(
                            title: "Panding orders",
                            value: user.pendingOrders.toString()),
                        _buildCard(
                          title: "Delivered orders",
                          value: user.deliveredOrders.toString(),
                        ),
                        _buildCard(
                          title: "Cancelled orders",
                          value: user.deliveredOrders.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (userController is UserFailed) {
            return _buildErrorScreen(watch(userControllerProvider));
          } else {
            return _buildLoading();
          }
        },
      ),
    );
  }

  _buildErrorScreen(userController) {
    final userFaild = userController as UserFailed;
    return ErrorWidet(
      message: userFaild.customException.message,
      wentWrongMessage: "Oops something went wrong",
    );
  }

  _buildLoading() {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
