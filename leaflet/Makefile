all: coordinates_offset index

coordinates:
	python scrapper.py ../resources/acidentes-2016.csv > coordinates.txt
	
coordinates_offset:
	python scrapper.py ../resources/acidentes-2016.csv --offset_lat -0.0008 --offset_long 0.00001 > coordinates.txt
	
index:
	python html_filler.py coordinates.txt map.html > index.html
	
server:
	python -m SimpleHTTPServer 1337
	