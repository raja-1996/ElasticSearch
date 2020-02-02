
# AND/OR
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand"
  ],
  "query": {
    "query_string": {
      "default_field": "product_name", 
      "query": "(Fashnopolism shoe) OR (cream)"
    }
  }
}

GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand"
  ],
  "query": {
    "query_string": {
      "default_field": "product_name", 
      "query": "Fashnopolism AND shoe"
    }
  }
}

# TO
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "overall_rating"
  ],
  "query": {
    "query_string": {
      "default_field": "overall_rating", 
      "query": "{2 TO 3}"
    }
  }
}

GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "crawl_timestamp"
  ],
  "query": {
    "query_string": {
      "default_field": "crawl_timestamp", 
      "query": "{2015-01-03 TO 2016-11-10}"
    }
  }
}

# + indicates must
# - indicates must_not
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "crawl_timestamp"
  ],
  "query": {
    "query_string": {
      "default_field": "product_name", 
      "query": "-Sleeve +Solid men's Tie"
    }
  }
}