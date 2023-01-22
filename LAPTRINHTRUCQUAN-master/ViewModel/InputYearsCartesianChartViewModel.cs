using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;
using QUANLICAPHE.ViewModel;
using QUANLICAPHE.Model;
using QUANLICAPHE.View;
using System.Windows.Navigation;

namespace QUANLICAPHE.ViewModel
{
    public class InputYearsCartesianChartViewModel: BaseViewModel
    {
        #region prop
        //

        private string result { get; set; }
        public string Result
        {
            get => result;
            set
            {
                result = value;
                OnPropertyChanged();          
            }
        }
        private string script { get; set; }
        public string Script
        {
            get => script;
            set
            {
                script = value;
                OnPropertyChanged();
            }
        }
        //
        #endregion
        #region command
        //
        public ICommand btn_OKCommand { get; set; }
        //
        #endregion


        #region method
        public bool CheckString(string value)
        {
            for(int i = 0; i < value.Length;i++)
            {
                if (value[i] != ' ' &&(value[i] > '9' || value[i] < '0'))
                {
                    return false;
                }
            }
            return true;

        }
        public string scriptFix(ref string str)
        {

            while (str[0] == ' ')
            {
                str = str.Remove(0, 1);
            }
            while (str[str.Length - 1] == ' ')
            {
                str = str.Remove(str.Length - 1, 1);

            }

            for(int i =0; i<str.Length;i++)
            {
                if (str[i] == ' ' &&  str[i + 1] == ' ')
                {
                    str = str.Remove(i + 1, 1);
                    i--;
                }
            }
            return str;
        }
        #endregion
        public InputYearsCartesianChartViewModel() 
        {
            Script= string.Empty;
            btn_OKCommand = new RelayCommand<string>
                (
                (p) => 
                {
                    if (p == null)
                        return true;
                    if (!CheckString(Script))
                        return false;
                    return true;
                },
                (p) => 
                {
                    string temp = p.Clone().ToString();
                    scriptFix(ref temp);
                    this.Script = temp;
                    MessageBox.Show(this.Script);
                });
        } 
    }
}
