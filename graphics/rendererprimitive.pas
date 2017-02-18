unit rendererPrimitive;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

   IRendererPrimitive = interface
      ['{2DFF250A-2DD5-4A69-B1D7-08216BEEEDE1}']

      function triangles() : cardinal;
      function triangleStrip() : cardinal;
      function triangleFan() : cardinal;

      function lines() : cardinal;
      function lineStrip(): cardinal;
      function lineLoop() : cardinal;

      function points() : cardinal;
   end;
implementation

end.

