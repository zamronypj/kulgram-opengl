unit matrixUtility;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes, vectorOperation, vectorType;

type

   { TMatrixUtility }

   TMatrixUtility = class(TObject)
   public
      class function zero(): TMat4x4f; static;
      class function identity(): TMat4x4f; static;
      class function scale(const sx: single; const sy:single; const sz: single): TMat4x4f; static;
      class function translate(const tx: single; const ty:single; const tz: single): TMat4x4f; static;
      class function rotateX(const sina: single; const cosa: single): TMat4x4f; static;
      class function rotateY(const sina: single; const cosa: single): TMat4x4f; static;
      class function rotateZ(const sina: single; const cosa: single): TMat4x4f; static;
      class function lookAt(const vectOperation : IVectorOperation; const position, target, up :TVector) : TMat4x4f; static;
   end;

var
   matUtil : class of TMatrixUtility;

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

class function TMatrixUtility.rotateX(const sina: single; const cosa: single): TMat4x4f;
begin
  result[00] := 1.0; result[04] := 0.0;  result[08] := 0.0;   result[12] := 0.0;
  result[01] := 0.0; result[05] := cosa; result[09] := -sina; result[13] := 0.0;
  result[02] := 0.0; result[06] := sina; result[10] := cosa;  result[14] := 0.0;
  result[03] := 0.0; result[07] := 0.0;  result[11] := 0.0;   result[15] := 1.0;
end;

class function TMatrixUtility.rotateY(const sina: single; const cosa: single): TMat4x4f;
begin
  result[00] := cosa;  result[04] := 0.0; result[08] := sina; result[12] := 0.0;
  result[01] := 0.0;   result[05] := 1.0; result[09] := 0.0;  result[13] := 0.0;
  result[02] := -sina; result[06] := 0.0; result[10] := cosa; result[14] := 0.0;
  result[03] := 0.0;   result[07] := 0.0; result[11] := 0.0;  result[15] := 1.0;
end;

class function TMatrixUtility.rotateZ(const sina: single; const cosa: single): TMat4x4f;
begin
  result[00] := cosa; result[04] := -sina; result[08] := 0.0; result[12] := 0.0;
  result[01] := sina; result[05] := cosa;  result[09] := 0.0; result[13] := 0.0;
  result[02] := 0.0;  result[06] := 0.0;   result[10] := 1.0; result[14] := 0.0;
  result[03] := 0.0;  result[07] := 0.0;   result[11] := 0.0; result[15] := 1.0;
end;

class function TMatrixUtility.lookAt(const vectOperation: IVectorOperation;
  const position, target, up: TVector): TMat4x4f;
var lookVect, rightVect, upVect : TVector;
    dotrightVsPos : single;
    dotUpVsPos : single;
    dotLookVsPos : single;
begin
  lookVect := vectOperation.sub(target, position);
  lookVect := vectOperation.normalize(lookVect);
  rightVect  := vectOperation.cross(lookVect, up);
  rightVect  := vectOperation.normalize(rightVect);
  //make sure upVect is orthogonal
  //against lookVect and rightVect
  upVect := vectOperation.cross(rightVect, lookVect);
  upVect := vectOperation.normalize(upVect);

  dotRightVsPos := -vectOperation.dot(rightVect, position);
  dotUpVsPos := -vectOperation.dot(upVect, position);
  dotLookVsPos := vectOperation.dot(lookVect, position);

  result[0] := rightVect.x;
  result[1] := upVect.x;
  result[2] := -lookVect.x;
  result[3] := 0.0;

  result[4] := rightVect.y;
  result[5] := upVect.y;
  result[6] := -lookVect.y;
  result[7] := 0.0;

  result[8] := rightVect.z;
  result[9] := upVect.z;
  result[10] := -lookVect.z;
  result[11] := 0.0;

  result[12] := -dotRightVsPos;
  result[13] := -dotUpVsPos;
  result[14] := dotLookVsPos;
  result[15] := 1.0;
end;

initialization
   matUtil := TMatrixUtility;
end.

