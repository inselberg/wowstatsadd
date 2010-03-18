unit Unit1;

interface

uses
  jclstrings, JclSimpleXML,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, JvExStdCtrls, JvMemo, JvSimpleXml, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ComCtrls, JvExComCtrls, JvStatusBar, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvListView,
  JvComCtrls, JvSplitter, JvMenus;

type
  TForm1 = class(TForm)
    xml: TJvSimpleXML;
    mChars: TJvMemo;
    MainMenu1: TMainMenu;
    miGetIt: TMenuItem;
    IdHTTP1: TIdHTTP;
    JvStatusBar1: TJvStatusBar;
    miCalcIt: TMenuItem;
    JvPanel1: TJvPanel;
    JvTreeView1: TJvTreeView;
    JvPanel2: TJvPanel;
    JvSplitter1: TJvSplitter;
    miAbout: TMenuItem;
    JvMemo1: TJvMemo;
    miInclude: TMenuItem;
    miIncAll: TMenuItem;
    N1: TMenuItem;
    miIncClassic: TMenuItem;
    miIncBC: TMenuItem;
    miIncWotlk: TMenuItem;
    JvPopupMenu1: TJvPopupMenu;
    pmSort: TMenuItem;
    pmUnsort: TMenuItem;
    procedure miGetItClick(Sender: TObject);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure miCalcItClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmSortClick(Sender: TObject);
    procedure pmUnsortClick(Sender: TObject);
  private
    { Private-Deklarationen }
    bWait: boolean;
    bSorted: boolean;
  public
    { Public-Deklarationen }
    procedure BuildTree(fn: string; var tv: TJvTreeView);
    function CalcTree(tvdata: TJvTreeView): tstringlist;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function lz(s: String; max: byte): string;
begin
  while length(s) < max do
    s := '0' + s;
  result := s;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    mChars.Lines.LoadFromFile('mychars.ini');
  except

  end;

  bSorted := not false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form1.Caption := application.Title;
  JvStatusBar1.simpletext := 'Edit charlist and click >getit< ;)';

  miCalcItClick(Sender);

end;

procedure TForm1.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  bWait := false;
end;

procedure TForm1.miAboutClick(Sender: TObject);
begin
  CalcTree(JvTreeView1);
end;

procedure TForm1.miCalcItClick(Sender: TObject);
var
  SR: TSearchRec;
begin
  JvMemo1.Lines.Clear;
  JvTreeView1.Items.Clear;
  if FindFirst('char_*.xml', faAnyFile, SR) = 0 then
  begin
    repeat

      if SR.Name[1] <> '.' then
        BuildTree(SR.name, JvTreeView1);

    until FindNext(SR) <> 0;
    FindClose(SR); // Nach jedem findfirst nötig, um sr freizugeben!
  end;

  JvMemo1.Lines.AddStrings(CalcTree(JvTreeView1));
end;

//

function TForm1.CalcTree(tvdata: TJvTreeView): tstringlist;
var
  i, j, p: longint;
  str, cat, visited: string;
  found: longint;
  slcat, slvisited: tstringlist;
  v, max: longint;
begin
  slcat := tstringlist.create;
  slvisited := tstringlist.create;

  j := 0;
  max := 0;
  for i := 0 to tvdata.Items.Count - 1 do
  begin
    str := tvdata.Items.item[i].Text;
    p := pos('|', str);
    if p > 0 then
    begin
      cat := trim(copy(str, 1, p - 1));
      visited := trim(copy(str, p + 1, length(str)));

      found := slcat.indexof(cat);

      if found = -1 then
      begin
        slcat.Add(cat);
        slvisited.Add(visited);
        // reine kosmetik bei der sortierten tabelle
        v := strtoint(visited);
        if v > max then
          max := v;
      end
      else
      begin
        slvisited[found] := inttostr(strtoint(slvisited[found]) + strtoint(visited));
        // reine kosmetik bei der sortierten tabelle
        v := strtoint(slvisited[found]);
        if v > max then
          max := v;

      end;
    end;
  end;

  for i := 0 to slcat.Count - 1 do
    slcat[i] := lz(slvisited[i], length(inttostr(max))) + ' | ' + slcat[i];

  // sortiern und umdrehen
  if bSorted then
  begin
    slvisited.Assign(slcat);
    slvisited.sort;
    slcat.Clear;
    for i := slvisited.Count - 1 downto 1 do
      slcat.Add(slvisited[i]);
  end;

  JvStatusBar1.simpletext := 'ready.';
  slvisited.free;

  // slcat.free;
  // slvisited.free;
  result := slcat;
end;

//
//
//
procedure TForm1.BuildTree(fn: string; var tv: TJvTreeView);
var
  i, j, visited: longint;
  s, cat: String;
  e, ee: TJclSimpleXMLElems;
  root, node: TTreeNode;
  ctrl: integer;
begin
  //
  xml.LoadFromFile(fn);

  // JvMemo1.Lines.Add(inttostr(xml.Root.Items.Count));

  // TreeView1.Items.Add(nil,'verz');
  root := tv.Items.AddFirst(nil, fn);

  for i := 0 to xml.root.Items.Count - 1 do
  begin
    e := xml.root.Items[i].Items;
    // JvMemo1.Lines.Add(inttostr(e.Count));
    for j := 0 to e.Count - 1 do
    begin
      ee := e.item[j].Items;
      s := trim(e.item[j].value);
      if s <> '' then
        node := tv.Items.AddChild(root, s);

      {
        for k := 0 to ee.Count - 1 do
        begin
        s := trim(ee.Item[k].value);
        if ( s <> '' ) and ( k = 1) then
        jvTreeView1.Items.AddChild(node,s);
        JvMemo1.Lines.Add(s);
        end;
        }

      // 1=name 0=count
      if ee.Count = 2 then
      begin
        cat := trim(ee.item[1].value);
        // visited := strtoint(trim(ee.Item[0].value));
        val(trim(ee.item[0].value), visited, ctrl);
        if (cat <> '') and (ctrl = 0) then
          tv.Items.AddChild(node, cat + ' | ' + inttostr(visited));

      end;

      // 1=name 0=count
      // s:=ee.Item[k].value
      /// jvTreeView1.Items.AddChild(node,s);
    end;

  end;
  // lv.LoadFromStrings(jvmemo1.Lines,'|');
  // lv.items.add();

  // lv.Items.Item[1].Caption:='S1 Z2'; //Spalte1 Zeile2
  // lv.Items.Item[1].SubItems.Add('S2 Z2'); //Spalte2 Zeile2

end;

procedure TForm1.miGetItClick(Sender: TObject);
var
  i, j: longint;
  fn, url, str, realm: string;
  // url="http://eu.wowarmory.com/character-statistics.xml?r=$1&cn=$2&c=14807"
  sl: tstringlist;
begin

  miGetIt.Enabled := false;
  mChars.Lines.SaveToFile('mychars.ini');
  sl := tstringlist.create;
  for i := 0 to mChars.Lines.Count - 1 do
  begin
    str := mChars.Lines[i];
    realm := copy(str, 1, pos(':', str) - 1);
    strreplace(realm, ' ', '+', [rfReplaceAll]);

    str := copy(str, pos(':', str) + 1, length(str));
    sl.DelimitedText := str;

    str := realm;
    for j := 0 to sl.Count - 1 do
    begin
      JvStatusBar1.simpletext := 'getting ' + sl[j] + ' on ' + realm + '....';
      url := 'http://eu.wowarmory.com/character-statistics.xml?r=' + realm + '&cn=' + sl[j] + '&c=14807';

      strreplace(str, '+', '_', [rfReplaceAll]);
      fn := 'char_' + sl[j] + '_' + str + '.xml';

      bWait := true;
      xml.LoadFromString(IdHTTP1.get(url));
      while bWait do
      begin
        application.ProcessMessages;
        JvStatusBar1.simpletext := timetostr(now) + 'warten...';
      end;

      xml.SaveToFile(fn);

    end;
  end;
  JvStatusBar1.simpletext := 'click CalcIt ;)';
  miGetIt.Enabled := true;
  sl.free;
end;

procedure TForm1.pmSortClick(Sender: TObject);
begin
  bSorted := true;
  miCalcItClick(sender);
end;

procedure TForm1.pmUnsortClick(Sender: TObject);
begin
  bSorted := false;
  miCalcItClick(sender);

end;

end.
