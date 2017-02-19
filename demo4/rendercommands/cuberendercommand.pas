unit cubeRenderCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, standardRenderCommand;

type

    { TRenderCube }

    TRenderCube = class(TStandardRenderCommand)
    private
      totalTime : single;
    protected
      function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
    end;

implementation
uses rendererPrimitive, matrixUtility;
{ TRenderCube }

function TRenderCube.doRender(const renderer: IRenderer; const elapsedTimeInSecs: single): cardinal;
var prim: IRendererPrimitive;
    sina, cosa : single;
begin
  totalTime := totalTime + elapsedTimeInSecs;
  sina := sin(totalTime);
  cosa := cos(totalTime);

  renderer.setMatrixMode(renderer.getModelViewMatrixType());
  renderer.setIdentityMatrix();
  renderer.mulMatrix(TMatrixUtility.rotateY(sina, cosa));
  prim := renderer.getPrimitive();
  renderer.beginPrimitive(prim.triangles());

  //front face
  renderer.color3f(1.0*sina, 1.0*cosa, 1.0);
  renderer.vertex3f(-1.0, -1.0, 0.0);
  renderer.vertex3f(-1.0, 1.0, 0.0);
  renderer.vertex3f(1.0, -1.0, 0.0);
  renderer.vertex3f(1.0, -1.0, 0.0);
  renderer.vertex3f(-1.0, 1.0, 0.0);
  renderer.vertex3f(1.0, 1.0, 0.0);

  //left face
  renderer.color3f(1.0*cosa, 1.0*sina, 1.0);
  renderer.vertex3f(-1.0, -1.0, -1.0);
  renderer.vertex3f(-1.0, 1.0, -1.0);
  renderer.vertex3f(-1.0, -1.0, 0.0);
  renderer.vertex3f(-1.0, -1.0, 0.0);
  renderer.vertex3f(-1.0, 1.0, -1.0);
  renderer.vertex3f(-1.0, 1.0, 0.0);

  //back face
  renderer.color3f(1.0*cosa, 1.0, 1.0*sina);
  renderer.vertex3f(-1.0, -1.0, -1.0);
  renderer.vertex3f(-1.0, 1.0, -1.0);
  renderer.vertex3f(1.0, -1.0, -1.0);
  renderer.vertex3f(1.0, -1.0, -1.0);
  renderer.vertex3f(-1.0, 1.0, -1.0);
  renderer.vertex3f(1.0, 1.0, -1.0);

  //right face
  renderer.color3f(1.0, 1.0*cosa, 1.0*sina);
  renderer.vertex3f(1.0, -1.0, 0.0);
  renderer.vertex3f(1.0, 1.0, 0.0);
  renderer.vertex3f(1.0, -1.0, -1.0);
  renderer.vertex3f(1.0, -1.0, 0.0);
  renderer.vertex3f(1.0, 1.0, -1.0);
  renderer.vertex3f(1.0, 1.0, 0.0);

  renderer.endPrimitive();
  result := 0;
end;

end.

