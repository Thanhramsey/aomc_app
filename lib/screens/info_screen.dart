import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sync_provider.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SyncProvider>(context).data;

    return Scaffold(
      appBar: AppBar(title: Text("Thông Tin")),
      body: data == null
          ? Center(child: Text("Chưa có dữ liệu đồng bộ"))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tên: ${data['NAME'] ?? 'Không có dữ liệu'}"),
            Text("Mã số thuế: ${data['MST'] ?? 'Không có dữ liệu'}"),
            Text("Địa chỉ: ${data['URL'] ?? 'Không có dữ liệu'}"),
          ],
        ),
      ),
    );
  }
}
