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

  String selectedValue = 'Virtual Account BNI';

  Widget buildListVirtualAccount(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedValue = 'Virtual Account BNI';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: selectedValue == 'Virtual Account BNI'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/BNI.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BNI',
                            style: setTextStyle(NeutralColor().neutral10)
                                .copyWith(fontWeight: medium, fontSize: 16),
                          ),
                          Text(
                            'Gratis Biaya Pembayaran',
                            style: setTextStyle(
                                    PrimaryColor().onPrimaryFixedVariant)
                                .copyWith(fontWeight: semiBold, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Virtual Account BNI',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    // activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedValue = 'Virtual Account BCA';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: selectedValue == 'Virtual Account BCA'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/BNI.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'BCA',
                        style: setTextStyle(NeutralColor().neutral10)
                            .copyWith(fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Virtual Account BCA',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTransferBank(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedValue = 'Transfer Bank BNI';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: selectedValue == 'Transfer Bank BNI'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/BNI.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BNI',
                            style: setTextStyle(NeutralColor().neutral10)
                                .copyWith(fontWeight: medium, fontSize: 16),
                          ),
                          // Text(
                          //   'Gratis Biaya Pembayaran',
                          //   style: setTextStyle(
                          //           PrimaryColor().onPrimaryFixedVariant)
                          //       .copyWith(fontWeight: semiBold, fontSize: 11),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Transfer Bank BNI',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    // activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedValue = 'Transfer Bank BCA';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: selectedValue == 'Transfer Bank BCA'
                      ? PrimaryColor().onPrimaryFixedVariant
                      : NeutralColor().neutral90,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/payment/BNI.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'BCA',
                        style: setTextStyle(NeutralColor().neutral10)
                            .copyWith(fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: 'Transfer Bank BCA',
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: PrimaryColor().onPrimaryFixedVariant,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListEWallet(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: NeutralColor().neutral90,
          width: 1.0,
        ),
      ),
      child: Text(
        'Mohon maaf fitur ini belum tersedia',
        style: setTextStyle(NeutralColor().neutral90)
            .copyWith(fontWeight: medium, fontSize: 14),
      ),
    );
  }

  Widget buildListTotalPembayaran(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga Unit',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 20.999',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Diskon',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 0',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pajak',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 2.100',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: medium, fontSize: 12),
              ),
              Text(
                'IDR 23.099',
                style: setTextStyle(
                  Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          )
        ],
      ),
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
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, right: 18.0, left: 18.0),
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
                                              fontWeight: semiBold,
                                              fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isVirtualVisible = !isVirtualVisible;
                                  isBankVisible = false;
                                  isEWalletVisible = false;
                                  isTotalPembayaranVisible = false;
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
                                setState(
                                  () {
                                    isVirtualVisible = false;
                                    isBankVisible = !isBankVisible;
                                    isEWalletVisible = false;
                                    isTotalPembayaranVisible = false;
                                  },
                                );
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
                                  isVirtualVisible = false;
                                  isBankVisible = false;
                                  isEWalletVisible = !isEWalletVisible;
                                  isTotalPembayaranVisible = false;
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
                      isEWalletVisible
                          ? buildListEWallet(context)
                          : Container(),
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
                                  isTotalPembayaranVisible ? '' : 'IDR 23.099',
                                  style: setTextStyle(NeutralColor().neutral10)
                                      .copyWith(
                                          fontWeight: medium, fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVirtualVisible = false;
                                      isBankVisible = false;
                                      isEWalletVisible = false;
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
