using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using QUANLICAPHE.Model;
using System.Data.SqlClient;
using System.Windows.Input;
using System.Windows.Controls;
using System.Globalization;
using System.Windows;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;
using System.Windows.Controls.Primitives;
using QUANLICAPHE.View;

namespace QUANLICAPHE.ViewModel
{

    public class OrdersViewModel : BaseViewModel
    {
        Excel.Application app = new Excel.Application();
        Excel.Workbooks wbs;
        Excel.Workbook wb;
        Excel.Worksheet ws;

        private ObservableCollection<Bill> _historyList;
        public ObservableCollection<Bill> historyList
        {
            get => _historyList;
            set
            {
                if (_historyList != value)
                {
                    _historyList = value;
                    OnPropertyChanged();
                }
            }
        }
        private ObservableCollection<BillConvert> _billHistory;
        public ObservableCollection<BillConvert> billHistory
        {
            get => _billHistory;
            set
            {
                if (_billHistory != value)
                {
                    _billHistory = value;
                    OnPropertyChanged();
                }
            }
        }

        public ICommand executeViewCalendarRange { get; set; }
        public ICommand executeViewAllCommand { get; set; }
        public ICommand exportToExcelCommand { get; set; }
        public ICommand doubleClickItemsCommand { get; set; }

        private DateTime _startDate = DateTime.Today;
        private DateTime _endDate = DateTime.Today;
        public DateTime EndDate
        {
            get => _endDate;
            set
            {
                if (_endDate != value)
                {
                    _endDate = value;
                    OnPropertyChanged();
                }
            }
        }
        public DateTime StartDate
        {
            get => _startDate;
            set
            {
                if (_startDate != value && value <= _endDate)
                {
                    _startDate = value;
                    DatePicker t = new DatePicker();
                    t.BlackoutDates.Add(new CalendarDateRange(new DateTime(), _startDate.AddDays(-1)));
                    BlackoutDates = t.BlackoutDates;
                    OnPropertyChanged();
                }
            }
        }
        private CalendarBlackoutDatesCollection _blackoutDates;
        public CalendarBlackoutDatesCollection BlackoutDates
        {
            get => _blackoutDates;
            set
            {
                if (_blackoutDates != value)
                {
                    _blackoutDates = value;
                    OnPropertyChanged();
                }
            }
        }
        private double _total;
        public double total
        {
            get => _total;
            set
            {
                if (_total != value)
                {
                    _total = value;
                    OnPropertyChanged();
                }
            }
        }
        public OrdersViewModel()
        {
            ExecuteViewTodayQuery();
            executeViewCalendarRange = new RelayCommand<string>((p) => { return true; }, (p) => { ExecuteViewCalendarRange(); });
            executeViewAllCommand = new RelayCommand<string>((p) => { return true; }, (p) => ExecuteViewAllQuery());
            exportToExcelCommand = new RelayCommand<string>((p) => { return true; }, (p) => ExportExcel());
            doubleClickItemsCommand = new RelayCommand<string>((p) => { return true; }, (p) => ShowDetails());
        }

        private void ExecuteViewAllQuery()
        {
            using (var conn = new QUANLIQUANANGKEntities())
            {
                string queryString = @"select id, idTable, DateCheckIn, DateCheckOut, status, Total, PrintHD from Bill 
                                            where status = 1 or status = 2";
                historyList = new ObservableCollection<Bill>(
                                            conn.Bills.SqlQuery(queryString).ToList());
            }
            ConvertToBill();
            TotalRevenue();
        }
        private void ExecuteViewTodayQuery()
        {
            try
            {
                using (var conn = new QUANLIQUANANGKEntities())
                {
                    string queryString = @"select id, idTable, DateCheckIn, DateCheckOut, status, Total, PrintHD from Bill 
                                            where (status = 1 or status = 2) and DateCheckOut = @today";
                    historyList = new ObservableCollection<Bill>(
                                                conn.Bills.SqlQuery(queryString,
                                                new SqlParameter("@today", DateTime.Parse(DateTime.Today.ToString("MM/dd/yyyy"), CultureInfo.InvariantCulture))).ToList());
                }
                ConvertToBill();
                TotalRevenue();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
                throw;
            }
        }
        private void ExecuteViewCalendarRange()
        {
            try
            {
                using (var conn = new QUANLIQUANANGKEntities())
                {
                    string queryString = @"select id, idTable, DateCheckIn, DateCheckOut, status, Total, PrintHD from Bill
                                            where DateCheckOut between @start and @end and (status = 1 or status = 2)";

                    historyList = new ObservableCollection<Bill>(
                                            conn.Bills.SqlQuery(queryString,
                                            new SqlParameter("@start", DateTime.Parse(StartDate.ToString("MM/dd/yyyy"),  CultureInfo.InvariantCulture)),
                                            new SqlParameter("@end", DateTime.Parse(EndDate.ToString("MM/dd/yyyy"), CultureInfo.InvariantCulture))).ToList());
                }
                ConvertToBill();
                TotalRevenue();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                throw;
            }
        }
        private void ExportExcel()
        {
            try
            {
                string filePath = "";
                SaveFileDialog sf = new SaveFileDialog();
                sf.Filter = "Excel | *.xlsx | Excel 2003 | *.xls";
                if (sf.ShowDialog() == DialogResult.OK)
                {
                    filePath = sf.FileName;
                    app.DisplayAlerts = false;
                    app.Application.SheetsInNewWorkbook = 1;
                    wbs = app.Workbooks;
                    wb = (Excel.Workbook)(wbs.Add(Type.Missing));
                    ws = wb.Worksheets[1];
                    ws.Name = Path.GetFileNameWithoutExtension(sf.FileName);
                    editExcelForm(ws);
                    int i = 3;
                    foreach (Bill bill in historyList)
                    {
                        app.Cells[i, 1] = bill.id;
                        app.Cells[i, 2] = bill.idTable;
                        app.Cells[i, 3] = bill.DateCheckOut;
                        app.Cells[i, 4] = bill.Total;
                        i++;
                    }
                    wb.SaveAs(filePath);
                    wb.Close();
                }
            }
            catch
            {
            }
        }
        public void editExcelForm(Excel.Worksheet worksheet)
        {
            Excel.Range head = worksheet.get_Range("A1", "D1");
            head.MergeCells = true;
            head.Value2 = "DANH SÁCH HÓA ĐƠN";
            head.Interior.Color = Excel.XlRgbColor.rgbAliceBlue;
            head.Font.Bold = true;
            head.Font.Name = "Times New Roman";
            head.Font.Size = "20";
            head.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;

            Excel.Range column1 = ws.get_Range("A2", "A2");
            column1.Value2 = "ID Hóa Đơn";
            column1.ColumnWidth = 12;
            column1.Font.Bold = true;
            column1.Font.Name = "Times New Roman";
            column1.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;

            Excel.Range column2 = ws.get_Range("B2", "B2");
            column2.Value2 = "ID Bàn";
            column2.ColumnWidth = 12;
            column2.Font.Bold = true;
            column2.Font.Name = "Times New Roman";
            column2.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;

            Excel.Range column3 = ws.get_Range("C2", "C2");
            column3.Value2 = "Ngày Hóa Đơn";
            column3.ColumnWidth = 20;
            column3.Font.Bold = true;
            column3.Font.Name = "Times New Roman";
            column3.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;

            Excel.Range column4 = ws.get_Range("D2", "D2");
            column4.Value2 = "Tổng Tiền";
            column4.ColumnWidth = 15;
            column4.Font.Bold = true;
            column4.Font.Name = "Times New Roman";
            column4.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
        }
        public void TotalRevenue()
        {
            total = 0;
            foreach (BillConvert bill in billHistory)
            {
                total += bill.Total;
            }
        }
        public void ConvertToBill()
        {
            List<BillConvert> displayed = new List<BillConvert>();
            foreach(Bill bill in historyList)
            {
                BillConvert temp = new BillConvert();
                temp.id = bill.id;
                if (bill.idTable == null)
                    temp.idTable = "Không";
                else
                    temp.idTable = bill.idTable.ToString();
                temp.DateCheckOut = bill.DateCheckOut; 
                temp.Total = bill.Total;
                if (bill.status == 1)
                    temp.status = "Tại quán";
                if (bill.status == 2)
                    temp.status = "Mua về";
                displayed.Add(temp);
            }
            billHistory = new ObservableCollection<BillConvert>(displayed.ToList());
        }
        public void ShowDetails()
        {
            foreach (BillConvert item in billHistory)
            {
                if (item.IsSelected)
                {
                    var list = DataProvider.Ins.DB.Bills;
                    foreach (Bill bill in list)
                    {
                        bill.PrintHD = 0;
                    }
                    var Bill = DataProvider.Ins.DB.Bills.Where(x => x.id == item.id).First();
                    Bill.PrintHD = 1;
                    DataProvider.Ins.DB.SaveChanges();
                    PrintBillView print = new PrintBillView();
                    print.ShowDialog();
                    
                }
            }    
        }
    }
}
