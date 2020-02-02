# match_bool_prefix
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "crawl_timestamp"
  ],
  "query": {
    "match_bool_prefix": {
      "product_name": "Sleeve Solid Wo"
    }
  }
}

# match_phrase_prefix
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "crawl_timestamp"
  ],
  "query": {
    "match_phrase_prefix": {
      "product_name": {
        "query": "Recrafto Mag"
      }
      
    }
  }
}

