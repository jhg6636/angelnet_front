import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget pagination(int page) {
  // todo 눌렀을 때 바뀔 수 있게
  const selectedDecoration = BoxDecoration(
    color: Color(0xff333333),
    shape: BoxShape.circle,
    border: null,
  );
  const selectedTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: StringUtils.pretendard,
    color: Colors.white,
    letterSpacing: -0.45,
  );
  const normalTextStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: Color(0xff767676),
    letterSpacing: -0.45
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xffdddddd)),
          ),
          child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/pagination_first_page.png'),
                fit: BoxFit.cover
              )
            ),
          ),
        )
      ),
      InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffdddddd)),
            ),
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/pagination_back_page.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          )
      ),
      (page % 5 == 1)? InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          margin: const EdgeInsets.fromLTRB(15, 0, 21, 0),
          decoration: selectedDecoration,
          child: Text(page.toString(), style: selectedTextStyle),
        ),
      ) :
      InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(32, 0, (page % 5 == 2)? 21 : 36, 0),
          child: Text((page % 5 != 0? page~/5*5+1 : page - 4).toString(), style: normalTextStyle,),
        ),
      ),
      (page % 5 == 2)? InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
          decoration: selectedDecoration,
          child: Text(page.toString(), style: selectedTextStyle),
        ),
      ) :
      InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, (page % 5 == 3)? 21 : 36, 0),
          child: Text((page % 5 != 0? page~/5*5+2 : page - 3).toString(), style: normalTextStyle,),
        ),
      ),
      (page % 5 == 3)? InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
          decoration: selectedDecoration,
          child: Text(page.toString(), style: selectedTextStyle),
        ),
      ) :
      InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, (page % 5 == 4)? 21 : 36, 0),
          child: Text((page % 5 != 0? page~/5*5+3 : page - 2).toString(), style: normalTextStyle,),
        ),
      ),
      (page % 5 == 4)? InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
          decoration: selectedDecoration,
          child: Text(page.toString(), style: selectedTextStyle),
        ),
      ) :
      InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, (page % 5 == 0)? 21 : 36, 0),
          child: Text((page % 5 != 0? page~/5*5+4 : page - 1).toString(), style: normalTextStyle,),
        ),
      ),
      (page % 5 == 0)? InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          decoration: selectedDecoration,
          child: Text(page.toString(), style: selectedTextStyle),
        ),
      ) :
      InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(0, 0, 32, 0),
          child: Text((page % 5 != 0? page~/5*5+5 : page).toString(), style: normalTextStyle,),
        ),
      ),
      InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffdddddd)),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/pagination_next_page.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          )
      ),
      InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffdddddd)),
            ),
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/pagination_last_page.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          )
      ),
    ]
  );
}