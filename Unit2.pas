unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ShellAPI;

type
  TForm2 = class(TForm)
    PanelHaut: TPanel;
    ImgbordureHG1: TImage;
    ImgBordureHG2: TImage;
    ImgBordureHG3: TImage;
    ImgBordureHG4: TImage;
    ImgBordureHD1: TImage;
    ImgBordureHD2: TImage;
    ImgBordureHD3: TImage;
    ImgbordureHD4: TImage;
    ImgbordureH: TImage;
    PanelBas: TPanel;
    ImgBordureBG: TImage;
    ImgBordureB: TImage;
    ImgBordureBD: TImage;
    PanelClient: TPanel;
    ImgBordureG2: TImage;
    ImgBordureD: TImage;
    PopupMenu1: TPopupMenu;
    MenuMail: TMenuItem;
    MenuPagePerso: TMenuItem;
    N1: TMenuItem;
    MenuQuitter: TMenuItem;
    Nomform: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ImgbordureHD22: TImage;
    ImgBordureHD21: TImage;
    procedure ImgBordureHD3Click(Sender: TObject);
    procedure ImgBordureHD2Click(Sender: TObject);
    procedure ImgBordureHD1Click(Sender: TObject);
    procedure ImgBordureHG2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MenuMailClick(Sender: TObject);
    procedure MenuPagePersoClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;
  SourisDown:Boolean;
  SourisDown_X,SourisDown_Y:Integer;

implementation

{$R *.dfm}
{*******************************************************************************************}
procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{Début de déplacement de la form}
SourisDown:=True;
SourisDown_X:=X;
SourisDown_Y:=Y;
end;
{*******************************************************************************************}
procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
{Déplacement de la form}
If SourisDown=True Then
   Begin
   Form2.Left:=Form2.Left+X-SourisDown_X;
   Form2.Top :=Form2.Top +Y-SourisDown_Y;
   End;
end;
{*******************************************************************************************}
procedure TForm2.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{Fin de déplacement de la form}
SourisDown:=False;
end;
{*******************************************************************************************}
procedure TForm2.ImgBordureHD3Click(Sender: TObject);
begin
{Fermeture}
Close;
end;
{*******************************************************************************************}
procedure TForm2.ImgBordureHD2Click(Sender: TObject);
begin
{Maximisation/démaximisation de la form}
If Form2.WindowState=wsNormal Then
   Begin
   Form2.WindowState:=wsMaximized;
   ImgBordureHD2.Picture:=ImgBordureHD22.Picture;
   End
Else
   Begin
   Form2.WindowState:=wsNormal;
   ImgBordureHD2.Picture:=ImgBordureHD21.Picture;
   End;
end;
{*******************************************************************************************}
procedure TForm2.ImgBordureHD1Click(Sender: TObject);
begin
{Minimisation de la form}
Application.Minimize;
end;
{*******************************************************************************************}
procedure TForm2.ImgBordureHG2Click(Sender: TObject);
begin
{Ouverture du menu de la form}
PopupMenu1.Popup( Form2.Left+ImgBordureHG2.Left , Form2.Top+ImgBordureHG2.Height );
end;
{*******************************************************************************************}
procedure TForm2.MenuMailClick(Sender: TObject);
begin
{Exemple de premier menu}
ShellExecute(Handle,'Open','mailto:cgruais@wanadoo.fr','','',SW_SHOWNORMAL);
end;
{*******************************************************************************************}
procedure TForm2.MenuPagePersoClick(Sender: TObject);
begin
{Exemple de second menu}
ShellExecute(Handle,'Open','http://perso.wanadoo.fr/cgruais/','','',SW_SHOWNORMAL);
end;
{*******************************************************************************************}
end.
