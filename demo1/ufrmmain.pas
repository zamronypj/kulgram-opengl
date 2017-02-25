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
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  published
    OpenGLControl1: TOpenGLControl;
    procedure render(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation
uses openglrenderer, openglrendererPrimitive, openglconstants;

{$R *.lfm}

procedure TForm1.render(Sender: TObject);
var clearColorBit, clearDepthBit : cardinal;
begin
  renderer.clearColor(0.27, 0.53, 0.71, 1.0);
  clearColorBit := renderer.getClearColorBufferBit();
  clearDepthBit := renderer.getClearDepthBufferBit();
  renderer.clear(clearColorBit or clearDepthBit);
  renderer.setIdentityMatrix();
  renderer.beginScene(renderer.getPrimitive().triangles());
  renderer.color3f(1, 0, 0);
  renderer.vertex3f( 0.0, 1.0, 0.0);
  renderer.color3f(0, 1, 0);
  renderer.vertex3f(-1.0,-1.0, 0.0);
  renderer.color3f(0, 0, 1);
  renderer.vertex3f( 1.0,-1.0, 0.0);
  renderer.endScene();
  OpenGLControl1.SwapBuffers;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  renderer := TOpenGLRenderer.Create(TOpenGLRendererPrimitive.Create());
end;

destructor TForm1.Destroy();
begin
  renderer := nil;
  inherited Destroy();
end;


end.

