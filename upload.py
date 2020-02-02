import sys
import json
from pprint import pprint
from elasticsearch import Elasticsearch
es = Elasticsearch(
    ['localhost'],
    port=9200

)
import sys, json


index = sys.argv[1]
file = sys.argv[2]
print(file)

with open(file,'r') as f:
    data = json.load(f)

i = 0
for line in data:
    try:
        print(i)
        i=i+1
        es.index(index=index, doc_type='_doc', id=i, body=line)
    except Exception as e:
        print('Error', i)
        pass
    