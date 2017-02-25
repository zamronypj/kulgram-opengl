unit renderTriangleCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, standardRenderCommand;

type

   { TRenderTriangleCommand }

   TRenderTriangleCommand = class(TStandardRenderCommand)
   private
     totalTime : single;
   protected
     function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
   end;

implementation
uses rendererPrimitive, matrixUtility;

{ TRenderTriangleCommand }

function TRenderTriangleCommand.doRender(const renderer : IRenderer; const elapsedTimeInSecs: single): cardinal;
var prim: IRendererPrimitive;
    sina, cosa : single;
begin
  totalTime := totalTime + elapsedTimeInSecs;
  sina := sin(totalTime);
  cosa := cos(totalTime);

  renderer.setMatrixMode(renderer.getModelViewMatrixType());
  renderer.setIdentityMatrix();
  renderer.mulMatrix(TMatrixUtility.scale(1.0*sina, 1.0*cosa, 1.0));
  prim := renderer.getPrimitive();
  renderer.beginScene(prim.triangles());
  renderer.color3f(1.0*sina, 1.0*cosa, 1.0);
  renderer.vertex3f(-1.0, 0.0, 0.0);
  renderer.vertex3f(0.0, 1.0, 0.0);
  renderer.vertex3f(1.0, 0.0, 0.0);
  renderer.endScene();
  result := 0;
end;

end.

