   M S B A M L   `   `   `  ????F  BQUANLICAPHE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QUANLICAPHE.ViewQUANLICAPHE.View  5   	   =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel  5   	   E'clr-namespace:QUANLICAPHE.CustomControlQUANLICAPHE.CustomControl  5   	        QUANLICAPHE.View.LoginView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:QUANLICAPHE.View     5   	   9	viewModel#clr-namespace:QUANLICAPHE.ViewModel     5   	   Acustomcontrol'clr-namespace:QUANLICAPHE.CustomControl     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   -   5        $??LoginWindow??5   	     ? Title$  	LoginView??5
   	   $	??550??6   $	??800??6(    ? WindowStyle$
 None=?5   	    ? 
ResizeMode$ NoResize=?5   	    ? WindowStartupLocation$ CenterScreen=?5   	   
??????  ? AllowsTransparency .    MaterialDesignBody#???   5      $??Regular"?5      $??13(?5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=?5         TextRenderingMode$
 Auto=?5        MaterialDesignFont#???  5       ? DataContext 5      *  $QUANLICAPHE.ViewModel.LoginViewModel  5   
   .??5$      ??  ?? CornerRadius$ 50??6   ??5&   
   ?? 5'      	 ?? ImageSource$	 \Image\Login.jpg??6   
 j? Stretch$

 Fill=?5(      ._?5+   
   ?? $ 50??6   $??5q?5,      ??5/      ?? 50       ?? 
StartPoint$	 0,0&?6&    ?? EndPoint$	 1,1&?67   .??51      ?  ? Color$ #659999??6#    ? Offset$ 0Q?63   6@   ? 52      $ #f4791f??6#   $
 0.75Q?63   6C   ? 53      $ #b07a0e??6#   $	 1.0Q?63   6B   54      ._?56      ?? $ 50??6   ._?57      ?  ? RowDefinitions 58      ?? 59      $??40 ?6(   ?? 5:       ? ColumnDefinitions 5<      ?? 5=      ?? 5>      $??307.03 ?6+   ?? 5?      $??92.97 ?6+   .+?5A      ? $??10,20,-10,20q?6   $??1??61   $??2??6A   $??2??6R    5B      ?? 5C      $	??17* ?6/   ?? 5D      $??3* ?6/   .+?5F      ?? ???	#FF5B2A18$??X??5H      $??315,-11,41,479q?5L      $??2??64   ???	#DDFF0000???	#FF581815??5I      ?? *CloseCommand+??5J      ??  ?? ElementName$ LoginWindow??{?5K      ?? *DataContext.ControlsEnabled+ ?? RelativeSource ?? *FindAncestor+ ?? AncestorType$ WindowL?5L   _   ?? 5M      -   5         ??Name$ MinimizeBTN??5N   0   $
??Left=?5M   "    c? OverflowMode$ AsNeeded=?5P      ???	#FF5B2A18 ? ToolTip$ Minimize??5R      $??255,-11,0,479q?6,   $??44??6C   ???	#DD2B1919???	#FF442517??5O      0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ WindowMinimize=?5R   e   5S      ?? 5U      ???#fcedc2$ 50??62   $??2q?5V      $??1??5W      $
??Left=?5X      $??
50,75,0,75q?5Y      $	??350??5Z      $	??300??5[       J? Opacity$	 0.8Q?5\      
??? ???._?5_      ?? $??1??5`   !   $??Center=?5a   !   
?????? $	??300??5c   !    ?? Orientation$ Vertical=?5d   !   $??0,8,0,-2q?68   ??5h      ?? 5i   "    ?? 
TargetType" ??6(   .?5k   &   ??  ?? Property ?@J?Opacity ?? Value$
 0.75Q?6@   5m   #   .+?5o      ?? $??ĐĂNG NHẬP??6(   
???**??$
??Bold"?5q      $??30(?5r      $??Center=?5s      $??Center=?5t      6;   ?? 5u      $	??300??6%   $??4??5v   %   $??0,10,0,0q?5w   %   ??5x   "   ?? 5y   &   $	 0,0&?6:   $	 1,1&?6K   .??5z   *   ? $ #c31432??67   $ 0Q?6G   6T   ? 5{   *   $ #240b36??67   $
 0.75Q?6G   6W   ? 5|   *   $ #b07a0e??67   $	 1.0Q?6G   6V   5}   '   5      ? 5?       5?   "   ?? 5?   &   66   ?? 5?   &   66   .+?5?   "   ? $??0??6'   $??2??65    5?   &   ?? 5?   *   $
??auto ?6;   6J   ?? 5?   *   6=   .+?5?   &   ? $??0??6+   $??50??6;   $	??100??6F   $??0q?6S   .+?5?   *   '  !MaterialDesignThemes.Wpf.PackIcon  $??30??6B   $??30??6M   $??Center=?6Y      Kind$ Account=?6v    J? RenderTransformOrigin$ 0.589,1.378&?6?   $??0,-4,0,0q?6?   5?   '   ? 5?   &   $??1??6+   .+?5?   *   ?? $	??Top=?5?      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ TÊN ĐĂNG NHẬP??5?      $??16(?5?       % !MaterialDesignFloatingHintTextBox#??[ 5?      $??	0,36,24,0q?6T   ??5?      ?? *
UserName+5?   T   5?   '   5?   #   ? 5?   "   $??1??6'   $??
2,60,12,48q?64    5?   &   ?? 5?   *   $
??auto ?6;   6J   ?? 5?   *   6=   .+?5?   &   ? $??0??6+   $??50??6;   $	??100??6F   $??0q?6S   .+?5?   *     $??30??6B   $??30??6M   $??Center=?6Y   $
 Lock=?6v   $ 0.567,1.766&?6?   $??0,50,0,0q?6?   5?   '   ? 5?   &   $??1??6+   .+?5?   *   G? -   5          G?Name$  FloatingPasswordBox??5?      $??16(?5?   -   !   
Foreground
! ?**??$ MẬT KHẨU??5?      .  (MaterialDesignThemes.Wpf.TextFieldAssist"   UnderlineBrush
" ?**?? ) %MaterialDesignFloatingHintPasswordBox#??[ 5?      $??
0,35,10,20q?6X   .  (System.Windows.Interactivity.Interaction#   Triggers# 5?   .   /  )System.Windows.Interactivity.EventTrigger  5?   2   $   	EventName$$ PasswordChanged??6A   .	  (System.Windows.Interactivity.TriggerBase% 	  Actions.% 5?   6   6
  0System.Windows.Interactivity.InvokeCommandAction
  & 
  Command& 6L   ?? *PasswordChangedCommand+' 
  CommandParameter' 6w   ?? $ FloatingPasswordBox??5?   3   5?   +   5?   '   5?   #   ? 5?   "   $??2??6'   $??
10,83,20,5q?64   $??2??6H    5?   &   ?? 5?   *   6=   ?? 5?   *   6=   .+?5?   &   ? $	??124??5?      .+?5?   *   ?? ( ?? 	IsDefault( . $??1q?5?   2   $??48,88,-91,0q?5?      3  -MaterialDesignThemes.Wpf.ButtonProgressAssist)   IsIndeterminate) . *   IsIndicatorVisible* . +   Value$+ -1Q?5?      $??ĐĂNG NHẬP??5?      ???	#FFF51B1B  MaterialDesignRaisedButton#??[ 5?      ???	#FF5A00FB???	#DDFFFFFF??5?      ?? *LoginCommand+??5?      ?? $ LoginWindow??{?5?      ?? *DataContext.ControlsEnabled+ ?? *FindAncestor+$ WindowL?5?   i   5?   '   ? 5?   &   $??1??6+   $	??124??5?      $??11,0,0,0q?6&    5?   *   ?? 5?   .   $	??19* ?6<   ?? 5?   .   $	??67* ?6<   .+?5?   *   ? .+?5?   .   ?? $	??100??5?   1   $??
ĐĂNG KÍ??5?   1     MaterialDesignPaperButton#??[ 5?   1   $ 
ĐĂNG KÍ??5?   1   $??-137,146,161,-143q?6C   ??5?   1   ?? *
ShowDangKi+{?5?   1   ?? *DataContext.ControlsEnabled+ ?? *FindAncestor+$ WindowL?5?   C   ?? 5?   .   $??QUÊN MẬT KHẨU??5?   1   #??[ 5?   1   $ QUÊN MẬT KHẨU??5?   1   $??-17,146,-1,-143q?6I   ??5?   1   ?? *
ShowQuenMK+{?5?   1   ?? *DataContext.ControlsEnabled+ ?? *FindAncestor+" ?5?   I   5?   +   5?   '   ? 5?   &   5?   #   5?      5?      5?      5?      5?      5?      5?      5?      