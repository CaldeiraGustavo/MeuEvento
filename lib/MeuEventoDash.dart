import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class MeuEventoDash extends StatelessWidget {
  MeuEventoDash({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 241.6, middle: 0.4991),
            Pin(size: 45.0, middle: 0.3815),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x5e000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 134.0, middle: 0.502),
                  Pin(size: 26.0, middle: 0.5),
                  child: Text(
                    'Adicionar Evento',
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 20,
                      color: const Color(0xff444444),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 241.6, middle: 0.5009),
            Pin(size: 45.0, middle: 0.4908),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x5e000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 122.0, middle: 0.5),
                  Pin(size: 26.0, middle: 0.5),
                  child: Text(
                    'Outros Eventos',
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 20,
                      color: const Color(0xff444444),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 96.3, middle: 0.5),
            Pin(size: 57.7, start: 60.9),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 57.7, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffefa7d6),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 57.7, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xd652a0fe),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 156.0, middle: 0.5),
            Pin(size: 26.0, middle: 0.2248),
            child: Text(
              'MEU EVENTO',
              style: TextStyle(
                fontFamily: 'PMingLiU-ExtB',
                fontSize: 26,
                color: const Color(0xff444444),
                letterSpacing: -0.286,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 93.0, middle: 0.4937),
            Pin(size: 78.3, start: 49.7),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 47.0, start: 3.9),
                        Pin(start: 8.7, end: 2.6),
                        child: Transform.rotate(
                          angle: 0.1222,
                          child: Text(
                            'W',
                            style: TextStyle(
                              fontFamily: 'Rollcage',
                              fontSize: 50,
                              color: const Color(0xffffffff),
                              letterSpacing: 2.5,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 45.0, end: 3.9),
                        Pin(start: 2.5, end: 8.8),
                        child: Transform.rotate(
                          angle: 0.1222,
                          child: Text(
                            'M',
                            style: TextStyle(
                              fontFamily: 'Rollcage',
                              fontSize: 50,
                              color: const Color(0xffffffff),
                              letterSpacing: 2.5,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 71.0, middle: 0.5709),
            Pin(size: 19.0, end: 12.0),
            child: Text(
              'VERSÃO 1.0 ',
              style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 15,
                color: const Color(0xff444444),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, middle: 0.3705),
            Pin(size: 28.0, end: 8.0),
            child:
                // Adobe XD layer: 'copy' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
