unit baseshader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    IBaseShader = interface
       ['{16848BF3-B823-4510-8DD6-BECF44F3E017}']
       {------------------------
       get shader ID
       -------------------------}
       function id() : cardinal;
    end;

implementation

end.

