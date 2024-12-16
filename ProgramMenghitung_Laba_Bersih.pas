program LabaBersih;

uses crt;

type
  Transaksi = record
    keterangan: string;
    jumlah: real;
  end;

var
  pendapatan, pengeluaran: array of Transaksi;
  totalPendapatan, totalPengeluaran, labaBersihTotal: real;
  nPendapatan, nPengeluaran, i: integer;

procedure InputTransaksi(var data: array of Transaksi; var total: real; jumlah: integer; jenis: string);
var
  i: integer;
begin
  total := 0;
  for i := 0 to jumlah - 1 do
  begin
    writeln(jenis, ' ke-', i + 1, ':');
    write('  Keterangan: ');
    readln(data[i].keterangan);
    write('  Jumlah (Rp): ');
    readln(data[i].jumlah);
    total := total + data[i].jumlah;
  end;
end;
  
function HitungLabaBersih(pendapatan, pengeluaran: real): real;
begin
  HitungLabaBersih := pendapatan - pengeluaran;
end;

procedure TampilkanRincian(data: array of Transaksi; jumlah: integer; jenis: string);
var
  i: integer;
begin
  writeln('--- Rincian ', jenis, ' ---');
  for i := 0 to jumlah - 1 do
  begin
    writeln('  ', i + 1, '. ', data[i].keterangan, ' - Rp', data[i].jumlah:0:2);
  end;
end;

begin
  clrscr;

  writeln('Program Menghitung Laba Bersih');
  writeln('===============================');

  write('Masukkan jumlah pendapatan: ');
  readln(nPendapatan);
  setlength(pendapatan, nPendapatan);
  InputTransaksi(pendapatan, totalPendapatan, nPendapatan, 'Pendapatan');

  write('Masukkan jumlah pengeluaran: ');
  readln(nPengeluaran);
  setlength(pengeluaran, nPengeluaran);
  InputTransaksi(pengeluaran, totalPengeluaran, nPengeluaran, 'Pengeluaran');
  labaBersihTotal := HitungLabaBersih(totalPendapatan, totalPengeluaran);

  TampilkanRincian(pendapatan, nPendapatan, 'Pendapatan');
  TampilkanRincian(pengeluaran, nPengeluaran, 'Pengeluaran');

  writeln('===============================');
  writeln('Total Pendapatan : Rp', totalPendapatan:0:2);
  writeln('Total Pengeluaran: Rp', totalPengeluaran:0:2);
  writeln('Laba Bersih      : Rp', labaBersihTotal:0:2);

  if labaBersihTotal > 0 then
    writeln('Status: Untung')
  else if labaBersihTotal < 0 then
    writeln('Status: Rugi')
  else
    writeln('Status: Impas');
end.
