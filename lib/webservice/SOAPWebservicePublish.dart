import 'package:dio/dio.dart';
import 'package:xml/xml.dart' as xml;

class SOAPWebservicePublish {
  static const String namespace = "http://tempuri.org/";
  static const String url = "https://ctdthuyendakdoa-tt78admin.vnpt-invoice.com.vn/publishservice.asmx?WSDL";
  static const String soapAction = "http://tempuri.org/ImportAndPublishInv";

  Future<String?> getWSImportAndPublishInv(
      String strUserName,
      String strUserPass,
      String strPattern,
      String strSerial,
      int convert,
      String strXmlInvData) async {
    try {
      final soapRequest = '''
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="$namespace">
        <soapenv:Header/>
        <soapenv:Body>
          <tem:ImportAndPublishInv>
            <tem:Account>$strUserName</tem:Account>
            <tem:ACpass>$strUserPass</tem:ACpass>
            <tem:xmlInvData>$strXmlInvData</tem:xmlInvData>
            <tem:username>WS_USER</tem:username>
            <tem:password>WS_PASS</tem:password>
            <tem:pattern>$strPattern</tem:pattern>
            <tem:serial>$strSerial</tem:serial>
            <tem:convert>$convert</tem:convert>
          </tem:ImportAndPublishInv>
        </soapenv:Body>
      </soapenv:Envelope>
      ''';

      Dio dio = Dio();
      Response response = await dio.post(
        url,
        data: soapRequest,
        options: Options(
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": soapAction,
          },
          sendTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
        ),
      );

      // Kiểm tra response
      if (response.statusCode == 200) {
        final document = xml.XmlDocument.parse(response.data);
        final result = document.findAllElements("ImportAndPublishInvResult").first;
        return result.text;
      } else {
        print("Lỗi: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Lỗi kết nối: $e");
      return null;
    }
  }
}
