import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowModalPayment extends StatefulWidget {
  const ShowModalPayment({super.key});

  @override
  State<ShowModalPayment> createState() => _ShowModalPaymentState();
}

class _ShowModalPaymentState extends State<ShowModalPayment> {
  bool isVirtualVisible = false;
  bool isBankVisible = false;
  bool isEWalletVisible = false;
  bool isTotalPembayaranVisible = false;

  Widget buildListVirtualAccount(BuildContext context) {
    return Container(
      height: 50,
    );
  }

  Widget buildListTransferBank(BuildContext context) {
    return Container(
      height: 50,
    );
  }

  Widget buildListEWallet(BuildContext context) {
    return Container(
      height: 50,
    );
  }

  Widget buildListTotalPembayaran(BuildContext context) {
    return Container(
      height: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(
                      "Pilih Metode Pembayaran",
                      style: setTextStyle(SourceColor().black)
                          .copyWith(fontWeight: semiBold, fontSize: 14),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFF1F0F4),
            height: 3,
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 18.0, left: 18.0),
            child: Column(
              children: [
                // Virtual Acount
                //=============================================================
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/payment/credit_card.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Virtual Account",
                                    style:
                                        setTextStyle(NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                  ),
                                  Text(
                                    "Verifikasi Otomatis",
                                    style: setTextStyle(NeutralVariantColor()
                                            .neutralVariant30)
                                        .copyWith(
                                            fontWeight: semiBold, fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isVirtualVisible = !isVirtualVisible;
                              });
                            },
                            icon: isVirtualVisible
                                ? SvgPicture.asset("assets/detail/up.svg")
                                : SvgPicture.asset("assets/detail/down.svg"),
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    isVirtualVisible
                        ? buildListVirtualAccount(context)
                        : Container(),
                  ],
                ),
                // Transfer Bank
                //=============================================================
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/payment/account_balance.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transfer Bank",
                                    style:
                                        setTextStyle(NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isBankVisible = !isBankVisible;
                              });
                            },
                            icon: isBankVisible
                                ? SvgPicture.asset("assets/detail/up.svg")
                                : SvgPicture.asset("assets/detail/down.svg"),
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    isBankVisible
                        ? buildListTransferBank(context)
                        : Container(),
                  ],
                ),
                // E-Wallet
                //=============================================================
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/payment/account_balance_wallet.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "E-Wallet",
                                    style:
                                        setTextStyle(NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isEWalletVisible = !isEWalletVisible;
                              });
                            },
                            icon: isEWalletVisible
                                ? SvgPicture.asset("assets/detail/up.svg")
                                : SvgPicture.asset("assets/detail/down.svg"),
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    isEWalletVisible ? buildListEWallet(context) : Container(),
                  ],
                ),
                // Total Pembayaran
                //=============================================================
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: setTextStyle(NeutralColor().neutral10)
                                .copyWith(fontWeight: medium, fontSize: 14),
                          ),
                          Row(
                            children: [
                              Text(
                                'IDR 23.099',
                                style: setTextStyle(NeutralColor().neutral10)
                                    .copyWith(fontWeight: medium, fontSize: 14),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isTotalPembayaranVisible =
                                        !isTotalPembayaranVisible;
                                  });
                                },
                                icon: isTotalPembayaranVisible
                                    ? SvgPicture.asset("assets/detail/up.svg")
                                    : SvgPicture.asset(
                                        "assets/detail/down.svg"),
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isTotalPembayaranVisible
                        ? buildListTotalPembayaran(context)
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(PrimaryColor().primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bentuk border
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Bayar",
                  style: setTextStyle(SourceColor().white)
                      .copyWith(fontWeight: medium, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
