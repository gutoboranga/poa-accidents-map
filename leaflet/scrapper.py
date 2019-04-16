import sys


# handle input
filename = sys.argv[1]
has_offset = False
offset_lat = 0.0
offset_long = 0.0

if len(sys.argv) > 5:
    if sys.argv[2] == "--offset_lat":
        has_offset = True
        offset_lat = float(sys.argv[3])
    if sys.argv[4] == "--offset_long":
        has_offset = True
        offset_long = float(sys.argv[5])
    
# handle files
with open(filename, 'r') as filehandle:
    
    sys.stdout.write("[")
    sys.stdout.flush()
    
    for line in filehandle:
        del[line]
        break
        
    for line in filehandle:
        items = line.split(";")
    
        lat = float(items[2])
        long = float(items[1])
        
        if has_offset:
            lat += offset_lat
            long += offset_long
    
        sys.stdout.write("{lat:"+str(lat)+", lng:"+str(long)+", count: 1},")
        sys.stdout.flush()
    
    sys.stdout.write("]")
    sys.stdout.flush()