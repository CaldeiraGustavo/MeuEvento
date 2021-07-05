import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './MyProfileCard.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeuEvento extends StatelessWidget {
  MeuEvento();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 241.6, end: 53.3),
            Pin(size: 45.0, middle: 0.7408),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushUp,
                  ease: Curves.easeIn,
                  duration: 0.2,
                  pageBuilder: () => MyProfileCard(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                          bottomLeft: Radius.circular(24.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(-0.92, 0.7),
                          end: Alignment(0.61, -0.43),
                          colors: [
                            const Color(0xf0f5baed),
                            const Color(0xffebaaee),
                            const Color(0xff6daffe)
                          ],
                          stops: [0.0, 0.335, 1.0],
                        ),
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
                    Pin(size: 88.0, middle: 0.5),
                    Pin(size: 26.0, middle: 0.5),
                    child: Text(
                      'Saiba Mais',
                      style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 241.6, end: 53.3),
            Pin(size: 45.0, middle: 0.3697),
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
                  Pin(size: 142.0, middle: 0.5),
                  Pin(size: 26.0, middle: 0.5),
                  child: Text(
                    'Login com Google',
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
            Pin(size: 241.6, end: 53.3),
            Pin(size: 45.0, middle: 0.4824),
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
                  Pin(size: 163.0, middle: 0.5),
                  Pin(size: 26.0, middle: 0.5),
                  child: Text(
                    'Login com Facebook',
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
            Pin(size: 241.6, end: 53.3),
            Pin(size: 45.0, middle: 0.6),
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
                  Pin(size: 143.0, middle: 0.5),
                  Pin(size: 26.0, middle: 0.5),
                  child: Text(
                    'Login com Twitter',
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
            Pin(size: 71.0, middle: 0.519),
            Pin(size: 19.0, end: 17.0),
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
            Pin(size: 6.3, middle: 0.2451),
            Pin(size: 12.5, middle: 0.4833),
            child:
                // Adobe XD layer: 'facebook' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'XMLID_835_' (shape)
                      SvgPicture.string(
                    _svg_5h2b28,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.9, middle: 0.2403),
            Pin(size: 10.5, middle: 0.5945),
            child:
                // Adobe XD layer: 'twitter' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'XMLID_827_' (shape)
                      SvgPicture.string(
                    _svg_4yo2bb,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, middle: 0.249),
            Pin(size: 12.3, middle: 0.3765),
            child:
                // Adobe XD layer: 'google-plus' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'XMLID_512_' (shape)
                      SvgPicture.string(
                    _svg_vroo5t,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.5017),
            Pin(size: 1.0, end: 67.5),
            child: SvgPicture.string(
              _svg_9h1sbp,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
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
            Pin(size: 28.0, middle: 0.3253),
            Pin(size: 28.0, end: 13.0),
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
        ],
      ),
    );
  }
}

const String _svg_5h2b28 =
    '<svg viewBox="76.7 0.0 6.3 12.5" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff4bb7ff"  /><stop offset="1.0" stop-color="#ff8300f5"  /></linearGradient></defs><path  d="M 76.90516662597656 6.675472736358643 L 78.27906036376953 6.675472736358643 L 78.27906036376953 12.33158683776855 C 78.27906036376953 12.44325923919678 78.36955261230469 12.5337438583374 78.48122406005859 12.5337438583374 L 80.81072235107422 12.5337438583374 C 80.92238616943359 12.5337438583374 81.01287841796875 12.44325923919678 81.01287841796875 12.33158683776855 L 81.01287841796875 6.7021164894104 L 82.59229278564453 6.7021164894104 C 82.69498443603516 6.7021164894104 82.78138732910156 6.625053882598877 82.79311370849609 6.523045539855957 L 83.03299713134766 4.440746307373047 C 83.03958129882812 4.3834547996521 83.02143096923828 4.326082706451416 82.98310089111328 4.283103942871094 C 82.94473266601562 4.240084648132324 82.88982391357422 4.215462207794189 82.83220672607422 4.215462207794189 L 81.01295471191406 4.215462207794189 L 81.01295471191406 2.910173416137695 C 81.01295471191406 2.516694784164429 81.22482299804688 2.317165613174438 81.64271545410156 2.317165613174438 C 81.7022705078125 2.317165613174438 82.83220672607422 2.317165613174438 82.83220672607422 2.317165613174438 C 82.94388580322266 2.317165613174438 83.03436279296875 2.226639986038208 83.03436279296875 2.115008592605591 L 83.03436279296875 0.2036531418561935 C 83.03436279296875 0.09198151528835297 82.94388580322266 0.001495970296673477 82.83220672607422 0.001495970296673477 L 81.19291687011719 0.001495970296673477 C 81.18135070800781 0.0009299229714088142 81.15567779541016 0 81.11783599853516 0 C 80.83340454101562 0 79.8447265625 0.05583581328392029 79.06375885009766 0.7743023633956909 C 78.19844055175781 1.570478081703186 78.3187255859375 2.523770570755005 78.34747314453125 2.689054250717163 L 78.34747314453125 4.215421676635742 L 76.90516662597656 4.215421676635742 C 76.79349517822266 4.215421676635742 76.7030029296875 4.305907249450684 76.7030029296875 4.417579174041748 L 76.7030029296875 6.473275661468506 C 76.7030029296875 6.584946632385254 76.79349517822266 6.675472736358643 76.90516662597656 6.675472736358643 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_4yo2bb =
    '<svg viewBox="0.0 28.1 12.9 10.5" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff4bb7ff"  /><stop offset="1.0" stop-color="#ff8300f5"  /></linearGradient></defs><path transform="translate(0.0, 0.0)" d="M 12.57610321044922 29.31304931640625 C 12.37392044067383 29.40272331237793 12.16604900360107 29.47840690612793 11.95365333557129 29.53985214233398 C 12.20511531829834 29.25546455383301 12.39683628082275 28.92084693908691 12.51387023925781 28.55467796325684 C 12.54010677337646 28.47259902954102 12.51291370391846 28.38275909423828 12.44545078277588 28.32907867431641 C 12.37807083129883 28.27535820007324 12.28445148468018 28.26892280578613 12.21026229858398 28.31288719177246 C 11.75919151306152 28.58041763305664 11.27254104614258 28.77267837524414 10.76226806640625 28.88510131835938 C 10.24825859069824 28.38284301757812 9.550126075744629 28.09700393676758 8.828412055969238 28.09700393676758 C 7.304982662200928 28.09700393676758 6.065564632415771 29.33638191223145 6.065564632415771 30.85976791381836 C 6.065564632415771 30.97974967956543 6.073161602020264 31.09906768798828 6.08819055557251 31.21672248840332 C 4.197762012481689 31.05074119567871 2.440265417098999 30.12157249450684 1.233395576477051 28.64115333557129 C 1.190385103225708 28.58838653564453 1.124125480651855 28.55994987487793 1.056288361549377 28.56538772583008 C 0.988409698009491 28.57070159912109 0.9274227023124695 28.60897827148438 0.8931304216384888 28.66780662536621 C 0.6483521461486816 29.08782386779785 0.5189468860626221 29.56820678710938 0.5189468860626221 30.05697441101074 C 0.5189468860626221 30.72268295288086 0.7566258907318115 31.35430526733398 1.176477193832397 31.84784889221191 C 1.048815488815308 31.80363273620605 0.9249317049980164 31.74837493896484 0.8066942095756531 31.68274116516113 C 0.7432162761688232 31.64740943908691 0.6657474040985107 31.64795112609863 0.6026846170425415 31.68411064147949 C 0.5395802855491638 31.72027015686035 0.5000156164169312 31.78677940368652 0.4983549118041992 31.85947227478027 C 0.4980643093585968 31.8717212677002 0.4980643093585968 31.88396835327148 0.4980643093585968 31.89638137817383 C 0.4980643093585968 32.89006805419922 1.032873272895813 33.78469467163086 1.850530743598938 34.27230072021484 C 1.780285716056824 34.26528167724609 1.710082292556763 34.25511169433594 1.640335321426392 34.24178314208984 C 1.568429708480835 34.22804260253906 1.494489669799805 34.25324249267578 1.445999026298523 34.30808639526367 C 1.397425413131714 34.36288833618164 1.381358623504639 34.43927764892578 1.403735637664795 34.50902557373047 C 1.706387162208557 35.45392608642578 2.48560094833374 36.14894485473633 3.427598714828491 36.36084365844727 C 2.64630913734436 36.85019302368164 1.752843618392944 37.10651397705078 0.814914345741272 37.10651397705078 C 0.6192079186439514 37.10651397705078 0.4223806858062744 37.09501266479492 0.229746475815773 37.07221984863281 C 0.134052112698555 37.06084442138672 0.04255088791251183 37.11735153198242 0.009960820898413658 37.20835113525391 C -0.02262923121452332 37.29939651489258 0.01191207394003868 37.40090560913086 0.0933249220252037 37.45308685302734 C 1.298243641853333 38.22566223144531 2.691478490829468 38.63401412963867 4.122326850891113 38.63401412963867 C 6.935201168060303 38.63401412963867 8.694855690002441 37.30757522583008 9.675671577453613 36.19482421875 C 10.89873313903809 34.80731582641602 11.60018730163574 32.97077560424805 11.60018730163574 31.15615081787109 C 11.60018730163574 31.08034324645996 11.59902477264404 31.00378799438477 11.59669876098633 30.92748260498047 C 12.07923889160156 30.56392478942871 12.49469089508057 30.12393951416016 12.83275508880615 29.61823272705078 C 12.88411045074463 29.54142951965332 12.87854766845703 29.43992233276367 12.81905555725098 29.36922073364258 C 12.75964641571045 29.29847717285156 12.66063022613525 29.27560043334961 12.57610321044922 29.31304931640625 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vroo5t =
    '<svg viewBox="0.0 55.3 12.0 12.3" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff4bb7ff"  /><stop offset="1.0" stop-color="#ff8300f5"  /></linearGradient></defs><path  d="M 6.131997108459473 58.28443908691406 C 6.678889751434326 58.28443908691406 7.20453929901123 58.43187713623047 7.6529221534729 58.71091842651367 L 8.165212631225586 59.06145095825195 C 8.343758583068848 59.18360900878906 8.583928108215332 59.16200637817383 8.737741470336914 59.00963973999023 L 10.23182773590088 57.52951431274414 C 10.3274507522583 57.43479537963867 10.37577152252197 57.30240249633789 10.36367607116699 57.16839218139648 C 10.35164070129395 57.03437423706055 10.28039073944092 56.91275405883789 10.16942310333252 56.83663177490234 L 9.30106258392334 56.24111175537109 C 9.283369064331055 56.22901916503906 9.264775276184082 56.2181282043457 9.245578765869141 56.20867919921875 L 8.40435791015625 55.7933349609375 C 8.39322566986084 55.78779602050781 8.381852149963379 55.78274154663086 8.370297431945801 55.77817153930664 C 7.64564037322998 55.49208450317383 6.882169246673584 55.34700012207031 6.101125717163086 55.34700012207031 C 4.490957736968994 55.34700012207031 2.972139120101929 55.96502304077148 1.824434280395508 57.08702850341797 C 0.6589775085449219 58.2264289855957 0.01086633373051882 59.77581787109375 -0.0003267238498665392 61.44983291625977 C -0.01157990843057632 63.12421417236328 0.6158303618431091 64.68257141113281 1.766182661056519 65.83773803710938 C 2.907628774642944 66.98405456542969 4.527064323425293 67.64155578613281 6.209324836730957 67.64155578613281 C 7.873713493347168 67.64155578613281 9.435317993164062 66.99530792236328 10.49365901947021 65.86854553222656 C 11.33199119567871 64.97605895996094 11.84644794464111 63.783935546875 11.98166751861572 62.42109680175781 C 11.98293018341064 62.40815734863281 11.9837121963501 62.39522552490234 11.98383331298828 62.38228607177734 L 11.99947929382324 61.15797424316406 C 11.99983978271484 61.13264083862305 11.99803447723389 61.10736465454102 11.99406337738037 61.08232879638672 L 11.92846965789795 60.66391754150391 C 11.89410877227783 60.44432830810547 11.7048511505127 60.28245162963867 11.48261547088623 60.28245162963867 L 6.266914367675781 60.28245162963867 C 6.017599582672119 60.28245162963867 5.8155837059021 60.48452758789062 5.8155837059021 60.73378372192383 L 5.8155837059021 62.53802490234375 C 5.8155837059021 62.78728103637695 6.017599582672119 62.98935317993164 6.266914367675781 62.98935317993164 L 8.92591667175293 62.98935317993164 C 8.804058074951172 63.2564811706543 8.612030982971191 63.53817367553711 8.369214057922363 63.80066680908203 C 7.839592456817627 64.37343597412109 7.049762725830078 64.70195007324219 6.202224254608154 64.70195007324219 C 5.336691379547119 64.70195007324219 4.50780725479126 64.36278533935547 3.928117990493774 63.77147674560547 C 2.721439599990845 62.54096984863281 2.735280513763428 60.39691162109375 3.957544803619385 59.18325042724609 C 4.532961845397949 58.61210632324219 5.325558662414551 58.28443908691406 6.131997108459473 58.28443908691406 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9h1sbp =
    '<svg viewBox="149.5 571.5 62.0 1.0" ><path transform="translate(149.5, 571.5)" d="M 0 0 L 62 0" fill="none" stroke="#bbbbbb" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
