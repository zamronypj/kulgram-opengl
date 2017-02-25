unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, renderer, renderQueue, vectorOperation;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    procedure OpenGLControl1Paint(Sender: TObject);
  private
    { private declarations }
    rendererObj : IRenderer;
    queueObj : IRenderQueue;
    vectorObj : IVectorOperation;

  public
    { public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
  end;

var
  Form1: TForm1;

implementation
uses OpenGLRendererFactory, rendererPrimitive, matrixUtility, vectorUtility,
  vectorType, VectorSSEOperation;
{$R *.lfm}

{ TForm1 }

procedure TForm1.OpenGLControl1Paint(Sender: TObject);
var primitiveObj : IRendererPrimitive;
    pos, target, up : TVector;
begin
  rendererObj.setMatrixMode(rendererObj.getProjectionMatrixType());
  rendererObj.setIdentityMatrix();
  rendererObj.perspective(45.0, OpenGLControl1.Width/OpenGLControl1.Height, -2, 100);
  rendererObj.clear(rendererObj.getClearColorBufferBit() or
                    rendererObj.getClearDepthBufferBit());


  rendererObj.setMatrixMode(rendererObj.getModelViewMatrixType());
  rendererObj.setIdentityMatrix();
  rendererObj.mulMatrix(matUtil.translate(0.5, 0.0, 0.0));
  //pos := vectUtil.vector(1,1,-1, 1);
  //target := vectUtil.vector(0,0,0, 1);
  //up := vectUtil.vector(0,1,0, 1);
  //rendererObj.mulMatrix(matUtil.lookAt(vectorObj, pos, target, up));

  //primitiveObj := rendererObj.getPrimitive();
  //rendererObj.beginScene(primitiveObj.triangles());
  //rendererObj.color3f(1.0, 0.0, 0.0);
  //rendererObj.vertex3f(-1.0, -1.0, 0.0);
  //
  //rendererObj.color3f(0.0, 1.0, 0.0);
  //rendererObj.vertex3f(0.0, 1.0, 0.0);
  //
  //rendererObj.color3f(0.0, 0.0, 1.0);
  //rendererObj.vertex3f(1.0, -1.0, 0.0);
  //rendererObj.endScene();

  primitiveObj := rendererObj.getPrimitive();
  with rendererObj do
  begin
    beginScene(primitiveObj.triangles());
    // Front
    color3f(1.0, 0.0, 0.0);     // Red
    vertex3f( 0.0, 1.0, 0.0);
    color3f(0.0, 1.0, 0.0);     // Green
    vertex3f(-1.0, -1.0, 1.0);
    color3f(0.0, 0.0, 1.0);     // Blue
    vertex3f(1.0, -1.0, 1.0);

    // Right
    color3f(1.0, 0.0, 0.0);     // Red
    vertex3f(0.0, 1.0, 0.0);
    color3f(0.0, 0.0, 1.0);     // Blue
    vertex3f(1.0, -1.0, 1.0);
    color3f(0.0, 1.0, 0.0);     // Green
    vertex3f(1.0, -1.0, -1.0);

    // Back
    color3f(1.0, 0.0, 0.0);     // Red
    vertex3f(0.0, 1.0, 0.0);
    color3f(0.0, 1.0, 0.0);     // Green
    vertex3f(1.0, -1.0, -1.0);
    color3f(0.0, 0.0, 1.0);     // Blue
    vertex3f(-1.0, -1.0, -1.0);

    // Left
    color3f(1.0, 0.0, 0.0);       // Red
    vertex3f( 0.0, 1.0, 0.0);
    color3f(0.0,0.0,1.0);       // Blue
    vertex3f(-1.0,-1.0,-1.0);
    color3f(0.0, 1.0, 0.0);       // Green
    vertex3f(-1.0,-1.0, 1.0);

    endScene();
  end;

  OpenGLControl1.swapBuffers();
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  rendererObj := TOpenGLRendererFactory.create();
  vectorObj := TSSEVectorOperation.create();
end;

destructor TForm1.Destroy();
begin
  rendererObj := nil;
  vectorObj := nil;
  inherited Destroy();
end;

end.

