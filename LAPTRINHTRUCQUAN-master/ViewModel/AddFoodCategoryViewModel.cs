using CustomMessageBox;
using QUANLICAPHE.Model;
using QUANLICAPHE.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Input;

namespace QUANLICAPHE.ViewModel
{
    public class AddFoodCategoryViewModel:BaseViewModel
    {
        public ICommand CloseCommand { get; set; }
        public ICommand AddFoodCategory { get; set; }
        public ICommand DeleteFoodCategory { get; set; }

        private ObservableCollection<FoodCategory> _ListFoodCategory;
        public ObservableCollection<FoodCategory> ListFoodCategory { get => _ListFoodCategory; set { _ListFoodCategory = value; OnPropertyChanged(); } }

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

        private string _NameFoodCategory;
        public string NameFoodCategory { get => _NameFoodCategory; set { _NameFoodCategory = value; OnPropertyChanged(); } }



        public AddFoodCategoryViewModel()
        {
            ListFoodCategory = new ObservableCollection<FoodCategory>(DataProvider.Ins.DB.FoodCategories);

            CloseCommand = new RelayCommand<Window>((p) => { return p == null ? false : true; }, (p) => {
                var w = (p);
                if (w != null)
                {
                    w.Close();
                }
            });

            AddFoodCategory = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(NameFoodCategory))
                    return false;
                var displayList = DataProvider.Ins.DB.FoodCategories.Where(x => x.name == NameFoodCategory);
                if (displayList == null || displayList.Count() != 0)
                    return false;
                return true;
            }, (p) =>
            {
                var FoodCategory = new FoodCategory() { name = NameFoodCategory, };
                DataProvider.Ins.DB.FoodCategories.Add(FoodCategory);
                DataProvider.Ins.DB.SaveChanges();
                ListFoodCategory = new ObservableCollection<FoodCategory>(DataProvider.Ins.DB.FoodCategories);

            });

            DeleteFoodCategory = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(NameFoodCategory))
                    return false;
                var displayList = DataProvider.Ins.DB.FoodCategories.Where(x => x.name == NameFoodCategory);
                var listFood = DataProvider.Ins.DB.Foods;
                var listFoodCategory = DataProvider.Ins.DB.FoodCategories;
                foreach (FoodCategory item in displayList)
                {
                    foreach (Food food in listFood)
                    {
                        if (food.idCategory == item.id)
                            return false;

                    }

                }
                foreach (FoodCategory item in listFoodCategory)
                {
                    if (item.name == NameFoodCategory)
                        return true;
                }

                return false;
            }, (p) =>
            {
                bool? result = new MessageBoxCustom("Bạn có chắc là muốn xóa không?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (result.Value)
                {
                    var foodCaterogy = DataProvider.Ins.DB.FoodCategories.Where(x => x.name == NameFoodCategory).SingleOrDefault();
                    foodCaterogy.deleteFoodCategory = 1;
                    var FoodCategory = DataProvider.Ins.DB.FoodCategories;
                    foreach (FoodCategory item1 in FoodCategory)
                    {
                        if (item1.deleteFoodCategory == 1)
                            FoodCategory.Remove(item1);
                    }
                    DataProvider.Ins.DB.SaveChanges();
                    NameFoodCategory = "";
                    ListFoodCategory = new ObservableCollection<FoodCategory>(DataProvider.Ins.DB.FoodCategories);
                }
                else
                    return;



            });
        }
    }
}
