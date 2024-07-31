unit MarkdownHighlighter;

interface

uses
  SysUtils, Classes, Graphics, SynEdit, SynEditHighlighter;

type
  TSynMarkdownSyn = class(TSynCustomHighlighter)
  private
    fHeaderAttri: TSynHighlighterAttributes;
    fBoldAttri: TSynHighlighterAttributes;
    fItalicAttri: TSynHighlighterAttributes;
    fLinkAttri: TSynHighlighterAttributes;
    fPlainTextAttri: TSynHighlighterAttributes;
    fCurrentAttri: TSynHighlighterAttributes;
    fCurrentState: Integer;
    fTokenPos: Integer;
    fLine: string;
  protected
    function GetIdentChars: TSysCharSet;
    function GetEol: Boolean; override;
    procedure Next; override;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

constructor TSynMarkdownSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fHeaderAttri := TSynHighlighterAttributes.Create('Header', 'header of text');
  fHeaderAttri.Foreground := clBlue;
  AddAttribute(fHeaderAttri);

  fBoldAttri := TSynHighlighterAttributes.Create('Bold', 'font style');
  fBoldAttri.Foreground := clRed;
  AddAttribute(fBoldAttri);

  fItalicAttri := TSynHighlighterAttributes.Create('Italic', 'font style');
  fItalicAttri.Foreground := clGreen;
  AddAttribute(fItalicAttri);

  fLinkAttri := TSynHighlighterAttributes.Create('Link', 'Embedded Link');
  fLinkAttri.Foreground := clPurple;
  AddAttribute(fLinkAttri);

  fPlainTextAttri := TSynHighlighterAttributes.Create('PlainText', 'font style');
  fPlainTextAttri.Foreground := clWindowText;
  AddAttribute(fPlainTextAttri);

  // Initialize
  fCurrentAttri := fPlainTextAttri;
  fCurrentState := 0;
  fTokenPos := 0;
  fLine := '';
end;

destructor TSynMarkdownSyn.Destroy;
begin
  fHeaderAttri.Free;
  fBoldAttri.Free;
  fItalicAttri.Free;
  fLinkAttri.Free;
  fPlainTextAttri.Free;
  inherited;
end;

function TSynMarkdownSyn.GetIdentChars: TSysCharSet;
begin
  Result := ['a'..'z', 'A'..'Z', '0'..'9', '_'];
end;

function TSynMarkdownSyn.GetEol: Boolean;
begin
  Result := (fTokenPos >= Length(fLine)) or (fLine[fTokenPos] = #10);
end;

procedure TSynMarkdownSyn.Next;
begin
  if (fLine = '') or (fTokenPos >= Length(fLine)) then Exit;

  // Basic example for processing lines, you should extend this for full Markdown support
  case fCurrentState of
    0: // Plain text
      begin
        if fLine[fTokenPos] = '#' then
        begin
          fCurrentAttri := fHeaderAttri;
        end
        else if fLine[fTokenPos] = '*' then
        begin
          fCurrentAttri := fBoldAttri;
        end
        else if fLine[fTokenPos] = '_' then
        begin
          fCurrentAttri := fItalicAttri;
        end
        else if fLine[fTokenPos] = '[' then
        begin
          fCurrentAttri := fLinkAttri;
        end
        else
        begin
          fCurrentAttri := fPlainTextAttri;
        end;

        Inc(fTokenPos);
      end;
  end;
end;

function TSynMarkdownSyn.GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes;
begin
  case Index of
    0: Result := fHeaderAttri;
    1: Result := fBoldAttri;
    2: Result := fItalicAttri;
    3: Result := fLinkAttri;
    4: Result := fPlainTextAttri;
  else
    Result := fPlainTextAttri;
  end;
end;

end.

