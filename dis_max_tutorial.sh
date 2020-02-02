
GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "product_category_tree_2",
    "attributes_key"
  ],
  "query": {
    "dis_max": {
      "queries": [
        {
          "match": {
            "product_category_tree_2": {
              "query": "T-Shirts",
              "operator": "and"
            }
          }
          
        },
        {
          "match": {
            "product_name": "men"
          }
        },
        {
          "match": {
            "attributes_key": "Sleeve"
          }
        }
      ],
      "tie_breaker": 0.7
    }
  }
}