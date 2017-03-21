unit constants;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
   RESULT_OK = 0;

   RENDER_OK = RESULT_OK;
   INVALID_RENDERER = 1;

   //----shader operation----
   SHADER_OK = RESULT_OK;
   SHADER_INVALID_OBJECT = 1;
   SHADER_CREATION_FAILED = 2;
   SHADER_DELETION_FAILED = 3;

implementation

end.

