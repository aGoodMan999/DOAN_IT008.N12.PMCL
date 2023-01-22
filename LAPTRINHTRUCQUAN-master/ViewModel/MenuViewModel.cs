﻿using CustomMessageBox;
using FontAwesome.WPF.Converters;
using MaterialDesignThemes.Wpf;
using Microsoft.Win32;
using QUANLICAPHE.Model;
using QUANLICAPHE.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using ImageSourceConverter = FontAwesome.WPF.Converters.ImageSourceConverter;
using OpenFileDialog = Microsoft.Win32.OpenFileDialog;
using UserControl = System.Windows.Controls.UserControl;

namespace QUANLICAPHE.ViewModel
{
    public class MenuViewModel : BaseViewModel
    {
        private ObservableCollection<Food> _List;
        public ObservableCollection<Food> List { get => _List; set { _List = value; OnPropertyChanged(); } }

        private ObservableCollection<FoodCategory> _ListFoodCategory;
        public ObservableCollection<FoodCategory> ListFoodCategory { get => _ListFoodCategory; set { _ListFoodCategory = value; OnPropertyChanged(); } }

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
                    NameFood = SelectedItem.name;
                    Size = SelectedItem.size;
                    Price = SelectedItem.price;
                    SelectedFoodCategory = SelectedItem.FoodCategory;
                    if (SelectedItem.imageFood == null)
                        imageFood = new BitmapImage(new Uri("pack://application:,,,/Image/nền-trắng-full.jpg"));
                    else
                        imageFood = new BitmapImage(new Uri(SelectedItem.imageFood));

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

                }
            }
        }

        private string _NameFood;
        public string NameFood { get => _NameFood; set { _NameFood = value; OnPropertyChanged(); } }

        private string _Size;
        public string Size { get => _Size; set { _Size = value; OnPropertyChanged(); } }

        private double _Price;
        public double Price { get => _Price; set { _Price = value; OnPropertyChanged(); } }

        private string _NameFoodCategory;
        public string NameFoodCategory { get => _NameFoodCategory; set { _NameFoodCategory = value; OnPropertyChanged(); } }

        private BitmapImage _imageFood;
        public BitmapImage imageFood { get => _imageFood; set { _imageFood = value; OnPropertyChanged(); } }

        private int _type;
        public int type { get => _type; set { _type = value; OnPropertyChanged(); } }

        private bool _Visibility;

        public ICommand Search { get; set; }
        public ICommand AddFood { get; set; }
        public ICommand EditFood { get; set; }
        public ICommand DeleteFood { get; set; }
        public ICommand DeleteFoodCategory { get; set; }
        public ICommand ImageFood { get; set; }
        public ICommand OpenLoaiThucAn { get; set; }


        public bool IsAdmin
        {
            get { return _Visibility; }
        }


        public MenuViewModel()
        {
            List = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x=>x.deleteFood==0));
            ListFoodCategory = new ObservableCollection<FoodCategory>(DataProvider.Ins.DB.FoodCategories);
            Search = new RelayCommand<object>((p) =>
            {               
                return true;
            }, (p) =>
            {
               var List1= new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x=>x.idCategory==SelectedFoodCategory.id&& x.deleteFood==0));          
                if (List1 != null && List1.Count > 0)
                {
                    List = List1;
                }
            });

            AddFood = new RelayCommand<object>((p) =>
            {
                if (List.Where(x => x.name == NameFood).Any())
                {
                    return false;
                }
                if (string.IsNullOrEmpty(NameFood))
                    return false;
                if (SelectedItem != null)
                    return false;
                return true;
            }, (p) =>
            {
                var Food = new Food() { name=NameFood,size=Size,price=Price,idCategory=SelectedFoodCategory.id,imageFood=imageFood.ToString()};
                DataProvider.Ins.DB.Foods.Add(Food);
                List.Add(Food);
                DataProvider.Ins.DB.SaveChanges();
                List = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x=>x.deleteFood==0));
                NameFood = null;
                SelectedFoodCategory = null;
                Price = 0;
                imageFood = null;
            });

            

         

             EditFood= new RelayCommand<object>((p) =>
            { if (SelectedItem == null || SelectedFoodCategory == null)
                    return false;
                if (SelectedItem.name == NameFood)
                    return false;
                var displayList = DataProvider.Ins.DB.Foods.Where(x => x.id == SelectedItem.id);
                if (displayList != null && displayList.Count() != 0)
                    return true;
                return false;

            }, (p) =>
            {
                var Food = DataProvider.Ins.DB.Foods.Where(x => x.id == SelectedItem.id).SingleOrDefault();
                Food.name=NameFood;
                Food.size = Size;
                Food.price = Price;
                Food.imageFood = imageFood.ToString();
                Food.idCategory = SelectedFoodCategory.id;
                DataProvider.Ins.DB.SaveChanges();
                SelectedItem.name=NameFood;
                List = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x => x.deleteFood == 0));
                MessageBoxCustom mess = new MessageBoxCustom("Cập nhật thành công!", MessageType.Success, MessageButtons.Ok);
            });

            DeleteFood= new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(NameFood))
                    return false;
                return true;
            }, (p) =>
            {
                bool? result = new MessageBoxCustom("Bạn có chắc là muốn xóa không?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (result.Value)
                {
                    var food = DataProvider.Ins.DB.Foods.Where(x => x.id == SelectedItem.id).SingleOrDefault();
                    food.deleteFood = 1;
                    var Food = DataProvider.Ins.DB.Foods;
                    //foreach (Food item1 in Food)
                    //{
                    //    if (item1.deleteFood == 1)
                    //        Food.Remove(item1);
                    //}
                    DataProvider.Ins.DB.SaveChanges();
                    List = new ObservableCollection<Food>(DataProvider.Ins.DB.Foods.Where(x=>x.deleteFood==0));
                    NameFood = "";
                    Size = "";
                    Price = 0;
                    imageFood = new BitmapImage(new Uri("pack://application:,,,/Image/nền-trắng-full.jpg"));
                }
                else
                    return;
                
            });
            ImageFood = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(NameFood))
                    return false;
                return true;
            }, (p) =>
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();  
                if(openFileDialog.ShowDialog()==true)
                {
                    Uri fileUri=new Uri(openFileDialog.FileName);
                    imageFood = new BitmapImage(fileUri);
                    string sourcefile=openFileDialog.FileName;
                    string resourceUri = "..//..//Image//" +System.IO.Path.GetFileName(openFileDialog.FileName);
                    var list1 = DataProvider.Ins.DB.Users.Where(x => x.IMAGEUSER == resourceUri);
                    if (list1 != null)
                    {

                    }
                    else
                    {
                        System.IO.File.Copy(sourcefile, resourceUri, true);
                    }
                }
            });

            OpenLoaiThucAn = new RelayCommand<UserControl>((p) => { return true; }, (p) =>
            { 
                    AddFoodCategory addFoodCategory = new AddFoodCategory();
                    addFoodCategory.ShowDialog();      
               
            });

            var list = DataProvider.Ins.DB.Users;
            foreach (var item in list)
            {
                if (item.DANGNHAP == 1)
                {
                    type = item.TYPE;
                }
            }
            if (type == 0)
            {
                _Visibility = false;
            }
            else
                _Visibility = true;
        }
    }
}
