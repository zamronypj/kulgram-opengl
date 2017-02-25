unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, renderer, renderQueue;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    procedure OpenGLControl1Paint(Sender: TObject);
  private
    { private declarations }
    rendererObj : IRenderer;
    queueObj : IRenderQueue;

  public
    { public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
  end;

var
  Form1: TForm1;

implementation
uses OpenGLRendererFactory;
{$R *.lfm}

{ TForm1 }

procedure TForm1.OpenGLControl1Paint(Sender: TObject);
begin
  rendererObj.clear(rendererObj.getClearColorBufferBit() or
                    rendererObj.getClearDepthBufferBit());
  rendererObj.beginScene(rendererObj.getPrimitive().triangles());
  rendererObj.color3f(1.0, 0.0, 0.0);
  rendererObj.vertex3f(-1.0, -1.0, 0.0);

  rendererObj.color3f(0.0, 1.0, 0.0);
  rendererObj.vertex3f(0.0, 1.0, 0.0);

  rendererObj.color3f(0.0, 0.0, 1.0);
  rendererObj.vertex3f(1.0, -1.0, 0.0);
  rendererObj.endScene();
  OpenGLControl1.swapBuffers();
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  rendererObj := TOpenGLRendererFactory.create();
end;

destructor TForm1.Destroy();
begin
  rendererObj := nil;
  inherited Destroy();
end;

end.

