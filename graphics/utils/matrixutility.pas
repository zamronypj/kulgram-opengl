unit matrixUtility;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes;

type

   { TMatrixUtility }

   TMatrixUtility = class(TObject)
   public
      class function zero(): TMat4x4f; static;
      class function identity(): TMat4x4f; static;
      class function scale(const sx: single; const sy:single; const sz: single): TMat4x4f; static;
      class function translate(const tx: single; const ty:single; const tz: single): TMat4x4f; static;
   end;

implementation

{ TMatrixUtility }

class function TMatrixUtility.zero(): TMat4x4f;
begin
  result[00] := 0.0; result[04] := 0.0; result[08] := 0.0; result[12] := 0.0;
  result[01] := 0.0; result[05] := 0.0; result[09] := 0.0; result[13] := 0.0;
  result[02] := 0.0; result[06] := 0.0; result[10] := 0.0; result[14] := 0.0;
  result[03] := 0.0; result[07] := 0.0; result[11] := 0.0; result[15] := 0.0;
end;

class function TMatrixUtility.identity(): TMat4x4f;
begin
  result[00] := 1.0; result[04] := 0.0; result[08] := 0.0; result[12] := 0.0;
  result[01] := 0.0; result[05] := 1.0; result[09] := 0.0; result[13] := 0.0;
  result[02] := 0.0; result[06] := 0.0; result[10] := 1.0; result[14] := 0.0;
  result[03] := 0.0; result[07] := 0.0; result[11] := 0.0; result[15] := 1.0;
end;

class function TMatrixUtility.scale(const sx: single; const sy: single; const sz: single): TMat4x4f;
begin
  result[00] := sx;  result[04] := 0.0; result[08] := 0.0; result[12] := 0.0;
  result[01] := 0.0; result[05] := sy;  result[09] := 0.0; result[13] := 0.0;
  result[02] := 0.0; result[06] := 0.0; result[10] := sz;  result[14] := 0.0;
  result[03] := 0.0; result[07] := 0.0; result[11] := 0.0; result[15] := 1.0;
end;

class function TMatrixUtility.translate(const tx: single; const ty: single; const tz: single): TMat4x4f;
begin
  result[00] := 1.0; result[04] := 0.0; result[08] := 0.0; result[12] := tx;
  result[01] := 0.0; result[05] := 1.0; result[09] := 0.0; result[13] := ty;
  result[02] := 0.0; result[06] := 0.0; result[10] := 1.0; result[14] := tz;
  result[03] := 0.0; result[07] := 0.0; result[11] := 0.0; result[15] := 1.0;
end;
end.

