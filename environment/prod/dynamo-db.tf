module "dynamodb_table_table_name_dev" {
  source = "cloudposse/dynamodb/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  namespace                    = "eg"
  stage                        = "prod"
  name                         = "demo-prod-cluster"
  hash_key                     = "MobileNo"
  range_key                    = "Name"
  autoscale_write_target       = 50
  autoscale_read_target        = 50
  autoscale_min_read_capacity  = 5
  autoscale_max_read_capacity  = 20
  autoscale_min_write_capacity = 5
  autoscale_max_write_capacity = 20
  enable_autoscaler            = true
  enable_streams = false



  dynamodb_attributes = [
    {
      name = "MobileNo"
      type = "S"
    },
     {
      name = "Name"
      type = "S"
    },
    {
      name = "Age"
      type = "N"
    },
      {
      name = "BankAccount"
      type = "S"
    },
    {
      name = "Balance"
      type = "N"
    },
    {
      name = "Timestamp"
      type = "S"
    }
  ]

  local_secondary_index_map = [
    {
      name               = "TimestampSortIndex"
      range_key          = "Timestamp"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    },
    {
      name               = "HighWaterIndex"
      range_key          = "Timestamp"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]

  global_secondary_index_map = [
    {
      name               = "DailyAverageIndex"
      hash_key           = "Balance"
      range_key          = "Age"
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    },
     {
      name               = "BankAccountIndex"
      hash_key           = "BankAccount"
      range_key          = "Age"
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]

  #replicas = ["us-east-1"]
}