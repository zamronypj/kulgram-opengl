unit renderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

   IRenderer = interface
       function clearColor(const r: single; const g: single; const b:single; const a:single): cardinal;
       function clear(const clearBit : cardinal): cardinal;
       function setIdentityMatrix() : cardinal;
       function beginPrimitive(const primitive : cardinal): cardinal;
       function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal;
       function vertex3f(const x: single; const y: single; const z:single): cardinal;
       function color4f(const r: single; const g: single; const b:single; const a:single): cardinal;
       function color3f(const r: single; const g: single; const b:single): cardinal;
       function endPrimitive(): cardinal;
   end;

implementation

end.

