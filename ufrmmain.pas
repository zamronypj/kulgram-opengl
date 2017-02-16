unit ufrmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, OpenGLContext, gl, renderer;

type

  { TForm1 }

  TForm1 = class(TForm)
  private
    { private declarations }
    renderer : IRenderer;
  public
  published
    OpenGLControl1: TOpenGLControl;
    procedure render(Sender: TObject);
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation
uses openglrenderer;

{$R *.lfm}

procedure TForm1.render(Sender: TObject);
begin
  renderer.clearColor(0.27, 0.53, 0.71, 1.0);
  renderer.clear(CLEAR_COLOR_BUFFER or CLEAR_DEPTH_BUFFER);
  renderer.setIdentityMatrix();
  renderer.beginPrimitive(PRIMTYPE_TRIANGLES);
  renderer.color3f(1, 0, 0);
  renderer.vertex3f( 0.0, 1.0, 0.0);
  renderer.color3f(0, 1, 0);
  renderer.vertex3f(-1.0,-1.0, 0.0);
  renderer.color3f(0, 0, 1);
  renderer.vertex3f( 1.0,-1.0, 0.0);
  renderer.endPrimitive();
  OpenGLControl1.SwapBuffers;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  renderer := TOpenGLRenderer.Create();
end;


end.

