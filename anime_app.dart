import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:vertical_card_pager/vertical_card_pager.dart';

void main() {
  runApp(MyApp());
}

///////////HOME//////////////////////////
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp1(),
    );
  }
}

////////////////Splash//////////////////
class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);
  @override
  _Myapp1 createState() => _Myapp1();
}

class _Myapp1 extends State<MyApp1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////
List<String> wallpapers = [
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/161547763_130050669124512_4655931158018505784_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeELVHzReQ83U82d32b35MM2i2WTPQYwJhSLZZM9BjAmFEyYgNq1OWqyIxWNH_j2Nmslhu-u1Ver65m4za3Cfcq9&_nc_ohc=niA6rHjIEVQAX8T-T0F&tn=a_4iF1gDBQoYjkcW&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_KEKfjWG3rMPxVHMvr2RCv56awQ99P4vGT4FkDBKASlg&oe=6318A36C',
  'https://scontent.fcmn1-1.fna.fbcdn.net/v/t1.6435-9/68255122_2481087065462151_4639258475812093952_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeGUWH5oUEyz6UP19Ko49MQuxrgAqXHcyDbGuACpcdzINq3M5F3I0pWhxLsZvJn2XxqovK1MRY8URNx6sZqbXb3Z&_nc_ohc=ZBHkRMOiLZoAX8n8Jar&_nc_ht=scontent.fcmn1-1.fna&oh=00_AT_EhQ6KEVh6iiEtf365tjayHzHHmLwoC3JTq7vuVLSP-g&oe=630DA41F',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/66748130_396688577644645_1421470605441499136_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=cdbe9c&_nc_eui2=AeFwkVqKvoV-G8sp2q9nBYRLIXOcv7OH2EUhc5y_s4fYRTxkEITic-eUN6OpOBvIBaUzO7a67DWPvdTkMKnDXLEM&_nc_ohc=5zuWET7gX3gAX9zUzA-&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_o4izM-QjxRzOKQoIloaeZcE6jhrZnVN9_AH5hs13ZNA&oe=631096D1',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/101030184_2675387066071989_1155277455799623171_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF8_67QIulPnCanvNg_tdquJ6iRLHy8bXMnqJEsfLxtc6hWJ6GznQQVV3nnzY8Q_YwzUUazn_TeDgaRZHh0aIZ5&_nc_ohc=5VfOmWNor6sAX-KnqVw&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_7j85QZEez9Z4YySgxRIH9qDSgl43ZJhH-abvpl8FO4g&oe=630D4F57',
  'https://scontent.frba1-2.fna.fbcdn.net/v/t1.6435-9/129620583_2833817563562271_5846003924658812935_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeE_zwocdl67Mn43MM2JepUqNwyQdnOs7Vc3DJB2c6ztV35zXyVhuVbCsykgD2n58-fN9f6-m3XijvPsVdMFAyFQ&_nc_ohc=BXvICvJ2zckAX8LFYXC&_nc_ht=scontent.frba1-2.fna&oh=00_AT8De61_gKHHphkUkgdS975iZZlTulcJx0J0w7XVUTlWbQ&oe=630D97E2',
  'https://scontent.fcmn1-1.fna.fbcdn.net/v/t1.6435-9/68255122_2481087065462151_4639258475812093952_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeGUWH5oUEyz6UP19Ko49MQuxrgAqXHcyDbGuACpcdzINq3M5F3I0pWhxLsZvJn2XxqovK1MRY8URNx6sZqbXb3Z&_nc_ohc=ZBHkRMOiLZoAX8n8Jar&_nc_ht=scontent.fcmn1-1.fna&oh=00_AT_EhQ6KEVh6iiEtf365tjayHzHHmLwoC3JTq7vuVLSP-g&oe=630DA41F',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/66748130_396688577644645_1421470605441499136_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=cdbe9c&_nc_eui2=AeFwkVqKvoV-G8sp2q9nBYRLIXOcv7OH2EUhc5y_s4fYRTxkEITic-eUN6OpOBvIBaUzO7a67DWPvdTkMKnDXLEM&_nc_ohc=5zuWET7gX3gAX9zUzA-&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_o4izM-QjxRzOKQoIloaeZcE6jhrZnVN9_AH5hs13ZNA&oe=631096D1',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/101030184_2675387066071989_1155277455799623171_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF8_67QIulPnCanvNg_tdquJ6iRLHy8bXMnqJEsfLxtc6hWJ6GznQQVV3nnzY8Q_YwzUUazn_TeDgaRZHh0aIZ5&_nc_ohc=5VfOmWNor6sAX-KnqVw&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_7j85QZEez9Z4YySgxRIH9qDSgl43ZJhH-abvpl8FO4g&oe=630D4F57',
];
List<List> lists = [
  one_piece,
  naruto,
  attack,
  spyxfamily,
  baki,
];

/////////names of anime
List<String> animes = [
  'one piece',
  'naruto',
  'attack',
  'spy x family',
  'baki',
];
//////////icons anime///////////////////////////////////////////
List<String> animesicons = [
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/125193221_710537172918233_5331779405042741198_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8631f5&_nc_eui2=AeHx2TDjIn1ftO6sEHeF8jrSgZmQYQU2vZCBmZBhBTa9kNVT01jUSdLuj0YjY4Muz5yRQb752h11QMYtYncr1Nx_&_nc_ohc=g-j4fu7n7rkAX-tHfgC&_nc_ht=scontent.frba1-1.fna&oh=00_AT-2z514P5s1YK_OI4XQuoc3pnf_tpRWoq8Sp70S9uGvTA&oe=63166311',
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/148771392_3552216534901608_6900741438211638915_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFkv3d4HG_u58uugp0BOrXWC5Co5WXDuqMLkKjlZcO6o5-EQDRbkZDtxNhjqHjQtPpStwNwBguA-B1NEv8Dk7DN&_nc_ohc=O9VnNqG7NMsAX-7p-WG&_nc_ht=scontent.frba1-1.fna&oh=00_AT9yecuLEkvChPsR04I09TnJMghhmoTE99ALHZD4uoay4Q&oe=631661EF',
  'https://scontent.frba1-1.fna.fbcdn.net/v/t39.30808-6/271716646_2490704134397604_8891415354331997052_n.png?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEkbTnD4luZ7Fvp7X0yuJV3h3Jfqsn8ImaHcl-qyfwiZuuBjDASg0NtAqoP0mIgqcTF4rTpGeMutcsuo1bDeuoN&_nc_ohc=sefVbHs96F0AX9ckJto&_nc_zt=23&_nc_ht=scontent.frba1-1.fna&oh=00_AT9M-rZAhyij2TqG24BuYjqsJYSBcSDWZ8oi8CNuG3ZPRA&oe=62F6D231',
  'https://scontent.frba1-2.fna.fbcdn.net/v/t39.30808-6/286419988_547017103489188_8966714823650697259_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8631f5&_nc_eui2=AeHj-nwC69QS3EbfupV3XwyZbEC0_XCDr5NsQLT9cIOvk5OauYWpKPUYTTCjsQAlYmt6O9NodHXMzvgT7UkMrL_Q&_nc_ohc=nRnvCGTVs1UAX9ZtQVB&_nc_zt=23&_nc_ht=scontent.frba1-2.fna&oh=00_AT-JkHgbKr6Iyxun8dyQiAJfqVPM_n8QIWPB0-IQeXdJIg&oe=62F749B8',
  'https://scontent.frba1-2.fna.fbcdn.net/v/t39.30808-6/219176834_1247896932329416_7958270168443574588_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHJORwqj-t-Gj5KgRB-qwm0E_5LxR3njfYT_kvFHeeN9uWlhabZ_xB45Z8wmI5Qc5JmK3k8PtzZa5R2Pxz5Lpm3&_nc_ohc=1LzINlWj4f4AX-SksUZ&_nc_zt=23&_nc_ht=scontent.frba1-2.fna&oh=00_AT-PNNhBDpsTLJdU-MmeqasgMWIpgkUPTLoxdcVwwednKw&oe=62F77C7F',
];
/////////////lists of animes///////////////////////
// ignore: non_constant_identifier_names
List<String> one_piece = [
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/125193221_710537172918233_5331779405042741198_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8631f5&_nc_eui2=AeHx2TDjIn1ftO6sEHeF8jrSgZmQYQU2vZCBmZBhBTa9kNVT01jUSdLuj0YjY4Muz5yRQb752h11QMYtYncr1Nx_&_nc_ohc=g-j4fu7n7rkAX-tHfgC&_nc_ht=scontent.frba1-1.fna&oh=00_AT-2z514P5s1YK_OI4XQuoc3pnf_tpRWoq8Sp70S9uGvTA&oe=63166311',
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/125193221_710537172918233_5331779405042741198_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8631f5&_nc_eui2=AeHx2TDjIn1ftO6sEHeF8jrSgZmQYQU2vZCBmZBhBTa9kNVT01jUSdLuj0YjY4Muz5yRQb752h11QMYtYncr1Nx_&_nc_ohc=g-j4fu7n7rkAX-tHfgC&_nc_ht=scontent.frba1-1.fna&oh=00_AT-2z514P5s1YK_OI4XQuoc3pnf_tpRWoq8Sp70S9uGvTA&oe=63166311',
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/125193221_710537172918233_5331779405042741198_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8631f5&_nc_eui2=AeHx2TDjIn1ftO6sEHeF8jrSgZmQYQU2vZCBmZBhBTa9kNVT01jUSdLuj0YjY4Muz5yRQb752h11QMYtYncr1Nx_&_nc_ohc=g-j4fu7n7rkAX-tHfgC&_nc_ht=scontent.frba1-1.fna&oh=00_AT-2z514P5s1YK_OI4XQuoc3pnf_tpRWoq8Sp70S9uGvTA&oe=63166311',
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/125193221_710537172918233_5331779405042741198_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8631f5&_nc_eui2=AeHx2TDjIn1ftO6sEHeF8jrSgZmQYQU2vZCBmZBhBTa9kNVT01jUSdLuj0YjY4Muz5yRQb752h11QMYtYncr1Nx_&_nc_ohc=g-j4fu7n7rkAX-tHfgC&_nc_ht=scontent.frba1-1.fna&oh=00_AT-2z514P5s1YK_OI4XQuoc3pnf_tpRWoq8Sp70S9uGvTA&oe=63166311',
];
List<String> baki = [
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/124893701_1072747666511011_8843686529889911915_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHCc4WV807cX2V-IP_QRcarfLngN63sbvN8ueA3rexu85YoCldDigXVk4pdfB2BkzXixHnAjRxX023LaBDilAJ-&_nc_ohc=uPef0Uc0ef0AX8mj8Tp&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_5HIv3mZUlS9aK-lVNGfrUUNk0rVZgn-Vaz20mqfhNPg&oe=63173E7A',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/96295957_925071634611949_7672403374255374336_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeGeN6rWurFn94H8zOZsAyLHxaN1oeMh0nXFo3Wh4yHSdfpTxEILw1jd5rQXfqRwKgeftS6G2OYdv3YeAAhqHZQJ&_nc_ohc=XnyxdS-4SM0AX_UT2Jc&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-q6NKUw5I6n3xZpLU9AhmQxL7iokKvaYVowjcqL_RrNw&oe=63167119',
  'https://scontent.frba1-1.fna.fbcdn.net/v/t1.6435-9/96117996_925366391249140_2407809428356071424_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEJCwXNwb4xDObVTdslV9RoOZdJzgCmTws5l0nOAKZPC3capeWbxbLl_Edm3Q-mkpaEXsH25eElVxTq6a_r6FCx&_nc_ohc=gSQ7TdoU-ggAX9ENrfI&_nc_ht=scontent.frba1-1.fna&oh=00_AT-LsdUet8SjQwTE7Art1JL9BNJHMKET8-iF3R0VO2kK8g&oe=6317133E',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.6435-9/48421396_586752621777187_3152051643558658048_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGcDUEARgZvItsSUImLrUNWMLNZ2fFmS6cws1nZ8WZLp8oWIc1Z9giX-zAVETW5-285cOP5rDkB-NH3mQRdOr0x&_nc_ohc=l_mLyPYtg7sAX_d8KbY&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-ZHuDvsfiUSEh1guM9gn0NySuc_N1vjecmOaDOx-DeiQ&oe=63187A7D',
];
List<String> naruto = [
  'https://scontent.frba1-2.fna.fbcdn.net/v/t39.30808-6/296376367_5137486176374628_3771994332653943981_n.jpg?stp=dst-jpg_s600x600&_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeFF6ZwuPhK4fJXKQM4VlJfFMfiAECDYb5Ux-IAQINhvldTKfE5dw3UAibXxbIguvU0KZtsM68C3oKawN0g0eZFr&_nc_ohc=WEUCM2ODDVAAX_oYRPq&_nc_zt=23&_nc_ht=scontent.frba1-2.fna&oh=00_AT9mffUYcKtOIsV6Cgmf1Jmsi1MMMsagu8-G_ttP5c9Lsg&oe=62F800FD',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/297108900_5150565268400052_7223411584553804356_n.png?stp=dst-png_s600x600&_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeEJk-z0GoYuBhdxMIHoDJbND0yzHVyCo0UPTLMdXIKjRSRHn8qITIOwm1SB4yAt6sqImCEJzZYaOKHTEsY2_P58&_nc_ohc=0D2XpFwhxDsAX9kCSan&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-A_QnFGkUXluS4lqmoBffoqC1KcCoafMz2nXti8eMdqw&oe=62F6A8F3',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t1.18169-9/16729573_1105607906229162_7529224729829845379_n.png?_nc_cat=105&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeG4rhgMHgxqi3VHV0KeRn-MjozX840RDcKOjNfzjRENwu3zoYqaeebqeLLn46khANqR2ZAisi7fuJ7dgQ6Mhcdk&_nc_ohc=hKPVOwdqnP0AX8dBVwc&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT9q3nUOHZoPI0yGIfzPui3yR4JWqg9FUpxln8-HWYvung&oe=63193584',
  'https://scontent.fcmn1-1.fna.fbcdn.net/v/t39.30808-6/287005430_5002372796552634_910708275186578648_n.png?stp=dst-png_s600x600&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeGk7hGq0UW9h-WK2AS7FxXbLvNwXtK9b9Iu83Be0r1v0n3o0PcS6bQfZQECqpXcr4gcfzXV5F2gEutGixFbRhhg&_nc_ohc=uPdV9k5lFvEAX-Y7D6q&_nc_zt=23&_nc_ht=scontent.fcmn1-1.fna&oh=00_AT8bvkggfIbkIpxJ-F_4dNcXmmfqI3L0sQyM59k2gUWUjg&oe=62F8406D',
];

List<String> spyxfamily = [
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/293757673_106283138828999_8535282628092378039_n.png?stp=dst-png_s600x600&_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeEnnOwV5SURFP7pJrNAy3JrE-cmxQvH2T8T5ybFC8fZP7D-gNbkNXgDFir2s0vgwaz2MiyvvIBzzNq4C8N7Ke1a&_nc_ohc=Xfj-zHyolG8AX-ErG7T&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_5I4vU0R1RPyNoF-cgR8STtR1gFrmcL5pavQqY6cRq1Q&oe=62F803E3',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/293743855_106284928828820_8860552423407828463_n.jpg?stp=dst-jpg_p417x417&_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeGMlXjHsxyoZPYm6dZvwqSLaWGWX3eFpxlpYZZfd4WnGU53XvNT_XlsU7Y18ksgVNBHRA3NcXfYflms-jyj9Zox&_nc_ohc=jS6XlU_DploAX875Y_f&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-0c7mpaFieV1fTTXGcEKXkiZAQFwKlw6zW1Fg62yETEg&oe=62F6EA8C',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/296460929_598230398675765_5644883661162868070_n.jpg?stp=dst-jpg_s640x640&_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFSGpgLVKWccR0X6GAwkbuNZsrImJel-o1mysiYl6X6jfvMeLdFpqIRUN8rQ8PRvfLxT9S7nSpGolNXb9aiflro&_nc_ohc=A5nGYcOS5pEAX_lJFL9&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-ZRhoLziWrzx0I_M3bkiuYPB6Q8ob8u3dL5H3TjFcwcw&oe=62F7E27C',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/297782391_104971552320035_2781288286203346894_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFeJmERaks_r5YoPqFVmG0GiuHCCqFg9UCK4cIKoWD1QJVfDcqkMBk862TWcw-s6D7ponPrHMH83kAxoatw4sn3&_nc_ohc=Lhs8S5n7Wz8AX-Svbrv&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT93VOfg7j3N7ES9D2xnB2h5PJ6bWvKl5QypX_XE0vwZ5Q&oe=62F7427E',
  'https://scontent.fcmn1-1.fna.fbcdn.net/v/t1.6435-9/90237857_878710442577813_2533010838885761024_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHiUntrUiBjB9ta_fXtcVM_uFz0f-5T-tG4XPR_7lP60QHxJPOS44CGBeWbsLHzfuOYezzcfQPnQCmIqf8xLIaA&_nc_ohc=Ck_wLvqH0gEAX_vnBb-&_nc_ht=scontent.fcmn1-1.fna&oh=00_AT9Ytxri1uy2_LY7vBHiBex6QTxdgJOqptArwCOUyczhVw&oe=6318B1E0',
];

List<String> attack = [
  'https://scontent.fcmn1-1.fna.fbcdn.net/v/t39.30808-6/240122724_367787071590875_1123392146849879535_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeFlkBe-zgNf9Wx6k-TyQaqjGBGRGBIlqdcYEZEYEiWp11WUAgVwCde8E8LWht8BsuKvgVKMpN1bu0afCLwyb9tZ&_nc_ohc=EMeTJ9TEL-AAX-PHBwz&_nc_zt=23&_nc_ht=scontent.fcmn1-1.fna&oh=00_AT_Z1lyQOKVYGawgKb8zpyAYbIwe6qzg1uzxMDQtsDmXDw&oe=62F7D1BA',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/294091973_5208499292565494_7549930932332347057_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHDRH2c5kTgYPtXoINGINhYC04EJPONiZoLTgQk842JmvegI0W8_sgz97B_k8CzwBz5Mimm5cjz_TzNmvXff7T7&_nc_ohc=52fIdAtWNzsAX9qyyRR&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-dAtySrT3v5Seyw4d4Vwat-p1B0GS0TM9TIQNIofo7LQ&oe=62F76791',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/240319919_367786914924224_392101544443675980_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeEL9QfgfhRijmYd8kQmm4HWZv8BYfV4O0Jm_wFh9Xg7Qv9EOWEzD1KOmZEjoRjiDA2XSfyfUp3i566wFF9r4sA_&_nc_ohc=KqpKxOS9WHwAX_Qecj-&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-MfhFKHxgm1mVguo0iQVQkLdTuOd1rRpSvi1glMeJbhA&oe=62F7C63C',
  'https://scontent.fcmn1-1.fna.fbcdn.net/v/t39.30808-6/240429191_367786574924258_6536209086742835747_n.jpg?stp=dst-jpg_p600x600&_nc_cat=101&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeFj2nPZ9VHPG45AbtZOVCAj-SiG12vjjNj5KIbXa-OM2GtwQcOFYJw4HnqtIh5gETOPn1POlJNSmfZokF9nIkjj&_nc_ohc=bBn8cFAfO9oAX9VFAWg&_nc_zt=23&_nc_ht=scontent.fcmn1-1.fna&oh=00_AT8yh5jYFM8EFGA8vQCmdAG1jmaNIuZ7MRsoyrL1uzB-2Q&oe=62F7085C',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/294084015_5433047596717607_2899796534463640292_n.jpg?stp=dst-jpg_p180x540&_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeE7Pij8gRpp-8n9ir763QVuJbhdjPi-tSMluF2M-L61I3NeYwijIVZPmbWUsUVoFu_HPGjN9wHOT0WTXJn1sG8X&_nc_ohc=DK6Lw83mr_gAX9SKAeG&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT8GkV6VuTzWIy3hR6s4_4fVJ93ynKwOhMTeL3qOeubudA&oe=62F6BD87',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/294635506_5208498719232218_7863610600156206439_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEcfGZo7cdT3pX3hdUuaw-ALC059Pi6hy0sLTn0-LqHLY8Y4akvZ8bPyrs_t1pM6yycX7ARAWGLTLsO9b_vKjNy&_nc_ohc=xYT1JiCdAWMAX8bHr1z&tn=a_4iF1gDBQoYjkcW&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT_kghpZDkGelBGwTyQPisSy70Ltwcf_epmItMEyXM6cng&oe=62F6BB5E',
  'https://scontent.fcmn1-2.fna.fbcdn.net/v/t39.30808-6/293494246_5208499182565505_4642779815830696996_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeE5Qd2q0hB9ze_IgkVRu_u-haqBLK8hAjKFqoEsryECMvdLwR6z8_Az2MFdMzxM_Zap1by7YsBqfna2erzOePi4&_nc_ohc=dCsj3PeVrLwAX85-By-&tn=a_4iF1gDBQoYjkcW&_nc_zt=23&_nc_ht=scontent.fcmn1-2.fna&oh=00_AT-vHP7e1V52R1wW6mdGEQ3YP5DZkzFvoCuikf0SDFkdaw&oe=62F75F76',
];

///////////////////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 172, 164, 164),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: size.height * .45,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 172, 164, 164),
                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: size.width * .4,
                child: Container(
                  child: Text(
                    'anime',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 0,
                width: size.width,
                height: size.height * .3,
                child: Container(
                  child: ListView.builder(
                    itemCount: animes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return (InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 4.0, left: 2.0, right: 2.0),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Color.fromARGB(255, 121, 74, 74),
                                  image: DecorationImage(
                                      image: NetworkImage(animesicons[index]),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 3),
                                ),
                              ),
                              Center(
                                child: Text(
                                  animes[index].toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Myanime(index: index)),
                          );
                        },
                      ));
                    },
                  ),
                ),
              ),
              Positioned(
                top: 175,
                left: 0,
                width: size.width,
                height: size.height * .6,
                child: Container(
                  // list
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 172, 164, 164),
                    border: Border.all(
                        color: Color.fromARGB(255, 172, 164, 164), width: 5),
                  ),
                  child: ListView.builder(
                    //itemExtent: size.width * .5,
                    itemCount: lists.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return (Container(
                        // list index,
                        width: 200,
                        height: 200,
                        child: ListView.builder(
                          //  itemExtent: size.width,
                          itemCount: lists[i].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return (InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 5.0,
                                  bottom: 5.0,
                                ),
                                child: Container(
                                  height: size.height * .3,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: NetworkImage(lists[i][index]),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 3),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Myhome1(index: i, j: index)),
                                );
                              },
                            ));
                          },
                        ),
                      ));
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: size.height * .21,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 121, 74, 74),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0), width: 3),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 20,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 250, 254, 250),
                    border: Border.all(
                        color: Color.fromARGB(255, 172, 164, 164), width: 5),
                  ),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 20,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 250, 254, 250),
                    border: Border.all(
                        color: Color.fromARGB(255, 172, 164, 164), width: 5),
                  ),
                  child: Icon(
                    Icons.download,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: size.width * .4,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 250, 254, 250),
                    border: Border.all(
                        color: Color.fromARGB(255, 172, 164, 164), width: 5),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: size.width * .3,
                child: Text(
                  'wallpapers',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}

/////////////////////////////////////////////big photo
class Myhome1 extends StatelessWidget {
  final int index;
  final int j;
  const Myhome1({Key? key, required this.index, required this.j})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          image: DecorationImage(
            image: NetworkImage(lists[index][j]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Myanime extends StatelessWidget {
  final int index;
  const Myanime({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 164, 164),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: size.height * .2,
            width: size.width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 121, 74, 74),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 4),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: size.width * .4,
            child: Column(children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(animesicons[index]),
                      fit: BoxFit.cover),
                  border: Border.all(
                      color: Color.fromARGB(255, 172, 164, 164), width: 4),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                animes[index],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Positioned(
            top: size.height * .3,
            width: size.width,
            height: size.height * .7,
            child: Container(
              color: Color.fromARGB(255, 172, 164, 164),
              child: ListView.builder(
                itemCount: lists[index].length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, j) {
                  return (InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * .35,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(lists[index][j]),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 4),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'add to favorit',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.download,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'download',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myhome1(index: index, j: j)),
                      );
                    },
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

