unit baseRenderCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, renderCommand;

const
   RENDER_OK = 0;
   INVALID_RENDERER = 1;
type

    { TBaseRenderCommand }

    TBaseRenderCommand = class(TInterfacedObject, IRenderCommand)
    private
        renderer : IRenderer;
    public
        constructor Create(const aRenderer: IRenderer); virtual;
        destructor Destroy(); override;

        function getRenderer() :IRenderer;

        {---------------------------------
        render anything to screen
        ----------------------------------
        elapsedTimeInSecs : time passed since last
        call in seconds
        ----------------------------------}
        function render(const elapsedTimeInSecs : single) : cardinal; virtual; abstract;
    end;

implementation

{ TBaseRenderCommand }

constructor TBaseRenderCommand.Create(const aRenderer: IRenderer);
begin
  inherited Create();
  renderer := aRenderer;
end;

destructor TBaseRenderCommand.Destroy();
begin
  renderer := nil;
  inherited Destroy();
end;

function TBaseRenderCommand.getRenderer(): IRenderer;
begin
  result := renderer;
end;

end.

