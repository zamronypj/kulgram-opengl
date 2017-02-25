unit vectorUtility;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, vectorType;

type

   { TVectorUtility }

   TVectorUtility = class(TObject)
   public
       class function vector(const x, y, z, w: single): TVector; static;
   end;

var
   vectUtil : class of TVectorUtility;

implementation

{ TVectorUtility }

class function TVectorUtility.vector(const x, y, z, w: single): TVector;
begin
  result.x := x;
  result.y := y;
  result.z := z;
  result.w := w;
end;

initialization
   vectUtil := TVectorUtility;
end.

