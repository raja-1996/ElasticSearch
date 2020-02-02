# distancce_feature

GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "crawl_timestamp"
  ],
  "query": {
    "bool": {
      "must": [
        {"match": {
          "product_name": "shoe"
        }}
      ],
      "should": [
        {"distance_feature": {
          "field": "crawl_timestamp",
          "origin": "2016-01-13",
          "pivot": "1d"
        }}
      ]
    }
  }
}


# more_like_this
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "crawl_timestamp"
  ],
  "query": {
    "more_like_this": {
      "fields": [
        "product_name"
      ],
      "like": "Recrafto Magical Box Makeup, Jewellery Vanity Jewellery",
      "min_term_freq": 1,
      "max_query_terms": 12
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
    "more_like_this": {
      "fields": [
        "product_name"
      ],
      "like":[
        {"_index": "flipkart", "_id":"1"}
      ],
      "min_term_freq": 1,
      "max_query_terms": 12
    }
  }
}