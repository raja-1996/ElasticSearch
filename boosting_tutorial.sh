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
    "boosting": {
      "positive": {
        "match": {
            "product_name": "lipstick"
          }
      },
      "negative": {
        "match": {
            "description": "matte"
          }
      },
      "negative_boost": 0.2
    }
  }
}