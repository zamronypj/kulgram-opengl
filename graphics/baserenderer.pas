unit baserenderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, rendererPrimitive;

type

   { TBaseRenderer }

   TBaseRenderer = class(TInterfacedObject, IRenderer)
   public
     function clearColor(const r: single; const g: single; const b:single; const a:single): cardinal; virtual; abstract;
     function clear(const clearBit : cardinal): cardinal; virtual; abstract;

     function getClearColorBufferBit() : cardinal; virtual; abstract;
     function getClearStencilBufferBit() : cardinal; virtual; abstract;
     function getClearDepthBufferBit() : cardinal; virtual; abstract;

     function getPrimitive() : IRendererPrimitive; virtual; abstract;

     function setIdentityMatrix() : cardinal; virtual; abstract;
     function beginPrimitive(const primitive : cardinal): cardinal; virtual; abstract;
     function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal; virtual; abstract;
     function vertex3f(const x: single; const y: single; const z:single): cardinal; virtual; abstract;
     function color4f(const r: single; const g: single; const b:single; const a:single): cardinal; virtual; abstract;
     function color3f(const r: single; const g: single; const b:single): cardinal; virtual; abstract;
     function endPrimitive(): cardinal; virtual; abstract;
   end;

implementation

end.

