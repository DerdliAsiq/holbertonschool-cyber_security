#!/usr/bin/python3
"""
Bu modül, çalışan bir işlemin heap bölgesindeki belirli bir metni bulur
ve hedef metinle değiştirir.
"""
import sys


def print_usage_and_exit():
    """Hatalı kullanım durumunda yardım mesajını basar ve çıkar."""
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)


def read_write_heap():
    """Ana fonksiyon: Heap bölgesini tarar ve metni değiştirir."""
    # Argüman kontrolü
    if len(sys.argv) != 4:
        print_usage_and_exit()

    try:
        pid = int(sys.argv[1])
    except ValueError:
        print_usage_and_exit()

    search_string = sys.argv[2]
    replace_string = sys.argv[3]

    if not search_string:
        return

    # 1. /proc/[pid]/maps dosyasından heap aralığını bul
    maps_filename = "/proc/{}/maps".format(pid)
    mem_filename = "/proc/{}/mem".format(pid)

    heap_start = None
    heap_end = None

    try:
        with open(maps_filename, 'r') as f_maps:
            for line in f_maps:
                if '[heap]' in line:
                    # Satır formatı: 555e646e0000-555e64701000 rw-p ... [heap]
                    parts = line.split()
                    addr_range = parts[0].split('-')
                    heap_start = int(addr_range[0], 16)
                    heap_end = int(addr_range[1], 16)
                    break
        
        if heap_start is None or heap_end is None:
            print("[ERROR] Heap bulunamadı.")
            sys.exit(1)
            
    except IOError as e:
        print("[ERROR] Maps dosyası okunamadı: {}".format(e))
        sys.exit(1)

    # 2. /proc/[pid]/mem dosyasını aç ve veriyi değiştir
    try:
        with open(mem_filename, 'rb+') as f_mem:
            # Heap başlangıcına git
            f_mem.seek(heap_start)
            heap_data = f_mem.read(heap_end - heap_start)

            # Metni bayt formatında ara
            try:
                offset = heap_data.index(search_string.encode('ascii'))
            except ValueError:
                print("[ERROR] '{}' heap içinde bulunamadı.".format(search_string))
                sys.exit(1)

            print("[INFO] '{}' bulundu! Offset: 0x{:x}".format(search_string, offset))

            # Bulunan konuma git ve yeni metni yaz
            f_mem.seek(heap_start + offset)
            f_mem.write(replace_string.encode('ascii'))
            
            # Eğer yeni metin eskisinden kısaysa, sonuna null-terminator eklemek
            # bellek güvenliği açısından mantıklıdır (isteğe bağlı).
            if len(replace_string) < len(search_string):
                f_mem.write(b'\0')
                
            print("[SUCCESS] Yazma işlemi tamamlandı.")

    except IOError as e:
        print("[ERROR] Mem dosyasına erişilemedi: {}. (Sudo kullandınız mı?)".format(e))
        sys.exit(1)


if __name__ == "__main__":
    read_write_heap()
