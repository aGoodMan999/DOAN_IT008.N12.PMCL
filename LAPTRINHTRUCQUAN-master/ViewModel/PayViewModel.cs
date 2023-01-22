
using QUANLICAPHE.Model;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using System.Windows.Forms;
using QUANLICAPHE.View;
using System.Windows.Controls;
using CustomMessageBox;
namespace QUANLICAPHE.ViewModel
{
    public class PayViewModel : BaseViewModel
    {
        private ObservableCollection<Food> _List;
        public ObservableCollection<Food> List { get => _List; set { _List = value; OnPropertyChanged(); } }

        private ObservableCollection<TableFood> _ListTable;
        public ObservableCollection<TableFood> ListTable { get => _ListTable; set { _ListTable = value; OnPropertyChanged(); } }

        private ObservableCollection<BillInfoConvert> _ListBillInfoConvert;
        public ObservableCollection<BillInfoConvert> ListBillInfoConvert { get => _ListBillInfoConvert; set { _ListBillInfoConvert = value; OnPropertyChanged(); } }

        private ObservableCollection<Food> _ListAfter;
        public ObservableCollection<Food> ListAfter { get => _ListAfter; set { _ListAfter = value; OnPropertyChanged(); } }

        private ObservableCollection<FoodCategory> _ListFoodCategory;
        public ObservableCollection<FoodCategory> ListFoodCategory { get => _ListFoodCategory; set { _ListFoodCategory = value; OnPropertyChanged(); } }

        private double _Price;
        public double Price { get => _Price; set { _Price = value; OnPropertyChanged(); } }

        private string _Name;
        public string Name { get => _Name; set { _Name = value; OnPropertyChanged(); } }

        private double _Total;
        public double Total { get => _Total; set { _Total = value; OnPropertyChanged(); } }

        private double _Money;
        public double Money { get => _Money; set { _Money = value; OnPropertyChanged(); } }

        private int _Amount;
        public int Amount { get => _Amount; set { _Amount = value; OnPropertyChanged(); } }

        private int _Count;
        public int Count { get => _Count; set { _Count = value; OnPropertyChanged(); } }

        private DateTime _CheckIn = DateTime.Now;
        public DateTime CheckIn { get => _CheckIn; set { _CheckIn = value; OnPropertyChanged(); } }

        private DateTime _CheckOut = DateTime.Now;
        public DateTime CheckOut { get => _CheckOut; set { _CheckOut = value; OnPropertyChanged(); } }

        private int _SoHD;
        public int SoHD { get => _SoHD; set { _SoHD = value; OnPropertyChanged(); } }

        private int _SoHDBan;
        public int SoHDBan { get => _SoHDBan; set { _SoHDBan = value; OnPropertyChanged(); } }

        private Food _SelectedItem;
        public Food SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    var ListAfter1 = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x => x.id == SelectedItem.id)).First();
                    Price = ListAfter1.price;
                }
            }
        }

        private BillInfoConvert _SelectedBillInfo;
        public BillInfoConvert SelectedBillInfo
        {
            get => _SelectedBillInfo;
            set
            {
                _SelectedBillInfo = value;
                OnPropertyChanged();
                if (SelectedBillInfo != null)
                {
                }
            }
        }

        private Model.FoodCategory _SelectedFoodCategory;
        public Model.FoodCategory SelectedFoodCategory
        {
            get => _SelectedFoodCategory;
            set
            {
                _SelectedFoodCategory = value;
                OnPropertyChanged();
                if (SelectedFoodCategory != null)
                {
                    List = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x => x.idCategory == SelectedFoodCategory.id&&x.deleteFood==0));
                }
            }
        }

        private TableFood _SelectedTable;
        public TableFood SelectedTable
        {
            get => _SelectedTable;
            set
            {
                _SelectedTable = value;
                OnPropertyChanged();
                if (SelectedTable != null)
                {
                    SoHDBan = SelectedTable.idbill;
                }
            }
        }
        public ICommand CreateBill { get; set; }
        public ICommand ResetBill { get; set; }
        public ICommand AddBillInfo { get; set; }
        public ICommand DeleteBillInfo { get; set; }
        public ICommand AddTable { get; set; }
        public ICommand Payment { get; set; }
        public ICommand AddBillInfoInTable { get; set; }
        public PayViewModel()
        {
            ListFoodCategory = new ObservableCollection<FoodCategory>(DataProvider.Ins.DB.FoodCategories);
            List = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x=>x.deleteFood==0));
            ListBillInfoConvert = new ObservableCollection<BillInfoConvert>();
            ListTable = new ObservableCollection<TableFood>(DataProvider.Ins.DB.TableFoods);
            CreateBill = new RelayCommand<object>((p) =>
            {
                if (SelectedTable == null )
                    return true;
                if(SoHDBan!=0)
                    return false;
                if (ListBillInfoConvert == null || ListBillInfoConvert.Count == 0 &&  SoHD==0)
                    return true;
                return false;
            }, (p) =>
            {
                var Bill = new Bill() { DateCheckIn = CheckIn, DateCheckOut = CheckOut };
                DataProvider.Ins.DB.Bills.Add(Bill);
                DataProvider.Ins.DB.SaveChanges();
                SoHD = Bill.id;
                ListBillInfoConvert = new ObservableCollection<BillInfoConvert>();
            });

            ResetBill = new RelayCommand<object>((p) =>
            {
                if (SoHD == 0)
                    return false;
                return true;
            }, (p) =>
            {
                var billifo=DataProvider.Ins.DB.BillInfoes.Where(x=>x.id==SoHD);
                foreach(BillInfo item in billifo)
                {
                    item.deleteBillInfo = 1;
                }
              
                Money = 0;
                ListBillInfoConvert = new ObservableCollection<BillInfoConvert>();
            });

            AddBillInfo = new RelayCommand<object>((p) =>
            {
                if(SelectedFoodCategory==null || SelectedItem==null||Price==0||Count==0)
                {
                    return false;
                }
                if (Count == 0)
                    return false;
                if (SoHD == 0 && SoHDBan == 0)
                    return false;
                return true;
            }, (p) =>
            {
                var BillInfo = new BillInfo() { idBill = SoHD, idFood = SelectedItem.id, count = Count };
                if (SoHD == 0)
                    BillInfo = new BillInfo() { idBill = SoHDBan, idFood = SelectedItem.id, count = Count };
                DataProvider.Ins.DB.BillInfoes.Add(BillInfo);
                DataProvider.Ins.DB.SaveChanges();
                var food = DataProvider.Ins.DB.Foods.Where(x => x.id == SelectedItem.id).First();
                var BillInfoConvert = new BillInfoConvert() { Name = food.name, Amount = Count, Total = food.price * Count, IdBillInfo = BillInfo.id };
                ListBillInfoConvert.Add(BillInfoConvert);
                Money += food.price * Count;
                DataProvider.Ins.DB.SaveChanges();
            });

            DeleteBillInfo = new RelayCommand<object>((p) =>
            {
                if (ListBillInfoConvert != null && ListBillInfoConvert.Count() != 0 && SelectedBillInfo != null)
                    return true;
                return false;
            }, (p) =>
            {
                try
                {
                    bool? result = new MessageBoxCustom("Bạn có chắc là muốn xóa không?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                    if (result.Value)
                    {
                        var food = DataProvider.Ins.DB.Foods;
                        var BillInfo2 = DataProvider.Ins.DB.BillInfoes.Where(x => x.idBill == SoHD);
                        Money = 0;
                        var BillInfo = DataProvider.Ins.DB.BillInfoes.Where(x => x.id == SelectedBillInfo.IdBillInfo).SingleOrDefault();
                        BillInfo.deleteBillInfo = 1;
                        DataProvider.Ins.DB.SaveChanges();
                        foreach (BillInfo item in BillInfo2)
                        {
                            foreach (Food item2 in food)
                            {
                                if (item.deleteBillInfo == 0 && item.idFood == item2.id)
                                    Money += item.count * item2.price;
                            }
                        }
                        foreach (BillInfoConvert item in ListBillInfoConvert.ToList())
                        {
                            if (item.IdBillInfo == SelectedBillInfo.IdBillInfo)
                                ListBillInfoConvert.Remove(item);
                        }
                    }
                    else
                        return;
                }
                catch (Exception)
                {
                }
            });

            AddTable = new RelayCommand<object>((p) =>
            {
                if (ListBillInfoConvert == null&&ListBillInfoConvert.Count==0)
                    return false;
                if (SelectedTable == null)
                    return false;
                if (SelectedTable.Bills.Where(x => x.status == 0).Any())
                    return false;
                if (SoHD == 0 || SelectedTable == null || DataProvider.Ins.DB.BillInfoes.Where(e => e.idBill == SoHD).Count() == 0)
                    return false;
                return true;
            }, (p) =>
            {
                var Bill = DataProvider.Ins.DB.Bills.Where(x => x.id == SoHD).First();
                Bill.idTable = SelectedTable.id;
                Bill.status = 0;
                SelectedTable.idbill = Bill.id;
                Bill.Total = Money;
                SelectedTable.status = "Có người";
                DataProvider.Ins.DB.SaveChanges();
                ListBillInfoConvert = new ObservableCollection<BillInfoConvert>();
                SelectedTable = null;
                //ListTable = new ObservableCollection<TableFood>(DataProvider.Ins.DB.TableFoods.Where(x => x.status == "Trống")); 
                ListTable = new ObservableCollection<TableFood>(DataProvider.Ins.DB.TableFoods);
                DataProvider.Ins.DB.SaveChanges();
                SoHD = 0;
                Money = 0;
            });

            Payment = new RelayCommand<System.Windows.Controls.UserControl>((p) =>
            {
                if(SelectedTable!=null && SoHDBan!=0 )
                    return false;
                if (SoHD == 0 || DataProvider.Ins.DB.BillInfoes.Where(e => e.idBill == SoHD).Count() == 0)
                    return false;
                return true;
            }, (p) =>
            {
                var list = DataProvider.Ins.DB.Bills;
                foreach (Bill item in list)
                {
                    item.PrintHD = 0;
                }
                var Bill = DataProvider.Ins.DB.Bills.Where(x => x.id == SoHD).First();
                Bill.status = 2;
                Bill.Total = Money;
                Bill.PrintHD = 1;
                DataProvider.Ins.DB.SaveChanges();
                bool? mess = new MessageBoxCustom("Bạn có muốn in hóa đơn không?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (mess.Value)
                {
                    PrintBillView print = new PrintBillView();
                    print.ShowDialog();
                }
                MessageBoxCustom mess1 = new MessageBoxCustom("Thanh toán thành công!", MessageType.Info, MessageButtons.Ok);
                mess1.ShowDialog();
                ListBillInfoConvert = new ObservableCollection<BillInfoConvert>();
                SoHD = 0;
                Money = 0;
            });

            AddBillInfoInTable = new RelayCommand<object>((p) =>
            {
                if (ListBillInfoConvert.Count == 0)
                    return false;
                if (SoHDBan == 0)
                    return false;
                return true;
            }, (p) =>
            {
                var Bill = DataProvider.Ins.DB.Bills.Where(x => x.id == SoHDBan).First();
                Bill.status = 0;
                Bill.Total = Money + Bill.Total;
                DataProvider.Ins.DB.SaveChanges();
                ListBillInfoConvert = new ObservableCollection<BillInfoConvert>();
                SelectedTable = null;
                ListTable = new ObservableCollection<TableFood>(DataProvider.Ins.DB.TableFoods);
                DataProvider.Ins.DB.SaveChanges();
                SoHDBan = 0;
                Money = 0;
            });
        }
    }
}
