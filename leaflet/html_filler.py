import sys

TAG = "<DATA_GOES_HERE>"

content_filename = sys.argv[1]
html_filename = sys.argv[2]

with open(content_filename, 'r') as content_file:
    content = content_file.read()
    
    with open(html_filename, 'r') as html_file:
        result = html_file.read().replace(TAG, content, 1)
        print(result)