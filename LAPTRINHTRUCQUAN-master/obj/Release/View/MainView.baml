   M S B A M L   `   `   `  ???? F  BQUANLICAPHE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QUANLICAPHE.ViewQUANLICAPHE.View  =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel      QUANLICAPHE.View.MainView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  *localclr-namespace:QUANLICAPHE.View  3	viewModel#clr-namespace:QUANLICAPHE.ViewModel  X TFontAwesome.Sharp, Version=6.1.1.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fEf=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     ?Name$  
mainWindow?? ? WindowStyle$
 None=? ? 
ResizeMode$ NoResize=? ? WindowStartupLocation$ CenterScreen=?
??????  ? AllowsTransparency .  ? Title$ 
MainWindow??$	??630??$
??1240??   MaterialDesignBody#???   $??Regular"?$??13(?&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=?   TextRenderingMode$
 Auto=?  MaterialDesignFont#???  .  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger  	   	EventName$	 Loaded??.  (System.Windows.Interactivity.TriggerBase
   Actions.
 6  0System.Windows.Interactivity.InvokeCommandAction     Command ?? *LoadedWindowCommand+   CommandParameter ??  ?? ElementName$ 
mainWindow?? ? DataContext )   #QUANLICAPHE.ViewModel.MainViewModel   ? 	Resources   	Converter ?? DataType)   #QUANLICAPHE.ViewModel.HomeViewModel   QUANLICAPHE.View.HomeView)	   #QUANLICAPHE.ViewModel.MenuViewModel
   QUANLICAPHE.View.MenuView(   "QUANLICAPHE.ViewModel.PayViewModel   QUANLICAPHE.View.Payment-   'QUANLICAPHE.ViewModel.CustomerViewModel#   QUANLICAPHE.View.CustomerView+   %QUANLICAPHE.ViewModel.OrdersViewModel!   QUANLICAPHE.View.OrdersView*   $QUANLICAPHE.ViewModel.TableViewModel    QUANLICAPHE.View.TableView,   &QUANLICAPHE.ViewModel.AccountViewModel"   QUANLICAPHE.View.AccountView-   'QUANLICAPHE.ViewModel.RegisterViewModel   QUANLICAPHE.View.Register??%  &	       (??      *, +)(??      *,	 +)(?? )     *, +)(?? ;     *, +)(?? M     *, +)(?? _     *, +)(?? q     *, +)(?? ?     *, +)?? ?? "  .R?  ?? " 	 .R?
  ?? "  .R?  ?? "  .R?  ?? "  .R?  ?? "  .R?  ?? "  .R?  ?? "  .R?  .????  ?? CornerRadius$ 10??$??0q?????  ?? 
StartPoint$	 0,0&? ?? EndPoint$	 1,1&?.???  ? Color$ Black?? ? Offset$ 0Q?? $ #ffff??$
 0.75Q?._??  ? ColumnDefinitions ?? $	??150 ??? $??* ?.+??? $ 	10,0,0,10??$??0,0,0,0q?$??0?????? $	 0,0&?$	 1,1&?.??? $ #FFFFFF??$
 0.75Q??? $ 	0,10,10,0??$??0,1,1,1q?
???????$??1??._?? $??0,0,0,-1q? ?? $
??311* ??? $??0* ??? $
??778* ? ? RowDefinitions ?? $??25 ??? $??45 ??? $??* ?.+??? $	 180?????	#FFCC8022$??522,0,17,338q?$??2??$??2???? $	 180?????	#FF612B05$??571,20,55,442q?$??2??$??1??$??2???? $ 10??
???   ?$??2??$??514,121,10,387q?$??2???? $	 180??$??574,22,58,444q? J? RenderTransformOrigin$ 0.5,0.5&?$??1??$??2??$??2??????  j? Stretch$
 Fill=? ?? ImageSource ?? *	imageuser+?? $??20(?$??545,132,41,399q?$??2??
??????? ?? TextAlignment$ Center=?$??2?????? *
stringType+?? ???#cc8022$ 10??$??514,172,10,18q?$??2??$??2??._??  ?? $??70 ??? $??70 ??? $??70 ??? $??70 ?.+?#  MaterialDesignThemes.Wpf.Chip  $
??Bold"?$??16(????#f5deb3???#412A10 ? Cursor$ Arrow??   IconBackground ?#603814   IconForeground
 ?????$??60??$	??254??$??0??$??0,5,0,5q?$??Center=????? *hoten+   Icon '  !MaterialDesignThemes.Wpf.PackIcon      Kind$
  User=?  $
??Bold"????#412A10$??12(?$ Arrow?????#f5deb3 ?#603814
 ?????$??60??$	??254??$??0,5,0,5q?$??Center=?$??1?????? *email+   $  Email=?  $
??Bold"????#412A10$??16(?$ Arrow?????#f5deb3 ?#603814
 ?????$??60??$	??254??$??2??$??0,5,0,5q?$??Center=????? *sdt+   $  Phone=?  $
??Bold"????#412A10$??16(?$ Arrow?????#f5deb3 ?#603814
 ?????$??60??$	??254??$??3??$??0,5,0,5q?$??Center=????? *diachi+   $  AddressMarker=??? $	 180?????	#FFCC8022$??833,0,17,338q?$??2???? $	 180?????	#FF612B05$	??142??$	??152??$??880,16,53,438q?$??2??$??1???? $ 10??
???   ?$??2??$??825,121,10,387q??? $	 180??$??885,22,58,444q?$ 0.5,0.5&?$??1??$??2?????? $
 Fill=? ?? *	imageuser+?? $??20(?$??856,132,41,399q?$??2??
???????$ Center=????? *name+?? 
???????$ 10??$??832,172,3,18q?$??2??&   System.Windows.Controls.Calendar  .  (MaterialDesignThemes.Wpf.ElevationAssist!   	Elevation$	! Dp8=? , (MaterialDesignCalendarPortraitForeground#??[ $??827,172,11,10q?$??2??? $??0??$??3??.+??? " ?? Orientation$" 
Horizontal=????#603814? $??1??$??3?? ?? ?? .+??? $??0??$" 
Horizontal=?$??Center=?.+?!  FontAwesome.Sharp.IconImage  $??30??$??30??$??	35,0,10,0q??  ?FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.1.1.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]#   
Foreground# ?	#FF612B05$   Icon$ ?? *Icon+?? $??18(?$
??Bold"?$??15,0,0,0q?$??Center=????	#FF612B05???? *	Caption+?? $??2??$??10,5,272,10q?$??3?????? *CurrentChildView+?? $	??150??$	??Top=?.+??? $??\Image\LogoShop.png??$??
10,25,10,0q??? $??	-12,0,0,0q?.+?	?   
menuButton#??[ 
% ? Tag$% #603814??$??	0,150,0,0q????? *ShowHomeViewCommand+& d? 	IsChecked& ?? *defaultCheck+.???? $" 
Horizontal=?.+?  $
$ Home=?  menuIcon#??[ ?? $??13(?$??TRANG CHỦ??  menuButtonText#??[ 	? #??[ $% #603814??$??0,10,0,0q????? *ShowMenuViewCommand+.???? $" 
Horizontal=?.+?  $
$ Bars=?#??[ ?? $??13(?$??THỰC ĐƠN??#??[ 	? #??[ $% #603814??$??0,10,0,0q????? *ShowPaymentCommand+.???? $" 
Horizontal=?.+?  $$ CashRegister=?#??[ ?? $??13(?$??THANH TOÁN??#??[ 	? #??[ $% #603814??$??0,10,0,0q????? *ShowCustomerViewCommand+.???? $" 
Horizontal=?.+?  $$ PeopleGroup=?#??[ ?? $??13(?$??KHÁCH HÀNG??#??[ 	? #??[ $% #603814??$??0,10,0,0q????? *ShowOrdersViewCommand+.???? $" 
Horizontal=?.+?  $$ ClockRotateLeft=?#??[ ?? $??13(?$??LỊCH SỬ??#??[ 	? #??[ $% #603814??$??0,10,0,0q????? *ShowTableViewCommand+.???? $" 
Horizontal=?.+?  $$ Table=?#??[ ?? $??13(?$
??BÀN??#??[ 	? #??[ $% #603814??$??0,10,0,0q????? *ShowAccountViewCommand+.???? $" 
Horizontal=?.+?  $$ PersonCircleCheck=?#??[ ?? $??13(?$??TÀI KHOẢN??#??[ 	? #??[ $% #603814??$??	-4,10,0,0q?y??? *
Visibility+' ?? 	Converter#' [ ???? *ShowRegister+.???? $" 
Horizontal=?.+?  $$ Person=?#??[ ?? $??13(?$??4 0 0 0q?$??
ĐĂNG KÝ??#??[ ?? 
???????$??THOÁT?????	#FF603814???	#FF581815$ 0.474,1.289&?$??10,581,10,17q?$??14(?$
??Bold"????? *CloseCommand+???? $ 
mainWindow??{??? *DataContext.ControlsEnabled+( ?? RelativeSource( ?? *FindAncestor+) ?? AncestorType$) WindowL?