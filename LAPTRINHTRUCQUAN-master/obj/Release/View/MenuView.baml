   M S B A M L   `   `   `  ???? F  BQUANLICAPHE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QUANLICAPHE.ViewQUANLICAPHE.View  =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel  =#clr-namespace:QUANLICAPHE.ViewModelQUANLICAPHE.ViewModel      QUANLICAPHE.View.MenuView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     0localclr-namespace:QUANLICAPHE.View     9	viewmodel#clr-namespace:QUANLICAPHE.ViewModel     9	viewModel#clr-namespace:QUANLICAPHE.ViewModel     _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     >?Name$  MenuVM??   MaterialDesignBody#???   $??Regular"?$??13(?&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=?   TextRenderingMode$
 Auto=?
??????   MaterialDesignFont#???   ? DataContext )   #QUANLICAPHE.ViewModel.MenuViewModel   ? 	Resources &    QUANLICAPHE.View.AddFoodCategory  AddFoodCategory4   .QUANLICAPHE.ViewModel.AddFoodCategoryViewModel  	Converter??%&   &	       &	        .??  ?? .????  ?? CornerRadius$ 10??$??1q?._??  ? RowDefinitions ?? $
??auto ??? .+?#  MaterialDesignThemes.Wpf.Card  $??0??$??80??.??? $??Right=?.+??? $??20q?$??80??$??Thêm?????	#FF6B4309$??16(?y???  ?? Path$ IsAdmin? ?? 	Converter# [ ???? *	AddFood+{??? *DataContext.ControlsEnabled+	 ?? RelativeSource	 ?? *FindAncestor+
 ?? AncestorType$
 WindowL??? $??
0 20 20 20q?$??80??$
??Xóa?? , (MaterialDesignRaisedSecondaryLightButton#??[ ???	#FF6B4309$??16(?y??? $ IsAdmin?# [ ???? *
DeleteFood+{??? *DataContext.ControlsEnabled+	 ?? *FindAncestor+"
 ??? -   $??
0 20 20 20q?$??80??$??Sửa??#??[ ???	#FF6B4309$??16(?y??? $ IsAdmin?# [ ???? *
EditFood+{??? *DataContext.ControlsEnabled+	 ?? *FindAncestor+"
 ??? $	??109??$??Thêm loại?????	#FF883B0F$??16(?y??? $ IsAdmin?# [ ???? *OpenLoaiThucAn+????  ?? ElementName$ MenuVM??{??? *DataContext.ControlsEnabled+	 ?? *FindAncestor+$
 WindowL??? $??	10 10 0 0q?)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Danh mục??.  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .  ?? DisplayMemberPath$
 name?? " MaterialDesignOutlinedComboBox#??[  J? RenderTransformOrigin$ 1.247,-0.93&?$	??238??$??16(????? *ListFoodCategory+ ?? SelectedItem ?? *SelectedFoodCategory+ ?? Mode$ TwoWay=? ?? UpdateSourceTrigger$ PropertyChanged=??? $	??100??$??10 10 10 10q?3  -MaterialDesignThemes.Wpf.ButtonProgressAssist   IsIndeterminate .    IsIndicatorVisible .    Value$ -1Q?$??Tìm Kiếm??  MaterialDesignRaisedButton#??[ ???	#FFE08C13$??16(????? *Search+{??? *DataContext.ControlsEnabled+	 ?? *FindAncestor+"
 ?? $??1?? ? ColumnDefinitions ?? $
??auto ??? .+?? $??0??$??0 5 0 0q?.+?  .???? $
??Auto=?.???? -   $	??397??$	??578??$??5q????	#FF6B4309$??Disabled=????? *List+ ?? *SelectedItem+$ PropertyChanged=?$ TwoWay=????? .R?? ???? .R??? $	??180??$	??170?????#cbd1cc
??? ???$??1q?$ 10?? ?? Padding$ 5q?._??  ?? ?? $
??auto ??? $
??auto ?.+?? $??0??$	??160??$	??130??????  ?? ImageSource ?? *	imageFood+? $??1??.+??? $
??Bold"?$??5q?$??14(?$??Center=?$??0?????? *name+? $??2??.+??? $??Center=?$??13(?$??1?????? *price+ ?? StringFormat$ {0:N0}???? $??1??
???????
??? ???$??1q?$ 10??$??5 5 0 0q?._?? .+??? $	??Top=?$ 	Tên món?? % !MaterialDesignFloatingHintTextBox#??[ $??
20,25,18,0q?$??14(????? *
NameFood+?? -    ??Name$ ListFoodCategory??$ Loại?? . $
 name??#??[ $ 1.247,-0.93&?$	??Top=?$??20,104,18,0q?$??14(????? *ListFoodCategory+$ PropertyChanged=?$ TwoWay=? ?? *SelectedFoodCategory+$ TwoWay=?$ PropertyChanged=??? -   $	??Top=?$
 Giá??#??[ $??20,185,18,0q?$??14(????? *Price+$ PropertyChanged=??? $	??100?? .  . $ -1Q?$??Chọn ảnh??#??[ ???	#FFDA1A1A$ 0.464,1.251&?$??52,260,51,119q?$??16(????? *	ImageFood+{??? *DataContext.ControlsEnabled+	 ?? *FindAncestor+"
 ??? $	??100??$	??100??$??\Image\LogoShop.png??$??52,274,51,-13q?