unit baseRenderBuffer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderBuffer;

type
   TBaseRenderBuffer = class(TInterfacedObject, IRenderBuffer)
   public
      function beginWrite() : cardinal; virtual; abstract;
      function write(const sourceMemory: pointer; const numberOfData: cardinal; const dataType:cardinal; const stride: cardinal) : cardinal; virtual; abstract;
      function endWrite() : cardinal; virtual; abstract;
   end;

implementation

end.

