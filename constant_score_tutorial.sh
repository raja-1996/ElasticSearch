GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand"
  ],
  
  "query": {
    "constant_score":{
      "filter": {
        "term": {
          "brand.keyword": "DeStudio"
        }
      },
      "boost": 1.2
    }
  }
}

# constant_score used in bool query

GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "product_name": "Wall"
          }
        }
      ],
      "should": [
        {
          "constant_score": {
            "filter": {
              "term": {
                "brand.keyword": "DeStudio"
              }
            },
            "boost": 1.8
          }
        }
      ]
    }
  }
}