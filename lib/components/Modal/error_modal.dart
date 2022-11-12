import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/provider/modal_provider.dart';
import 'package:provider/provider.dart';

class ErrorModal extends StatelessWidget {
  const ErrorModal({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var modalProvider = Provider.of<ModalProvider>(context);
    return modalProvider.isOpen
        ? Positioned(
            child: Container(
              width: size.width,
              height: size.height,
              color: ColorsConstant.backgroundModalColor,
              alignment: Alignment.center,
              child: Container(
                width: size.width * 3 / 4,
                decoration: BoxDecoration(
                    color: ColorsConstant.whiteColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.warning,
                            color: ColorsConstant.errorColor,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Có lỗi xảy ra!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, color: ColorsConstant.blackColor),
                          ),
                          Text(modalProvider.content,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: ColorsConstant.lightTextColor)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        modalProvider.closeModal();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: size.width * 3.4,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          color: ColorsConstant.errorColor,
                        ),
                        child: const Text(
                          "Đóng",
                          style: TextStyle(
                              fontSize: 24, color: ColorsConstant.whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
