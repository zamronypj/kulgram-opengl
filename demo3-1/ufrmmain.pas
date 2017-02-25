unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, renderer, renderTime, vectorOperation;

type

  { TPyramid }

  TPyramid = class(TForm)
    OpenGLControl1: TOpenGLControl;
    Timer1: TTimer;
    procedure OpenGLControl1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
    rendererObj : IRenderer;
    renderTimeObj : IRenderTime;
    vectorObj : IVectorOperation;

  public
    { public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
  end;

var
  Pyramid: TPyramid;

implementation
uses OpenGLRendererFactory, rendererPrimitive, matrixUtility, vectorUtility,
  vectorType, VectorSSEOperation,
  basicrenderTime;
{$R *.lfm}

{ TPyramid }

procedure TPyramid.OpenGLControl1Paint(Sender: TObject);
var primitiveObj : IRendererPrimitive;
    pos, target, up : TVector;
    cameraPosX, cameraPosZ, sina, cosa : single;
begin
  renderTimeObj.startTiming();
  sina := sin(renderTimeObj.totalElapsedTimeInSec());
  cosa := cos(renderTimeObj.totalElapsedTimeInSec());
  rendererObj.clearColor(sina, sina*cosa, cosa, 1.0);

  rendererObj.setMatrixMode(rendererObj.getProjectionMatrixType());
  rendererObj.setIdentityMatrix();
  rendererObj.perspective(45.0, OpenGLControl1.Width/OpenGLControl1.Height, -2, 10);
  rendererObj.clear(rendererObj.getClearColorBufferBit() or
                    rendererObj.getClearDepthBufferBit());


  rendererObj.setMatrixMode(rendererObj.getModelViewMatrixType());
  rendererObj.setIdentityMatrix();

  cameraPosX := sina * 0.5;
  cameraPosZ := cosa * 0.5;

  pos := vectUtil.vector(cameraPosX, 1, cameraPosZ, 1);
  target := vectUtil.vector(0,0,0, 1);
  up := vectUtil.vector(0, 1, 0, 1);
  rendererObj.mulMatrix(matUtil.lookAt(vectorObj, pos, target, up));

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
  renderTimeObj.endTiming();
end;

procedure TPyramid.Timer1Timer(Sender: TObject);
begin
  OpenGLControl1.invalidate();
end;

constructor TPyramid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  rendererObj := TOpenGLRendererFactory.create();
  vectorObj := TSSEVectorOperation.create();
  rendertimeObj := TBasicRenderTime.Create();
  renderTimeObj.init();
end;

destructor TPyramid.Destroy();
begin
  rendererObj := nil;
  vectorObj := nil;
  rendertimeObj := nil;
  inherited Destroy();
end;

end.

