using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.RightsManagement;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QUANLICAPHE.View
{
    /// <summary>
    /// Interaction logic for InputYearsCartesianChart.xaml
    /// </summary>
    public partial class InputYearsCartesianChart : Window
    {
        private string result;
        public string Result
        {
            get { return result; }
            set { 
                result = value; 
            }
        }
        public InputYearsCartesianChart()
        {
            Result = "None";
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Result = "Exit";
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Result = "OK";
            this.Close();
        }
    }
}
