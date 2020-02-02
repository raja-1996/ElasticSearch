GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "description",
    "retail_price",
    "product_category_tree_0.keyword"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "product_name": "Cameleon lipstick"
          }
        },
        {
          "match": {
            "description": "Matte"
          }
        }
      ],
      "should": [
        {
          "match": {
            "description": "Professional"
          }
        }
      ],
      "filter": [
        {
          "range": {
            "retail_price": {
              "gte": 100,
              "lte": 1000
            }
          }
        },
        {
          "term": {
            "product_category_tree_0.keyword": "Beauty and Personal Care"
          }
        }
      ],
      "must_not": [
        {
          "match": {
            "product_name": "Rythmx"
          }
        }
      ]
    }
  }
}