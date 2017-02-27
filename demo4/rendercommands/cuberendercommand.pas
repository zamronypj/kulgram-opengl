unit cubeRenderCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, vectorOperation, standardRenderCommand;

type

    { TRenderCube }

    TRenderCube = class(TStandardRenderCommand)
    private
      totalTime : single;
      vectorMathObj : IVectorOperation;
    protected
      function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
    public
      constructor Create(const renderer : IRenderer; const vectMath : IVectorOperation);
      destructor Destroy(); override;
    end;

implementation
uses rendererPrimitive, matrixUtility, vectorType, vectorUtility;
{ TRenderCube }

function TRenderCube.doRender(const renderer: IRenderer; const elapsedTimeInSecs: single): cardinal;
var prim: IRendererPrimitive;
    sina, cosa : single;
    cameraPosX, cameraPosZ : single;
    pos, up, target: TVector;
begin
  totalTime := totalTime + elapsedTimeInSecs;
  sina := sin(totalTime);
  cosa := cos(totalTime);


  renderer.setMatrixMode(renderer.getProjectionMatrixType());
  renderer.setIdentityMatrix();
  renderer.perspective(30.0, 1, -2, 10);

  renderer.setMatrixMode(renderer.getModelViewMatrixType());
  renderer.setIdentityMatrix();

  cameraPosX := sina * 0.5;
  cameraPosZ := cosa * 0.5;

  pos := vectUtil.vector(cameraPosX, 0.5, cameraPosZ, 1);
  target := vectUtil.vector(0,0,0, 1);
  up := vectUtil.vector(0, 1, 0, 1);
  renderer.mulMatrix(matUtil.lookAt(vectorMathObj, pos, target, up));

  prim := renderer.getPrimitive();
  renderer.beginScene(prim.triangles());

  //front face
  renderer.color3f(1.0, 0.0, 0.0);
  renderer.vertex3f(-1.0, -1.0, 0.0);

  renderer.color3f(0.0, 0.0, 1.0);
  renderer.vertex3f(-1.0, 1.0, 0.0);

  renderer.color3f(0.0, 1.0, 0.0);
  renderer.vertex3f(1.0, -1.0, 0.0);

  renderer.color3f(0.0, 1.0, 0.0);
  renderer.vertex3f(1.0, -1.0, 0.0);

  renderer.color3f(0.0, 0.0, 1.0);
  renderer.vertex3f(-1.0, 1.0, 0.0);

  renderer.color3f(0.0, 1.0, 1.0);
  renderer.vertex3f(1.0, 1.0, 0.0);

  ////left face
  renderer.color3f(1.0, 0.0, 1.0);
  renderer.vertex3f(-1.0, -1.0, -1.0);
  renderer.color3f(0.0, 0.5, 1.0);
  renderer.vertex3f(-1.0, 1.0, -1.0);
  renderer.color3f(1.0, 0.0, 0.0);
  renderer.vertex3f(-1.0, -1.0, 0.0);

  renderer.color3f(1.0, 0.0, 0.0);
  renderer.vertex3f(-1.0, -1.0, 0.0);
  renderer.color3f(0.0, 0.5, 1.0);
  renderer.vertex3f(-1.0, 1.0, -1.0);
  renderer.color3f(0.0, 0.0, 1.0);
  renderer.vertex3f(-1.0, 1.0, 0.0);
  //
  ////back face
  //renderer.color3f(1.0*cosa, 1.0, 1.0*sina);
  //renderer.vertex3f(-1.0, -1.0, -1.0);
  //renderer.vertex3f(-1.0, 1.0, -1.0);
  //renderer.vertex3f(1.0, -1.0, -1.0);
  //renderer.vertex3f(1.0, -1.0, -1.0);
  //renderer.vertex3f(-1.0, 1.0, -1.0);
  //renderer.vertex3f(1.0, 1.0, -1.0);
  //
  ////right face
  //renderer.color3f(1.0, 1.0, 1.0);
  //renderer.vertex3f(1.0, -1.0, 0.0);
  //renderer.vertex3f(1.0, 1.0, 0.0);
  //renderer.vertex3f(1.0, -1.0, -1.0);
  //renderer.vertex3f(1.0, -1.0, 0.0);
  //renderer.vertex3f(1.0, 1.0, -1.0);
  //renderer.vertex3f(1.0, 1.0, 0.0);

  renderer.endScene();
  result := 0;
end;

constructor TRenderCube.Create(const renderer : IRenderer; const vectMath : IVectorOperation);
begin
  inherited Create(renderer);
  vectorMathObj := vectMath;
end;

destructor TRenderCube.Destroy;
begin
  vectorMathObj := nil;
  inherited Destroy;
end;

end.

