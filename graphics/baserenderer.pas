unit baserenderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes, renderer, rendererPrimitive;

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
     function enable(const state:cardinal) : cardinal; virtual; abstract;
     function disable(const state:cardinal) : cardinal; virtual; abstract;

     //get matrix for model/view or projection
     function getProjectionMatrixType() : cardinal; virtual; abstract;
     function getModelViewMatrixType() : cardinal; virtual; abstract;

     function setMatrixMode(const matrixType:cardinal) : cardinal; virtual; abstract;
     function setMatrix(const mat:TMat4x4f) : cardinal; virtual; abstract;
     function mulMatrix(const mat:TMat4x4f) : cardinal; virtual; abstract;
     function setIdentityMatrix() : cardinal; virtual; abstract;

     function beginScene(const primitive : cardinal): cardinal; virtual; abstract;
     function endScene(): cardinal; virtual; abstract;
     function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal; virtual; abstract;
     function vertex3f(const x: single; const y: single; const z:single): cardinal; virtual; abstract;
     function color4f(const r: single; const g: single; const b:single; const a:single): cardinal; virtual; abstract;
     function color3f(const r: single; const g: single; const b:single): cardinal; virtual; abstract;
   end;

implementation

end.

