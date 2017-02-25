unit renderboxcommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes, renderer, rendererPrimitive, baseRenderCommand, standardRenderCommand;

type

    { TRenderBoxCommand }

    TRenderBoxCommand = class(TStandardRenderCommand)
    private
    protected
       function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
    public
       constructor Create(const aRenderer: IRenderer); override;
    end;

implementation

{ TRenderBoxCommand }

function TRenderBoxCommand.doRender(const renderer: IRenderer;
  const elapsedTimeInSecs: single): cardinal;
var i:integer;
    primitiveObj : IRendererPrimitive;
begin
  primitiveObj := renderer.getPrimitive();
  with renderer do
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
end;

constructor TRenderBoxCommand.Create(const aRenderer: IRenderer);
begin
  inherited Create(aRenderer);
end;

end.

