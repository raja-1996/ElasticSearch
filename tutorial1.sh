# Match Query
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name"
  ],
  "query": {
    "match": {
      "product_name": "lipstick"
    }
  }
}

# match_phrase
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name"
  ],
  "query": {
    "match_phrase": {
      "product_name": "Cameleon matte"
    }
  }
}

# match_all
GET /flipkart/_search
{"query":{"match_all":{}}}

# term
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_category_tree_0"
  ],
 "query": {
   "term" : {
     "product_category_tree_0.keyword": "Home Entertainment"
   }
 }
}

# Filter
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "retail_price"
  ],
 "query": {
   "range": {
     "retail_price" : {
       "gte": 10000,
       "lte": 20000
     }
   }
 }
}





