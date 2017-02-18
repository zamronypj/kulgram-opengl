unit rendercommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

   {------------------------------
   interface for rendering
   command
   -------------------------------}
   IRenderCommand = interface
       ['{E6001C74-DDFD-4075-9AC9-BF1AF73EF00A}']

       {---------------------------------
       render anything to screen
       ----------------------------------
       elapsedTimeInSecs : time passed since last
       call in seconds
       ----------------------------------}
       function render(const elapsedTimeInSecs : single) : cardinal;
   end;

implementation

end.

