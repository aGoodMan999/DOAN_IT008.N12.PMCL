   M S B A M L   `   `   `  ????F  BQUANLICAPHE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QUANLICAPHE.ViewQUANLICAPHE.View  5   	   =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel  5   	       QUANLICAPHE.View.MainView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   *localclr-namespace:QUANLICAPHE.View  5   	   3	viewModel#clr-namespace:QUANLICAPHE.ViewModel  5   	   X TFontAwesome.Sharp, Version=6.1.1.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fEf=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5	   	   _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5          ?Name$  
mainWindow??5   	    ? WindowStyle$
 None=?5   	    ? 
ResizeMode$ NoResize=?5   	    ? WindowStartupLocation$ CenterScreen=?5   	   
??????  ? AllowsTransparency .  ? Title$ 
MainWindow??5   	   $	??630??6   $
??1240??6)      MaterialDesignBody#???   5      $??Regular"?5      $??13(?5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=?5         TextRenderingMode$
 Auto=?5        MaterialDesignFont#???  5      .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
   	   	EventName$	 Loaded??6   .  (System.Windows.Interactivity.TriggerBase
   Actions.
 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   ?? *LoadedWindowCommand+   CommandParameter 6L   ??  ?? ElementName$ 
mainWindow??6?   5       ? DataContext 5!      )   #QUANLICAPHE.ViewModel.MainViewModel  5"   
    ? 	Resources 5%       ?? DataType)   #QUANLICAPHE.ViewModel.HomeViewModel   QUANLICAPHE.View.HomeView)	   #QUANLICAPHE.ViewModel.MenuViewModel
   QUANLICAPHE.View.MenuView-   'QUANLICAPHE.ViewModel.CustomerViewModel#   QUANLICAPHE.View.CustomerView+   %QUANLICAPHE.ViewModel.OrdersViewModel!   QUANLICAPHE.View.OrdersView*   $QUANLICAPHE.ViewModel.TableViewModel    QUANLICAPHE.View.TableView,   &QUANLICAPHE.ViewModel.AccountViewModel"   QUANLICAPHE.View.AccountView??%?  (??       5&      *, +)(?? 2     5)      *,	 +)(?? d     5,      *, +)(?? ?     5/      *, +)(?? ?     52      *, +)(?? ?     55      *, +)?? 5&   
   "  6   .R?5'        5(      ?? 5)   
   " 	 6   .R?5*      
  5+      ?? 5,   
   "  6   .R?5-        5.      ?? 5/   
   "  6   .R?50        51      ?? 52   
   "  6   .R?53        54      ?? 55   
   "  6   .R?56        57      59      .??5=      ??  ?? CornerRadius$ 10??5>      $??0q?5?      ??5C   
   ?? 5D       ?? 
StartPoint$	 0,0&?6"    ?? EndPoint$	 1,1&?63   .??5E      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   6:   ? 5F      $ #ffff??6   $
 0.75Q?6-   6=   5H      ._?5K   
   ?  ? ColumnDefinitions 5M      ?? 5N      $	??150 ?6#   ?? 5O      $??* ?6#   .+?5T      ?? $ 	10,0,0,10??6   $??0,0,0,0q?5U      $??0??5V      ??5X      ?? 5Y      $	 0,0&?6*   $	 1,1&?6;   .??5[      ? $ #FFFFFF??6'   $
 0.75Q?67   6G   5]      5a      ?? 5c      $ 	0,10,10,0??6   $??0,1,1,1q?5d      
???????$??1??5f      ._?5q      ? $??0,0,0,-1q?6    ? RowDefinitions 5r      ?? 5s      $??25 ?6(   ?? 5t      $??45 ?6(   ?? 5u      $??* ?6(   .+?5w      ?? $	 180??6   ???	#FFCC8022$??839,0,11,338q?6G   $??2??6]   ?? 5x      $ 10??6   
???   ?$??2??6C   $??832,120,3,388q?6P   ?? 5y      $ 90??6   $??886,27,57,439q?6/    J? RenderTransformOrigin$ 0.5,0.5&?6F   $??1??6f   $??2??6s   ??5z      ?? 5{       j? Stretch$
 Fill=?6)    ?? ImageSource 68   ?? *	imageuser+6\   5}      ?? 5~      $??20(?6    $??863,130,33,401q?6D   $??2??6\   
??????? ?? TextAlignment$ Center=?6|   ??6.   ?? *name+6|   ?? 5      
???????$ 10??60   $??832,172,3,18q?6B   $??2??6X   &   System.Windows.Controls.Calendar  5?      .  (MaterialDesignThemes.Wpf.ElevationAssist   	Elevation$	 Dp8=?5?       , (MaterialDesignCalendarPortraitForeground#??[ 5?      $??839,176,10,21q?6E   $??2??6\   ? 5?      $??0??6   .+?5?      ??  ?? Orientation$ 
Horizontal=?6%   ???#6038145?   %   5?      ? 5?      $??1??6    5?      ?? 5?      ?? 5?      .+?5?      ?? $??0??6%   $ 
Horizontal=?5?   %   $??Center=?5?   %   .+?5?      !  FontAwesome.Sharp.IconImage  $??30??5?   *   $??30??5?   *   $??	35,0,10,0q?5?   *   ?  ?FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.1.1.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   
Foreground
 ?   ?   Icon 5?   *   ?? *Icon+5?   *   ?? 5?      $??18(?5?   (   $
??Bold"?5?   (   $??15,0,0,0q?5?   (   $??Center=?5?   (   
???   ???5?   (   ?? *	Caption+5?   )   5?      5?      ?? 5?      $??2??5?   %   $??20,5,262,18q?5?   %   ??5?   %   ?? *CurrentChildView+5?   %   5?      5?      ?? 5?      $	??150??6   $	??Top=?6&   .+?5?      ?? $??\Image\LogoShop.png??6   $??
10,25,10,0q?5?      5?      ?? 5?      $??	-12,0,0,0q?6   .+?5?      	?   
menuButton#??[ 6   
  ? Tag$  #603814??5?      $??	0,150,0,0q?5?      ??5?      ?? *ShowHomeViewCommand+.??5?      ?? $ 
Horizontal=?6!   .+?5?        $
 Home=?6&     menuIcon#??[ 62   ?? 5?      $??13(?6$   $??TRANG CHỦ??62     menuButtonText#??[ 6C   5?      5?      	? 5?      #??[ 6   $  #603814??5?      $??0,10,0,0q?5?      ??5?      ?? *ShowMenuViewCommand+.??5?      ?? $ 
Horizontal=?6!   .+?5?        $
 Bars=?6&   #??[ 62   ?? 5?      $??13(?6$   $??THỰC ĐƠN??62   #??[ 6B   5?      5?      	? 5?      #??[ 6   $  #603814??5?      $??0,10,0,0q?5?      ??5?      ?? *ShowCustomerViewCommand+.??5?      ?? $ 
Horizontal=?6!   .+?5?        $ PeopleGroup=?6&   #??[ 69   ?? 5?      $??13(?6$   $??KHÁCH HÀNG??62   #??[ 6D   5?      5?      	? 5?      #??[ 6   $  #603814??5?      $??0,10,0,0q?5?      ??5?      ?? *ShowOrdersViewCommand+.??5?      ?? $ 
Horizontal=?6!   .+?5?        $ ClockRotateLeft=?6&   #??[ 6=   ?? 5?      $??13(?6$   $??LỊCH SỬ??62   #??[ 6A   5?      5?      	? 5?      #??[ 6   $  #603814??5?      $??0,10,0,0q?5?      ??5?      ?? *ShowTableViewCommand+.??5?      ?? $ 
Horizontal=?6!   .+?5?        $ Gears=?6&   #??[ 63   ?? 5?      $??13(?6$   $
??BÀN??62   #??[ 6=   5?      5?      	? 5?      #??[ 6   $  #603814??5?      $??0,10,0,0q?5?      ??5?      ?? *ShowAccountViewCommand+.??5?      ?? $ 
Horizontal=?6!   .+?5?        $ PersonCircleCheck=?6&   #??[ 6?   ?? 5?      $??13(?6$   $??TÀI KHOẢN??62   #??[ 6C   5?      5?      5      ?? 5     
???????$??THOÁT??5     ???	#FF603814???	#FF581815$ 0.474,1.289&?5  ?   $??10,581,10,17q?6?   $??14(?6?   $
??Bold"?6?   ??5     ?? *CloseCommand+??5     ?? $ 
mainWindow??{?5     ?? *DataContext.ControlsEnabled+! ?? RelativeSource! ?? *FindAncestor+" ?? AncestorType$" WindowL?6?   5     5	     5
     