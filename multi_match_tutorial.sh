

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
    "multi_match": {
      "query": "Riyo",
      "fields": ["brand", "product_name"]
    }
  }
}

# boost score if matches for a specific field
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
    "multi_match": {
      "query": "Recrafto",
      "fields": ["brand^3", "product_name"]
    }
  }
}

# search in fields using regex
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "crawl_timestamp",
    "attributes_key",
    "attributes_value"
  ],
  "query": {
    "multi_match": {
      "query": "fit",
      "fields": ["attributes_*"]
    }
  }
}


GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "crawl_timestamp",
    "attributes_key",
    "attributes_value"
  ],
  "query": {
    "multi_match": {
      "query": "fit",
      "fields": ["attributes_*"],
      "type": "most_fields"
    }
  }
}

# cross fields
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "crawl_timestamp",
    "attributes_key",
    "attributes_value"
  ],
  "query": {
    "multi_match": {
      "query": "Code Box",
      "fields": ["attributes_*"],
      "type": "cross_fields"
    }
  }
}
