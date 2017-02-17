unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, renderer;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    procedure OpenGLControl1Paint(Sender: TObject);
  private
    renderer : IRenderer;
    { private declarations }
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy(); override;
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
uses openglrenderer, openglconstants;
{$R *.lfm}

{ TForm1 }

procedure TForm1.OpenGLControl1Paint(Sender: TObject);
begin
  renderer.clearColor(1.0, 0.0, 0.0, 1.0);
  renderer.clear(CLEAR_COLOR_BUFFER or CLEAR_DEPTH_BUFFER);
  OpenGLControl1.SwapBuffers();
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  renderer := TOpenGLRenderer.Create();
end;

destructor TForm1.Destroy;
begin
  renderer := nil;
  inherited Destroy;
end;

end.

