import 'package:bank_ui/constants/color_const.dart';
import 'package:bank_ui/models/card_model.dart';
import 'package:bank_ui/models/operation_model.dart';
import 'package:bank_ui/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Current selected
  int current = 0;

  //handle indicator
  List<T>? map<T>(List list, Function handle) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handle(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.8,],
              colors: [
                Color(0xFF3e4444),
                Colors.white
              ],
            ),
          ),
          margin: const EdgeInsets.only(top: 8),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                margin:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Drawer Clicado');
                      },
                      child: const Icon(
                        Icons.view_list_rounded,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 59.0,
                      width: 59.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://www.vhv.rs/dpng/d/426-4263064_circle-avatar-png-picture-circle-avatar-image-png.png'
                              ))),
                    )
                  ],
                ),
              ),
              //Card section
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Good Morning',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor),
                    ),
                    Text(
                      'Rafael Sales',
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: kWhiteColor),
                    ),
                  ],
                ),
              ),
              Container(
                height: 199.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16.0, right: 6.0),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 28),
                        height: 199.0,
                        width: 344.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(cards[index].cardBackground as int)),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 20.0,
                              right: 29.0,
                              left: 260,
                              child:
                                  Image.asset(cards[index].cardType as String),
                            ),
                            Positioned(
                              top: 10.0,
                              left: 20.0,
                              child: Text(
                                'IBank',
                                style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              top: 48.0,
                              left: 20.0,
                              child: Text(
                                'CARD NUMBER',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              top: 10.0,
                              right: 29.0,
                              child: Text(
                                'INTERNATIONAL',
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              top: 65.0,
                              left: 20.0,
                              child: Text(
                                cards[index].cardNumber as String,
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              left: 20.0,
                              bottom: 45.0,
                              child: Text(
                                'CARD HOLDERNAME',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              left: 20.0,
                              bottom: 21.0,
                              child: Text(
                                cards[index].user as String,
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              left: 210.0,
                              bottom: 45.0,
                              child: Text(
                                'EXPIRY DATE',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                            Positioned(
                              left: 210.0,
                              bottom: 21.0,
                              child: Text(
                                cards[index].cardExpired as String,
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              //Operations
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 29, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Operation',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kWhiteColor),
                    ),
                    Row(
                      children: map<Widget>(
                        datas,
                        (index, selected) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 9,
                            width: 9,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: current == index
                                    ? kBlueColor
                                    : kTwentyBlueColor),
                          );
                        },
                      )!.toList(),
                    )
                  ],
                ),
              ),
              Container(
                height: 123.0,
                child: ListView.builder(
                    itemCount: datas.length,
                    padding: const EdgeInsets.only(left: 16.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                          operation: datas[index].name,
                          selectedIcon: datas[index].selectedIcon,
                          unSelectedIcon: datas[index].unselectedIcon,
                          isSelected: current==index,
                          context:this
                        ),
                      );
                    }
                  ),
              ),
              //Transations sections
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
                child: Text(
                  'Transaction Histories',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kWhiteColor
                  ),
                ),
              ),
              ListView.builder(
                itemCount: transactions.length,
                padding: const EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(
                    height: 76,
                    margin: const EdgeInsets.only(bottom: 13),
                    padding: const EdgeInsets.only(left: 24,top: 12,bottom: 12,right: 22),
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: kTenBlackColor,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(8.0, 8.0)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                        children: <Widget>[
                          Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(transactions[index].photo.toString())
                              )
                            ),
                          ),
                          const SizedBox(width: 13,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(transactions[index].name.toString(),
                                style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: kBlackColor
                              ),),
                              Text(transactions[index].date.toString(),
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: kGreyColor
                              ),)
                            ],
                          )
                        ],
                      ),
                       Row(
                         children: [
                           Text(transactions[index].amount.toString(),
                             style: GoogleFonts.inter(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w700,
                                 color: kBlackColor
                             ),)
                         ],
                       )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  const OperationCard({Key? key, this.operation, this.selectedIcon, this.unSelectedIcon, this.isSelected, required this.context}) : super(key: key);

  final String? operation;
  final String? selectedIcon;
  final String? unSelectedIcon;
  final bool? isSelected;
  final _HomeScreenState context;

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 123.0,
      height: 123.0,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: kTenBlackColor,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8.0, 8.0)
          )
        ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected! ? kBlueColor : kWhiteColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.isSelected! ? widget.selectedIcon! : widget.unSelectedIcon!.toString(), scale: 8,),
          const SizedBox(height: 9,),
          Text(widget.operation.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: widget.isSelected! ? kWhiteColor : kBlackColor
            ),
          )
        ],
      ),
    );
  }
}

