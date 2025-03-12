import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import '../providers/sync_provider.dart';

class SyncPopup extends StatefulWidget {
  @override
  _SyncPopupState createState() => _SyncPopupState();
}

class _SyncPopupState extends State<SyncPopup> {
  TextEditingController mstController = TextEditingController();
  String? syncResult;


  Future<void> syncData() async {
    setState(() {
      syncResult = "Đang tải dữ liệu...";
    });
    String mst = mstController.text.trim();
    if (mst.isEmpty) return;

    String url = 'https://blubnd.gialai.vnpt.vn/xem/getthongtintk?mst=$mst';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Lưu dữ liệu vào Provider
        Provider.of<SyncProvider>(context, listen: false).updateData(data);
        setState(() {
          syncResult = "Đã load thành công dữ liệu!";
        });
      } else {
        setState(() {
          syncResult = 'Lỗi: Không thể đồng bộ dữ liệu';
        });
      }
    } catch (e) {
      setState(() {
        syncResult = 'Lỗi kết nối';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Đồng bộ dữ liệu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: mstController,
            decoration: InputDecoration(labelText: 'Nhập mã số thuế'),
          ),
          SizedBox(height: 10),
          if (syncResult != null) Text(syncResult!),
        ],
      ),
      actions: [
        TextButton(
          onPressed: syncData,
          child: Text('Đồng bộ'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Đóng'),
        ),
      ],
    );
  }
}
