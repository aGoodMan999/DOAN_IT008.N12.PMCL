   M S B A M L   `   `   `  ????F  BQUANLICAPHE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QUANLICAPHE.ViewQUANLICAPHE.View  5   	   =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel  5   	   E'clr-namespace:QUANLICAPHE.CustomControlQUANLICAPHE.CustomControl  5   	       QUANLICAPHE.View.Register   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:QUANLICAPHE.View     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   3	viewModel#clr-namespace:QUANLICAPHE.ViewModel  5   	   ;customcontrol'clr-namespace:QUANLICAPHE.CustomControl  5   	   _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5          ?Name$  
RegisterVM??5
   	    ? Title$ Register??5	   	   $	??450??6   $	??700??6'      MaterialDesignBody#???   5      $??Regular"?5      $??18(?5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=?5         TextRenderingMode$
 Auto=?5       ? AllowsTransparency . 
??????   MaterialDesignFont#???  5       ? 
ResizeMode$ NoResize=?5   	    ? WindowStyle$
 None=?5   	    ? WindowStartupLocation$ CenterScreen=?5   	    ? DataContext 5      -   'QUANLICAPHE.ViewModel.RegisterViewModel  5   
   6(   .??5       ?? 
???????	 ?? CornerRadius$	 30??6    ._?5!   
   ? 
 ? RowDefinitions
 5"      ?? 5#      $
??Auto ?6    60   ?? 5$      6"   .+?5&      ? $??0??6   $??45??6    $	??Top=?6,   .+?5'      ?? $??50??5(      
??????????	#DDFF0000???	#FF581815$??621,13,29,0q?5,   ?    J? RenderTransformOrigin$ 0.474,1.289&?6?   ??5*      ?? *CloseCommand+??5+      ??  ?? ElementName$ 
RegisterVM??{?5,      ?? *DataContext.ControlsEnabled+ ?? RelativeSource ?? *FindAncestor+ ?? AncestorType$ WindowL?6?   '  !MaterialDesignThemes.Wpf.PackIcon  5-         Kind$ WindowClose=?6*   $??24??6=   $??24??6H   $??
634,17,0,0q?6T   $ 0.529,-0.288&?6h   5.      ? 5/      $??1??6    ? ColumnDefinitions 50      ?? 51      $	??250 ?6'   65   ?? 52      6)   .+?54      ? $??0??6   .+?55      ?? $	 10??6   $??1q?60   
???   ?$??56,84,55,180q?6X   ._?56      ?? $	??120??6    $	??120??6-   $
??Fill=?69   ??6H   ?? *	imageuser+57      ?? 58      $	??100??6   3  -MaterialDesignThemes.Wpf.ButtonProgressAssist   IsIndeterminate .    IsIndicatorVisible .    Value$ -1Q?5;      $??Chọn ảnh??5<        MaterialDesignRaisedButton#??[ 5?      ???	#FFDA1A1A$ 0.464,1.251&?6d   $??75,266,75,107q?6?   ??5=      ?? *SelectImage+{?5>      ?? *DataContext.ControlsEnabled+ ?? *FindAncestor+" ?5?   ?   5@      ? 5A      $??1??6   $??	0,-14,0,0q?6'   .+?5B      ?? $??
ĐĂNG KÍ??6    $??28(?6/   ???	#FFA91F09$
??Bold"?6U   $??70,15,250,371q?6g   ?? 5C      $	??200??6   $	??Top=?5E      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên Đăng Nhập??5F      $??18(?5G       % !MaterialDesignFloatingHintTextBox#??[ 5H      $??
0,49,250,0q?6T   ??5D      ?? *
username+5H   T   G? 5I      -   5         G?Name$ FloatingPasswordBox??5L      $	??200??5J      $??18(?5K         
Foreground
 ?**??$ Mật Khẩu??5N      .  (MaterialDesignThemes.Wpf.TextFieldAssist   UnderlineBrush
 ?**?? ) %MaterialDesignFloatingHintPasswordBox#??[ 5P      $??240,49,10,322q?6X   .  (System.Windows.Interactivity.Interaction   Triggers 5Q      /  )System.Windows.Interactivity.EventTrigger  5R         	EventName$ PasswordChanged??6-   .	  (System.Windows.Interactivity.TriggerBase 	  Actions. 5S   "   6
  0System.Windows.Interactivity.InvokeCommandAction
   
  Command 68   ?? *PasswordChangedCommand+ 
  CommandParameter 6c   ?? $ FloatingPasswordBox??5T      5V      ?? 5W      $	??200??6   $	??Top=?5Y      $ 	Họ Tên??5Z      $??18(?5[      #??[ 5\      $??0,102,250,0q?6T   ??5X      ?? *hoten+5\   T   ?? 5]      -   5         ??Name$
 cbb1??5^      $??55??5_      $ Giới Tính??5`         HasClearButton .  ?? SelectedValuePath$ Content??5c       " MaterialDesignOutlinedComboBox#??[ 5e      $ 1.247,-0.93&?6R   $	??Top=?6v   $??240,112,10,0q?6?   $??18(?6?     ?? SelectedValue  5b      ?? *SelectedSex+.@?5f      ?? .??6'   Nam6,   ?? 5g      .??6'   Nữ6+   5h      (  "System.Windows.Controls.DatePicker  5i      $??18(?5j      $ 
Ngày Sinh??5l       .  ( $MaterialDesignFloatingHintDatePicker#??[ 5o      $??0,173,250,0q?6W   $	??Top=?6l   !   SelectedDate! 5k      ?? *
ngaysinh+" ?? UpdateSourceTrigger$" PropertyChanged=?5o   l   ?? 5p      $	??200??6   $	??Top=?5s      $ Số Điện Thoại??5t      $??18(?5u      #??[ 5v      $??240,176,10,0q?6T   ??5r      ?? *sdt+5v   T   ?? 5w      $	??Top=?5y      $ Email??5z      $??18(?5{      #??[ 5|      $??
0,280,10,0q?6T   ??5x      ?? *email+5|   T   ?? 5}      $	??Top=?5      $ Địa Chỉ??5?      $??18(?5?      #??[ 5?      $??
0,228,10,0q?6T   ??5~      ?? *diachi+5?   T   ?? 5?      $	??150??5?      $??40??5?      $??18(?5?      +  %MaterialDesignThemes.Wpf.ButtonAssist#   CornerRadius$# 10??5?      #??[ 5?      $??145,349,155,29q?5?      ???	#FF962121??5?      ?? *RegisterCommand+{?5?      ?? *DataContext.ControlsEnabled+ ?? *FindAncestor+$ WindowL?.??5?      ?? $??
Đăng Kí??5?      5?      5?      5?      5?      5?      5?      