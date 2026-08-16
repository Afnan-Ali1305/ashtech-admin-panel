import 'dart:io';
import 'package:ashtech_app/features/employee/model/employee_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfDownloadService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    // FIX 1: Pass named parameter 'settings'
    await _notificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {},
    );

    final androidPlatform = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (androidPlatform != null) {
      await androidPlatform.requestNotificationsPermission();
    }
  }

  static Future<void> generateAndSavePdf(EmployeeModel employee) async {
    const androidDetails = AndroidNotificationDetails(
      'pdf_download_channel',
      'PDF Downloads',
      channelDescription: 'Notifications for PDF generation and downloads',
      importance: Importance.high,
      priority: Priority.high,
      showProgress: true,
      maxProgress: 100,
      progress: 50,
      indeterminate: true,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    // FIX 2: Pass named parameters for 'show'
    await _notificationsPlugin.show(
      id: 1,
      title: 'Downloading PDF...',
      body: 'Generating ${employee.name ?? 'Employee'}_Profile.pdf',
      notificationDetails: notificationDetails,
    );

    final pdf = pw.Document();

    final primaryColor = PdfColor.fromHex('#0F172A');
    final textColor = PdfColor.fromHex('#1E293B');
    final mutedTextColor = PdfColor.fromHex('#64748B');
    final tableHeaderBg = PdfColor.fromHex('#F1F5F9');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            pw.Text(
              'Ashtech Digital Solutions',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                color: primaryColor,
              ),
            ),
            pw.Text(
              'www.ashtechdigitalsolutions.com',
              style: pw.TextStyle(fontSize: 10, color: mutedTextColor),
            ),
            pw.SizedBox(height: 16),
            pw.Text(
              'Employee Profile',
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: textColor,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              '${employee.name ?? 'N/A'} · ${employee.designation ?? 'N/A'} · ${employee.status ?? 'active'}',
              style: pw.TextStyle(fontSize: 11, color: mutedTextColor),
            ),
            pw.SizedBox(height: 16),
            _buildSectionHeader('Personal Information', textColor),
            pw.SizedBox(height: 6),
            _buildTable(
              headers: ['Field', 'Value'],
              rows: [
                ['Employee Code', employee.code ?? 'N/A'],
                ['Full Name', employee.name ?? 'N/A'],
                ["Father's Name", employee.fathersName ?? 'N/A'],
                ['Designation', employee.designation ?? 'N/A'],
                ['Status', employee.status ?? 'active'],
                ['Joining Date', employee.joinedDate ?? 'N/A'],
                ['Email', employee.email ?? 'N/A'],
                ['Phone', employee.phone ?? 'N/A'],
              ],
              headerBg: tableHeaderBg,
            ),
            pw.SizedBox(height: 16),
            _buildSectionHeader('Identity & Bank', textColor),
            pw.SizedBox(height: 6),
            _buildTable(
              headers: ['Field', 'Value'],
              rows: [
                ['CNIC', employee.cnic ?? 'N/A'],
                ['Address', employee.address ?? 'N/A'],
                ['Bank Name', employee.bankName ?? 'N/A'],
                ['Bank Account', employee.bankAccount ?? 'N/A'],
              ],
              headerBg: tableHeaderBg,
            ),
            pw.SizedBox(height: 16),
            _buildSectionHeader('Salary Breakdown', textColor),
            pw.SizedBox(height: 6),
            _buildTable(
              headers: ['Component', 'Amount'],
              rows: [
                ['Basic Salary', employee.basicSalary ?? '-'],
                ['Allowances', employee.allowances ?? '-'],
                ['Deductions', employee.deductions ?? '-'],
              ],
              headerBg: tableHeaderBg,
            ),
            pw.SizedBox(height: 24),
            pw.Divider(color: PdfColors.grey300),
            pw.SizedBox(height: 4),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Ashtech Digital Solutions EMS',
                  style: pw.TextStyle(fontSize: 8, color: mutedTextColor),
                ),
                pw.Text(
                  'Page 1 of 1',
                  style: pw.TextStyle(fontSize: 8, color: mutedTextColor),
                ),
              ],
            ),
          ];
        },
      ),
    );

    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    directory ??= await getApplicationDocumentsDirectory();

    final filePath =
        '${directory.path}/${employee.code ?? "Employee"}_Profile.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    const completedAndroidDetails = AndroidNotificationDetails(
      'pdf_download_channel',
      'PDF Downloads',
      channelDescription: 'Notifications for PDF generation and downloads',
      importance: Importance.high,
      priority: Priority.high,
    );

    const completedNotificationDetails = NotificationDetails(
      android: completedAndroidDetails,
    );

    // FIX 3: Pass named parameters for 'show' (Completion notification)
    await _notificationsPlugin.show(
      id: 2,
      title: 'Download Complete',
      body: 'Saved: ${employee.code ?? "Employee"}_Profile.pdf',
      notificationDetails: completedNotificationDetails,
    );
  }

  static pw.Widget _buildSectionHeader(String title, PdfColor textColor) {
    return pw.Text(
      title,
      style: pw.TextStyle(
        fontSize: 13,
        fontWeight: pw.FontWeight.bold,
        color: textColor,
      ),
    );
  }

  static pw.Widget _buildTable({
    required List<String> headers,
    required List<List<String>> rows,
    required PdfColor headerBg,
  }) {
    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: rows,
      border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
      rowDecoration: const pw.BoxDecoration(color: PdfColors.white),
      headerDecoration: pw.BoxDecoration(color: headerBg),
      cellStyle: const pw.TextStyle(fontSize: 9),
      cellPadding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );
  }
}
