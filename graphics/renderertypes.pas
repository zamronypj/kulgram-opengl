unit rendererTypes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
   TMat4x4f = array[0..15] of single;
   TVertex4f = record
      x, y, z, w: single;
   end;

   TColor4f = record
      r, g, b, a: single;
   end;

implementation

end.

