unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    AnimationTimer: TTimer;
    procedure AnimationTimerTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FClickCount : Longint;
  public
    {procedure Click; override;
    property ClickCount : Longint read FClickCount write FClickCount;  }
  end;

Const
  BALL_SPEED = 0.01;
  BALL_CENTER_X = 300;
  BALL_CENTER_Y = 200;
  BALL_RADIUS = 200;

var
  Form1: TForm1;
  background, backbuffer: TBitmap;
  ball: TBitmap;

implementation

{$R *.dfm}

Procedure ReDraw;
Var
  x, y: Integer;
  angle: Real;
begin
  {1. ������ ��� �� backbuffer}
  {1.1. ������ ��� (���� � ������)}
  backbuffer.Canvas.Draw(0, 0, background);

  {1.2. ������ ���, ��������� ���� �������� ���� �� ����� � �����������
   �� �������� �������}
  angle := GetTickCount;
  angle := angle * BALL_SPEED;

  x := BALL_CENTER_X + Round(cos(angle) * BALL_RADIUS);
  y := BALL_CENTER_Y + Round(sin(angle) * BALL_RADIUS);

  x := x - ball.width Div 2;
  y := y - ball.height Div 2;

  backbuffer.Canvas.Draw(x, y, ball);

  {2. ������������ backbuffer �� �����}
  Form1.Canvas.Draw(0, 0, backbuffer);
end;

procedure TForm1.AnimationTimerTimer(Sender: TObject);
begin
  {�������������� ��� �� �������}
  ReDraw;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  {�������������� ���, ����� ����� ����� �����������}
  ReDraw;
end;

procedure LoadImageOrDie(var bmp: TBitmap; fileName: string);
begin
  {�������� ��������� �����������}
  try
    bmp.LoadFromFile(fileName);
  except {���� �� ����������, �������� � ������� �� ����������}
    ShowMessage('���������� ��������� ����������� ' + fileName);
    Application.Terminate;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {������� bitmap ��� ������� ����}
  background := TBitmap.Create;
  LoadImageOrDie(background, 'sky.bmp');

  {������� bitmap ��� ������� ����}
  ball := TBitmap.Create;
  LoadImageOrDie(ball, 'ball.bmp');
  {����������� ������������ ����}
  ball.Transparent := true;
  ball.TransparentColor := clRed;

  {������� backbuffer, �������� � ������ ���}
  backbuffer := TBitmap.Create;
  backbuffer.width := background.width;
  backbuffer.height := background.height;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {�� ������ �� ����� ������� �����������}
  background.Free;
  backbuffer.Free;
  ball.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  {�������� �������� (�������� ������)}
  AnimationTimer.Enabled := true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  {��������� �������� (��������� ������)}
  AnimationTimer.Enabled := false;
end;

end.
