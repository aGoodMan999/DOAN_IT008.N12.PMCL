   M S B A M L   `   `   `  ???? F  BQUANLICAPHE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QUANLICAPHE.ViewQUANLICAPHE.View  =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel  =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel  E'clr-namespace:QUANLICAPHE.CustomControlQUANLICAPHE.CustomControl      QUANLICAPHE.View.Register   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:QUANLICAPHE.View     9	viewmodel#clr-namespace:QUANLICAPHE.ViewModel     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  3	viewModel#clr-namespace:QUANLICAPHE.ViewModel  ;customcontrol'clr-namespace:QUANLICAPHE.CustomControl  _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     >?Name$  
RegisterVM??$	??530??$	??800??   MaterialDesignBody#???   $??Regular"?$??18(?&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=?   TextRenderingMode$
 Auto=?
??????   MaterialDesignFont#???   ? DataContext -   'QUANLICAPHE.ViewModel.RegisterViewModel  .???? 
??????? ?? CornerRadius$ 30??._??  ? RowDefinitions ?? $
??Auto ??? .+?? $??0??$??45??$	??Top=?? $??1?? ? ColumnDefinitions ?? $	??250 ??? .+?? $??0??.+??? $ 10??$??1q?
???   ?$??54,111,54,234q?._??? $	??120??$	??120??$
??Fill=????? *	imageuser+?? $	??100??3  -MaterialDesignThemes.Wpf.ButtonProgressAssist   IsIndeterminate .    IsIndicatorVisible . 	   Value$	 -1Q?$??Chọn ảnh??  MaterialDesignRaisedButton#??[ ???	#FFDA601A
 J? RenderTransformOrigin$
 0.464,1.251&?$??65,277,85,176q????? *SelectImage+{??? *DataContext.ControlsEnabled+ ?? RelativeSource ?? *FindAncestor+ ?? AncestorType" ?? $??1??$??	0,-14,0,0q? ?? $
??397* ??? $	??53* ?.+??? $??
ĐĂNG KÍ??$??28(????	#FFBF5026$
??Bold"?$??181,20,181,445q?$
 0.528,0.471&??? $	??Top=?)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên Đăng Nhập??$??18(? % !MaterialDesignFloatingHintTextBox#??[ $??10,83,299,0q?$
 0.478,0.644&????? *
username+G? -    G?Name$ FloatingPasswordBox??$??18(?   
Foreground
 ?**??$ Mật Khẩu??.  (MaterialDesignThemes.Wpf.TextFieldAssist   UnderlineBrush
 ?**?? ) %MaterialDesignFloatingHintPasswordBox#??[ $??275,75,58,369q?$??2??.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ PasswordChanged??.  (System.Windows.Interactivity.TriggerBase   Actions. 6	  0System.Windows.Interactivity.InvokeCommandAction	   	  Command ?? *PasswordChangedCommand+ 	  CommandParameter ??  ?? ElementName$ FloatingPasswordBox???? $	??Top=?$ 	Họ Tên??$??18(?#??[ $??10,142,299,0q????? *hoten+?? -    ??Name$
 cbb1??$??56??$ Giới Tính??   HasClearButton .  ?? SelectedValuePath$ Content?? " MaterialDesignOutlinedComboBox#??[ $
 1.247,-0.93&?$	??Top=?$??275,142,58,0q?$??18(?$??2?? ?? SelectedValue ?? *SelectedSex+.@??? .??Nam?? .??Nữ(
  "System.Windows.Controls.DatePicker
  $??18(?$ 
Ngày Sinh?? .  ( $MaterialDesignFloatingHintDatePicker#??[ $??10,203,299,0q?$	??Top=? 
  SelectedDate ?? *
ngaysinh+ ?? UpdateSourceTrigger$ PropertyChanged=??? -   $	??Top=?$ Số Điện Thoại??$??18(?#??[ $??275,203,58,0q?$??2?????? *sdt+?? $	??Top=?$ Email??$??18(?#??[ $??10,327,58,0q?$??2?????? *email+?? $	??Top=?$ Địa Chỉ??$??18(?#??[ $??10,263,58,0q?$??2?????? *diachi+?? $	??150??$??40??$??18(?+  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10??#??[ $??154,403,181,56q????	#FF963621???? *RegisterCommand+{??? *DataContext.ControlsEnabled+ ?? *FindAncestor+$ WindowL?.???? $??
Đăng Kí??