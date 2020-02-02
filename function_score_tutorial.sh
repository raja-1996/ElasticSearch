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
    "function_score": {
      "query": {
        "match": {
          "product_name": "flats"
        }
      },
      "functions": [
        {
          "filter": {
            "match": {
              "product_name": "women"
            }
          },
          "weight": 2
        },
        {
          "filter": {
            "match": {
              "product_name": "men"
            }
          },
          "weight": 3
        }
      ],
      "score_mode": "multiply",
      "boost_mode": "sum"
    }
  }
}



# Score with another integer field 

GET /flipkart/_search
{
  "size": 20,
  "_source": [
    "product_name",
    "retail_price",
    "brand",
    "overall_rating"
  ],
  "query": {
    "function_score": {
      "query": {
        "match": {
          "product_name": "flats"
        }
      },
      "functions": [
        {
          "script_score": {
            "script": "_score * doc['overall_rating'].value"
          }
        }
      ]
    }
  }
}

# Decay function by field of type double 

# decay - factor by which values are multiplied
# scale - value after which score drops to its half of decay value
# offset - range in which scores remains almost constant and close to origin score

GET /flipkart/_search
{
  "size": 20,
  "from": 1000, 
  "_source": [
    "product_name",
    "overall_rating",
    "brand"
  ],
  "query": {
    "function_score": {
     "gauss": {
       "overall_rating": {
         "origin": "3",
         "scale": "4",
         "offset": "0.2", 
         "decay": 0.5
       }
     }
    }
  }
}

# Decay function by field of type date 
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
    "function_score": {
     "gauss": {
       "crawl_timestamp": {
         "origin": "2015-12-14",
         "scale": "10d",
         "decay": 0.5
       }
     }
    }
  }
}